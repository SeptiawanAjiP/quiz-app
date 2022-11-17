import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/model/question_model.dart';
import 'package:quizapp/result.page.dart';

class TestPage extends StatefulWidget {
  final List<QuestionModel> questionList;
  final String username;
  const TestPage({Key? key, required this.questionList, required this.username})
      : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int index = 0;
  bool _isRunning = true;
  final _controller = CountDownController();
  int result = 0;

  @override
  void initState() {
    // TODO: implement initState
    // _controller.start();

    super.initState();
  }

  void validate(String option) {
    setState(() {
      if (option == widget.questionList[index].correctOption) {
        result++;
      }
      print('Nilai : ' + result.toString());
      index++;
      if (index == widget.questionList.length) {
        Navigator.of(context)
            .push(MaterialPageRoute(
          builder: (context) => ResultPage(result: result),
        ))
            .then((value) {
          setState(() {});
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${index + 1}  /   ${widget.questionList.length.toString()}',
                    style: GoogleFonts.montserrat(
                        fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    widget.username,
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.montserrat(
                        fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 150,
              width: 150,
              child: CountDownProgressIndicator(
                controller: _controller,
                valueColor: Colors.red,
                backgroundColor: Colors.white,
                initialPosition: 0,
                duration: 60,
                text: 'detik',
                onComplete: () {
                  setState(() {
                    index++;
                  });
                  Navigator.of(context)
                      .push(MaterialPageRoute(
                    builder: (context) => ResultPage(
                      result: result,
                    ),
                  ))
                      .then((value) {
                    setState(() {});
                  });
                },
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Text(
                  widget.questionList[index].question,
                  textAlign: TextAlign.center,
                  style:
                      GoogleFonts.montserrat(fontSize: 22, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                validate("a");
              },
              child: OptionWidget(
                  color: Colors.pink,
                  optionChar: "A",
                  optionDetail: widget.questionList[index].optionA),
            ),
            GestureDetector(
              onTap: () {
                validate("b");
              },
              child: OptionWidget(
                  color: Colors.red,
                  optionChar: "B",
                  optionDetail: widget.questionList[index].optionB),
            ),
            GestureDetector(
              onTap: () {
                validate("c");
              },
              child: OptionWidget(
                  color: Colors.green,
                  optionChar: "C",
                  optionDetail: widget.questionList[index].optionC),
            ),
            GestureDetector(
              onTap: () {
                validate("d");
              },
              child: OptionWidget(
                  color: Colors.blue,
                  optionChar: "D",
                  optionDetail: widget.questionList[index].optionD),
            ),
          ],
        )),
      ),
    );
  }
}

class OptionWidget extends StatelessWidget {
  final Color color;
  final String optionChar;
  final String optionDetail;
  const OptionWidget(
      {Key? key,
      required this.color,
      required this.optionChar,
      required this.optionDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: color),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Text(
                optionChar,
                style:
                    GoogleFonts.montserrat(fontSize: 18, color: Colors.white),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  optionDetail,
                  textAlign: TextAlign.left,
                  style:
                      GoogleFonts.montserrat(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
