import 'package:flutter/material.dart';
import 'package:project/util/colors.dart';
import 'package:project/widget/bottom_navy_bar.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordVisible = false;
  bool _rememberMe = false;
  bool _showErrors = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: _showErrors
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: screenHeight * 0.33,
                decoration: const BoxDecoration(
                  color: AppColors.accentColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                  ),
                ),
                child: const Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.all(40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_back,
                            ),
                            SizedBox(width: 20.0),
                          ],
                        ),
                        SizedBox(height: 50.0),
                        Text(
                          'Welcome',
                          style: TextStyle(
                            color: AppColors.fontColor,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Primary",
                            height: 0.3,
                          ),
                        ),
                        Text(
                          'Back!',
                          style: TextStyle(
                            color: AppColors.fontColor,
                            fontFamily: "Primary",
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Continue your adventure.',
                          style: TextStyle(
                            color: AppColors.fontColor,
                            fontFamily: "Primary",
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      style: const TextStyle(color: AppColors.textColor),
                      decoration: InputDecoration(
                        hintText: 'E-Mail',
                        hintStyle: TextStyle(color: AppColors.hintTextColor),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.accentColor),
                        ),
                      ),
                      cursorColor: AppColors.accentColor,
                      validator: (value) {
                        if (_showErrors && (value == null || value.isEmpty)) {
                          return 'Please enter your email';
                        }

                        if (_showErrors &&
                            !RegExp(r'^[a-zA-Z0-9]+@gmail\.com$').hasMatch(value!)) {
                          return 'Invalid email format. Use abc@gmail.com';
                        }

                        return null;
                      },
                    ),

                    SizedBox(height: screenHeight * 0.02),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: !_passwordVisible,
                      style: const TextStyle(color: AppColors.textColor),
                      decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                        hintStyle: const TextStyle(color: AppColors.hintTextColor),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.accentColor),
                        ),
                      ),
                      cursorColor: Colors.white,
                      validator: (value) {
                        if (_showErrors && (value == null || value.isEmpty)) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),


                    SizedBox(height: screenHeight * 0.0),
                    Container(
                      child: Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: _rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    _rememberMe = value!;
                                  });
                                },
                                activeColor: AppColors.textColor,
                                checkColor: AppColors.fontColor
                              ),
                              const Text(
                                'Remember Me',
                                style: TextStyle(color: AppColors.textColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _showErrors = true;
                          });

                          if (_formKey.currentState!.validate()) {
                            String email = _emailController.text;
                            String password = _passwordController.text;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyHomePage(),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.accentColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: EdgeInsets.all(16.0),
                        ),
                        child: const Text('Sign in',
                            style: TextStyle(color: AppColors.fontColor))
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(color: AppColors.textColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}