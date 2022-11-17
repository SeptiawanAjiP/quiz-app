import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultPage extends StatefulWidget {
  final int result;
  const ResultPage({Key? key, required this.result}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/trophy.png",
              width: 150,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Hore !!! Nilai kamu ${widget.result}',
              textAlign: TextAlign.left,
              style: GoogleFonts.montserrat(fontSize: 18, color: Colors.black),
            ),
            SizedBox(
              height: 30,
            ),
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.pop(context);
            //     },
            //     child: Text("Kembali"))
          ],
        ),
      )),
    );
  }
}
