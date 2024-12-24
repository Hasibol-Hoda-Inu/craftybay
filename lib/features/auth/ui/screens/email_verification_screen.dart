import 'package:craftybay/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:craftybay/features/auth/ui/widgets/app_icon_widget.dart';
import 'package:craftybay/features/auth/utils/regex_validators.dart';
import 'package:flutter/material.dart';


class EmailVerificationScreen extends StatefulWidget {
  static const String name = "/EmailVerificationScreen";
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTEController = TextEditingController();

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
              Text("Welcome Back", style: Theme.of(context).textTheme.titleLarge ,),
              Text("Please enter your email address", style: Theme.of(context).textTheme.bodyLarge,),
              const SizedBox(height: 24,),
              Form(
                key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailTEController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Enter your email";
                          }else if(!value.isValidEmail()){
                            return "Enter a valid email";
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                          hintText: 'Email address'
                        ),
                      ),
              ],)),
              const SizedBox(height: 24,),
              ElevatedButton(
                  onPressed: (){
                    _onTapNavigateToOTPVerificationScreen();
                  },
                  child: const Text("Next"))
            ],
          ),
        ),
      ),
    );
  }

  void _onTapNavigateToOTPVerificationScreen(){
  Navigator.pushReplacementNamed(context, OtpVerificationScreen.name);
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    super.dispose();
  }
}
