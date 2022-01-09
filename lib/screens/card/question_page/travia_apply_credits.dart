import 'package:take_out_app/constants/imports.dart';

class TraviaApplyCredits extends StatelessWidget {
  const TraviaApplyCredits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        children: [
          _topSideRedContainer(),
          _underRedContainerText(),
          _summary(),
          SizedBox(height: getHeight(35.0)),
          _applyCreditsButton(),
          SizedBox(height: getHeight(15.0)),
          _noSaveTextButton(),
        ],
      ),
    );
  }

  _topSideRedContainer() {
    return Container(
      height: getHeight(200.0),
      width: getWidth(335.0),
      margin: EdgeInsets.only(
        left: getWidth(20.0),
        right: getWidth(20.0),
        top: getHeight(70.0),
        bottom: getHeight(25.0),
      ),
      padding: EdgeInsets.all(getWidth(18.0)),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.3),
            blurRadius: 15.0,
            spreadRadius: 4.0,
          ),
        ],
        color: kRed,
        borderRadius: BorderRadius.circular(
          getWidth(10.0),
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              backgroundColor: Colors.white.withOpacity(.4),
              radius: 60.0,
              child: CircleAvatar(
                backgroundColor: kRed,
                radius: 40.0,
                child: SvgPicture.asset(
                  "assets/icons/star.svg",
                  color: Colors.white.withOpacity(.5),
                  height: 60.0,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SetText(
                "Trivia Tokens",
                color: Colors.white,
                size: 30.0,
                fw: FontWeight.w700,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //   SvgPicture.asset("assets/icons/take_out.svg"),
                  SizedBox(
                    height: getHeight(40.0),
                    width: getWidth(40.0),
                    child: Image.asset(
                      "assets/images/moneyBucket.png",
                      fit: BoxFit.cover,
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SetText(
                        "\$5.75",
                        color: Colors.white,
                        size: 30.0,
                        fw: FontWeight.w700,
                      ),
                      SetText(
                        "CREDIT",
                        size: 15.0,
                        color: Colors.white,
                        fw: FontWeight.w600,
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  _underRedContainerText() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getWidth(20.0),
      ),
      child: SetText(
        "Apply credits earned from Trivia to your current order, or save them for a future one.",
        size: 15.0,
        fw: FontWeight.w400,
      ),
    );
  }

  _summary() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getWidth(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: getWidth(165.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "New Summary",
                  style: TextStyle(
                    decorationColor: kRed,
                    fontSize: getWidth(20.0),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Divider(
                  color: kRed,
                  thickness: 4.0,
                  height: 4.0,
                )
              ],
            ),
          ),
          SizedBox(
            height: getHeight(20.0),
          ),
          _billTile("Subtotal", "14.97"),
          _billTile("Delivery Fee", "1.99"),
          _billTile("Taxes", "1.48"),
          SizedBox(height: getHeight(15.0)),
          _triviaAmountBox(),
          SizedBox(height: getHeight(15.0)),
          _billTile("Total", "12.69", fw: FontWeight.w600, size: 17.0)
        ],
      ),
    );
  }

  _applyCreditsButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            getWidth(10.0),
          ),
        ),
        primary: kRed,
        fixedSize: Size(
          getWidth(335.0),
          getHeight(58.0),
        ),
      ),
      child: SetText(
        "Apply Credits",
        color: Colors.white,
        size: 20.0,
        fw: FontWeight.w700,
      ),
    );
  }

  _noSaveTextButton() {
    return TextButton(
      onPressed: () {},
      child: Text(
        "No, save credits for a future order.",
        style: TextStyle(
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.w500,
          color: kDeepGrey,
          fontSize: getWidth(20.0),
        ),
      ),
    );
  }

  _billTile(what, howMuch, {FontWeight? fw, double? size}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SetText(
              what,
              size: size ?? 15.0,
              color: fw == null ? kDeepGrey : Colors.black,
              fw: fw ?? FontWeight.w400,
            ),
            SetText(
              "\$$howMuch",
              size: size ?? 15.0,
              color: fw == null ? kDeepGrey : Colors.black,
              fw: fw ?? FontWeight.w400,
            ),
          ],
        ),
        Divider(
          color: fw == null ? kDeepGrey : Colors.transparent,
        ),
      ],
    );
  }

  _triviaAmountBox() {
    return Ink(
      height: getHeight(26.0),
      width: getWidth(335.0),
      // margin: EdgeInsets.only(top: getHeight(19.0), bottom: getHeight(25.0)),
      padding: EdgeInsets.symmetric(horizontal: getWidth(10.0)),
      decoration: BoxDecoration(
        color: kFilledField,
        borderRadius: BorderRadius.circular(
          getWidth(10.0),
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/moneyBucket.png",
            height: getHeight(16.0),
            width: getWidth(16.0),
            fit: BoxFit.contain,
          ),
          SizedBox(
            width: getWidth(4.0),
          ),
          SetText(
            "With Trivia Credits Applied",
            size: getWidth(15.0),
            fw: FontWeight.w500,
          ),
          const Spacer(),
          SetText(
            "-\$6.25",
            size: getWidth(15.0),
            fw: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
