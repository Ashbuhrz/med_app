// To parse this JSON data, do
//
//     final problems = problemsFromMap(jsonString);

import 'dart:convert';

class Problems {
  Problems({
    required this.problems,
  });

  final List<Problem> problems;

  factory Problems.fromJson(String str) => Problems.fromMap(json.decode(str));

  // String toJson() => json.encode(toMap());

  factory Problems.fromMap(Map<String, dynamic> json) => Problems(
        problems:
            List<Problem>.from(json["problems"].map((x) => Problem.fromMap(x))),
      );

  // Map<String, dynamic> toMap() => {
  //       "problems": List<dynamic>.from(problems.map((x) => x.toMap())),
  //     };
}

class Problem {
  Problem({
    this.diabetes,
    this.asthma,
  });

  final List<Diabetes>? diabetes;
  final List<Asthma>? asthma;

  factory Problem.fromJson(String str) => Problem.fromMap(json.decode(str));

  // String toJson() => json.encode(toMap());

  factory Problem.fromMap(Map<String, dynamic> json) => Problem(
        diabetes: json['Diabetes'] == null
            ? null
            : List<Diabetes>.from(
                json["Diabetes"].map((x) => Diabetes.fromMap(x))),
        asthma: json['Asthma'] == null
            ? null
            : List<Asthma>.from(json["Asthma"].map((x) => Asthma.fromMap(x))),
      );

  // Map<String, dynamic> toMap() => {
  //       "Diabetes": List<dynamic>.from(diabetes.map((x) => x.toMap())),
  //       "Asthma": List<dynamic>.from(asthma.map((x) => x.toMap())),
  //     };
}

class Asthma {
  Asthma();

  factory Asthma.fromJson(String str) => Asthma.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Asthma.fromMap(Map<String, dynamic> json) => Asthma();

  Map<String, dynamic> toMap() => {};
}

class Diabetes {
  Diabetes({
    this.medications,
    this.labs,
  });

  final List<Medication>? medications;
  final List<Lab>? labs;

  factory Diabetes.fromJson(String str) => Diabetes.fromMap(json.decode(str));

  // String toJson() => json.encode(toMap());

  factory Diabetes.fromMap(Map<String, dynamic> json) => Diabetes(
        medications: List<Medication>.from(
            json["medications"].map((x) => Medication.fromMap(x))),
        labs: List<Lab>.from(json["labs"].map((x) => Lab.fromMap(x))),
      );

  // Map<String, dynamic> toMap() => {
  //       "medications": List<dynamic>.from(medications.map((x) => x.toMap())),
  //       "labs": List<dynamic>.from(labs.map((x) => x.toMap())),
  //     };
}

class Lab {
  Lab({
    this.missingField,
  });

  final String? missingField;

  factory Lab.fromJson(String str) => Lab.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Lab.fromMap(Map<String, dynamic> json) => Lab(
        missingField: json["missing_field"],
      );

  Map<String, dynamic> toMap() => {
        "missing_field": missingField,
      };
}

class Medication {
  Medication({
    this.medicationsClasses,
  });

  final List<MedicationsClass>? medicationsClasses;

  factory Medication.fromJson(String str) =>
      Medication.fromMap(json.decode(str));

  // String toJson() => json.encode(toMap());

  factory Medication.fromMap(Map<String, dynamic> json) => Medication(
        medicationsClasses: List<MedicationsClass>.from(
            json["medicationsClasses"].map((x) => MedicationsClass.fromMap(x))),
      );

  // Map<String, dynamic> toMap() => {
  //       "medicationsClasses":
  //           List<dynamic>.from(medicationsClasses.map((x) => x.toMap())),
  //     };
}

class MedicationsClass {
  MedicationsClass({
    this.className,
    this.className2,
  });

  final List<ClassName>? className;
  final List<ClassName>? className2;

  factory MedicationsClass.fromJson(String str) =>
      MedicationsClass.fromMap(json.decode(str));

  // String toJson() => json.encode(toMap());

  factory MedicationsClass.fromMap(Map<String, dynamic> json) =>
      MedicationsClass(
        className: List<ClassName>.from(
            json["className"].map((x) => ClassName.fromMap(x))),
        className2: List<ClassName>.from(
            json["className2"].map((x) => ClassName.fromMap(x))),
      );

  // Map<String, dynamic> toMap() => {
  //       "className": List<dynamic>.from(className.map((x) => x.toMap())),
  //       "className2": List<dynamic>.from(className2.map((x) => x.toMap())),
  //     };
}

class ClassName {
  ClassName({
    this.associatedDrug,
    this.associatedDrug2,
  });

  final List<AssociatedDrug>? associatedDrug;
  final List<AssociatedDrug>? associatedDrug2;

  factory ClassName.fromJson(String str) => ClassName.fromMap(json.decode(str));

  // String toJson() => json.encode(toMap());

  factory ClassName.fromMap(Map<String, dynamic> json) => ClassName(
        associatedDrug: List<AssociatedDrug>.from(
            json["associatedDrug"].map((x) => AssociatedDrug.fromMap(x))),
        associatedDrug2: List<AssociatedDrug>.from(
            json["associatedDrug#2"].map((x) => AssociatedDrug.fromMap(x))),
      );

  // Map<String, dynamic> toMap() => {
  //       "associatedDrug":
  //           List<dynamic>.from(associatedDrug.map((x) => x.toMap())),
  //       "associatedDrug#2":
  //           List<dynamic>.from(associatedDrug2.map((x) => x.toMap())),
  //     };
}

class AssociatedDrug {
  AssociatedDrug({
    this.name,
    this.dose,
    this.strength,
  });

  final String? name;
  final String? dose;
  final String? strength;

  factory AssociatedDrug.fromJson(String str) =>
      AssociatedDrug.fromMap(json.decode(str));

  // String toJson() => json.encode(toMap());

  factory AssociatedDrug.fromMap(Map<String, dynamic> json) => AssociatedDrug(
        name: json["name"],
        dose: json["dose"],
        strength: json["strength"],
      );

  // Map<String, dynamic> toMap() => {
  //       "name": name,
  //       "dose": dose,
  //       "strength": strength,
  //     };
}
