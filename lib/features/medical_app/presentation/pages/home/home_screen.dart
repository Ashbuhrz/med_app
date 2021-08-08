import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinetest/features/medical_app/domain/entity/medical_model.dart';
import 'package:machinetest/features/medical_app/presentation/controllers/auth_controller/auth_controller.dart';
import 'package:machinetest/features/medical_app/presentation/controllers/problem_controller/problem_controller.dart';
import 'package:machinetest/features/medical_app/presentation/widgets/custom_app_bar.dart';
import 'package:machinetest/features/medical_app/presentation/widgets/medicine_list_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<AssociatedDrug>?> futureMedicineList;

  final ProblemController _problemController = Get.put(ProblemController());
  final AuthController _authController = Get.find<AuthController>();

  @override
  void initState() {
    futureMedicineList = _problemController.getAssociatedDrugs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Welcome,\n${_authController.userState.userName()}',
      ),
      body: FutureBuilder<List<AssociatedDrug>?>(
        future: futureMedicineList,
        builder: (context, AsyncSnapshot<List<AssociatedDrug>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 16),
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final medicines = snapshot.data![index];
                  return MedicineListBox(medicines: medicines);
                });
          } else {
            return Text('Empty');
          }
        },
      ),
    );
  }
}
