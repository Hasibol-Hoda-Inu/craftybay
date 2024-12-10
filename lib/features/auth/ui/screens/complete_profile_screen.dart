import 'package:craftybay/features/auth/utils/regex_validators.dart';
import 'package:flutter/material.dart';

import '../widgets/app_icon_widget.dart';

class CompleteProfileScreen extends StatefulWidget {
  static const String name = "CompleteProfileScreen";
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _addressTEController = TextEditingController();

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
              Text("Welcome Back", style: Theme.of(context).textTheme.titleLarge ,),
              Text("Please enter your email address", style: Theme.of(context).textTheme.bodyLarge,),
              const SizedBox(height: 24,),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _firstNameTEController,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Enter your fist name";
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                            hintText: 'First name'
                        ),
                      ),
                      const SizedBox(height: 24,),
                      TextFormField(
                        controller: _lastNameTEController,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Enter your last name";
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                            hintText: 'Last name'
                        ),
                      ),
                      const SizedBox(height: 24,),
                      TextFormField(
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
                      const SizedBox(height: 24,),
                      TextFormField(
                        controller: _cityTEController,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Enter your email";
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                            hintText: 'City'
                        ),
                      ),
                      const SizedBox(height: 24,),
                      TextFormField(
                        controller: _addressTEController,
                        maxLines: 3,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Enter your email";
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                            hintText: 'Shopping address',
                        ),
                      ),
                    ],)),
              const SizedBox(height: 24,),
              ElevatedButton(
                  onPressed: (){},
                  child: const Text("Complete"))
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _cityTEController.dispose();
    _addressTEController.dispose();
    super.dispose();
  }
}
