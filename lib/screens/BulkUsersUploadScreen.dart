import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_selector/file_selector.dart';
import 'package:csv/csv.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bus_tracker/utils/PasswordUtils.dart';

class BulkUserUploadScreen extends StatefulWidget {
  const BulkUserUploadScreen({super.key});

  @override
  State<BulkUserUploadScreen> createState() => _BulkUserUploadScreenState();
}

class _BulkUserUploadScreenState extends State<BulkUserUploadScreen> {
  bool isUploading = false;
  String statusMessage = "";

  Future<void> _pickAndUploadCSV() async {
    const XTypeGroup typeGroup = XTypeGroup(label: 'CSV', extensions: ['csv']);

    final XFile? file = await openFile(acceptedTypeGroups: [typeGroup]);

    if (file == null) return;

    final csvData = const CsvToListConverter().convert(
      await File(file.path).readAsString(),
      eol: '\n',
    );

    csvData.removeAt(0); // header

    for (var row in csvData) {
      final userId = row[0].toString().trim();
      final name = row[1].toString().trim();
      final role = row[2].toString().trim();
      final password = row[3].toString().trim();
      final active = parseBool(row[4]);

      await FirebaseFirestore.instance.collection('Users').doc(userId).set({
        'UserId': userId,
        'Name': name,
        'Role': role,
        'Password': hashPassword(password),
        'Active': active,
      }, SetOptions(merge: true));
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("CSV uploaded successfully")));
  }

  bool parseBool(dynamic value) {
    if (value == null) return false;
    if (value is bool) return value;

    final v = value.toString().toLowerCase().trim();
    return v == 'true' || v == '1' || v == 'yes';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bulk User Upload",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF154C79),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "Upload users using CSV file",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: isUploading ? null : _pickAndUploadCSV,
              icon: const Icon(Icons.upload_file),
              label: const Text("UPLOAD CSV"),
            ),

            const SizedBox(height: 20),

            if (isUploading) const CircularProgressIndicator(),

            const SizedBox(height: 12),

            Text(statusMessage, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
