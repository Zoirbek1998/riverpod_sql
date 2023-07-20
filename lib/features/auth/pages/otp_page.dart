import 'package:bloc_clean_arxitectura/common/utils/widgets/app_style.dart';
import 'package:bloc_clean_arxitectura/common/utils/widgets/constants.dart';
import 'package:bloc_clean_arxitectura/common/utils/widgets/reusable_text.dart';
import 'package:bloc_clean_arxitectura/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Image.asset(
                Assets.imagesTodo,
                width: size.width * 0.5,
              ),
            ),
            const SizedBox(height: 26),
            ReusableText(
                text: 'Enter your otp code',
                style: appStyle(
                  18,
                  AppConst.kLight,
                  FontWeight.bold,
                )),
            const SizedBox(height: 26),
            Pinput(
              length: 6,
              showCursor: true,
              onCompleted: (value) {
                if (value.length == 6) {}
              },
              onSubmitted: (value) {
                if (value.length == 6) {}
              },
            )
          ],
        ),
      )),
    );
  }
}
