import 'package:bloc_clean_arxitectura/common/utils/widgets/constants.dart';
import 'package:flutter/material.dart';

import 'bottom_titles.dart';

class XpanseionTitle extends StatelessWidget {
  const XpanseionTitle(
      {super.key,
      required this.text,
      required this.text2,
      this.onExpansionChanged,
      this.trailing,
      required this.children});

  final String text;
  final String text2;
  final void Function(bool)? onExpansionChanged;
  final Widget? trailing;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: AppConst.kBkLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            title: BottomTitle(
              text: text,
              text2: text2,
            ),
            tilePadding: EdgeInsets.zero,
            childrenPadding: EdgeInsets.zero,
            onExpansionChanged: onExpansionChanged,
            controlAffinity: ListTileControlAffinity.trailing,
            trailing: trailing,
            children: children,
          )),
    );
  }
}
