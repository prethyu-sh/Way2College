import 'package:flutter/material.dart';

class DriverDashboard extends StatelessWidget {
  const DriverDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      //  APP BAR
      appBar: AppBar(
        backgroundColor: const Color(0xFF154C79),
        elevation: 0,
        automaticallyImplyLeading: false, // ❌ disables back arrow
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
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
                onPressed: () {
                  // TODO: open drawer / logout
                },
              ),
            ),
          ),
        ],
      ),

      //  BODY
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),

            //  ASSIGNED INFO CARD
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF154C79),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    _infoTile("ASSIGNED BUS"),
                    const SizedBox(height: 12),
                    _infoTile("ASSIGNED ROUTE"),
                    const SizedBox(height: 12),
                    Container(
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child: Text('Details')),
                      width: double.infinity,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            //  MAP PREVIEW
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage("assets/map_placeholder.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            //  ROUTES AND STOPS BUTTON
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF154C79),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 14,
                ),
              ),
              onPressed: () {
                // TODO: Navigate to routes & stops page
              },
              child: const Text(
                "ROUTES AND STOPS",
                style: TextStyle(fontSize: 16),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  //  Reusable tile
  Widget _infoTile(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
