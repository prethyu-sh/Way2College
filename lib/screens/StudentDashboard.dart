import 'package:flutter/material.dart';

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // 🔹 APP BAR
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
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                icon: const Icon(Icons.menu, color: Colors.black),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),

      // 🔹 BODY (Scrollable)
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            // 🔵 ROUTE SELECTED CARD
            _blueCard(
              child: Column(
                children: [
                  _whiteTile("ROUTE SELECTED"),
                  const SizedBox(height: 12),
                  _whiteBar(),
                  const SizedBox(height: 12),
                  _whiteBar(),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🗺 MAP + BUS STATUS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 220,
                      alignment: Alignment.center,
                      child: const Text(
                        "map_view",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _roundedButton("BUS STATUS", () {}),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // 🚌 BUS PASS CARD
            _blueCard(
              child: Column(
                children: [
                  _whiteTile("BUS PASS"),
                  const SizedBox(height: 16),
                  _roundedButton("APPLY FOR BUS PASS", () {}),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // 🔎 LOST AND FOUND CARD
            _blueCard(
              child: Column(
                children: [
                  _whiteBar(height: 50),
                  const SizedBox(height: 20),
                  _whiteTile("LOST AND FOUND"),
                ],
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // 🔹 BLUE CONTAINER
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

  // 🔹 WHITE TILE
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

  // 🔹 WHITE BAR
  Widget _whiteBar({double height = 20}) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  // 🔹 ROUNDED BUTTON
  Widget _roundedButton(String text, VoidCallback onTap) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF154C79),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
      ),
      onPressed: onTap,
      child: Text(text, style: const TextStyle(fontSize: 16)),
    );
  }
}
