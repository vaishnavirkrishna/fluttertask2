import 'package:fluttask2/utils/textfromwidget.dart';
import 'package:fluttask2/view/bottomnav/nav.dart';
import 'package:fluttask2/view/utils/constant.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoginScreen> {
  bool isVisible = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [Colors.black, Colors.black38, Colors.black45],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 0.05,
            ),
            Center(
              child: Container(
                  height: screenHeight * 0.15,
                  width: screenWidth * 0.2,
                  //  child: img.isNotEmpty ? Image.asset(img[0]) : SizedBox.shrink(),
                  child: Image.asset(AppImages.logo)
                  // : SizedBox.shrink()
                  ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.1),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(screenWidth * 0.1),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.1),
                      child: Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        key: _formKey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: screenHeight * 0.01,
                            ),
                            Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(screenWidth * 0.01),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.all(screenWidth * 0.001),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                    255, 232, 224, 224)
                                                .withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 2,
                                            offset: Offset(0, 1),
                                          ),
                                        ],
                                      ),
                                      child: buildTextField(
                                        validator: validateEmail,
                                        controller: _emailController,
                                        isVisible: isVisible,
                                        toggleVisibility: (visible) {
                                          setState(() {
                                            isVisible = visible;
                                          });
                                        },
                                        type: TextFieldType.Email,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                Padding(
                                    padding:
                                        EdgeInsets.all(screenWidth * 0.001),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                    255, 232, 224, 224)
                                                .withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 2,
                                            offset: Offset(0, 1),
                                          ),
                                        ],
                                      ),
                                      child: buildTextField(
                                        controller: _passwordController,
                                        isVisible: isVisible,
                                        toggleVisibility: (visible) {
                                          setState(() {
                                            isVisible = visible;
                                          });
                                        },
                                        validator: validatePassword,
                                        type: TextFieldType.Password,
                                      ),
                                    )),
                                SizedBox(height: screenHeight * 0.1),
                                Container(
                                    height: screenHeight * 0.07,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.only(
                                        topLeft:
                                            Radius.circular(screenWidth * 0.02),
                                        bottomLeft:
                                            Radius.circular(screenWidth * 0.02),
                                        bottomRight:
                                            Radius.circular(screenWidth * 0.03),
                                      ),
                                    ),
                                    child: TextButton(
                                      onPressed: _submitForm,
                                      child: Center(
                                        child: Text(
                                          "Login",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: screenHeight * 0.05,
                            ),
                            const Text(
                              "Don't you have any account? Sign Up",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      print('Login successful!');
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return FancyBottomBarPage();
      }));
    } else {
      print('Form validation failed.');

      if (_emailController.text.isEmpty) {
        print('Email is required.');
      } else if (!RegExp(r'^[a-zA-Z0-9]+@gmail\.com$')
          .hasMatch(_emailController.text)) {
        print('Please enter a valid gmail address.');
      }

      if (_passwordController.text.isEmpty) {
        print('Password is required.');
      } else if (_passwordController.text.length < 7) {
        print('Password should be at least 6 characters.');
      } else if (_passwordController.text.length > 13) {
        print('Password should be at most 13 characters.');
      }
    }

    _emailController.clear();
    _passwordController.clear();
    _formKey.currentState?.reset();
  }
}
