// ignore_for_file: unused_import, use_key_in_widget_constructors, library_private_types_in_public_api, non_constant_identifier_names, use_build_context_synchronously, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guru_flutter/helper/constant.dart';
import 'package:guru_flutter/methods/api.dart';
import 'package:guru_flutter/screens/auth/login.dart';
import 'package:guru_flutter/widget/colors.dart';
import 'dart:convert';
import 'package:guru_flutter/widget/input_field.dart';
import 'package:http/http.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController nama_lengkap = TextEditingController();
  TextEditingController password = TextEditingController();

  void registerUser() async {
    final data = {
      'email': email.text.toString(),
      'nama_lengkap': nama_lengkap.text.toString(),
      'password': password.text.toString(),
    };
    final result = await API().postRequest(route: '/register', data: data);
    final response = jsonDecode(result.body);
    if (response['status'] == 200) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Login(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackground,
        body: SafeArea(
            child: Form(
          key: _formKey,
          child: Container(
            width: double.infinity,
            padding:
                const EdgeInsets.only(top: 40, bottom: 5, left: 40, right: 40),
            color: kBackground,
            child: 
                Stack(
                  children: [
                    
                    Container(
                      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 7),
                      child: Column(
                        children: [
                          const Image(
                            image: AssetImage('img/logo.png'),
                            width: 140,
                            height: 140,
                          ),
                           Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              'Create Account',
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
                              controller: nama_lengkap,
                              style: GoogleFonts.poppins(color: kText),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: 'nama lengkap',
                                hintStyle: GoogleFonts.poppins(color: Colors.white60),
                                filled: true,
                                fillColor: kPrimaryColor,
                                prefixIcon: const Align(
                                  widthFactor: 2,
                                  heightFactor: 1.0,
                                  child: Icon(
                                    Icons.account_circle_outlined,
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
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: TextFormField(
                              controller: email,
                              style:  GoogleFonts.poppins(color: kText),
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'Email',
                                hintStyle:  GoogleFonts.poppins(color: Colors.white60),
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
                                    color: kPrimaryColor,
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
                              style:  GoogleFonts.poppins(color: kText),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle:  GoogleFonts.poppins(color: Colors.white60),
                                filled: true,
                                fillColor: kPrimaryColor,
                                prefixIcon: const Align(
                                  widthFactor: 2,
                                  heightFactor: 1.0,
                                  child: Icon(
                                    Icons.lock_outline_rounded,
                                    color: Colors.white,
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
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              registerUser();
                            },
                            child: Container(
                              width: double.infinity,
                              height: 48,
                              alignment: Alignment.center,
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: kBtn,
                              ),
                              child: Text(
                                'Register',
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
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 100,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Alraedy have an account ?',
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
                                                builder: (context) => const Login()));
                                      },
                                      child: Text(
                                        'login',
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
                        ),
                      ],
                    ),

                  ],
                ),
                
              
          ),
        )));
  }
}
