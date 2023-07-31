// ignore_for_file: unused_import, use_build_context_synchronously, unused_local_variable, prefer_const_constructors

import 'dart:convert';

import 'package:google_fonts/google_fonts.dart';
import 'package:guru_flutter/helper/constant.dart';
import 'package:guru_flutter/screens/auth/register.dart';
import 'package:guru_flutter/screens/home.dart';
import 'package:guru_flutter/widget/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/browser_client.dart';


import '../../methods/api.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void loginUser() async {
    final data = {
      'email': email.text.toString(),
      'password': password.text.toString(),
    };
    final result = await API().postRequest(route: '/login', data: data);
    final response = jsonDecode(result.body);
    if (response['status'] == 200) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setInt('user_id', response['guru']['id']);
      await preferences.setString('name', response['guru']['nama_lengkap']);
      await preferences.setString('email', response['guru']['email']);
      await preferences.setString('token', response['token']);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response['message']),
        ),
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const Home(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = deviceWidth(context);
    double height = deviceHeight(context);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.width / 0.57,
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height / 13,
                        left: 40,
                        right: 40),
                    decoration: const BoxDecoration(
                        color: kBackground,
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(110))),
                    child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Image(
                            image: AssetImage('img/logo.png'),
                            width: 140,
                            height: 140,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              'Welcome Back',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 25,
                                color: Colors.white,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 13),
                            child: Text(
                              'lorem ipsum lorem ipsum lorem ipsum lorem',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.white,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: TextFormField(
                              controller: email,
                              style: GoogleFonts.poppins(color: kText),
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'email',
                                hintStyle:
                                   GoogleFonts.poppins(color: Colors.white60),
                                filled: true,
                                fillColor: kPrimaryColor,
                                prefixIcon: const Align(
                                  widthFactor: 2,
                                  heightFactor: 1.0,
                                  child: Icon(
                                    Icons.email_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: kPrimaryColor,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: TextFormField(
                              controller: password,
                              obscureText: true,
                              style:  GoogleFonts.poppins(color: kText),
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                hintText: 'password',
                                hintStyle:
                                     GoogleFonts.poppins(color: Colors.white60),
                                filled: true,
                                fillColor: kPrimaryColor,
                                prefixIcon: const Align(
                                  widthFactor: 2,
                                  heightFactor: 1.0,
                                  child: Icon(
                                    Icons.lock_outline_rounded,
                                    color: kText,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: kPrimaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: kPrimaryColor,
                                    width: 0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8, bottom: 13),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'forgot password ?',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Colors.white,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              loginUser();
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: 48,
                              alignment: Alignment.center,
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: kBtn,
                              ),
                              child: Text(
                                'Login',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Not register yet ?',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegisterPage(),
                                    ));
                              },
                              child: Text(
                                'created an account',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.white,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        )),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
