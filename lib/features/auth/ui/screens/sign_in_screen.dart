import 'package:craftybay/features/auth/ui/controllers/sign_in_controller.dart';
import 'package:craftybay/features/auth/ui/widgets/app_icon_widget.dart';
import 'package:craftybay/features/auth/utils/regex_validators.dart';
import 'package:craftybay/features/cart/ui/screens/cart_screen.dart';
import 'package:craftybay/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:craftybay/features/common/ui/widgets/show_snackbar_message.dart';
import 'package:craftybay/features/product/ui/controller/product_id_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/ui/controllers/auth_controller.dart';
import '../../../product/ui/controller/add_to_cart_controller.dart';
import 'sign_up_screen.dart';


class SignInScreen extends StatefulWidget {
  static const String name = "/EmailVerificationScreen";
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final SignInController _emailVController = Get.find<SignInController>();
  final AuthController _auth = Get.find<AuthController>();
  final AddToCartController _addToCart = Get.find<AddToCartController>();

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
              Text("Sign in", style: Theme.of(context).textTheme.titleLarge ,),
              Text("Please enter your email and password to sign in", style: Theme.of(context).textTheme.bodyLarge,),
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
                      const SizedBox(height: 10,),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Enter a your password";
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                          hintText: 'Password'
                        ),
                      ),
              ],)),
              const SizedBox(height: 24,),
              GetBuilder<SignInController>(
                builder: (controller) {
                  if(controller.inProgress){
                   return const CenteredCircularProgressIndicator();
                  }
                  return ElevatedButton(
                      onPressed: (){
                        _onTapNavigateToOTPVerificationScreen();
                      },
                      child: const Text("Next"));
                }
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onTapNavigateToOTPVerificationScreen(){
  if(_formKey.currentState!.validate()){
    _getVerifyEmailAddress();
  }
  }

Future<void> _getVerifyEmailAddress()async {
  final bool isSuccess = await _emailVController.signIn(
      _emailTEController.text.trim(),
      _passwordController.text
  );
  if(isSuccess){
    _goToNextScreen();
    // if(mounted){
    //   Navigator.pushNamedAndRemoveUntil(context, CartScreen.name, (predicate)=>false);
    // }
  }else{
    if(mounted){
      showSnackBarMessage(context, _emailVController.errorMessage ?? "Something went wrong. Please try again");
    }
  }
}

  Future<void> _goToNextScreen()async {
    bool loggedIn = await _auth.isUserLoggedIn();
    if(loggedIn){
      String token = _auth.accessToken!;
      debugPrint("TOKEN: $token");

      final id = Get.find<ProductIdController>().productId;
      final bool result = await _addToCart.postAddToCart(id!, token);
      if(result && mounted){
        Navigator.pushNamed(context, CartScreen.name);
      }else{
        if(mounted){
          showSnackBarMessage(context, _addToCart.errorMessage ?? "Something went wrong, Please try again");
        }
      }
    }else{
      if(mounted){
        Navigator.pushNamedAndRemoveUntil (context, SignUpScreen.name, (predicate)=>false);
      }
    }
  }


  @override
  void dispose() {
    _emailTEController.dispose();
    super.dispose();
  }
}
