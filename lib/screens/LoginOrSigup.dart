import 'package:flutter/material.dart';
import 'UserLogin.dart';
import 'UserRegister.dart';

class LoginOrSigup extends StatefulWidget {
  const LoginOrSigup({super.key});

  @override
  LoginOrSigupState createState() => LoginOrSigupState();
}

class LoginOrSigupState extends State<LoginOrSigup> {
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
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(46),
                          color: const Color(0xFF154C77),
                        ),
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          children: [
                            const SizedBox(height: 200),

                            // LOGIN BUTTON
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const UserLogin()),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 80, vertical: 32),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(41),
                                  color: Colors.white,
                                ),
                                child: const Text(
                                  "LOGIN",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),

                            const SizedBox(height: 20),

                            // SIGN UP
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const UserRegister()),
                                );
                              },
                              child: const Text(
                                "New user? sign in",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
