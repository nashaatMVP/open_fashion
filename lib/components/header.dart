import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../core/colors.dart';
import 'custom_text.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(20),
        Center(child: CustomText(
          text: title.toUpperCase(),
          color: AppColors.primary,
          spacing: 4,
          size: 20,
        )),
        Gap(10),
        Image.asset("assets/svgs/line.png",width: 160,color: Colors.black),
        Gap(20),

      ],
    );
  }
}
