import 'package:bloc_clean_arxitectura/common/utils/widgets/app_style.dart';
import 'package:bloc_clean_arxitectura/common/utils/widgets/constants.dart';
import 'package:bloc_clean_arxitectura/common/utils/widgets/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/page_one.dart';
import '../widgets/page_two.dart';

class OnBoardingPage extends ConsumerStatefulWidget {
  const OnBoardingPage({super.key});

  @override
  ConsumerState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends ConsumerState<OnBoardingPage> {
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: pageController,
            children: const [
              PageOne(),
              PageTwo(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          pageController.nextPage(duration:const Duration(milliseconds: 600), curve: Curves.ease);

                        },
                        icon: const Icon(
                          Ionicons.chevron_forward_circle,
                          size: 30,
                          color: AppConst.kLight,
                        ),
                      ),
                      const SizedBox(width: 5),
                      ReusableText(
                          text: "Skip",
                          style:
                              appStyle(16, AppConst.kLight, FontWeight.normal))
                    ],
                  ),
                  GestureDetector(
                    onTap: (){
                      pageController.nextPage(duration:const Duration(milliseconds: 600), curve: Curves.ease);

                    },
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: 2,
                      effect:const WormEffect(
                        dotHeight: 12,
                        dotWidth: 20,
                        spacing: 10,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
