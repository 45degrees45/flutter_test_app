// lib/models/patient.dart
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

class Treatment {
  final String date;
  final String complaint;
  final String medicine;
  final String prescriptionImage;

  Treatment({
    required this.date,
    required this.complaint,
    required this.medicine,
    required this.prescriptionImage,
  });
}
