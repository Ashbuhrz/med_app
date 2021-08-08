import 'package:get/get.dart';

import 'local_provider.dart';

Future initServices() async {
  print('starting services ...');

  /// Here is where you put get_storage, hive, shared_pref initialization.
  /// or moor connection, or whatever that's async.
  await Get.putAsync(() => DbService().init());
  print('All services started...');
}
