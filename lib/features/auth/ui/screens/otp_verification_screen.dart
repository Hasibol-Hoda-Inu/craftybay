import 'package:craftybay/application/app_colors.dart';
import 'package:craftybay/features/auth/ui/controllers/email_verification_controller.dart';
import 'package:craftybay/features/auth/ui/controllers/otp_verification_controller.dart';
import 'package:craftybay/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:craftybay/features/auth/ui/controllers/timer_controller.dart';
import 'package:craftybay/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:craftybay/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:craftybay/features/common/ui/widgets/show_snackbar_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../widgets/app_icon_widget.dart';

class OtpVerificationScreen extends StatefulWidget {
  static const name = "/OtpVerification";
  const OtpVerificationScreen({
    super.key,
    required this.email,
  });
  final String email;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TimerController _timerController = Get.find<TimerController>();
  final OtpVerificationController _otpVController = Get.find<OtpVerificationController>();
  final EmailVerificationController _emailVController = Get.find<EmailVerificationController>();

  @override
  void initState() {
    super.initState();
    _timerController.startTimer();
  }

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
              Text("A 6 digit OTP code has been sent", style: Theme.of(context).textTheme.bodyLarge,),
              const SizedBox(height: 24,),
              Form(
                key: _formKey,
                child: PinCodeTextField(
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
                  controller: _otpTEController,
                  validator: (String? value){
                    if(value?.length !=6){
                      return "Enter your otp";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  onCompleted: (v) {
                    debugPrint("Completed");
                  },
                  appContext: (context),
                ),
              ),
              const SizedBox(height: 24,),
              GetBuilder<TimerController>(
                builder: (controller) {
                  return Visibility(
                    visible: _otpVController.inProgress == false,
                    replacement: const CenteredCircularProgressIndicator(),
                    child: ElevatedButton(
                        onPressed: !controller.isButtonActive
                            ? _handleButtonPress : null,
                        child: const Text("Next")),
                  );
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
                  return Visibility(
                    visible: controller.isButtonActive,
                    replacement: const SizedBox(),
                    child: TextButton(
                      onPressed: (){
                        ///TODO: email send krr api call hbe
                        _resendVerifyEmailAddress();
                      },
                      child: const Text("Resend code"),
                     ),
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _handleButtonPress(){
    if(_formKey.currentState!.validate()){
      _getOtpVerification();
    }
  }

  Future<void> _getOtpVerification()async {
    final bool isSuccess = await _otpVController.verifyOtp(widget.email, _otpTEController.text);
    if(isSuccess){
      _timerController.startTimer();
      if(_otpVController.shouldNavigateCompleteProfile){
        if(mounted){
          Navigator.pushNamed(context, CompleteProfileScreen.name);
        }
      }else{
        if(mounted){
          Navigator.pushNamedAndRemoveUntil(context, MainBottomNavScreen.name, (predicate)=>false);
        }
      }
    }else{
      if(mounted){
        showSnackBarMessage(context, _otpVController.errorMessage ?? "Something went wrong");
      }
    }
  }

  Future<void> _resendVerifyEmailAddress()async {
    final bool isSuccess = await _emailVController.verifyEmail(widget.email);
    if(isSuccess){
      _timerController.startTimer();
    }else{
      if(mounted){
        showSnackBarMessage(context, _emailVController.errorMessage ?? "Something went wrong");
      }
    }
  }

  @override
  void dispose() {
    _otpVController.dispose();
    _timerController.dispose();
    super.dispose();
  }
}
