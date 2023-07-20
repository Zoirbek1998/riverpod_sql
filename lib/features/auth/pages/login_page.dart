import 'package:bloc_clean_arxitectura/common/utils/widgets/app_style.dart';
import 'package:bloc_clean_arxitectura/common/utils/widgets/custom_otn_btn.dart';
import 'package:bloc_clean_arxitectura/common/utils/widgets/reusable_text.dart';
import 'package:bloc_clean_arxitectura/generated/assets.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/utils/widgets/constants.dart';
import '../../../common/utils/widgets/custom_text_field.dart';
import 'otp_page.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  var phoneController = TextEditingController();
  Country country = Country(
    phoneCode: "998",
    countryCode: "UZ",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "UZB",
    example: "UZB",
    displayName: "United States",
    displayNameNoCountryCode: "UZ",
    e164Key: "",
  );

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Image.asset(Assets.imagesTodo),
              ),
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 16),
                child: ReusableText(
                  text: "Please enter your phone number",
                  style: appStyle(18, AppConst.kLight, FontWeight.w500),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: CustomTextField(
                  prefixIcon: GestureDetector(
                    onTap: () {
                      showCountryPicker(
                          context: context,
                          countryListTheme: CountryListThemeData(
                              backgroundColor: AppConst.kLight,
                              bottomSheetHeight: size.height * 0.6,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(12),
                                topLeft: Radius.circular(12),
                              )),
                          onSelect: (code) {
                            setState(() {
                              country = code;
                            });
                          });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6)
                          .copyWith(top: 12),
                      child: ReusableText(
                        text: "${country.flagEmoji} + ${country.phoneCode}",
                        style: appStyle(18, AppConst.kBKDark, FontWeight.w700),
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  hintText: 'Enter phone number',
                  hintStyle: appStyle(16, AppConst.kBKDark, FontWeight.w600),
                  controller: phoneController,
                ),
              ),
              const SizedBox(height: 20),
              CustomOtnBtn(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const OtpPage()));
                },
                color: AppConst.kBKDark,
                color2: AppConst.kLight,
                text: "Send Code",
                width: size.width * 0.9,
                height: size.height * 0.07,
              )
            ],
          ),
        ),
      ),
    );
  }
}
