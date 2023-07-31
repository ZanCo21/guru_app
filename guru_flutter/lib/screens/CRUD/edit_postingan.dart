// ignore_for_file: camel_case_types, must_be_immutable, use_key_in_widget_constructors, prefer_final_fields, non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:guru_flutter/screens/home.dart';
import 'package:http/http.dart' as http;

class editpostigan extends StatelessWidget {
  final Map postigan;

  editpostigan({required this.postigan});

  final _formKey = GlobalKey<FormState>();
  TextEditingController _gambarController = TextEditingController();
  TextEditingController _pesanController = TextEditingController();
  
  Future updatepostigan() async{
   final Response = await http.put(Uri.parse("http://127.0.0.1:8000/api/postingan/" + postigan['id'].toString()),body:{
    "gambar":_gambarController.text,
    "pesan":_pesanController.text,
   } );

   return json.decode(Response.body);
  }
 
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key:_formKey,
        child: Column(
          children: [
            TextFormField(
              controller:_gambarController..text = postigan['gambar'].toString(),
              decoration: const InputDecoration(
                labelText: "link gambar",
              ),
              validator:(value){
                if(value == null || value.isEmpty){
                  return "tidak boleh kosong";
                }
                return null;
              }
            ),
            TextFormField(
              controller:_pesanController..text = postigan['pesan'],
              decoration: const InputDecoration(
                labelText: "pesan"
              ),
               validator:(value){
                if(value == null || value.isEmpty){
                  return "tidak boleh kosong";
                }
                return null;
              }
            ),





            ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() == true) {
                updatepostigan().then((value) => {
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => const Home()))),
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('data berhasil di update')))
                });
              }
            }, child: const Text('update'))
          ],
        ),
      ),
    );
  }
}