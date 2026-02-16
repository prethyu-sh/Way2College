import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SecretaryMap extends StatefulWidget {
  final String userId;
  const SecretaryMap({super.key, required this.userId});

  @override
  State<SecretaryMap> createState() => _SecretaryMapState();
}

class _SecretaryMapState extends State<SecretaryMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // MAP PLACEHOLDER
            Positioned.fill(
              child: Image.asset(
                "assets/images/map_placeholder.png",
                fit: BoxFit.cover,
              ),
            ),

            // TOP BAR
            Positioned(
              top: 16,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _iconButton(
                    icon: Icons.arrow_back,
                    onTap: () => Navigator.pop(context),
                  ),
                  Row(
                    children: [
                      _iconButton(icon: Icons.notifications_none),
                      const SizedBox(width: 12),
                      _iconButton(icon: Icons.menu),
                    ],
                  ),
                ],
              ),
            ),

            // BUS CARDS
            Positioned(
              top: 90,
              left: 16,
              right: 16,
              bottom: 16,
              child: _allBusCards(),
            ),
          ],
        ),
      ),
    );
  }

  // ================= ALL BUS CARDS =================

  Widget _allBusCards() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Buses').snapshots(),
      builder: (context, snap) {
        if (!snap.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final buses = snap.data!.docs;

        if (buses.isEmpty) {
          return const Center(
            child: Text(
              "No buses available",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          );
        }

        return GridView.builder(
          itemCount: buses.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // side by side
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.2,
          ),
          itemBuilder: (context, index) {
            final bus = buses[index];
            return _busCard(bus.id);
          },
        );
      },
    );
  }

  // ================= SINGLE BUS CARD =================

  Widget _busCard(String busId) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('Buses')
          .doc(busId)
          .snapshots(),
      builder: (context, snap) {
        if (!snap.hasData || !snap.data!.exists) {
          return const SizedBox();
        }

        final data = snap.data!.data() as Map<String, dynamic>;
        final busName = data['busName'] ?? "Unknown Bus";
        final status = data['status'] ?? "ON_THE_WAY";
        final delayMinutes = data['delayMinutes'];
        final delayReason = data['delayReason'];

        Color bgColor;
        Color textColor;

        switch (status) {
          case "DELAYED":
            bgColor = Colors.orange.shade100;
            textColor = Colors.red;
            break;
          case "BREAKDOWN":
            bgColor = Colors.red.shade100;
            textColor = Colors.red;
            break;
          default:
            bgColor = Colors.green.shade100;
            textColor = Colors.green.shade800;
        }

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: Offset(2, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.directions_bus,
                    size: 20,
                    color: Colors.black87,
                  ),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      busName,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),
              Text(
                _statusLabel(status),
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: textColor,
                ),
              ),
              if (status == "DELAYED" && delayMinutes != null)
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    "$delayMinutes min late${delayReason != null ? " • $delayReason" : ""}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
              if (status == "BREAKDOWN")
                const Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: Text(
                    "Please wait for updates",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  String _statusLabel(String status) {
    switch (status) {
      case "DELAYED":
        return "Delayed";
      case "BREAKDOWN":
        return "Breakdown";
      default:
        return "On the Way";
    }
  }

  Widget _iconButton({required IconData icon, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 4)],
        ),
        child: Icon(icon, color: Colors.black),
      ),
    );
  }
}
