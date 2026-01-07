import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// import dashboards
import 'package:bus_tracker/screens/BusSecretaryDashboard.dart';
import 'package:bus_tracker/screens/BusAttendantDashboard.dart';
import 'package:bus_tracker/screens/DriverDashboard.dart';
import 'package:bus_tracker/screens/StudentDashboard.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});
  @override
  UserLoginState createState() => UserLoginState();
}

class UserLoginState extends State<UserLogin> {
  String textField1 = '';
  String textField2 = '';
  bool _obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          color: Color(0xFFFFFFFF),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: IntrinsicHeight(
                  child: Container(
                    color: Color(0xFFFFFFFF),
                    width: double.infinity,
                    height: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IntrinsicHeight(
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 6),
                              width: double.infinity,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IntrinsicWidth(
                                    child: IntrinsicHeight(
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                          right: 21,
                                        ),
                                        child: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 150,
                                                  height: 150,
                                                  child: Image.network(
                                                    "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Y8FDqv2vvv/grecp1b1_expires_30_days.png",
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              right: 20,
                                              width: 60,
                                              height: 60,
                                              child: Container(
                                                transform:
                                                    Matrix4.translationValues(
                                                      0,
                                                      45,
                                                      0,
                                                    ),
                                                width: 60,
                                                height: 60,
                                                child: Image.network(
                                                  "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Y8FDqv2vvv/b3gq0lvi_expires_30_days.png",
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: IntrinsicHeight(
                                      child: Container(
                                        width: double.infinity,
                                        child: Column(
                                          children: [
                                            IntrinsicHeight(
                                              child: Container(
                                                width: double.infinity,
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    IntrinsicWidth(
                                                      child: IntrinsicHeight(
                                                        child: Container(
                                                          margin:
                                                              const EdgeInsets.only(
                                                                right: 18,
                                                              ),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                margin:
                                                                    const EdgeInsets.only(
                                                                      bottom:
                                                                          15,
                                                                      left: 26,
                                                                    ),
                                                                width: 60,
                                                                height: 60,
                                                                child: Image.network(
                                                                  "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Y8FDqv2vvv/c6eky4cv_expires_30_days.png",
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 60,
                                                                height: 60,
                                                                child: Image.network(
                                                                  "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Y8FDqv2vvv/8kvq80aw_expires_30_days.png",
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        height: 150,
                                                        width: double.infinity,
                                                        child: Image.network(
                                                          "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Y8FDqv2vvv/tlshliih_expires_30_days.png",
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 60,
                                              height: 60,
                                              child: Image.network(
                                                "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Y8FDqv2vvv/1wrzmtu9_expires_30_days.png",
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          IntrinsicHeight(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(46),
                                color: Color(0xFF164D77),
                              ),
                              margin: const EdgeInsets.symmetric(
                                horizontal: 22,
                              ),
                              width: double.infinity,
                              child: Column(
                                children: [
                                  IntrinsicHeight(
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color(0xFFFFFFFF),
                                      ),
                                      margin: const EdgeInsets.only(
                                        top: 122,
                                        bottom: 30,
                                        left: 40,
                                        right: 40,
                                      ),
                                      width: double.infinity,
                                      child: TextField(
                                        style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontSize: 16,
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            textField1 = value;
                                          });
                                        },
                                        decoration: InputDecoration(
                                          hintText: "User Name",
                                          isDense: true,
                                          contentPadding: const EdgeInsets.only(
                                            top: 10,
                                            bottom: 10,
                                            left: 21,
                                            right: 21,
                                          ),
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          filled: false,
                                        ),
                                      ),
                                    ),
                                  ),
                                  IntrinsicHeight(
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color(0xFFFFFFFF),
                                      ),
                                      margin: const EdgeInsets.only(
                                        bottom: 55,
                                        left: 40,
                                        right: 40,
                                      ),
                                      width: double.infinity,
                                      child: TextField(
                                        obscureText:
                                            _obscurePassword, //  hide/show password
                                        textAlignVertical:
                                            TextAlignVertical.center,

                                        style: const TextStyle(
                                          color: Color(0xFF000000),
                                          fontSize: 16,
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            textField2 = value;
                                          });
                                        },
                                        decoration: InputDecoration(
                                          hintText: "Password",
                                          isDense: true,
                                          contentPadding: const EdgeInsets.only(
                                            top: 7,
                                            bottom: 7,
                                            left: 21,
                                            right: 21,
                                          ),
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          filled: false,

                                          //  EYE ICON
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              _obscurePassword
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: Colors.grey,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _obscurePassword =
                                                    !_obscurePassword;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: loginUser,
                                    child: IntrinsicWidth(
                                      child: IntrinsicHeight(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              31,
                                            ),
                                            color: Color(0xFFFFFFFF),
                                          ),
                                          padding: const EdgeInsets.only(
                                            top: 16,
                                            bottom: 16,
                                            left: 67,
                                            right: 67,
                                          ),
                                          margin: const EdgeInsets.only(
                                            bottom: 74,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Login",
                                                style: TextStyle(
                                                  color: Color(0xFF000000),
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          IntrinsicWidth(
                            child: IntrinsicHeight(
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 6),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    IntrinsicWidth(
                                      child: IntrinsicHeight(
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                            right: 70,
                                          ),
                                          child: Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 150,
                                                    height: 150,
                                                    child: Image.network(
                                                      "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Y8FDqv2vvv/whlntzbn_expires_30_days.png",
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Positioned(
                                                bottom: 8,
                                                right: 0,
                                                width: 60,
                                                height: 60,
                                                child: Container(
                                                  transform:
                                                      Matrix4.translationValues(
                                                        17,
                                                        0,
                                                        0,
                                                      ),
                                                  width: 60,
                                                  height: 60,
                                                  child: Image.network(
                                                    "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Y8FDqv2vvv/5xwvjqig_expires_30_days.png",
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 22),
                                      width: 60,
                                      height: 60,
                                      child: Image.network(
                                        "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Y8FDqv2vvv/gnkq5is6_expires_30_days.png",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 100),
                            width: 150,
                            height: 60,
                            child: Image.network(
                              "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Y8FDqv2vvv/3u6rh9vi_expires_30_days.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
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

  Future<void> loginUser() async {
    if (textField1.isEmpty || textField2.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter username and password")),
      );
      return;
    }

    try {
      final docRef = FirebaseFirestore.instance
          .collection('Users')
          .doc(textField1);
      final doc = await docRef.get();

      if (!doc.exists) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("User not found")));
        return;
      }

      final data = doc.data()!;
      final dbPassword = data['Password'];
      final role = data['Role'];
      final bool isActive = data['Active'] ?? true;

      if (!isActive) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Your account has been deactivated. Please contact the Bus Secretary.",
            ),
          ),
        );
        return;
      }

      int failedAttempts = data['FailedAttempts'] ?? 0;
      Timestamp? firstFailedAtTs = data['FirstFailedAt'];
      Timestamp? lockUntilTs = data['LockUntil'];

      final DateTime now = DateTime.now();

      // 🔒 CHECK ACCOUNT LOCK
      if (lockUntilTs != null) {
        final lockUntil = lockUntilTs.toDate();
        if (now.isBefore(lockUntil)) {
          final remaining = lockUntil.difference(now).inMinutes.clamp(1, 60);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Account locked. Try again in $remaining minutes."),
            ),
          );
          return;
        } else {
          // Lock expired → reset everything
          await docRef.update({
            'FailedAttempts': 0,
            'FirstFailedAt': null,
            'LockUntil': null,
          });
          failedAttempts = 0;
          firstFailedAtTs = null;
        }
      }

      //  WRONG PASSWORD
      if (dbPassword != textField2) {
        // First failed attempt
        if (firstFailedAtTs == null) {
          await docRef.update({
            'FailedAttempts': 1,
            'FirstFailedAt': Timestamp.fromDate(now),
          });

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Incorrect password. Attempt 1 of 5")),
          );
          return;
        }

        final firstFailedAt = firstFailedAtTs.toDate();

        // ⏳ If 1 hour passed → reset counter
        if (now.difference(firstFailedAt).inHours >= 1) {
          await docRef.update({
            'FailedAttempts': 1,
            'FirstFailedAt': Timestamp.fromDate(now),
          });

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Previous attempts expired. Attempt 1 of 5"),
            ),
          );
          return;
        }

        // Increment attempts
        failedAttempts++;

        if (failedAttempts >= 5) {
          await docRef.update({
            'FailedAttempts': 0,
            'FirstFailedAt': null,
            'LockUntil': Timestamp.fromDate(now.add(const Duration(hours: 1))),
          });

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Too many failed attempts. Account locked for 1 hour.",
              ),
            ),
          );
        } else {
          await docRef.update({'FailedAttempts': failedAttempts});

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Incorrect password. Attempt $failedAttempts of 5.",
              ),
            ),
          );
        }
        return;
      }

      //  SUCCESSFUL LOGIN → RESET SECURITY DATA
      await docRef.update({
        'FailedAttempts': 0,
        'FirstFailedAt': null,
        'LockUntil': null,
      });

      //  REDIRECT BY ROLE
      switch (role) {
        case 'Bus Secretary':
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const BusSecretaryDashboard()),
          );
          break;

        case 'Driver':
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const DriverDashboard()),
          );
          break;

        case 'Student':
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const StudentDashboard()),
          );
          break;

        case 'Bus Attendant':
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const BusAttendantDashboard()),
          );
          break;

        default:
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Invalid user role")));
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Login failed: $e")));
    }
  }
}
