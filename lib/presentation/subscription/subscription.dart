import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_document_generator/components/constants/app_colors.dart';
import 'package:legal_document_generator/components/constants/widgets/custom_button.dart';
import 'package:legal_document_generator/presentation/router/base_navigator.dart';
import 'package:in_app_payment/in_app_payment.dart';

class Subscription_screen extends StatefulWidget {
  const Subscription_screen({super.key});
  static const String routeName = 'SubscriptionScreen';
  @override
  State<Subscription_screen> createState() => _Subscription_screenState();
}

class _Subscription_screenState extends State<Subscription_screen> {
  final pay = HNGPay();
  int selectedAmount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 69, 59, 99),
      body: Padding(
        padding: const EdgeInsets.only(top: 35.0, left: 16, right: 16).r,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.chevron_left_outlined,
                  size: 40.r,
                  color: AppColor.secondaryColor,
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Text(
              'Choose Your Plan',
              style: TextStyle(
                color: AppColor.secondaryColor,
                fontFamily: 'Onest',
                fontWeight: FontWeight.bold,
                fontSize: 32.sp,
              ),
            ),
            SizedBox(height: 30.h),
            SubscriptionPlan(
              subscriptionType: 'Free Trial',
              benefit1: '+ Get 3 Days Free',
              benefit2: '+ Generate 3 Legal Documents',
              price1: '\$5',
              price2: '\$0',
              price3: 'Free',
              lineThrough1: TextDecoration.lineThrough,
              border: selectedAmount == 0
                  ? Border.all(color: AppColor.secondaryColor)
                  : Border.all(color: AppColor.backgroundColor),
              onTap: () {
                setState(() {
                  selectedAmount = 0;
                });
              },
            ),
            SizedBox(height: 30.h),
            SubscriptionPlan(
              subscriptionType: 'Monthly',
              benefit1: '+ Save 0%',
              benefit2: '+ Generate 30 Legal Documents',
              price1: '\$0',
              price2: '\$5',
              price3: 'Free',
              lineThrough1: TextDecoration.lineThrough,
              lineThrough3: TextDecoration.lineThrough,
              border: selectedAmount == 5
                  ? Border.all(color: AppColor.secondaryColor)
                  : Border.all(color: AppColor.backgroundColor),
              onTap: () {
                setState(() {
                  // isClicked = !isClicked;
                  selectedAmount = 5;
                });
              },
            ),
            SizedBox(height: 30.h),
            SubscriptionPlan(
              subscriptionType: 'Yearly',
              benefit1: '',
              benefit2: '+ Save 20% ',
              price1: '\$60',
              price2: '\$48',
              price3: 'Yearly',
              lineThrough1: TextDecoration.lineThrough,
              border: selectedAmount == 48
                  ? Border.all(color: AppColor.secondaryColor)
                  : Border.all(color: AppColor.backgroundColor),
              onTap: () {
                setState(() {
                  // isClicked = !isClicked;
                  selectedAmount = 48;
                });
              },
            ),
            SizedBox(height: 30.h),
            Text(
              'If you choose to purchase a subscription, payment will be charged to your GooglePay account,and your account will be charged within 24-hours prior to the end of the current period for \$5/months. You can cancel the automatic renewal of your subscription at any time by going to your setting in the GooglePay store after purchase.',
              textAlign: TextAlign.left,
              style: TextStyle(
                  wordSpacing: -1,
                  color: AppColor.secondaryColor,
                  inherit: true,
                  fontFamily: 'Onest',
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp),
            ),
            SizedBox(height: 30.h),

            pay.googlePay(
                amountToPay: selectedAmount.toString(),
                userID: ''), //for android im,
          ]),
        ),
      ),
    );
  }
}

class SubscriptionPlan extends StatelessWidget {
  const SubscriptionPlan(
      {super.key,
      this.subscriptionType,
      this.benefit1,
      this.benefit2,
      this.price1,
      this.price2,
      this.price3,
      this.lineThrough1,
      this.lineThrough2,
      this.lineThrough3,
      this.onTap,
      this.border});

  final String? subscriptionType;
  final String? price1;
  final String? benefit1;
  final String? price2;
  final String? benefit2;
  final String? price3;
  final TextDecoration? lineThrough1;
  final TextDecoration? lineThrough2;
  final TextDecoration? lineThrough3;
  final Function()? onTap;
  final Border? border;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 140.h,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[AppColor.backgroundColor, AppColor.primaryColor],
            ),
            border: border,
            color: AppColor.backgroundColor,
            borderRadius: BorderRadius.circular(18).r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8).r,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$subscriptionType',
                    style: TextStyle(
                      color: AppColor.secondaryColor,
                      fontFamily: 'Onest',
                      fontWeight: FontWeight.bold,
                      fontSize: 24.sp,
                    ),
                  ),
                  Text(
                    '$price1',
                    style: TextStyle(
                        color: AppColor.secondaryColor,
                        fontFamily: 'Onest',
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        decoration: lineThrough1,
                        decorationColor: AppColor.secondaryColor,
                        decorationThickness: 1.2),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0).r,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$benefit1',
                    style: TextStyle(
                      color: AppColor.secondaryColor,
                      fontFamily: 'Onest',
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                  Text(
                    '$price2',
                    style: TextStyle(
                      color: AppColor.secondaryColor,
                      fontFamily: 'Onest',
                      fontWeight: FontWeight.bold,
                      fontSize: 26.sp,
                      decoration: lineThrough2,
                      decorationColor: AppColor.secondaryColor,
                      decorationThickness: 1.2,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6).r,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$benefit2',
                    style: TextStyle(
                      color: AppColor.secondaryColor,
                      fontFamily: 'Onest',
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                  Text(
                    '$price3',
                    style: TextStyle(
                      color: AppColor.secondaryColor,
                      fontFamily: 'Onest',
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                      decoration: lineThrough3,
                      decorationColor: AppColor.secondaryColor,
                      decorationThickness: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}






//  appBar: AppBar(
//         title: const Text('Subscription'),
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {},
//           icon: const Icon(Icons.arrow_back_ios_new),
//         ),
//       ),
//       body: Column(
//         children: [
//           Card(
//             color: const Color.fromARGB(255, 255, 255, 255),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 const Text(
//                   'Subscribe\n Newspapers of\n your choice',
//                   style: TextStyle(color: Colors.grey),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Image.asset(
//                   'assets/images/subpp.png',
//                   height: 150,
//                   width: 160,
//                 )
//               ],
//             ),
//           ),
//           const SizedBox(height: 20),
//           SizedBox(
//             height: 430,
//             child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 shrinkWrap: true,
//                 children: [
//                   const SizedBox(
//                     width: 20,
//                   ),
//                   Container(
//                     //color: Colors.blue,
//                     height: 430,
//                     width: 320,
//                     decoration: const BoxDecoration(
//                         color: Colors.blue,
//                         borderRadius: BorderRadius.all(Radius.circular(15))),
//                     child: Expanded(
//                       child: Column(
//                         children: [
//                           const Text(
//                             'Starter',
//                             style: TextStyle(fontSize: 24),
//                           ),
//                           const Text(
//                             "\$3",
//                             style: TextStyle(
//                               fontSize: 30,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 25,
//                           ),
//                           Container(
//                             height: 2,
//                             width: 200,
//                             color: Colors.black,
//                           ),
//                           const SizedBox(
//                             height: 25,
//                           ),
//                           const Text('Stay on top of the news'),
//                           const SizedBox(
//                             height: 25,
//                           ),
//                           const Text('Personalise Recommendations'),
//                           const SizedBox(
//                             height: 25,
//                           ),
//                           const Text('Ad free experience'),
//                           const SizedBox(
//                             height: 25,
//                           ),
//                           const Text('Topics of interest selected by you'),
//                           const SizedBox(
//                             height: 25,
//                           ),
//                           Container(
//                             height: 50,
//                             width: 150,
//                             decoration: const BoxDecoration(
//                                 color: Colors.purple,
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(15))),
//                             child: const Center(
//                               child: Text(
//                                 'Get Started',
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                 ),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 20,
//                   ),
//                   Container(
//                     //color: Colors.blue,
//                     height: 430,
//                     width: 320,
//                     decoration: const BoxDecoration(
//                         color: Colors.blue,
//                         borderRadius: BorderRadius.all(Radius.circular(15))),
//                     child: Expanded(
//                       child: Column(
//                         children: [
//                           const Text(
//                             'Starter',
//                             style: TextStyle(fontSize: 24),
//                           ),
//                           const Text(
//                             "\$6",
//                             style: TextStyle(
//                               fontSize: 30,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 25,
//                           ),
//                           Container(
//                             height: 2,
//                             width: 200,
//                             color: Colors.black,
//                           ),
//                           const SizedBox(
//                             height: 25,
//                           ),
//                           const Text('Stay on top of the news'),
//                           const SizedBox(
//                             height: 25,
//                           ),
//                           const Text('Personalise Recommendations'),
//                           const SizedBox(
//                             height: 25,
//                           ),
//                           const Text('Ad free experience'),
//                           const SizedBox(
//                             height: 25,
//                           ),
//                           const Text('Topics of interest selected by you'),
//                           const SizedBox(
//                             height: 25,
//                           ),
//                           Container(
//                             height: 50,
//                             width: 150,
//                             decoration: const BoxDecoration(
//                                 color: Colors.purple,
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(15))),
//                             child: const Center(
//                               child: Text(
//                                 'Get Started',
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 20,
//                   )
//                 ]),
//           )
//         ],
//       ),