import 'package:flutter/material.dart';

void main() {
  runApp(HomeopathyApp());
}

class HomeopathyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dr.Lalu\'s Assistant',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: PatientListScreen(),
    );
  }
}

class PatientListScreen extends StatelessWidget {
  final List<Map<String, String>> patients = [
    {
      'name': 'Joseph T C',
      'phone': '+91 7795 420 113',
      'lastVisit': '2024-03-15',
    },
    {
      'name': 'Tintu T C',
      'phone': '+91 9895 634670',
      'lastVisit': '2024-03-14',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        title: Text(
          'Dr.Lalu\'s Assistant',
          style: TextStyle(color: Colors.purple[900]),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Doctor is at home')),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('No new notifications')),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search patients...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                // TODO: Implement search
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: patients.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.purple[200],
                      child: Text(
                        patients[index]['name']![0],
                        style: TextStyle(color: Colors.purple[900]),
                      ),
                    ),
                    title: Text(patients[index]['name']!),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(patients[index]['phone']!),
                        Text('Last Visit: ${patients[index]['lastVisit']}'),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.call),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Calling ${patients[index]['name']}')),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.message),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Messaging ${patients[index]['name']}')),
                            );
                          },
                        ),
                      ],
                    ),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Opening ${patients[index]['name']}\'s details')),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: Icon(Icons.add),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Add new patient')),
          );
        },
      ),
    );
  }
}