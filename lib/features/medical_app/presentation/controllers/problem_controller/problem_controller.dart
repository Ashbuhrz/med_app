import 'package:get/get.dart';
import 'package:machinetest/features/medical_app/data/remote/remote_data.dart';
import 'package:machinetest/features/medical_app/domain/entity/medical_model.dart';

class ProblemController extends GetxController {
  final GetMedicalProblems _medicalProblems = GetMedicalProblems();

  Future<Problems> getProblemData() async {
    return _medicalProblems.getMedicalData();
  }

  Future<List<MedicationsClass>?> getMedicationClasses() async {
    final medicalData = await getProblemData();
    final medicationClasses = medicalData
        .problems.first.diabetes!.first.medications!.first.medicationsClasses;
    return medicationClasses;
  }

  Future<List<AssociatedDrug>?> getAssociatedDrugs() async {
    final medicalData = await getMedicationClasses();
    List<AssociatedDrug> associatedDrugData = [];
    associatedDrugData
        .add(medicalData!.first.className!.first.associatedDrug!.first);
    associatedDrugData
        .add(medicalData.first.className!.first.associatedDrug2!.first);
    associatedDrugData
        .add(medicalData.first.className2!.first.associatedDrug!.first);
    associatedDrugData
        .add(medicalData.first.className2!.first.associatedDrug2!.first);
    return associatedDrugData;
  }
}
