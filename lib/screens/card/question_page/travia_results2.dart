
import 'package:take_out_app/constants/imports.dart';

class TraviaResults2 extends StatefulWidget {
  const TraviaResults2({Key? key}) : super(key: key);

  @override
  State<TraviaResults2> createState() => _TraviaResults2State();
}

class _TraviaResults2State extends State<TraviaResults2> {
  var sliderValue = 30.0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kRed,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _onCenterWhiteBox(),
          const MyStatefullBuilderNavigationBottomBar(),
        ],
      ),
    );
  }

  _onCenterWhiteBox() {
    return Container(
      height: getHeight(503.0),
      width: getWidth(335.0),
      margin: EdgeInsets.only(
        top: getHeight(106.0),
        bottom: getHeight(33.0),
        left: getWidth(20.0),
        right: getWidth(20.0),
      ),
      padding: EdgeInsets.only(
        top: getHeight(71.0),
        bottom: getHeight(39.0),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _userImageBox(),
          _earnedStarsBox(),
          _userNameAndAddressBox(),
          const SizedBox(),
          _continueButton()
        ],
      ),
    );
  }

  _userImageBox() {
    return SizedBox(
      height: getHeight(187.67),
      width: getWidth(170.0),
      child: Image.asset("assets/images/badgedAccountImage.png"),
    );
  }

  _earnedStarsBox() {
    return Container(
      height: getHeight(29.72),
      width: getWidth(107.0),
      decoration: BoxDecoration(
        color: kFilledField,
        borderRadius: BorderRadius.circular(
          getWidth(14.5),
        ),
      ),
      child: Row(
        children: [
          SetText(
            "70",
            size: 15.0,
            fw: FontWeight.w500,
          ),
          SizedBox(width: getWidth(3.0)),
          CircleAvatar(
            radius: getWidth(9.0),
            backgroundColor: kRed,
            child: const Icon(
              Icons.star_rate,
              color: Colors.white,
              size: 12.0,
            ),
          ),
          SizedBox(width: getWidth(3.0)),
          SetText(
            "earned",
            size: 15.0,
            fw: FontWeight.w500,
          ),
        ],
      ),
    );
  }

  _userNameAndAddressBox() {
    return Column(
      children: [
        SetText(
          "Enzo",
          size: 30.0,
          fw: FontWeight.w900,
        ),
        SetText(
          "Chilonzor, OT",
          size: 15.0,
          fw: FontWeight.w500,
        ),
      ],
    );
  }

  _continueButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TraviaApplyCredits(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            getWidth(10.0),
          ),
        ),
        primary: kRed,
        fixedSize: Size(
          getWidth(300.0),
          getHeight(60.0),
        ),
      ),
      child: SetText(
        "Continue",
        color: Colors.white,
        size: 20.0,
        fw: FontWeight.w600,
      ),
    );
  }

  _bottomSideWhiteBox() {
    return Container(
      height: getHeight(130.0),
      width: getWidth(375.0),
      margin: EdgeInsets.only(
        top: getHeight(40.0),
      ),
      padding: EdgeInsets.symmetric(
        vertical: getHeight(7.0),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            getWidth(10.0),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: getHeight(4.0),
              width: getWidth(63.0),
              decoration: BoxDecoration(
                color: kSilverSycee,
                borderRadius: BorderRadius.circular(
                  getHeight(2.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: getWidth(20.0),
              right: getWidth(20.0),
              top: getHeight(11.5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SetText(
                  "Driver is headed to you",
                  size: 20.0,
                  fw: FontWeight.w600,
                ),
                SizedBox(
                  height: getHeight(20.0),
                  width: getWidth(50.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          getWidth(10.0),
                        ),
                      ),
                      primary: kFilledField,
                      elevation: 0,
                    ),
                    child: SetText(
                      "HELP",
                      size: 12.0,
                      fw: FontWeight.w500,
                      color: kDeepGrey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getWidth(20.0)),
            child: SetText(
              "Arriving in 10-20 min",
              size: 15.0,
              fw: FontWeight.w400,
              color: kDeepGrey,
            ),
          ),
          Slider(
            mouseCursor: MouseCursor.uncontrolled,
            autofocus: false,
            thumbColor: Colors.white,
            activeColor: kRed,
            inactiveColor: kFilledField,
            min: 0.0,
            max: 30.0,
            value: sliderValue,
            onChanged: (v) {
              sliderValue = v;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
