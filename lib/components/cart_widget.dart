import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../core/colors.dart';
import 'custom_text.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({
    super.key,
    required this.image,
    required this.name,
    required this.descp,
    required this.price,
    required this.onChanged,
    required this.qty,
  });
  final String image, name, descp;
  final int price;
  final Function(int) onChanged;
  final int qty;

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
 late int number;

 @override
  void initState() {
    number = 1;
    number = widget.qty;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Image.asset(widget.image, width: 120),
        Gap(20),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(10),
            CustomText(
              text: widget.name.toUpperCase(),
              spacing: 4,
              color: AppColors.primary,
            ),
            Gap(10),
            SizedBox(
              width: size.width * 0.6,
              child: CustomText(
                text: widget.descp.toUpperCase(),
                spacing: 2,
                color: AppColors.primary,
                size: 11,
              ),
            ),
            Gap(30),
            Row(
              children: [
                qty(() {
                  setState(() {
                    if (number > 1) {
                      number--;
                      widget.onChanged(number);
                    }
                  });
                }, "assets/svgs/min.svg"),

                Gap(12),

                CustomText(
                  text: number.toString(),
                  spacing: 4,
                  color: AppColors.primary,
                  weight: FontWeight.bold,
                ),

                Gap(12),

                qty(() {
                  setState(() {
                    number++;
                    widget.onChanged(number);
                  });
                }, "assets/svgs/plus.svg"),
              ],
            ),
            Gap(28),
            CustomText(
              text: "\$ ${widget.price}",
              color: Colors.red.shade200,
              size: 22,
            ),
          ],
        ),
      ],
    );
  }
}

Widget qty(onTap, svg) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade400, width: 1),
      ),
      child: SvgPicture.asset(svg),
    ),
  );
}
