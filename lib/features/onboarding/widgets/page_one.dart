import 'package:bloc_clean_arxitectura/common/utils/widgets/app_style.dart';
import 'package:bloc_clean_arxitectura/common/utils/widgets/constants.dart';
import 'package:bloc_clean_arxitectura/common/utils/widgets/reusable_text.dart';
import 'package:flutter/material.dart';

import '../../../generated/assets.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      color: AppConst.kBKDark,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Image.asset(Assets.imagesTodo),
          ),
          const SizedBox(height: 100),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ReusableText(
                text: "ToDo with Riverpod",
                style: appStyle(30, AppConst.kLight, FontWeight.w600),
              ),
              const SizedBox(height: 10),
              Padding(
                padding:const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Welcome!! Do yo want to create a task fast and with ease",
                  style: appStyle(16, AppConst.kLight, FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
