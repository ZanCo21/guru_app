import 'dart:convert';
import 'dart:html';

import 'package:guru_flutter/screens/CRUD/add_postingan.dart';
import 'package:guru_flutter/screens/CRUD/edit_postingan.dart';
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

  final String url = 'http://127.0.0.1:8000/api/postingan';

  Future getPostingan() async{
    var response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  Future deletepostingan(String postinganId) async{
  String url = 'http://127.0.0.1:8000/api/postingan/' + postinganId;

    var response = await http.delete(Uri.parse(url));
    return json.decode(response.body);
  }

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
       floatingActionButton: FloatingActionButton(
        onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: ((context) => addpostingan())));  
        },
        child: Icon(Icons.add
        ),
      ),
      body: Container(
       child: Column(
        children: [
          Container(
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
        Container(
          child: FutureBuilder(
            future: getPostingan(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data['data'].length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Card(
                        elevation: 5,
                        child: Row(
                          children: [
                            Container(
                              child: Image.network(snapshot.data['data'][index]['gambar'], width: 250, height: 250),
                            ),
                            Expanded(
                              child: Container(
                                child: Text(snapshot.data['data'][index]['pesan'], style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),),
                              ),
                            ),
                             Container(
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: ((context) => editpostigan( postigan: snapshot.data['data'][index] ,))));
                                  },
                                  child: Container(
                                    height: 70,
                                    child: Icon(Icons.mode_edit_rounded, size: 50,),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    deletepostingan(snapshot.data['data'][index]['id'].toString()).then((value) {
                                    setState(() {});
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('data berhasil di delete')));
                                    } 
                                    );
                                  },
                                  child: Container(
                                    height: 70,
                                    child: Icon(Icons.delete_forever, size: 50,),
                                  ),
                                ),
                              ],
                            ),
                          )
                          ],
                        ),
                      ),
                    );
                  }, // Tambahkan kurung kurawal penutup
                );
              } else {
                return Text("data gagal");
              }
            },
          ),
        ),
       ]),
      ),
    );
  }
}
