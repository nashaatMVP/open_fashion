import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';
import 'package:open_fashion/components/custom_text.dart';
import 'package:open_fashion/models/cover_model.dart';
import 'package:open_fashion/models/product_model.dart';
import 'package:open_fashion/screens/checkout.dart';
import '../components/custom_appbar.dart';
import '../core/colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppbar(
        isBlackk: true,
      ),
      body: Stack(
        children: [
          /// texts
          Positioned(
              top: 10,
              left: 0,
              right: 0,
              child: SvgPicture.asset("assets/texts/10.svg"),
          ),
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: SvgPicture.asset("assets/texts/October.svg"),
          ),
          Positioned(
              top: 85,
              left: 0,
              right: 0,
              child: SvgPicture.asset("assets/texts/Collection.svg"),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      Gap(120),
                      Image.asset("assets/cover/cover1.png"),
                      Gap(20),
                      GridView.builder(
                         padding: EdgeInsets.zero,
                         shrinkWrap: true,
                         physics: NeverScrollableScrollPhysics(),
                         itemCount: ProductModel.products.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 0,
                              crossAxisSpacing: 15,
                              childAspectRatio: 0.50,
                          ),
                          itemBuilder: (context , index) {
                           final item = ProductModel.products[index];
                            return GestureDetector(
                              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => Checkout(
                                  image: item.image,
                                  name: item.name,
                                  price: item.price,
                                  descp: item.description,
                              ))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(item.image),
                                  Gap(10),
                                  CustomText(text: item.name),
                                  CustomText(text: item.description,color: Colors.grey),
                                  Gap(9),
                                  CustomText(
                                      text: "\$ ${item.price.toString()}",
                                      color: Colors.red.shade200,
                                      size: 20,
                                  ),
                                ],
                              ),
                            );
                          }
                      ),
                      Gap(5),
                      CustomText(text: "You may also like".toUpperCase(),size: 26),
                      Gap(10),
                      Image.asset("assets/svgs/line.png",width: 190),
                      Gap(40),
                      SizedBox(
                        height: 500,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: CoverModel.covers.length,
                            itemBuilder: (context , index){
                              final item = CoverModel.covers[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(item.image,height: 350,fit: BoxFit.cover),
                                    Gap(10),
                                    CustomText(text: item.name.toUpperCase()),
                                  ],
                                ),
                              );

                            },
                        ),
                      ),
                      about(),
                      Gap(20),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.grey.shade400,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30.0,top: 10),
                    child: Center(
                      child: CustomText(
                        max: 3,
                        height: 2.5,
                        text:
                        "Copyright© OpenUI All Rights Reserved.",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget about() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Ionicons.logo_twitter,color: Colors.white),
          Gap(30),
          Icon(Ionicons.logo_instagram,color: Colors.white),
          Gap(30),
          Icon(Ionicons.logo_facebook,color: Colors.white),


        ],
      ),
      Gap(20),
      Image.asset("assets/svgs/line.png",width: 190),
      Gap(20),
      CustomText(
        max: 3,
        height: 2.5,
        text:
        "support@openui.design \n       +60 825 876 \n08:00 - 22:00 - Everyday",
      ),
      Gap(20),
      Image.asset("assets/svgs/line.png",width: 190),
      Gap(20),
      CustomText(
        max: 3,
        height: 2.5,
        text:
        "About   Contact    Blog",
      ),
    ],
  );
}
