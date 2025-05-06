import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/components/cart_widget.dart';
import 'package:open_fashion/components/custom_appbar.dart';
import 'package:open_fashion/components/custom_button.dart';
import 'package:open_fashion/components/custom_text.dart';
import 'package:open_fashion/components/header.dart';
import 'package:open_fashion/core/colors.dart';
import 'package:open_fashion/screens/place_order.dart';

class Checkout extends StatefulWidget {
  const Checkout({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.descp,
  });
  final String image;
  final String name;
  final int price;
  final String descp;

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  int selectedQty = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(isBlackk: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            Header(title: "Checkout"),

            CartWidget(
                image: widget.image,
                name: widget.name,
                descp: widget.descp,
                price: widget.price,
                qty: selectedQty,
                onChanged: (v) {
                  setState(() {
                    selectedQty = v;
                  });
                },
            ),

            promo(),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Est. Total",color: AppColors.primary),
                CustomText(text: "\$ ${widget.price * selectedQty}",color: Colors.red.shade200),
              ],
            ),
            Gap(20),
            Button(
                isSvgg: true,
                title: "Checkout",
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (c) {
                    return PlaceOrder(
                        image: widget.image,
                        name: widget.name,
                        desp: widget.descp,
                        qty: selectedQty,
                        price: widget.price,
                        total: widget.price * selectedQty,
                    );
                  }));
                },
            ),
            Gap(70),
          ],
        ),
      ),
    );
  }
}


Widget promo () {
  return Column(
    children: [
      Gap(20),
      Divider(),
      Gap(20),
      Row(
        children: [
          SvgPicture.asset("assets/svgs/promo.svg",width: 28,),
          Gap(20),
          CustomText(text: "ADD Promo Code",color: AppColors.primary,),
        ],
      ),
      Gap(20),
      Divider(),
      Gap(20),
      Row(
        children: [
          SvgPicture.asset("assets/svgs/delivery.svg",width: 25,),
          Gap(20),
          CustomText(text: "Delivery",color: AppColors.primary),
          Spacer(),
          CustomText(text: "FREE",color: AppColors.primary),
          Gap(5),
        ],
      ),
      Gap(10),
      Divider(),
    ],
  );
}
