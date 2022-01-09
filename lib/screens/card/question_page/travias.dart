import 'package:take_out_app/constants/imports.dart';

class Travias extends StatefulWidget {
  const Travias({Key? key}) : super(key: key);

  @override
  _TraviasState createState() => _TraviasState();
}

class _TraviasState extends State<Travias> {
  final CountDownController _countdownController = CountDownController();
  int _trueAnswerIndex = Random().nextInt(4);
  int _markIndicator = 2;
  int courrectAnswers = 0;
  int unCourrectAnswers = 0;
  int pageIndex = 0;
  int quizIndex = 0;
  bool selected = false;

  List datas = [];

  Future<Quiz> _getQuiz() async {
    try {
      Response res = await Dio()
          .get("https://opentdb.com/api.php?amount=10&type=multiple");
      var a = Quiz.fromJson(res.data);
      return a;
    } catch (e) {
      throw Exception("Errrrrror: $e");
    }
  }

  @override
  void initState() {
    _getQuiz().then((b) {
      for (int i = 0; i < b.results!.length; i++) {
        datas.add(b.results![i]);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: kRed,
        body: FutureBuilder(
          future: _getQuiz(),
          builder: ((context, snap) {
            return Center(
              child: snap.hasData
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _onCenterWhiteBox(),
                        const MyStatefullBuilderNavigationBottomBar(),
                      ],
                    )
                  : const CircularProgressIndicator(
                      strokeWidth: 6.0,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
            );
          }),
        ));
  }

  _onCenterWhiteBox() {
    return pageIndex == 0 ? _quizSplashScreen() : _quizBox(datas);
  }

  //ON CENTER WHITE BOX ELEMENTS
  _topSideRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: getHeight(30.0),
          width: getWidth(80.0),
          decoration: BoxDecoration(
            color: kFilledField,
            borderRadius: BorderRadius.circular(
              getWidth(10.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: getHeight(18.0),
                width: getWidth(18.0),
                child: Image.asset(
                  "assets/images/moneyBucket.png",
                  fit: BoxFit.contain,
                ),
              ),
              SetText(
                "\$5.75",
                size: 15.0,
                fw: FontWeight.w500,
              ),
            ],
          ),
        ),
        Container(
          height: getHeight(30.0),
          width: getWidth(100.0),
          decoration: BoxDecoration(
            color: kFilledField,
            borderRadius: BorderRadius.circular(
              getWidth(10.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.star_rate,
                color: kBlack,
                size: 17.5,
              ),
              SetText(
                "60 points",
                size: 15.0,
                fw: FontWeight.w500,
              ),
            ],
          ),
        ),
      ],
    );
  }

  _timeIsgoingSide() {
    return _markIndicator == 2
        ? SizedBox(
            height: getHeight(150.0),
            width: getWidth(375.0),
            child: Stack(
              children: [
                //Left Side of Counter
                /////////////   X     Y  HEIGHT italicTo
                _questionMark(-0.35, -0.7, 20.0, 'right'),
                _questionMark(-0.6, -0.5, 30.0, 'left'),
                _questionMark(-0.4, 0.0, 17.0, ''),
                _questionMark(-0.6, 0.2, 22.0, 'right'),
                _questionMark(-0.40, 0.55, 25.0, 'left'),
                //Right Side of Counter
                /////////////   X     Y  HEIGHT italicTo
                _questionMark(0.35, -0.7, 20.0, ''),
                _questionMark(0.6, -0.5, 30.0, 'left'),
                _questionMark(0.4, 0.0, 17.0, ''),
                _questionMark(0.6, 0.2, 22.0, 'right'),
                _questionMark(0.40, 0.55, 25.0, 'left'),

                _counter(),
              ],
            ),
          )
        : (_markIndicator == 1
            ? SizedBox(
                height: getHeight(150.0),
                width: getWidth(375.0),
                child: Align(
                  alignment: const Alignment(0.0, 0.0),
                  child: SizedBox(
                    height: getWidth(75.0),
                    width: getWidth(75.0),
                    child: SvgPicture.asset(
                      "assets/icons/true.svg",
                    ),
                  ),
                ),
              )
            : Stack(
                children: [
                  SizedBox(
                    height: getHeight(150.0),
                    width: getWidth(375.0),
                    child: Align(
                      alignment: const Alignment(0.0, 0.0),
                      child: SizedBox(
                        height: getWidth(75.0),
                        width: getWidth(75.0),
                        child: SvgPicture.asset(
                          "assets/icons/wrongAnsverMark.svg",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getHeight(150.0),
                    width: getWidth(375.0),
                    child: Align(
                      alignment: const Alignment(0.065, 0.0),
                      child: SizedBox(
                        height: getWidth(45.0),
                        width: getWidth(45.0),
                        child: SvgPicture.asset(
                          "assets/icons/<.svg",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getHeight(150.0),
                    width: getWidth(375.0),
                    child: Align(
                      alignment: const Alignment(-0.065, 0.0),
                      child: SizedBox(
                        height: getWidth(45.0),
                        width: getWidth(45.0),
                        child: SvgPicture.asset(
                          "assets/icons/>.svg",
                        ),
                      ),
                    ),
                  ),
                ],
              ));
  }

  //_timeIsGoingSide Elements
  _counter() {
    return Stack(
      children: [
        Align(
          alignment: const Alignment(0.0, 0.0),
          child: CircularCountDownTimer(
            duration: 10,
            initialDuration: 0,
            controller: _countdownController,
            width: getWidth(75.0),
            height: getHeight(75.0),
            ringColor: kRed,
            ringGradient: null,
            fillColor: kFilledField,
            fillGradient: null,
            backgroundColor: Colors.white,
            backgroundGradient: null,
            strokeWidth: getWidth(10.0),
            strokeCap: StrokeCap.round,
            textStyle: TextStyle(
                fontSize: getWidth(35.0),
                color: Colors.black,
                fontWeight: FontWeight.w600),
            textFormat: CountdownTextFormat.S,
            isReverse: true,
            isReverseAnimation: false,
            isTimerTextShown: true,
            autoStart: true,
            onStart: () {
              // ignore: avoid_print
              print('Countdown Started');
            },
            onComplete: () async {
              if (quizIndex < 9) {
                _markIndicator = 0;
                setState(() {});
                await Future.delayed(const Duration(milliseconds: 800), () {});
                quizIndex++;
                _markIndicator = 2;
                unCourrectAnswers++;
                setState(() {});
                _countdownController.restart();
              } else {
                unCourrectAnswers++;

                _navigator();
              }
            },
          ),
        ),
      ],
    );
  }

  _questionMark(x, y, size, how) {
    return Align(
      alignment: Alignment(x, y),
      child: SvgPicture.asset(
        (how == 'left')
            ? "assets/icons/italicToLeftquestionMark.svg"
            : (how == 'right')
                ? "assets/icons/italicToRightQuestionMark.svg"
                : "assets/icons/verticalQuestionMark.svg",
        height: getHeight(size),
      ),
    );
  }

  _quizSplashScreen() {
    return InkWell(
      onTap: () {
        setState(() {
          pageIndex = 1;
        });
      },
      child: Container(
        alignment: Alignment.center,
        height: getHeight(124.0),
        width: getWidth(300.0),
        margin: EdgeInsets.only(
          top: getHeight(238.0),
          bottom: getHeight(320.0),
          left: getWidth(38.0),
          right: getWidth(38.0),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            getWidth(10.0),
          ),
        ),
        child: SetText(
          "Question\n1 of 10",
          align: TextAlign.center,
          size: 30.0,
          fw: FontWeight.w700,
        ),
      ),
    );
  }

  _quizBox(data) {
    return Container(
      alignment: Alignment.center,
      height: getHeight(608.0),
      width: getWidth(335.0),
      padding: EdgeInsets.only(
        top: getWidth(15.0),
        left: getWidth(15.0),
        right: getWidth(15.0),
      ),
      margin: EdgeInsets.only(
        top: getHeight(49.0),
        bottom: getHeight(25.0),
        left: getWidth(20.0),
        right: getWidth(20.0),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          getWidth(10.0),
        ),
      ),
      child: Column(
        children: [
          _topSideRow(),
          _timeIsgoingSide(),
          QuestionBox(data[quizIndex].question.toString()),
          _ansverOptions(data)
        ],
      ),
    );
  }

  _ansverOptions(data) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () async {
            if (index == _trueAnswerIndex) {
              courrectAnswers++;
              _markIndicator = 1;
              setState(() {});
              await Future.delayed(const Duration(milliseconds: 800), () {});
            } else {
              unCourrectAnswers++;
              _markIndicator = 0;
              setState(() {});
              await Future.delayed(const Duration(milliseconds: 800), () {});
            }
            if (quizIndex < 9) {
              _markIndicator = 2;
              quizIndex++;
              _trueAnswerIndex = Random().nextInt(4);
              await Future.delayed(const Duration(microseconds: 500), () {
                setState(() {});
              });

              _countdownController.resume();
            } else {
              _navigator();
            }
          },
          child: AnsverOptionBox(
            index == _trueAnswerIndex
                ? (data[quizIndex].correctAnswer.toString())
                : (data[quizIndex].incorrectAnswers[
                    _trueAnswerIndex < index ? index - 1 : index]),
          ),
        );
      },
    );
  }

  _navigator() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TraviaResults(courrectAnswers, unCourrectAnswers),
      ),
    );
  }
}
