import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/core/colors.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key, required this.isBlackk});
  final bool isBlackk;

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    bool isBlack = isBlackk;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: AppBar(
        backgroundColor: isBlack ? AppColors.primary : Colors.white,
        centerTitle: true,
        leadingWidth: 25,
        leading: SvgPicture.asset("assets/svgs/Menu.svg",color: isBlack ? Colors.white : AppColors.primary),
        title: SvgPicture.asset("assets/logo/logo-bg.svg",color: isBlack ? Colors.white : AppColors.primary),

        actions: [
          SvgPicture.asset("assets/svgs/Search.svg",color: isBlack ? Colors.white : AppColors.primary),
          Gap(20),
          SvgPicture.asset("assets/svgs/shopping bag.svg",color: isBlack ? Colors.white : AppColors.primary),
        ],

      ),
    );
  }


}
