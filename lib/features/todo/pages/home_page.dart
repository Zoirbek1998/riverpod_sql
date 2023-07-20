import 'package:bloc_clean_arxitectura/common/utils/widgets/app_style.dart';
import 'package:bloc_clean_arxitectura/common/utils/widgets/constants.dart';
import 'package:bloc_clean_arxitectura/common/utils/widgets/custom_text_field.dart';
import 'package:bloc_clean_arxitectura/common/utils/widgets/reusable_text.dart';
import 'package:bloc_clean_arxitectura/common/utils/widgets/xpansion_title.dart';
import 'package:bloc_clean_arxitectura/features/todo/controller/xpansion_provider.dart';
import 'package:bloc_clean_arxitectura/features/todo/pages/add.dart';
import 'package:bloc_clean_arxitectura/features/todo/widgets/todo_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../controller/todo/todo_provider.dart';
import '../widgets/today_task.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  late final TabController tabController =
      TabController(length: 2, vsync: this);
  var searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    ref.read(todoStateProvider.notifier).refresh();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(85),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                          text: "Dashboard",
                          style:
                              appStyle(18, AppConst.kLight, FontWeight.bold)),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AddTask()));
                        },
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                              color: AppConst.kLight,
                              borderRadius: BorderRadius.circular(9)),
                          child: const Icon(
                            Icons.add,
                            color: AppConst.kBKDark,
                            size: 18,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  hintText: "Search",
                  controller: searchController,
                  prefixIcon: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: const Icon(
                      AntDesign.search1,
                      color: AppConst.kGreyLight,
                    ),
                  ),
                  suffixIcon: const Icon(
                    FontAwesome.sliders,
                    color: AppConst.kGreyLight,
                  ),
                )
              ],
            ),
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              const SizedBox(height: 25),
              Row(
                children: [
                  const Icon(
                    FontAwesome.tasks,
                    size: 20,
                    color: AppConst.kLight,
                  ),
                  const SizedBox(width: 10),
                  ReusableText(
                      text: "Today's Task",
                      style: appStyle(18, AppConst.kLight, FontWeight.bold))
                ],
              ),
              const SizedBox(height: 26),
              Container(
                decoration: BoxDecoration(
                  color: AppConst.kLight,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                        color: AppConst.kGreyLight,
                        borderRadius: BorderRadius.circular(12)),
                    controller: tabController,
                    labelPadding: EdgeInsets.zero,
                    isScrollable: false,
                    labelStyle:
                        appStyle(24, AppConst.kGreyLight, FontWeight.w700),
                    unselectedLabelColor: AppConst.kLight,
                    tabs: [
                      Tab(
                        child: Container(
                          width: size.width * 0.5,
                          child: Center(
                            child: ReusableText(
                                text: "Pending",
                                style: appStyle(
                                    16, AppConst.kBKDark, FontWeight.bold)),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          padding: const EdgeInsets.only(left: 30),
                          width: size.width * 0.5,
                          child: Center(
                            child: ReusableText(
                                text: "Completed",
                                style: appStyle(
                                    16, AppConst.kBKDark, FontWeight.bold)),
                          ),
                        ),
                      ),
                    ]),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: size.height * 0.3,
                width: size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Container(
                          color: AppConst.kBkLight,
                          height: size.height * 0.3,
                          child:TodayTask()),
                      Container(
                        color: AppConst.kBkLight,
                        height: size.height * 0.3,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              XpanseionTitle(
                text: "Tomorrow's Task",
                text2: "Tomorrow's task are shown here",
                children: [
                  TodoTile(
                    start: "03:00",
                    end: "05:00",
                    switcher: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  )
                ],
                onExpansionChanged: (bool expanded) {
                  ref.read(xpansionStateProvider.notifier).setState(!expanded);
                },
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: ref.watch(xpansionStateProvider)
                      ? const Icon(
                          AntDesign.circledown,
                          color: AppConst.kLight,
                        )
                      : const Icon(
                          AntDesign.closecircleo,
                          color: AppConst.kBlueLight,
                        ),
                ),
              ),
              const SizedBox(height: 20),
              XpanseionTitle(
                text: DateTime.now()
                    .add(const Duration(days: 2))
                    .toString()
                    .substring(5, 10),
                text2: "Day After tomorrow task ",
                children: [
                  TodoTile(
                    start: "03:00",
                    end: "05:00",
                    switcher: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  )
                ],
                onExpansionChanged: (bool expanded) {
                  ref.read(xpansionStateProvider.notifier).setState(!expanded);
                },
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: ref.watch(xpansionStateProvider)
                      ? const Icon(
                          AntDesign.circledown,
                          color: AppConst.kLight,
                        )
                      : const Icon(
                          AntDesign.closecircleo,
                          color: AppConst.kBlueLight,
                        ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        )));
  }
}
