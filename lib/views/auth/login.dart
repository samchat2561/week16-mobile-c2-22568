import 'package:flutter/material.dart';
import 'package:flutter_week16/views/auth/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPass = false;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    if (formKey.currentState!.validate()) {
      debugPrint(emailController.text);
      debugPrint(passwordController.text);
    } else {
      debugPrint('Have error in form');
    }
  }

  bool isEmailValid(String email) {
    RegExp regex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    return regex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //===== Image Login =====
                Image.asset(
                  'assets/images/login.png',
                  width: size.width * 0.65,
                ),
                //===== Text Field Login =====
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(fontSize: 30.0, color: Colors.purple),
                      ),
                    ],
                  ),
                ),
                //===== Form Login =====
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      //===== Text Field Email =====
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            debugPrint('email is empty');
                            return 'email is empty';
                          } else if (!isEmailValid(value)) {
                            debugPrint('email is invalid');
                            return 'email is invalid';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter your email or username',
                          label: Text("Email or username"),
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.0,
                            fontFamily: "verdana_regular",
                            fontWeight: FontWeight.w400,
                          ),
                          prefixIcon: Icon(Icons.email),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      //===== Text Field Password =====
                      TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: showPass ? false : true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            debugPrint('password is empty');
                            return 'password is empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          label: Text("Password"),
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.0,
                            fontFamily: "verdana_regular",
                            fontWeight: FontWeight.w400,
                          ),
                          prefixIcon: Icon(Icons.vpn_key_sharp),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                showPass = !showPass;
                              });
                            },
                            icon: Icon(
                              showPass
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      //===== Button submit Login =====
                      InkWell(
                        onTap: () {
                          setState(() {
                            login();
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          height: 55.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.lock_open, color: Colors.white),
                              SizedBox(width: 5.0),
                              Text(
                                'Sign in - App Account',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  wordSpacing: 2.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                //===== Button Link Register =====
                Row(
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 18.0, color: Colors.black54),
                    ),
                    const SizedBox(width: 10.0),
                    InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ),
                          );
                        });
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
