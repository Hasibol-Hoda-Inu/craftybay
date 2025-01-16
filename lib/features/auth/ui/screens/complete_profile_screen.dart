import 'package:craftybay/features/auth/ui/controllers/create_profile_controller.dart';
import 'package:craftybay/features/auth/utils/regex_validators.dart';
import 'package:craftybay/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:craftybay/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/ui/widgets/show_snackbar_message.dart';
import '../widgets/app_icon_widget.dart';

class CompleteProfileScreen extends StatefulWidget {
  static const String name = "/CompleteProfileScreen";
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _addressTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _stateTEController = TextEditingController();
  final TextEditingController _postCodeTEController = TextEditingController();
  final TextEditingController _countryTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _faxTEController = TextEditingController();
  final TextEditingController _shippingNameTEController = TextEditingController();
  final TextEditingController _shippingAddressTEController = TextEditingController();
  final TextEditingController _shippingCityTEController = TextEditingController();
  final TextEditingController _shippingStateTEController = TextEditingController();
  final TextEditingController _shippingPostCodeTEController = TextEditingController();
  final TextEditingController _shippingCountryTEController = TextEditingController();
  final TextEditingController _shippingMobileTEController = TextEditingController();

  final CreateProfileController _cProfileController = Get.find<CreateProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 24,),
              const AppLogoWidget(),
              const SizedBox(height: 24,),
              Text("Complete Profile", style: Theme.of(context).textTheme.titleLarge ,),
              Text("Get started with us with your details", style: Theme.of(context).textTheme.bodyLarge,),
              const SizedBox(height: 24,),
              Form(
                  key: _formKey,
                  child: Column(
                    spacing: 24,
                    children: [
                      TextFormField(
                        controller: _nameTEController,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Enter your Name";
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                            hintText: 'Name'
                        ),
                      ),
                      TextFormField(
                        controller: _addressTEController,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Enter your address";
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                            hintText: 'Your Address'
                        ),
                      ),
                      TextFormField(
                        controller: _cityTEController,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Enter your City";
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                            hintText: 'City'
                        ),
                      ),
                      TextFormField(
                        controller: _stateTEController,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Enter your State";
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                            hintText: 'State'
                        ),
                      ),
                      TextFormField(
                        controller: _postCodeTEController,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Enter your PostCode";
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                            hintText: 'PostCode'
                        ),
                      ),
                      TextFormField(
                        controller: _countryTEController,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Enter your Country";
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                            hintText: 'Country'
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: _mobileTEController,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Enter your BD mobile number";
                          }else if(!value.isValidBangladeshiMobile()){
                            return "Enter your mobile number";
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                            hintText: 'Mobile'
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: _faxTEController,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Enter your fax number";
                          }else if(!value.isValidBangladeshiMobile()){
                            return "Enter your fax number";
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                            hintText: 'Fax'
                        ),
                      ),
                      TextFormField(
                        controller: _shippingNameTEController,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Enter your Shipping Name";
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                            hintText: 'Shipping Name'
                        ),
                      ),
                      TextFormField(
                        controller: _shippingAddressTEController,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Enter your Shipping Address";
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                            hintText: 'Shipping Address'
                        ),
                      ),
                      TextFormField(
                        controller: _shippingCityTEController,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Enter your Shipping City";
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                            hintText: 'Shipping City'
                        ),
                      ),
                      TextFormField(
                        controller: _shippingStateTEController,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Enter your Shipping State";
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                            hintText: 'Shipping State'
                        ),
                      ),
                      TextFormField(
                        controller: _shippingPostCodeTEController,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Enter your Shipping PostCode";
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                            hintText: 'Shipping PostCode'
                        ),
                      ),
                      TextFormField(
                        controller: _shippingCountryTEController,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Enter your Shipping Country";
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                            hintText: 'Shipping Country'
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: _shippingMobileTEController,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Enter your BD shipping phone number";
                          }else if(!value.isValidBangladeshiMobile()){
                            return "Enter your shipping mobile number";
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                            hintText: 'Shipping Mobile No.'
                        ),
                      ),
                    ],)),
              const SizedBox(height: 24,),
              GetBuilder<CreateProfileController>(
                builder: (controller) {
                  if(controller.inProgress){
                    return const CenteredCircularProgressIndicator();
                  }
                  return ElevatedButton(
                      onPressed: (){
                        _onTapNextScreen();
                      },
                      child: const Text("Complete"),
                  );
                }
              ),
              const SizedBox(height: 24,),
            ],
          ),
        ),
      ),
    );
  }
  void _onTapNextScreen(){
    if(_formKey.currentState!.validate()){
      _createProfile();
    }
  }

  Future<void> _createProfile()async {
    final bool isSuccess = await Get.find<CreateProfileController>().createProfile(
        _nameTEController.text.trim(),
        _addressTEController.text.trim(),
        _cityTEController.text.trim(),
        _stateTEController.text.trim(),
        _postCodeTEController.text.trim(),
        _countryTEController.text.trim(),
        _mobileTEController.text.trim(),
        _faxTEController.text.trim(),
        _shippingNameTEController.text.trim(),
        _shippingAddressTEController.text.trim(),
        _shippingCityTEController.text.trim(),
        _shippingStateTEController.text.trim(),
        _shippingPostCodeTEController.text.trim(),
        _shippingCountryTEController.text.trim(),
        _shippingMobileTEController.text.trim(),

    );
    if(isSuccess){
      if(mounted){
        Navigator.pushNamedAndRemoveUntil(context, MainBottomNavScreen.name, (predicate)=>false);
      }
    }else{
      if(mounted){
        showSnackBarMessage(context, _cProfileController.errorMessage ?? "Something went wrong");
      }
    }
  }


  @override
  void dispose() {
    _nameTEController.dispose();
    _addressTEController.dispose();
    _cityTEController.dispose();
    _stateTEController.dispose();
    _postCodeTEController.dispose();
    _countryTEController.dispose();
    _mobileTEController.dispose();
    _faxTEController.dispose();
    _shippingNameTEController.dispose();
    _shippingAddressTEController.dispose();
    _shippingCityTEController.dispose();
    _shippingStateTEController.dispose();
    _shippingPostCodeTEController.dispose();
    _shippingCountryTEController.dispose();
    _shippingMobileTEController.dispose();
    super.dispose();
  }
}
