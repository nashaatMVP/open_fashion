import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'custom_text.dart';

class AddressInfo extends StatelessWidget {
  const AddressInfo({super.key, this.savedAddress, this.onTap});
  final dynamic savedAddress;
  final Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "${savedAddress['first']} ${ savedAddress['last']}".toUpperCase(),
                color: Colors.black,
                size: 20,
              ),
              Gap(15),
              CustomText(
                text: savedAddress['address'].toUpperCase(),
                color: Colors.black54,
                size: 16,
              ),
              Gap(10),
              CustomText(
                text: savedAddress['city'].toUpperCase(),
                color: Colors.black54,
                size: 16,
              ),
              Gap(10),
              CustomText(
                text:
                "(${savedAddress['phone']})"
                    .toUpperCase(),
                color: Colors.black54,
                size: 16,
              ),
            ],
          ),

          SvgPicture.asset("assets/svgs/arrow.svg"),

        ],
      ),
    );
  }
}
