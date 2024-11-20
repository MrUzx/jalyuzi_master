import 'package:flutter/material.dart';
import 'package:jalyuzi/view/signup_view.dart';
import 'package:jalyuzi/view_model/login_viewmodel.dart';
import 'package:jalyuzi/widget/custom_textfield.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: viewModel.formKey,  // Ensure this is only used once
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Sign In', style: Theme.of(context).textTheme.bodyLarge),
                  SizedBox(height: 20),
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
                          : () => viewModel.loginUser(
                        viewModel.phoneController.text,
                        viewModel.passwordController.text,
                        context,
                      ),
                      child: viewModel.isLoading
                          ? SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                            strokeWidth: 3,
                            color: Theme.of(context).primaryColor),
                      )
                          : Text(
                        'Sign In',
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
                        "Create new account",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, PageTransition(type: PageTransitionType.topToBottom, child: SignupPage()));

                        },
                        child: Text(
                          "Sign Up",
                          style:
                          Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (viewModel.errorMessage != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        viewModel.errorMessage!,
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
