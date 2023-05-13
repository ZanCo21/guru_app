import 'dart:convert';

import 'package:guru_flutter/screens/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late SharedPreferences preferences;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    setState(() {
      isLoading = true;
    });
    preferences = await SharedPreferences.getInstance();
    setState(() {
      isLoading = false;
    });
  }

  Future<void> logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString('token');
    var response = await http.post(
      Uri.parse('http://127.0.0.1:8000/api/auth/logout'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      // Hapus token autentikasi dari SharedPreferences
      preferences.remove('token');

      // Kembali ke halaman login
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      );
    } else {
      // Tampilkan pesan kesalahan jika logout gagal
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logout gagal')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  InkWell(
                      onTap: () async {
                        await logout();
                      },
                      child: Container(
                        color: Colors.red,
                        child: Text(
                          'logout',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                  Text('hello this home'),
                  Text(preferences.getInt('user_id').toString()),
                  Text(preferences.getString('email').toString()),
                  Text(preferences.getString('token').toString()),
                ],
              ),
      ),
    );
  }
}
