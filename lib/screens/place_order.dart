import r'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/components/address_info.dart';
import 'package:open_fashion/components/cart_widget.dart';
import 'package:open_fashion/components/custom_appbar.dart';
import 'package:open_fashion/components/custom_text.dart';
import 'package:open_fashion/components/dailog.dart';
import 'package:open_fashion/components/header.dart';
import 'package:open_fashion/components/shipping_method.dart';
import 'package:open_fashion/screens/add_card.dart';
import '../components/custom_button.dart';
import '../core/colors.dart';
import 'add_address.dart';

class PlaceOrder extends StatefulWidget {
  const PlaceOrder({
    super.key,
    required this.image,
    required this.name,
    required this.desp,
    required this.qty,
    required this.total,
    required this.price,
  });
  final String image;
  final String name;
  final int price;
  final String desp;
  final int qty;
  final int total;

  @override
  State<PlaceOrder> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  dynamic _savedAddress;
  dynamic _savedCard;
  late int selectedQty;

  @override
  void initState() {
    selectedQty = widget.qty;
    super.initState();
  }

  /// address
  void _openAddress(context) async {
    final addressData = await Navigator.push(
      context,
      MaterialPageRoute(builder: (c) => AddAddress(
      )),
    );

    if (addressData != null) {
      setState(() {
        _savedAddress = addressData;
      });
    }
  }
  void _editAddress () async {
    final newAddress = await Navigator.push(
      context,
      MaterialPageRoute(builder: (c) => AddAddress(
        editData: _savedAddress,
      )),
    );

    setState(() {
      _savedAddress = newAddress;
    });


  }

  /// card
  void _openCard () async {
    final cardData = await Navigator.push(
      context,
      MaterialPageRoute(builder: (c) => AddCard()),
    );

    if (cardData != null) {
      setState(() {
        _savedCard = cardData;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(isBlackk: false),
    
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(title: "Checkout"),
              _savedCard != null && _savedAddress != null ? SizedBox.shrink() : CustomText(
                text: "Shipping address".toUpperCase(),
                color: Colors.black38,
                max: 2,
                size: 16,
              ),
              Gap(13),
              
              /// address Info
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    _savedAddress != null ? AddressInfo(
                      savedAddress: _savedAddress,
                      onTap: _editAddress,
                    ) : SizedBox.shrink(),
                    Gap(20),
                    _savedAddress == null ? GestureDetector(
                          onTap: () {
                            _openAddress(context);
                          },
                          child: customContainer(
                            "Add shipping address",
                            Icons.add,
                            false,
                          ),
                        ) : SizedBox.shrink(),
                  ],
                ),
              ),
              Gap(10),
              
              /// Shipping Method
              _savedCard != null && _savedAddress != null ? SizedBox.shrink() : ShippingMethod(),
              
              /// payment Method
              _savedCard != null && _savedAddress != null ? SizedBox.shrink() : CustomText(
                text: "Payment Method".toUpperCase(),
                color: Colors.black38,
                size: 16,
              ),

              Gap(20),
              _savedCard != null ? Column(
                children: [
                  Divider(color: Colors.grey.shade300),
                  Gap(20),
                  Row(
                    children: [
                      SvgPicture.asset("assets/svgs/Mastercard.svg",width: 40),
                      Gap(10),
                      CustomText(text: "Master Card ending",color: Colors.black),
                      Gap(10),
                      CustomText(
                        text: "••••${_savedCard['number'].toString().substring(_savedCard['number'].length - 2)}",
                        color: Colors.black,
                      ),
                      Spacer(),
                      SvgPicture.asset("assets/svgs/arrow.svg"),
                    ],
                  ),
                  Gap(20),
                  Divider(color: Colors.grey.shade300),
                ],
              ) : GestureDetector(
                onTap: _openCard,
                child: customContainer(
                  "Select Payment Method",
                  Icons.keyboard_arrow_down_sharp,
                  false,
                ),
              ),
              
              Gap(20),
              
              _savedCard != null && _savedAddress != null ? CartWidget(
                  image: widget.image,
                  name:  widget.name,
                  descp:  widget.desp,
                  price:  widget.price,
                  qty: widget.qty,
                  onChanged: (qty) => setState(() => selectedQty = qty),
              ) : SizedBox.shrink(),

              Gap(120),

              /// Ending
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Total", color: AppColors.primary),
                  CustomText(
                    text: "\$ ${widget.price * selectedQty}",
                    color: Colors.red.shade200,
                  ),
                ],
              ),
              Gap(20),
              Button(isSvgg: true, title: "Place order", onTap: () {
               showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return Dialog(
                        child: CustomDailog(),
                      );
                    }
                );
                
              }),
              Gap(70),
            ],
          ),
        ),
      ),
    );
  }
}






Widget customContainer(text, icon, isFree) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
    decoration: BoxDecoration(
      color: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(100),
    ),
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(text: text, color: Colors.black),
        Spacer(),
        isFree
            ? CustomText(text: "FREE", color: Colors.black)
            : SizedBox.shrink(),
        Gap(15),
        Icon(icon),
      ],
    ),
  );
}
