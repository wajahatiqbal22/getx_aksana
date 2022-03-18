import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/routes.dart';

class GetxAksana extends StatelessWidget {
  const GetxAksana({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashScreen,
      getPages: Routes.routes,
    );
  }
}
