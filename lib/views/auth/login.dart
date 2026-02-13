import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  child: Column(
                    children: [
                      //===== Text Field Email =====
                      TextFormField(
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
                      TextFormField(),
                      SizedBox(height: 15.0),
                      //===== Button submit Login =====
                      InkWell(
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
                      onTap: () {},
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
