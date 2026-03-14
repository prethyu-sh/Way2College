import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class DirectionsService {
  // GraphHopper Directions API - Professional grade mapping (Better for Hills/Rural India)
  // Step 1: Sign up for a free key at https://graphhopper.com/dashboard/ (Takes 1 minute)
  // Step 2: Paste your key below.
  static const String _ghApiKey =
      "39d18e67-882b-4c07-bc1d-f68d7ad8e94d"; // Replace with your new key

  static const String _ghBaseUrl = "https://graphhopper.com/api/1/route";
  static const String _osrmBaseUrl =
      "https://router.project-osrm.org/route/v1/driving";

  static Future<Map<String, dynamic>?> getDirections({
    required LatLng origin,
    required dynamic destination,
    List<dynamic>? waypoints,
  }) async {
    // If you have a GraphHopper key, we use that for high accuracy.
    // Otherwise it falls back to OSRM.
    if (_ghApiKey != "REPLACE_WITH_YOUR_KEY" && _ghApiKey.isNotEmpty) {
      final ghData = await _getGraphHopperDirections(
        origin,
        destination,
        waypoints,
      );
      if (ghData != null) return ghData;
    }

    return await _getOSRMBackup(origin, destination, waypoints);
  }

  static Future<Map<String, dynamic>?> _getGraphHopperDirections(
    LatLng origin,
    dynamic destination,
    List<dynamic>? waypoints,
  ) async {
    try {
      List<LatLng> allPoints = [origin];
      if (waypoints != null) {
        for (var wp in waypoints) if (wp is LatLng) allPoints.add(wp);
      }
      if (destination is LatLng) allPoints.add(destination);

      List<LatLng> combinedPolyline = [];
      double totalDistanceMeters = 0;
      double totalTimeMs = 0;

      // GraphHopper free tier allows max 5 points per request.
      // We process in chunks of 5, where the last point of chunk N is the first point of chunk N+1.
      for (int i = 0; i < allPoints.length - 1; i += 4) {
        int end = (i + 5 < allPoints.length) ? i + 5 : allPoints.length;
        List<LatLng> chunk = allPoints.sublist(i, end);
        
        if (chunk.length < 2) break;

        final chunkData = await _fetchGHChunk(chunk);
        if (chunkData == null) return null; // If any segment fails, fail all

        // Exclude the first point of subsequent chunks to avoid duplicates in polyline
        if (combinedPolyline.isNotEmpty && (chunkData['polyline'] as List).isNotEmpty) {
           combinedPolyline.addAll((chunkData['polyline'] as List<LatLng>).skip(1));
        } else {
           combinedPolyline.addAll(chunkData['polyline']);
        }
        
        totalDistanceMeters += chunkData['distance'];
        totalTimeMs += chunkData['time'];

        if (end == allPoints.length) break;
      }

      if (combinedPolyline.isEmpty) return null;

      return {
        'distance': (totalDistanceMeters / 1000).toStringAsFixed(1) + " km",
        'duration': (totalTimeMs / 60000).round().toString() + " mins",
        'polylineCoordinates': combinedPolyline,
      };
    } catch (e) {
      print("GraphHopper Multi-Segment Fetch Error: $e");
    }
    return null;
  }

  static Future<Map<String, dynamic>?> _fetchGHChunk(List<LatLng> points) async {
    try {
      final pointsQuery = points.map((p) => "point=${p.latitude},${p.longitude}").join('&');
      final url = Uri.parse("$_ghBaseUrl?$pointsQuery&profile=car&layer=mapnik&points_encoded=false&key=$_ghApiKey");

      final response = await http.get(url).timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['paths'] != null && (data['paths'] as List).isNotEmpty) {
          final path = data['paths'][0];
          final List<dynamic> coords = path['points']['coordinates'];
          return {
            'distance': (path['distance'] as num).toDouble(),
            'time': (path['time'] as num).toDouble(),
            'polyline': coords.map((p) => LatLng((p[1] as num).toDouble(), (p[0] as num).toDouble())).toList(),
          };
        }
      } else {
        print("GH Chunk Error: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      print("GH Chunk Fetch Error: $e");
    }
    return null;
  }

  static Future<Map<String, dynamic>?> _getOSRMBackup(
    LatLng origin,
    dynamic destination,
    List<dynamic>? waypoints,
  ) async {
    try {
      print("DEBUG: Falling back to OSRM...");
      List<String> coords = ["${origin.longitude},${origin.latitude}"];
      if (waypoints != null) {
        for (var wp in waypoints)
          if (wp is LatLng) coords.add("${wp.longitude},${wp.latitude}");
      }
      if (destination is LatLng)
        coords.add("${destination.longitude},${destination.latitude}");

      final url = Uri.parse(
        "$_osrmBaseUrl/${coords.join(';')}?overview=full&geometries=geojson&continue_straight=true",
      );

      final response = await http.get(url).timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['code'] == "Ok" && (data['routes'] as List).isNotEmpty) {
          final route = data['routes'][0];
          final List<dynamic> geometryCoords = route['geometry']['coordinates'];
          return {
            'distance':
                ((route['distance'] as num) / 1000).toStringAsFixed(1) + " km",
            'duration':
                ((route['duration'] as num) / 60).round().toString() + " mins",
            'polylineCoordinates': geometryCoords
                .map(
                  (c) => LatLng(
                    (c[1] as num).toDouble(),
                    (c[0] as num).toDouble(),
                  ),
                )
                .toList(),
          };
        }
      }
    } catch (e) {
      print("OSRM Backup Error: $e");
    }
    return null;
  }
}
