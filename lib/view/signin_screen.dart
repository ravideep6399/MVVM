import 'package:flutter/material.dart';
import 'package:mvvm/res/colors.dart';
import 'package:mvvm/res/components/round_button.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _confirmpasswordcontroller =
      TextEditingController();
  FocusNode emailfocusNode = FocusNode();
  FocusNode passwordfocusNode = FocusNode();
  FocusNode confirmpasswordfocusNode = FocusNode();

  @override
  void dispose() {
    _passwordcontroller.dispose();
    _emailcontroller.dispose();
    _confirmpasswordcontroller.dispose();
    confirmpasswordfocusNode.dispose();
    emailfocusNode.dispose();
    passwordfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthViewModel>(context);
    double height = MediaQuery.of(context).size.height * 1;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Register"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onFieldSubmitted: (value) {
                    Utils.changeFocus(
                        context, emailfocusNode, passwordfocusNode);
                  },
                  keyboardType: TextInputType.emailAddress,
                  focusNode: emailfocusNode,
                  controller: _emailcontroller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyanAccent),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.email)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onFieldSubmitted: (value) {
                    Utils.changeFocus(
                        context, passwordfocusNode, confirmpasswordfocusNode);
                  },
                  focusNode: passwordfocusNode,
                  controller: _passwordcontroller,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyanAccent),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  focusNode: confirmpasswordfocusNode,
                  controller: _confirmpasswordcontroller,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyanAccent),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      hintText: 'Confirm Password',
                      prefixIcon: Icon(Icons.lock)),
                ),
              ),
              SizedBox(
                height: height * 0.1,
              ),
              RoundButton(
                value: "SignIn",
                loading: auth.signuploading,
                onPress: () {
                  if (_emailcontroller.text.isEmpty) {
                    Utils.flushbarErrorMessage("Enter Your email", context);
                  } else if (_passwordcontroller.text.isEmpty) {
                    Utils.flushbarErrorMessage("Enter Your Password", context);
                  } else if (_passwordcontroller.text.length < 6) {
                    Utils.flushbarErrorMessage(
                        "Enter password of more than 6 char", context);
                  } else if (_confirmpasswordcontroller.text !=
                      _passwordcontroller.text) {
                    Utils.flushbarErrorMessage(
                        "Confirm Your Password Again", context);
                  } else {
                    Map data = {
                      "email": _emailcontroller.text.toString(),
                      "password": _passwordcontroller.text.toString()
                    };
                    auth.signin(data, context);
                  }
                },
              ),
              SizedBox(
                height: height * 0.03,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Already Have an account?  LogIn",
                  style: TextStyle(
                    color: ColorsApp.whiteColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
