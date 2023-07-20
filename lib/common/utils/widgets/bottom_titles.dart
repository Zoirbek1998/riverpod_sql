import 'package:bloc_clean_arxitectura/common/utils/widgets/app_style.dart';
import 'package:bloc_clean_arxitectura/common/utils/widgets/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'constants.dart';

class BottomTitle extends StatelessWidget {
  const BottomTitle({super.key, required this.text, required this.text2,  this.clr});

  final String text;
  final String text2;
  final Color? clr;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Consumer(builder: (context, ref, child) {
              return Container(
                height: 80,
                width: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppConst.kGreen
                ),
              );
            }),
            const SizedBox(width: 15),
            Padding(padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(text: text, style: appStyle(24, AppConst.kLight, FontWeight.bold)),
                const SizedBox(height: 10),
                ReusableText(text: text2, style: appStyle(12, AppConst.kLight, FontWeight.normal)),
              ],
            ),
            )
          ],
        ),
      ),
    );
  }
}
