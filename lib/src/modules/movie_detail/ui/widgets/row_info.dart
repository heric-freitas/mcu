import 'package:flutter/material.dart';
import 'package:marvel/src/core/styles/app_color.dart';
import 'package:marvel/src/core/styles/app_text_styles.dart';

class RowInfo extends StatelessWidget {
  final String title;
  final String info;
  const RowInfo({super.key, required this.title, required this.info});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.appTextStyles.textTitle.copyWith(color: Colors.white),
        ),
        const SizedBox(
           height: 5,
        ),
        Text(
          info,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.justify,
          style: context.appTextStyles.text.copyWith(color: Colors.white),
        ),
        const SizedBox(
           height: 5,
        ),
        Divider(
          thickness: 2,
          color: AppColor.instance.secundary,
        )
      ],
    );
  }
}
