import 'package:flutter/material.dart';

import '../../../../utils/assets_path.dart';
import '../../../../utils/style_manager.dart';

class OnProgressOrders extends StatelessWidget {
  const OnProgressOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
        itemCount: 15,
        itemBuilder: (context, index) => Card(
              color: Colors.white,
              surfaceTintColor: Colors.white,
              margin: const EdgeInsets.only(bottom: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2)),
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Image.asset(
                    AssetPath.product,
                    height: 63,
                    width: 83,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('خزف ملون صنع يدوي',
                          style: StyleManager.smallText(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                      Text(
                          'هذا النص هو مثال لنص يمكن أن يستبدل \nتوليد هذا النص من مولد النص العربى...')
                    ],
                  )
                ]),
              ),
            ));
  }
}
