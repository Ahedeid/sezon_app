import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/utils/assets_path.dart';
import 'package:sezon_app/utils/style_manager.dart';

class CompletedOrders extends StatelessWidget {
  const CompletedOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
        itemCount: 15,
        itemBuilder: (context, index) => Card(
              color: Colors.white,
              surfaceTintColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2)),
              margin: const EdgeInsets.only(bottom: 10),
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Image.asset(
                    AssetPath.product,
                    height: 63,
                    width: 83,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('handmade_colorful_ceramics'.tr,
                            style: StyleManager.smallText(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                        Text('this_text_is_an_example_of_text'.tr)
                      ],
                    ),
                  )
                ]),
              ),
            ));
  }
}
