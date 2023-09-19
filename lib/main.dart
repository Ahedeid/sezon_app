import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:sezon_app/controllers/local_controller.dart';
import 'package:sezon_app/firebase_options.dart';
import 'package:sezon_app/router/route_name.dart';
import 'package:sezon_app/router/router.dart';
import 'package:sezon_app/service_locator.dart';
import 'package:sezon_app/services/authServices/auth_service.dart';
import 'package:sezon_app/utils/languages.dart';
import 'package:sezon_app/utils/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
    Get.put(AuthService());
  });
  await init();

  Stripe.publishableKey =
      'pk_test_51NrxQzIBQSM6ft7jjLug7WUJQiaLc72qxGNF5Jyskyecr0VEIXvAxODMcm9klpNDhwMhY1Ig6xXo5vK73n8zkTCn00CIMrNqi7';
  await Stripe.instance.applySettings();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(const SezonApp());
}

class SezonApp extends StatelessWidget {
  const SezonApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LocalController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sezon App',
      theme: ThemeManager.theme,
      initialRoute: RouteName.splashRoute,
      getPages: AppRoute.routes,
      translations: Languages(),
      locale: Get.deviceLocale,
    );
  }
}

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: CategorySelectionScreen(),
//     );
//   }
// }
//
// class CategorySelectionScreen extends StatefulWidget {
//   @override
//   _CategorySelectionScreenState createState() =>
//       _CategorySelectionScreenState();
// }
//
// class _CategorySelectionScreenState extends State<CategorySelectionScreen> {
//   List<Map<String, String>> categories = [
//     {"name": "Category 1", "id": "65567567asd"},
//     {"name": "Category 2", "id": "asdasd67567sad6756sd"},
//     // Add more categories here
//   ];
//
//   String selectedCategory = "";
//
//   void _showCategoryBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           height: 200, // Adjust the height as needed
//           child: ListView.builder(
//             itemCount: categories.length,
//             itemBuilder: (BuildContext context, int index) {
//               final category = categories[index];
//               return ListTile(
//                 title: Text(category['name'] ?? ''),
//                 onTap: () {
//                   setState(() {
//                     selectedCategory = category['name'] ?? '';
//                   });
//                   Navigator.pop(context); // Close the bottom sheet
//                 },
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
//
//
//   void _showCategorySelectionBottomSheet(BuildContext context) async {
//     final result = await showModalBottomSheet<String>(
//       context: context,
//       builder: (BuildContext context) {
//         return CategorySelectionBottomSheet(categories: categories);
//       },
//     );
//
//     if (result != null) {
//       setState(() {
//         selectedCategory = result;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Category Selection'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Selected Category:',
//               style: TextStyle(fontSize: 20),
//             ),
//             Text(
//               selectedCategory,
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 _showCategorySelectionBottomSheet(context);
//               },
//               child: Text('Select Category'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
// }
//
//
// class CategorySelectionBottomSheet extends StatefulWidget {
//   final List<Map<String, String>> categories;
//
//   CategorySelectionBottomSheet({required this.categories});
//
//   @override
//   _CategorySelectionBottomSheetState createState() =>
//       _CategorySelectionBottomSheetState();
// }
//
// class _CategorySelectionBottomSheetState
//     extends State<CategorySelectionBottomSheet> {
//   String? selectedCategory;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // Close the bottom sheet when tapped outside the content.
//         Navigator.pop(context, selectedCategory);
//       },
//       child: Container(
//         color: Colors.transparent,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Container(
//               padding: EdgeInsets.all(16.0),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
//               ),
//               child: Text(
//                 'Select Category ${selectedCategory}',
//                 style: TextStyle(
//                   fontSize: 18.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             ListView.builder(
//               shrinkWrap: true,
//               itemCount: widget.categories.length,
//               itemBuilder: (context, index) {
//                 final category = widget.categories[index];
//                 return ListTile(
//                   title: Text(category['name']!),
//                   leading: Radio<String>(
//                     value: category['id']!,
//                     groupValue: selectedCategory,
//                     onChanged: (value) {
//                       setState(() {
//                         selectedCategory = value;
//                       });
//                     },
//                   ),
//                   onTap: () {
//                     setState(() {
//                       selectedCategory = category['id'];
//                     });
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
