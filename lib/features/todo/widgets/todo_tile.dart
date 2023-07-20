import 'package:bloc_clean_arxitectura/common/utils/widgets/app_style.dart';
import 'package:bloc_clean_arxitectura/common/utils/widgets/constants.dart';
import 'package:bloc_clean_arxitectura/common/utils/widgets/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    super.key,
    this.color,
    this.title,
    this.description,
    this.start,
    this.end,
    this.editWidget,
    this.delete,
    this.switcher,
  });

  final Color? color;
  final String? title;
  final String? description;
  final String? start;
  final String? end;
  final Widget? editWidget;
  final Widget? switcher;
  final VoidCallback? delete;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            width: size.width,
            decoration: BoxDecoration(
              color: AppConst.kGreyLight,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 80,
                      width: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: color ?? AppConst.kGreen,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: SizedBox(
                        width: size.width * 0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ReusableText(
                              text: title ?? "Title",
                              style: appStyle(
                                  18, AppConst.kLight, FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            ReusableText(
                              text: description ?? "Description",
                              style: appStyle(
                                  12, AppConst.kLight, FontWeight.w500),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: size.width * 0.3,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppConst.kGreyDk, width: 0.3),
                                      borderRadius: BorderRadius.circular(12),
                                      color: AppConst.kBKDark),
                                  child: Center(
                                    child: ReusableText(
                                        text: "$start | $end",
                                        style: appStyle(12, AppConst.kLight,
                                            FontWeight.normal)),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Row(
                                  children: [
                                    SizedBox(
                                      child: editWidget,
                                    ),
                                    const SizedBox(width: 20),
                                    GestureDetector(
                                      onTap: delete,
                                      child: const Icon(
                                          MaterialCommunityIcons.delete_circle),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: switcher,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
