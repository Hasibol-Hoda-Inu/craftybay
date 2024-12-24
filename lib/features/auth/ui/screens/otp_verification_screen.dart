import 'package:craftybay/application/app_colors.dart';
import 'package:craftybay/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:craftybay/features/auth/controllers/timer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../widgets/app_icon_widget.dart';

class OtpVerificationScreen extends StatefulWidget {
  static const name = "/OtpVerification";
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _OtpTEController = TextEditingController();
  final TimerController _timerController = Get.put(TimerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 120,),
              const AppLogoWidget(),
              const SizedBox(height: 36,),
              Text("Enter OTP Code", style: Theme.of(context).textTheme.titleLarge ,),
              Text("A 4 digit OTP code has been sent", style: Theme.of(context).textTheme.bodyLarge,),
              const SizedBox(height: 24,),
              PinCodeTextField(
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.transparent,
                  activeColor: AppColors.themeColor,
                  inactiveFillColor: Colors.transparent,
                  inactiveColor: AppColors.themeColor,
                  selectedFillColor: Colors.transparent,
                ),
                animationDuration: const Duration(milliseconds: 300),
                cursorColor: AppColors.themeColor,
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                controller: _OtpTEController,
                keyboardType: TextInputType.number,
                onCompleted: (v) {
                  print("Completed");
                },
                appContext: (context),
              ),
              const SizedBox(height: 24,),
              GetBuilder<TimerController>(
                builder: (controller) {
                  return ElevatedButton(
                      onPressed: controller.isButtonActive
                          ? _handleButtonPress : null,
                      child: const Text("Next"));
                }
              ),
              const SizedBox(height: 24,),
              GetBuilder<TimerController>(
                builder: (controller) {
                  if(controller.remainingTime>0){
                    return RichText(text: TextSpan(
                        text: "This code will expire in ", style: Theme.of(context).textTheme.bodyLarge,
                        children: [
                          TextSpan(
                              text: controller.remainingTime.toString(),
                              style: const TextStyle(color: AppColors.themeColor)
                          )
                        ]
                    ));
                  }else{
                    return const SizedBox.shrink();
                  }
                }
              ),
              GetBuilder<TimerController>(
                builder: (controller) {
                  return TextButton(
                      onPressed:
                        controller.isButtonActive ? (){
                          controller.startTimer();
                        }: null,
                      child: Text("Resend code",

                      ));
                }
              )
            ],
          ),
        ),
      ),
    );
  }
  void _handleButtonPress(){
    _timerController.startTimer();
    Navigator.pushNamedAndRemoveUntil(context, CompleteProfileScreen.name, (predicate)=>false);
  }
}
