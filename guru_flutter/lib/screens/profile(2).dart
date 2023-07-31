// ignore_for_file: file_names, use_build_context_synchronously, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:guru_flutter/screens/auth/login.dart';
import 'package:guru_flutter/widget/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

//INI TAMPILAN PROFILE AWAL
class Profile2 extends StatefulWidget {
  const Profile2({super.key});

  @override
  State<Profile2> createState() => _Profile2State();
}

class _Profile2State extends State<Profile2> {
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
      backgroundColor: kBackground,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
                'Profile',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white
                ),
                ),
        backgroundColor: kBackground,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                width: 120.0,
                height: 130.0,
                margin: const EdgeInsets.only(top: 30, bottom: 15),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/img/haikal.png'),
                  ),
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                  
                ),
              ),
              
              Text(
                'Erik Groetz',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
                ),
                ),
              Text(
                'safhasgf',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white38
                ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: const Divider(
                    color: Colors.white10,
                    thickness: 2,
                  ),
                ),
                Text(
                '10',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
                ),
                ),
                Text(
                'Posting',
                style: GoogleFonts.poppins(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.white70
                ),
                ),
                Container(
                  width:  MediaQuery.of(context).size.width / 1.1,
                  height:  MediaQuery.of(context).size.height / 2.4,
                  margin: const EdgeInsets.only(top: 35),
                  padding: const EdgeInsets.all(35.0),
                  decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(45)
                ),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                            Container(
                              width: 50,
                              height: 50,
                              margin: const EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.settings,
                                  size: 30
                                  ),
                              ),
                            ),
                            Text(
                              'Settings',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.poppins(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Colors.white
                              ),
                              ),
                              ],
                            ),
                              const Icon(
                                Icons.chevron_right_rounded,
                                color: Colors.grey,
                                size: 28,
                                )
                          ],
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      InkWell(
                        onTap: () {
                          
                        },
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                              Container(
                                width: 50,
                                height: 50,
                                margin: const EdgeInsets.only(right: 20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.person,
                                    size: 30,
                                    ),
                                ),
                              ),
                              Text(
                                'User Managment',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.poppins(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white
                                ),
                                ),
                                ],
                              ),
                                const Icon(
                                  Icons.chevron_right_rounded,
                                  color: Colors.grey,
                                  size: 28,
                                  )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 35.0),
                        child: const Divider(
                          color: Colors.white10,
                          thickness: 2,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                        await logout();
                      },

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                              Container(
                                width: 50,
                                height: 50,
                                margin: const EdgeInsets.only(right: 20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.logout_rounded,
                                    size: 30,
                                    ),
                                ),
                              ),
                              Text(
                                'Logout',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.poppins(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white
                                ),
                                ),
                                ],
                              ),
                                const Icon(
                                  Icons.chevron_right_rounded,
                                  color: Colors.grey,
                                  size: 28,
                                  )
                            ],
                          ),
                        
                      ),

                      // // DALEMAN USER(EDIT)
                      // Container(
                      //   padding: EdgeInsets.all( 20),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Column(
                      //         children: [
                      //           Text(
                      //           'Mobile Phone',
                      //           style: GoogleFonts.poppins(
                      //             fontSize: 16,
                      //             fontWeight: FontWeight.w500,
                      //             color: Colors.white70
                      //           ),
                      //           ),
                      //           SizedBox(height: 5),
                      //           Row(
                      //             children: [
                      //           Icon(Icons.telegram_sharp),
                      //           SizedBox(width: 10),
                      //           Text(
                      //           '078349246',
                      //           style: GoogleFonts.poppins(
                      //             fontSize: 16,
                      //             fontWeight: FontWeight.w500,
                      //             color: Colors.white70
                      //           ),
                      //           ),
                      
                      //             ],
                      //           )
                      //         ],
                      //       ),
                      //       Icon(
                      //         Icons.edit,
                      //         color: Colors.white70,
                      //         )
                      //     ],
                      //   ),
                      // ),
                      // Container(
                      //   padding: EdgeInsets.all( 20),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Column(
                      //         children: [
                      //           Text(
                      //           'Address            ',
                      //           style: GoogleFonts.poppins(
                      //             fontSize: 16,
                      //             fontWeight: FontWeight.w500,
                      //             color: Colors.white70
                      //           ),
                      //           ),
                      //           SizedBox(height: 5),
                      //           Row(
                      //             children: [
                      //           Icon(Icons.telegram_sharp),
                      //           SizedBox(width: 10),
                      //           Text(
                      //           'ahsfhafasfh',
                      //           style: GoogleFonts.poppins(
                      //             fontSize: 16,
                      //             fontWeight: FontWeight.w500,
                      //             color: Colors.white70
                      //           ),
                      //           ),
                      
                      //             ],
                      //           )
                      //         ],
                      //       ),
                      //       Icon(
                      //         Icons.edit,
                      //         color: Colors.white70,
                      //         )
                      //     ],
                      //   ),
                      // ),
                      // Container(
                      //   padding: EdgeInsets.all( 20),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Column(
                      //         children: [
                      //           Text(
                      //           'Address',
                      //           style: GoogleFonts.poppins(
                      //             fontSize: 16,
                      //             fontWeight: FontWeight.w500,
                      //             color: Colors.white70
                      //           ),
                      //           ),
                      //           SizedBox(height: 5),
                      //           Row(
                      //             children: [
                      //           Icon(Icons.location_city_rounded),
                      //           SizedBox(width: 10),
                      //           Text(
                      //           'whdghasdhafsdhafd',
                      //           style: GoogleFonts.poppins(
                      //             fontSize: 16,
                      //             fontWeight: FontWeight.w500,
                      //             color: Colors.white70
                      //           ),
                      //           ),
                      
                      //             ],
                      //           )
                      //         ],
                      //       ),
                      //       Icon(
                      //         Icons.edit,
                      //         color: Colors.white70,
                      //         )
                      //     ],
                      //   ),
                      // ),
                      // Container(
                      //   padding: EdgeInsets.all( 20),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Column(
                      //         children: [
                      //           Text(
                      //           'Email                ',
                      //           textAlign: TextAlign.left,
                      //           style: GoogleFonts.poppins(
                      //             fontSize: 16,
                      //             fontWeight: FontWeight.w500,
                      //             color: Colors.white70
                      //           ),
                      //           ),
                      //           SizedBox(height: 5),
                      //           Row(
                      //             children: [
                      //           Icon(
                      //             Icons.email,
                      //             color: Colors.white70,
                      //             ),
                      //           SizedBox(width: 10),
                      //           Text(
                      //           '078349246',
                      //           style: GoogleFonts.poppins(
                      //             fontSize: 16,
                      //             fontWeight: FontWeight.w500,
                      //             color: Colors.white70
                      //           ),
                      //           ),
                      
                      //             ],
                      //           )
                      //         ],
                      //       ),
                      //       Icon(
                      //         Icons.edit,
                      //         color: Colors.white70,
                      //         )
                      //     ],
                      //   ),
                      // ),

                    ],
                  ),
                )
                


            ],
          ),
        )),
        bottomNavigationBar: Container(
          height: 65,
          clipBehavior:
              Clip.hardEdge, //or better look(and cost) using Clip.antiAlias,
          decoration: const BoxDecoration(),
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
                  Icons.favorite_border_outlined,
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