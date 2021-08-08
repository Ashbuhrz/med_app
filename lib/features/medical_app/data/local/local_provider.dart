import 'package:get/get.dart';
import 'package:machinetest/features/medical_app/data/local/shared_pref.dart';

class DbService extends GetxService {
  Future<DbService> init() async {
    await StorageUtil().init();
    return this;
  }
}
