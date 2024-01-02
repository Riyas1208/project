import 'package:flutter/material.dart';
import 'package:project/util/colors.dart';
import 'package:project/widget/text_field.dart';
import 'package:project/widget/bottom_navy_bar.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordVisible = false;
  bool _rememberMe = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _showEmailError = false;
  bool _showPasswordError = false;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                            color: Colors.black,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            height: 0.3,
                          ),
                        ),
                        Text(
                          'Back!',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Continue your adventure.',
                          style: TextStyle(
                            color: Colors.black,
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
                    CustomTextField(
                      controller: _emailController,
                      hintText: 'E-Mail',
                      showPasswordToggle: false,
                      obscureText: false,
                      onPasswordToggle: () {},
                      showError: _showEmailError,
                      onChanged: (value) {
                        setState(() {
                          _showEmailError = false;
                        });
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    CustomTextField(
                      controller: _passwordController,
                      hintText: 'Password',
                      showPasswordToggle: true,
                      obscureText: !_passwordVisible,
                      onPasswordToggle: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                      showError: _showPasswordError,
                      onChanged: (value) {
                        setState(() {
                          _showPasswordError = false;
                        });
                      },
                    ),
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
                                activeColor: Colors.white,
                                checkColor: Colors.black,
                              ),
                              const Text(
                                'Remember Me',
                                style: TextStyle(color: Colors.white),
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
                          setState(() {});

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
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: const EdgeInsets.all(16.0),
                        ),
                        child: const Text('Sign in',
                            style: TextStyle(color: Colors.black)),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.white),
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