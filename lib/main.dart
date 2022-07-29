import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(TryApp());
}

class TryApp extends StatelessWidget {
  const TryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: Home()); // use getx here
  }
}

class HomeController extends GetxController {
  var dataNum = 0.obs; // observe by getx
  increment() => dataNum++;
  decrement() => dataNum--;
}

class Home extends StatelessWidget {
  // const Home({Key? key}) : super(key: key);
  final homectrl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    print("yes, its rendered !"); // only once rendered
    return Scaffold(
      appBar: AppBar(
          title: const Text("Stateless page with getx"), centerTitle: true),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          // Obx(() => Text(
          //   "${homectrl.dataNum.value}",
          //   style: TextStyle(fontSize: 20),
          // )),
          Obx(() {
            print("rendered by obx");
            return Text(
              "${homectrl.dataNum.value}",
              style: TextStyle(fontSize: 20),
            );
          }),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                  onPressed: () {
                    homectrl.increment();
                  },
                  child: Text("+")),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    homectrl.decrement();
                  },
                  child: Text("-"))
            ],
          )
        ]),
      ),
    );
  }
}

// class SnackBarCommon extends StatelessWidget {
//   const SnackBarCommon({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Snackbar")),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: (() {
//             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//               content: Text("Hello"),
//               action: SnackBarAction(
//                 label: "labels",
//                 onPressed: () {},
//               ),
//             ));
//           }),
//           child: const Text("Open snackbar"),
//         ),
//       ),
//     );
//   }
// }

// class SnackBarGetx extends StatelessWidget {
//   const SnackBarGetx({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Snackbar")),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: (() {
//             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//               content: Text("Hello"),
//               action: SnackBarAction(
//                 label: "labels",
//                 onPressed: () {},
//               ),
//             ));
//           }),
//           child: const Text("Open snackbar"),
//         ),
//       ),
//     );
//   }
// }



// class Home extends StatefulWidget {
//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   int data = 0;

//   // const Home({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     // stful makes whole page is re-render
//     print("yes, it's rerender again bro !");
//     return Scaffold(
//       appBar: AppBar(title: const Text("Stateless page without getx"), centerTitle: true),
//       body: Center(
//         child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//           Text(
//             "$data",
//             style: TextStyle(fontSize: 20),
//           ),
//           SizedBox(
//             height: 50,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       data = data + 1;
//                     });
//                   },
//                   child: Text("+")),
//               SizedBox(
//                 width: 10,
//               ),
//               ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       data = data - 1;
//                     });
//                   },
//                   child: Text("-"))
//             ],
//           )
//         ]),
//       ),
//     );
//   }
// }
