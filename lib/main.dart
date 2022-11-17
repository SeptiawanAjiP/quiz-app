import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/model/question_model.dart';
import 'package:quizapp/result.page.dart';
import 'package:quizapp/test_page.dart';
import 'package:http/http.dart' as myHttp;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<QuestionModel> questionList = [];
  TextEditingController usernameController = TextEditingController();

  void getAllData(String username) async {
    try {
      var response = await myHttp.get(Uri.parse(
          "https://script.google.com/macros/s/AKfycbxE6jf3cMtRzXrJZpKQKiM7WflYdflxQaKgMCUINU1Ai9V_0tVrnrBCxgpTywJRMnhAMg/exec"));
      List data = (json.decode(response.body));

      data.forEach((element) {
        questionList.add(QuestionModel.fromJson(element));
      });
      print('AUFAR LENGTH : ' + questionList.length.toString());
      Navigator.of(context)
          .push(MaterialPageRoute(
        builder: (context) =>
            TestPage(questionList: questionList, username: username),
      ))
          .then((value) {
        setState(() {});
      });
    } catch (err) {
      print('Error : ' + err.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Yuk QUIZ",
              style: GoogleFonts.montserrat(color: Colors.white, fontSize: 26),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: "Masukan username",
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  getAllData(usernameController.text);
                },
                child: Text("M U L A I"))
          ],
        ),
      )),
    );
  }
}
