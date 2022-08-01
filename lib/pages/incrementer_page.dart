import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:learn_flutter_getx/controller/incrementer_controller.dart';

class GetxStateManager extends StatelessWidget {
  // const GetxStateManager({Key? key}) : super(key: key);

  final incrementerController  = Get.put(IncrementerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text("${incrementerController.dataIntReactive}", style: TextStyle(fontSize: 30),),), // reactive getx
            GetBuilder<IncrementerController>(builder: (controller) => Text("${controller.dataIntSimple}", style: TextStyle(fontSize: 30),),), // simple getx
            SizedBox(height: 40,),
            ElevatedButton(onPressed: (){ incrementerController.addData(); }, child: Text("Add Data")), // reactive getx
            SizedBox(height: 10,),
            ElevatedButton(onPressed: () { incrementerController.refresher(); }, child: Text("Refresh page")) // simple getx
          ],
        ),
      ),
    );
  }
}