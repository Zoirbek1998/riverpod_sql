import 'package:bloc_clean_arxitectura/common/utils/widgets/custom_otn_btn.dart';
import 'package:flutter/material.dart';

import '../../../common/utils/widgets/app_style.dart';
import '../../../common/utils/widgets/constants.dart';
import '../../../common/utils/widgets/reusable_text.dart';
import '../../../generated/assets.dart';
import '../../auth/pages/login_page.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

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
          const SizedBox(height: 50),
          CustomOtnBtn(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginPage()));
            },
            color: AppConst.kLight,
            text: 'Login with a phone number',
            width: size.width * 0.9,
            height: size.height * 0.06,
          )
        ],
      ),
    );
  }
}
