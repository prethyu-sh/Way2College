import 'package:flutter/material.dart';
import 'LoginOrSigup.dart';

class LoadingScreen1 extends StatefulWidget {
  const LoadingScreen1({super.key});

  @override
  LoadingScreen1State createState() => LoadingScreen1State();
}

class LoadingScreen1State extends State<LoadingScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          color: const Color(0xFFFFFFFF),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(-1, -1),
                      end: Alignment(-1, 1),
                      colors: [
                        Color(0xFFF2F2F6),
                        Color(0xFFFFFFFF),
                      ],
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 140),
                        const Text(
                          "WAY2COLLEGE",
                          style: TextStyle(fontSize: 40, color: Colors.black),
                        ),
                        const SizedBox(height: 90),
                        Image.network(
                          "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Y8FDqv2vvv/ifu8kzph_expires_30_days.png",
                          height: 150,
                        ),
                        const SizedBox(height: 110),

                        // GET STARTED BUTTON
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const LoginOrSigup()),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 74, vertical: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(37),
                              color: const Color(0xFF154C77),
                            ),
                            child: const Text(
                              "GET STARTED",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),

                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
