import 'dart:convert';
import 'package:guru_flutter/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class addpostingan extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  TextEditingController _gambarController = TextEditingController();
  TextEditingController _pesanController = TextEditingController();
  
  Future savepostingan() async{
   final Response = await http.post(Uri.parse("http://127.0.0.1:8000/api/postingan"),body:{
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
              controller:_gambarController,
              decoration: InputDecoration(
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
              controller:_pesanController,
              decoration: InputDecoration(
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
                savepostingan().then((value) => {
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => Home()))),
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('data berhasil di tambah')))
                });
              }
            }, child: Text('save'))
          ],
        ),
      ),
    );
  }
}