// ignore_for_file: prefer_final_fields, non_constant_identifier_names, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guru_flutter/widget/colors.dart';
import 'package:http/http.dart' as http;

class AddPostinganTampilan extends StatefulWidget {
  const AddPostinganTampilan({super.key});

  @override
  State<AddPostinganTampilan> createState() => _AddPostinganTampilanState();
}

class _AddPostinganTampilanState extends State<AddPostinganTampilan> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _gambarController = TextEditingController();
  TextEditingController _pesanController = TextEditingController();

  Future savepostingan() async {
    final Response = await http
        .post(Uri.parse("http://127.0.0.1:8000/api/postingan"), body: {
      "gambar": _gambarController.text,
      "pesan": _pesanController.text,
    });

    return json.decode(Response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {}, child: const Icon(Icons.help_outline_rounded)),
        leadingWidth: 60,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        title: Image.asset(
          'img/logo.png',
          width: 35,
          height: 35,
        ),
        backgroundColor: kBackground,
        actions: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Icon(Icons.close),
            ),
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(10),
          height: double.infinity,
          color: kBackground,
          child: TextField(
            // expands: true,
            maxLines: null,
            style: GoogleFonts.poppins(color: kText),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: 'Type here..',
              hintStyle: GoogleFonts.poppins(
                color: kText,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              filled: true,
              fillColor: kBackground,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(13),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
              ),
            ),
          ),
        ),
      ),
      bottomSheet: Container(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          color: kBackground,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(child: Icon(Icons.camera_alt_rounded, color: kIcon,)),
              InkWell(
                  child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: kBtn,
                ),
                child: Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              )),
            ],
          )),
    );
  }
}
