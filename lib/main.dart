import 'package:flutter/material.dart';
import 'models/patient.dart';

void main() {
  runApp(const HomeopathyApp());
}

class HomeopathyApp extends StatelessWidget {
  const HomeopathyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dr.Lalu\'s Assistant',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: PatientListScreen(),
    );
  }
}

class Treatment {
  final String date;
  final String complaint;
  final String medicine;
  final String prescriptionImage;
  final String? notes;

  Treatment({
    required this.date,
    required this.complaint,
    required this.medicine,
    required this.prescriptionImage,
    this.notes,
  });
}

class Patient {
  final String name;
  final String phone;
  final String lastVisit;
  final List<Treatment> treatments;

  Patient({
    required this.name,
    required this.phone,
    required this.lastVisit,
    required this.treatments,
  });
}

class PatientListScreen extends StatelessWidget {
  PatientListScreen({super.key});

  final List<Patient> patients = [
    Patient(
      name: 'Joseph T C',
      phone: '+91 7795 420 113',
      lastVisit: '2024-03-15',
      treatments: [
        Treatment(
          date: '2024-03-15',
          complaint: 'Migraine',
          medicine: 'Nux Vomica 200',
          prescriptionImage: 'assets/prescriptions/prescription1.jpg',
          notes: 'Follow up after 2 weeks',
        ),
        Treatment(
          date: '2024-02-10',
          complaint: 'Cold',
          medicine: 'Arsenicum Album 30',
          prescriptionImage: 'assets/prescriptions/prescription2.jpg',
          notes: 'Take medicine after food',
        ),
      ],
    ),
    Patient(
      name: 'Tintu T C',
      phone: '+91 9895 634670',
      lastVisit: '2024-03-14',
      treatments: [
        Treatment(
          date: '2024-03-14',
          complaint: 'Joint Pain',
          medicine: 'Rhus Tox 200',
          prescriptionImage: 'assets/prescriptions/prescription3.jpg',
          notes: 'Apply warm compress',
        ),
      ],
    ),
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
            icon: Icon(Icons.home, color: Colors.purple[900]),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Set Availability'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: Icon(Icons.home),
                        title: Text('At Home'),
                        onTap: () {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Status: At Home')),
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.directions_car),
                        title: Text('On Visit'),
                        onTap: () {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Status: On Visit')),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.phone_callback, color: Colors.purple[900]),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Record Voice Message'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton.icon(
                        icon: Icon(Icons.mic),
                        label: Text('Start Recording'),
                        onPressed: () {
                          // TODO: Implement voice recording
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Voice recording started')),
                          );
                        },
                      ),
                    ],
                  ),
                ),
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
                fillColor: Colors.white,
                filled: true,
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
                  child: ExpansionTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.purple[200],
                      child: Text(
                        patients[index].name[0],
                        style: TextStyle(color: Colors.purple[900]),
                      ),
                    ),
                    title: Text(
                      patients[index].name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(patients[index].phone),
                        Text('Last Visit: ${patients[index].lastVisit}'),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.call),
                          onPressed: () {
                            // TODO: Implement call
                          },
                        ),
                        Icon(Icons.chevron_right),
                      ],
                    ),
                    children: [
                      ...patients[index].treatments.map((treatment) =>
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Divider(),
                                Text('Date: ${treatment.date}',
                                    style: TextStyle(fontWeight: FontWeight.bold)),
                                Text('Complaint: ${treatment.complaint}'),
                                Text('Medicine: ${treatment.medicine}'),
                                if (treatment.notes != null)
                                  Text('Notes: ${treatment.notes}'),
                                SizedBox(height: 8),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    treatment.prescriptionImage,
                                    height: 200,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) =>
                                        Container(
                                          height: 200,
                                          color: Colors.grey[200],
                                          child: Center(
                                            child: Icon(Icons.image_not_supported),
                                          ),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ).toList(),
                    ],
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
          // TODO: Implement add patient
        },
      ),
    );
  }
}