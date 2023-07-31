// ignore_for_file: implementation_imports, unnecessary_import, prefer_interpolation_to_compose_strings, use_build_context_synchronously, sized_box_for_whitespace

import 'dart:convert';
import 'package:guru_flutter/screens/CRUD/add_postingan.dart';
import 'package:guru_flutter/screens/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:guru_flutter/widget/colors.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



//untuk kandidat selanjutnya mohon bantuan nya
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String url = 'http://127.0.0.1:8000/api/postingan';

  Future getPostingan() async {
    var response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  Future deletepostingan(String postinganId) async {
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
          builder: (context) => const Login(),
        ),
      );
    } else {
      // Tampilkan pesan kesalahan jika logout gagal
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Logout gagal')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(context,
      //         MaterialPageRoute(builder: ((context) => addpostingan())));
      //   },
      //   child: Icon(Icons.add),
      // ),
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
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => addpostingan())));
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Icon(Icons.create_rounded),
            ),
          )
        ],
      ),
      backgroundColor: kBackground,
      body: Container(
          width: double.infinity,
          color: kBackground,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
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
                        child: const Text(
                          'logout',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                  const Text('hello this home'),
                  Text(preferences.getInt('user_id').toString()),
                  Text(preferences.getString('email').toString()),
                  Text(preferences.getString('token').toString()),
                ],
              ),
          ),
              Container(
                padding: const EdgeInsets.all(25),
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: kBackground,
                    border: Border(
                        bottom: BorderSide(
                      color: kPrimaryColor,
                      width: 1,
                    ))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 50.0,
                        height: 50.0,
                        margin: const EdgeInsets.only(right: 18),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/img/haikal.png'),
                        ),
                          borderRadius: BorderRadius.circular(100.0),
                          
                        ),
                      ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        


                        //INI TAMPILAN AWAL BERHASIL LOGIN & HASIL POSTINGAN

                        //                   Container(
                        //  child: Column(
                        //   children: [
                        //     Container(
                        //        child: isLoading
                        //       ? const Center(
                        //           child: CircularProgressIndicator(),
                        //         )
                        //       : Column(
                        //           children: [
                        //             InkWell(
                        //                 onTap: () async {
                        //                   await logout();
                        //                 },
                        //                 child: Container(
                        //                   color: Colors.red,
                        //                   child: Text(
                        //                     'logout',
                        //                     style: TextStyle(color: Colors.white),
                        //                   ),
                        //                 )),
                        //             Text('hello this home'),
                        //             Text(preferences.getInt('user_id').toString()),
                        //             Text(preferences.getString('email').toString()),
                        //             Text(preferences.getString('token').toString()),
                        //           ],
                        //         ),
                        //     ),
                        //   Container(
                        //     child: FutureBuilder(
                        //       future: getPostingan(),
                        //       builder: (context, snapshot) {
                        //         if (snapshot.hasData) {
                        //           return ListView.builder(
                        //             shrinkWrap: true,
                        //             itemCount: snapshot.data['data'].length,
                        //             itemBuilder: (context, index) {
                        //               return Container(
                        //                 child: Card(
                        //                   elevation: 5,
                        //                   child: Row(
                        //                     children: [
                        //                       Container(
                        //                         child: Image.network(snapshot.data['data'][index]['gambar'], width: 250, height: 250),
                        //                       ),
                        //                       Expanded(
                        //                         child: Container(
                        //                           child: Text(snapshot.data['data'][index]['pesan'], style: TextStyle(
                        //                             fontSize: 20,
                        //                             fontWeight: FontWeight.w600,
                        //                           ),),
                        //                         ),
                        //                       ),
                        //                        Container(
                        //                       child:Column(
                        //                         mainAxisAlignment: MainAxisAlignment.center,
                        //                         children: [
                        //                           GestureDetector(
                        //                             onTap: () {
                        //                               Navigator.push(context, MaterialPageRoute(builder: ((context) => editpostigan( postigan: snapshot.data['data'][index] ,))));
                        //                             },
                        //                             child: Container(
                        //                               height: 70,
                        //                               child: Icon(Icons.mode_edit_rounded, size: 50,),
                        //                             ),
                        //                           ),
                        //                           GestureDetector(
                        //                             onTap: () {
                        //                               deletepostingan(snapshot.data['data'][index]['id'].toString()).then((value) {
                        //                               setState(() {});
                        //                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('data berhasil di delete')));
                        //                               }
                        //                               );
                        //                             },
                        //                             child: Container(
                        //                               height: 70,
                        //                               child: Icon(Icons.delete_forever, size: 50,),
                        //                             ),
                        //                           ),
                        //                         ],
                        //                       ),
                        //                     )
                        //                     ],
                        //                   ),
                        //                 ),
                        //               );
                        //             }, // Tambahkan kurung kurawal penutup
                        //           );
                        //         } else {
                        //           return Text("data gagal");
                        //         }
                        //       },
                        //     ),
                        //   ),
                        //  ]),
                        // ),
                        //END TAMPILAN AWAL POST

                        Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Row(
                            children: const [
                              Text(
                                'Mahes',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: kText,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 6),
                                child: Text(
                                  '•',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: kText,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 1),
                                child: Text(
                                  'guru agama',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: kText,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 290,
                          child: const Text(
                            'lorem ipsum lorem ipsum lorem ipsu lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum.',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: kText,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 7),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.favorite_border_rounded,
                                      color: kIcon,
                                      size: 15,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text(
                                        '10',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: kText,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.comment_outlined,
                                      color: kIcon,
                                      size: 15,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text(
                                        '10',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: kText,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          )),
      bottomNavigationBar: Container(
          height: 65,
          clipBehavior:
              Clip.hardEdge, //or better look(and cost) using Clip.antiAlias,
          decoration: const BoxDecoration(
            color: kBackground,
            border: Border(
                                  top: BorderSide(width: 1.0, color: Color.fromRGBO(57, 57, 57, 0.4)),
                                ),
          ),
          child: BottomNavigationBar(
            onTap: (value) {},
            selectedItemColor: kBtn,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            unselectedItemColor: Colors.white70,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            backgroundColor: const Color(0xff2C2C2C),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_rounded,
                  size: 25,
                ),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  size: 25,
                ),
                label: 'search',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications,
                  size: 25,
                ),
                label: 'like',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 25,
                ),
                label: 'p',
              ),
            ],
          )),
    );
  }
}
