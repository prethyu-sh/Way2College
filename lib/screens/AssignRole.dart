import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AssignRoleScreen extends StatelessWidget {
  const AssignRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assign Role"),
        backgroundColor: const Color(0xFF154C79),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Users').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: snapshot.data!.docs.map((doc) {
              final data = doc.data() as Map<String, dynamic>;

              return Card(
                child: ListTile(
                  title: Text(data['Name']),
                  subtitle: Text("Current Role: ${data['Role']}"),
                  trailing: DropdownButton<String>(
                    value: data['Role'],
                    items: const [
                      DropdownMenuItem(
                        value: 'Bus Secretary',
                        child: Text('Bus Secretary'),
                      ),
                      DropdownMenuItem(value: 'Driver', child: Text('Driver')),
                      DropdownMenuItem(
                        value: 'Student',
                        child: Text('Student'),
                      ),
                      DropdownMenuItem(
                        value: 'Bus Attendant',
                        child: Text('Bus Attendant'),
                      ),
                    ],
                    onChanged: (newRole) async {
                      await FirebaseFirestore.instance
                          .collection('Users')
                          .doc(doc.id)
                          .update({'Role': newRole});
                    },
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
