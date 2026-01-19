import 'package:bus_tracker/screens/UserManagement.dart';
import 'package:flutter/material.dart';
import 'package:bus_tracker/screens/UserLogin.dart';

class BusSecretaryDashboard extends StatelessWidget {
  const BusSecretaryDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2EEEE),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF2EEEE),
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'logout') {
                _showLogoutDialog(context);
              }
            },
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.logout, color: Colors.red),
                    SizedBox(width: 10),
                    Text("Logout"),
                  ],
                ),
              ),
            ],
            icon: const Icon(Icons.menu, color: Colors.black),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ASSIGN BUS / ROLE CARD
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF0A5C43),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  _actionTile(icon: Icons.directions_bus, text: "Assign Bus"),
                  const SizedBox(height: 16),
                  _actionTile(
                    icon: Icons.person_outline,
                    text: "Assign Role",
                    underline: true,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // USER MANAGEMENT BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2E2E2E),
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const UserManagementScreen(),
                    ),
                  );
                },
                child: const Text(
                  "User Management",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // MAP CARD
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Stack(
                children: [
                  Container(
                    height: 220,
                    alignment: Alignment.center,
                    child: const Text(
                      "MAP_VIEW",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  Positioned(
                    bottom: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFA6D854),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        "Tap to Track",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _actionTile({
    required IconData icon,
    required String text,
    bool underline = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(icon, size: 28),
          const SizedBox(width: 16),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              decoration: underline ? TextDecoration.underline : null,
            ),
          ),
        ],
      ),
    );
  }

  void _logout(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const UserLogin()),
      (route) => false, // removes all previous screens
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _logout(context);
            },
            child: const Text("Logout", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
