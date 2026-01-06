import 'package:bus_tracker/screens/UserManagement.dart';
import 'package:flutter/material.dart';
import 'package:bus_tracker/screens/UserLogin.dart';

class BusSecretaryDashboard extends StatelessWidget {
  const BusSecretaryDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      //  APP BAR
      appBar: AppBar(
        backgroundColor: const Color(0xFF154C79),
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.person, color: Colors.black),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'logout') {
                  _showLogoutDialog(context);
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
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
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(8),
                child: const Icon(Icons.menu, color: Colors.black),
              ),
            ),
          ),
        ],
      ),

      //  BODY (SCROLLABLE)
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            //  ROLE & ROUTE CARD
            _blueCard(
              child: Column(
                children: [
                  _whiteTile("ROLE SELECTED"),
                  const SizedBox(height: 16),
                  _whiteTile("ROUTE ASSIGNED"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            //  USER MANAGEMENT BUTTON
            _roundedButton("USER MANAGEMENT", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const UserManagementScreen()),
              );
            }),

            const SizedBox(height: 20),

            //  MAP + BUS PASS FEE
            _blueCard(
              child: Column(
                children: [
                  Container(
                    height: 180,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text(
                      "MAP_VIEW",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 70,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Text(
                            "BUS PASS FEE",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
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

  //  BLUE CARD
  Widget _blueCard({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF154C79),
          borderRadius: BorderRadius.circular(20),
        ),
        child: child,
      ),
    );
  }

  //  WHITE TILE
  Widget _whiteTile(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  //  ROUNDED BUTTON
  Widget _roundedButton(String text, VoidCallback onTap) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF154C79),
        foregroundColor: Colors.white, // ⭐ THIS fixes text color
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
      ),
      onPressed: onTap,
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
