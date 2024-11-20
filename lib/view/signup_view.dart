import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jalyuzi/view/login_page.dart';
import 'package:jalyuzi/view_model/signup_viewmodel.dart';
import 'package:jalyuzi/widget/custom_textfield.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SignupViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: viewModel.formKeySignUP,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 200),
                      Text('Sign Up',
                          style: Theme.of(context).textTheme.bodyLarge),
                      SizedBox(height: 20),
                      // Name TextField
                      CustomTextField(
                        controller: viewModel.nameController,
                        hintText: "Full Name",
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      // Phone Number TextField
                      CustomTextField(
                        controller: viewModel.phoneController,
                        hintText: "Phone number",
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      // Password TextField
                      CustomTextField(
                        controller: viewModel.passwordController,
                        hintText: "Password",
                        obscureText: viewModel.obscureText,
                        isPasswordField: true,
                        onVisibilityToggle: viewModel.togglePasswordVisibility,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      // Sign Up Button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: viewModel.isLoading
                              ? null
                              : () => viewModel.signUpUser(
                                    viewModel.nameController.text,
                                    viewModel.phoneController.text,
                                    context,
                                    viewModel.passwordController.text,
                                  ),
                          child: viewModel.isLoading
                              ? SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                      strokeWidth: 3, // Chiziq qalinligi
                                      color: Theme.of(context).primaryColor),
                                )
                              : Text(
                                  'sign up',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.white),
                                ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: LoginPage()));
                              // Back to login page
                            },
                            child: Text(
                              "Sign In",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Theme.of(context).primaryColor),
                            ),
                          ),
                        ],
                      ),
                      if (viewModel.errorMessage != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            viewModel.errorMessage!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Colors.red,
                                ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
