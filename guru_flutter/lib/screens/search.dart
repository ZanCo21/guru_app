// ignore_for_file: implementation_imports, unnecessary_import, unused_import, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:guru_flutter/screens/CRUD/add_postingan.dart';
import 'package:guru_flutter/widget/colors.dart';
import 'package:google_fonts/google_fonts.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
      body: Container(
        color: kBackground,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 18),
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: kBackground,
                    border: Border(
                        bottom: BorderSide(
                      color: kPrimaryColor,
                      width: 2,
                    ))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(right: 12.0),
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            color: kBtn,
                            image: const DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/img/haikal.png'),
                            ))),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        Row(
                          children: [
                            Text(
                              'Mahes • guru agama',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: kText,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '5m',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 9,
                                    color: kText,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Icon(Icons.menu)
                              ],
                            )
                          ],
                        ),

                        Container(
                          width: 290,
                          child: Text(
                            'lorem ipsum lorem ipsum lorem ipsu lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum.',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: kText,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 7),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.favorite_border_rounded,
                                    color: kIcon,
                                    size: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      '10',
                                      style: GoogleFonts.poppins(
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
                                children: [
                                  const Icon(
                                    Icons.comment_outlined,
                                    color: kIcon,
                                    size: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      '10',
                                      style: GoogleFonts.poppins(
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
                      ],
                    ),
                  ],
                ),
              ),
      
          ],
        ),
      ),
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