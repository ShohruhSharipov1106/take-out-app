import 'package:take_out_app/constants/imports.dart';

class TraviaResults extends StatefulWidget {
  final int correctAnsvers;
  final int uncorrectAnsvers;
  const TraviaResults(this.correctAnsvers, this.uncorrectAnsvers, {Key? key})
      : super(key: key);

  @override
  _TraviaResultsState createState() => _TraviaResultsState();
}

class _TraviaResultsState extends State<TraviaResults> {
  double sliderValue = 10.0;
  final List<String> _players = [
    "Naomi",
    "Zag",
    "Mia",
    "Chloe",
    "Heidi",
    "Marcus",
    "Mind",
    "Emma",
    "Aaliyah",
    "John"
  ];
  final int score = 150;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: kRed,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _topSideText(),
            _ansversSide(),
            _earningsSide(),
            _badgeSide(),
            _podiumSide(),
            _otherPlayersSide(),
            _continueButton(),
            SizedBox(
              height: getHeight(40.0),
            ),
            const MyStatefullBuilderNavigationBottomBar(),
          ],
        ),
      ),
    );
  }

  _topSideText() {
    return Padding(
      padding: EdgeInsets.only(
        top: getHeight(74.0),
      ),
      child: SetText("Results",
          color: Colors.white,
          align: TextAlign.center,
          size: 40.0,
          fw: FontWeight.w700),
    );
  }

  _ansversSide() {
    return Container(
      height: getHeight(48.0),
      width: getWidth(335.0),
      margin: EdgeInsets.only(top: getHeight(30.0)),
      padding: EdgeInsets.symmetric(horizontal: getWidth(15.0)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(getWidth(10.0)),
        color: const Color(0xff741C28).withOpacity(.6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/true.svg",
                height: getHeight(20.0),
              ),
              SizedBox(width: getWidth(4.0)),
              SetText(
                "${widget.correctAnsvers} correct",
                color: Colors.white,
                size: 15.0,
                fw: FontWeight.w500,
              ),
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/x.svg",
                height: getHeight(20.0),
              ),
              SizedBox(width: getWidth(4.0)),
              SetText(
                "${widget.uncorrectAnsvers} uncorrect",
                color: Colors.white,
                size: 15.0,
                fw: FontWeight.w500,
              )
            ],
          )
        ],
      ),
    );
  }

  _earningsSide() {
    return Container(
      height: getHeight(127.0),
      width: getWidth(335.0),
      margin: EdgeInsets.only(top: getHeight(30.0)),
      padding: EdgeInsets.only(
        left: getWidth(15.0),
        right: getWidth(15.0),
        top: getHeight(10.0),
        bottom: getHeight(25.0),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(getWidth(10.0)),
        color: const Color(0xff741C28).withOpacity(.6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SetText(
            "EARNED",
            align: TextAlign.center,
            size: 15.0,
            color: Colors.white,
            fw: FontWeight.w500,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UnderLabeledImage(
                  Image.asset(
                    "assets/images/foodpack.png",
                    fit: BoxFit.contain,
                  ),
                  "Credits"),
              SetText(
                "\$6.25",
                size: 38.0,
                fw: FontWeight.w700,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10.0,
              ),
              UnderLabeledImage(
                  CircleAvatar(
                    radius: getWidth(17.5),
                    backgroundColor: kRed,
                    child: const Icon(
                      Icons.star_rate,
                      color: Colors.white,
                    ),
                  ),
                  "Points"),
              SetText(
                "70",
                size: 38.0,
                fw: FontWeight.w700,
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }

  _badgeSide() {
    return Container(
      height: getHeight(261.0),
      width: getWidth(335.0),
      margin: EdgeInsets.only(top: getHeight(30.0)),
      padding: EdgeInsets.symmetric(
        vertical: getHeight(25.0),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(getWidth(10.0)),
        color: const Color(0xff741C28).withOpacity(.6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SetText(
            "You earned a badge!",
            align: TextAlign.center,
            size: 20.0,
            color: Colors.white,
            fw: FontWeight.w600,
          ),
          SizedBox(
            height: getWidth(120.0),
            width: getWidth(120.0),
            child: Stack(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: getWidth(60.0),
                  child: Align(
                    alignment: const Alignment(0.0, -0.35),
                    child: CircleAvatar(
                      radius: getWidth(33.5),
                      backgroundColor: const Color(0xffF1C2AF),
                      child: CircleAvatar(
                        radius: getWidth(24.175),
                        backgroundColor: const Color(0xffD97953),
                        child: SvgPicture.asset(
                          "assets/icons/star.svg",
                          color: const Color(0xffF1C2AF),
                          height: getWidth(33.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(-0.56, 0.58),
                  child: Image.asset("assets/images/leftWingOfBadge.png"),
                ),
                Align(
                  alignment: const Alignment(0.56, 0.58),
                  child: Image.asset("assets/images/rightWingOfBadge.png"),
                ),
              ],
            ),
          ),
          SetText(
            "3's a crowd",
            size: 18.0,
            fw: FontWeight.w600,
            align: TextAlign.center,
            color: Colors.white,
          ),
          SetText(
            "Rank in Top 3 of at least 3 restaurants",
            size: 15.0,
            fw: FontWeight.w500,
            align: TextAlign.center,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  _podiumSide() {
    return SizedBox(
      height: getHeight(293),
      width: getWidth(375.0),
      child: Stack(
        children: [
          Positioned(
              left: getWidth(45.0),
              top: getHeight(25.0),
              child: Image.asset("assets/images/podium.png")),
        ],
      ),
    );
  }

  _otherPlayersSide() {
    return Container(
        height: getHeight(560.0),
        width: getWidth(335.0),
        margin: EdgeInsets.only(
          bottom: getHeight(40.0),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            getWidth(10.0),
          ),
          color: const Color(0xff741C28).withOpacity(.6),
        ),
        child: ListView.builder(
            padding: EdgeInsets.only(top: getWidth(11.0)),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _players.length - 3,
            itemBuilder: (context, index) {
              return SizedBox(
                height: (getHeight(560.0) / 7),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getWidth(20.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          SetText(
                            "${index + 4}",
                            size: 15.0,
                            color: Colors.white,
                            fw: FontWeight.w600,
                          ),
                          SizedBox(
                            width: getWidth(12.0),
                          ),
                          CircleAvatar(
                            radius: getWidth(25.0),
                            backgroundColor: Colors.white,
                          ),
                          SizedBox(
                            width: getWidth(12.0),
                          ),
                          SetText(
                            _players[index + 3],
                            size: 15.0,
                            fw: FontWeight.w400,
                            color: Colors.white,
                          ),
                          const Spacer(),
                          Container(
                            alignment: Alignment.center,
                            height: getHeight(24.0),
                            width: getWidth(41.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                getWidth(12.0),
                              ),
                            ),
                            child: SetText(
                              (score - (index * 7)).toStringAsFixed(0),
                              size: 12.0,
                              fw: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              );
            }));
  }

  _continueButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TraviaResults2(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        fixedSize: Size(getWidth(335.0), getHeight(58.0)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            getWidth(10.0),
          ),
        ),
      ),
      child: SetText(
        "Continue",
        size: 20.0,
        fw: FontWeight.w700,
      ),
    );
  }
}
