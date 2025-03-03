// ignore_for_file: sort_child_properties_last, must_be_immutable
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:slider_button/slider_button.dart';
import '../widgets/button_Container.dart';
import '../widgets/newMorphism.dart';

class CheckOutScreen extends StatefulWidget {
  String addressID;
  double totalPrice;
  CheckOutScreen(
      {required this.totalPrice, required this.addressID, super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  bool payment = false;

  final userId = FirebaseAuth.instance.currentUser!.uid;
  final _razorpay = Razorpay();
  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handlePaymentWallet);

    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    // After paymentSuccessFull section>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.
    await FirebaseFirestore.instance
        .collection("StudentsProfile")
        .doc(userId)
        .update({"payment": "paymentSuccessfull"});

    log("PaymentDone!!!!!!!!");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    log("PaymentError!!!!!!!!");
  }

  void _handlePaymentWallet(ExternalWalletResponse response) {}

  int selectValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 36, 44, 59),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: ButtonContainerWidget(
                    curving: 10,
                    colorindex: 0,
                    height: 40.h,
                    width: 40.w,
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30.w,
                ),
                Text(
                  "Checkout",
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),

                NewMorphismBlackWidget(
                    height: 180.h,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 10.h),
                          ButtonContainerWidget(
                            curving: 30,
                            colorindex: 1,
                            height: 40.h,
                            width: 200.w,
                            child: Center(
                              child: Text(
                                "Purchacing Course Details",
                                style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          SizedBox(height: 10.h),
                          Text(
                            'Junior Lab Assistant for  3 Months',
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 10.h),
                        ],
                      ),
                    )),
                SizedBox(height: 10.h),
                SizedBox(height: 10.h),
                const Text(
                  "Order Summary",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Subtotal : ",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      widget.totalPrice.toString(),
                      style: const TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),

                SizedBox(
                  height: 20.h,
                ),
                NewMorphismBlackWidget(
                  width: 320.w,
                  height: 60.h,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total :',
                            style: TextStyle(
                                color: Color.fromARGB(255, 165, 157, 157),
                                fontSize: 17),
                          ),
                          Text(widget.totalPrice.toString(),
                              style: const TextStyle(
                                  color: Colors.green, fontSize: 20))
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),

                //<<<<<<<<<<<<<<<<Payment Mehtod >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                SliderButton(
                  icon: const Icon(Icons.arrow_forward_ios_rounded),
                  height: 70.h,
                  width: double.infinity.w,
                  baseColor: Colors.blue,
                  backgroundColor: const Color.fromARGB(255, 26, 32, 44),
                  action: () async {
                    double paymentPrice = 1 * 100;
                    // Get.off(PaymentScreen());
                    //
                    var options = {
                      'key': 'rzp_live_WkqZiZtSI6LGQ9',
                      //amount will be multiple of 100
                      'amount': paymentPrice.toString(), //so its pay 500
                      'name': '',
                      'description': 'SciPro',
                      'timeout': 300, // in seconds
                      'prefill': {
                        'contact': '9544782189',
                        'email': 'leptonscipro@gmail.com'
                      }
                    };

                    _razorpay.open(options);
                    //
                    try {} on Razorpay catch (e) {
                      log(e.toString());
                    }
                  },
                  label: Text(
                    'Proceed To PayOnline',
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }
}
