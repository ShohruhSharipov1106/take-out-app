import 'package:take_out_app/constants/imports.dart';

class Example {
  double _value = 0;

  showBottom(context) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      enableDrag: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(getWidth(10.0)),
          topRight: Radius.circular(getWidth(10.0)),
        ),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, StateSetter state) {
          return SizedBox(
            height: getHeight(750.0),
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: getWidth(20.0)),
              child: Column(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Your order is being prepared",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: getWidth(18.0),
                                  color: kBlack,
                                ),
                              ),
                              Text(
                                "Arriving in 10-20 min",
                                style: TextStyle(
                                  color: kDeepGrey,
                                  fontSize: getWidth(13.0),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: getWidth(20.0),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  getWidth(20.0),
                                ),
                              ),
                              primary: kFilledField,
                              fixedSize: Size(
                                getWidth(40.0),
                                getHeight(15.0),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              "HELP",
                              style: TextStyle(
                                color: kBlack,
                                fontSize: getWidth(10.0),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        child: sliderinShowModal(state),
                      ),
                      Container(
                        height: getHeight(390.0),
                        width: getWidth(335.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            getWidth(10.0),
                          ),
                          border: Border.all(
                            color: kFilledField,
                            width: getWidth(4.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: getHeight(10.0),
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: kFilledField,
                                  fixedSize: Size(
                                    getWidth(130.0),
                                    getHeight(20.0),
                                  ),
                                ),
                                child: Text(
                                  "4:56 left to play",
                                  style: TextStyle(
                                    color: kRed,
                                    fontSize: getHeight(12.0),
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            Text(
                              "Take-Out Trivia",
                              style: TextStyle(
                                color: kBlack,
                                fontWeight: FontWeight.bold,
                                fontSize: getHeight(35.0),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: getHeight(10.0)),
                              child: RichText(
                                text: TextSpan(
                                  text: 'Play trivia now to earn up to ',
                                  style: DefaultTextStyle.of(context).style,
                                  children: const <TextSpan>[
                                    TextSpan(
                                      text: '\$5.00 off ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                        text: 'this \norder, and climb up the'),
                                    TextSpan(
                                      text: 'Katsuei Leaderboard',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: getHeight(10.0),
                            ),
                            SizedBox(
                              height: getHeight(120.0),
                              width: getWidth(250.0),
                              child: Image.asset("assets/images/triviabig.png"),
                            ),
                            SizedBox(
                              height: getHeight(20.0),
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: kRed,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        getHeight(10.0),
                                      ),
                                    ),
                                    fixedSize:
                                        Size(getWidth(250.0), getHeight(50.0))),
                                child: Text(
                                  "Launch Trivia",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: getHeight(20.0),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const Travias()));
                                }),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getHeight(20.0),
                      ),
                      Container(
                        height: getHeight(300.0),
                        width: getWidth(335.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            getWidth(10.0),
                          ),
                          image: const DecorationImage(
                            image: AssetImage(
                              "assets/images/delivery.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: kRed,
                          radius: 30.0,
                        ),
                        title: Text(
                          "Halli",
                          style: TextStyle(
                            color: kBlack,
                            fontSize: getHeight(20.0),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          "Your Driver",
                          style: TextStyle(
                            color: kDeepGrey,
                            fontSize: getHeight(15.0),
                          ),
                        ),
                        trailing: ElevatedButton(
                          child: Text(
                            "Contact Driver",
                            style: TextStyle(
                              color: kDeepGrey,
                              fontSize: getHeight(12.0),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: kFilledField,
                            fixedSize: Size(
                              getWidth(130.0),
                              getHeight(20.0),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                getHeight(10.0),
                              ),
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Divider(
                        thickness: getHeight(2.0),
                      ),
                      ListTile(
                        title: Text(
                          "10:00 PM",
                          style: TextStyle(
                            fontSize: getHeight(20.0),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          "Estimated Delivery Time",
                          style: TextStyle(
                            fontSize: getHeight(15.0),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: getHeight(2.0),
                      ),
                      ListTile(
                        title: Text(
                          "Address",
                          style: TextStyle(
                            fontSize: getHeight(20.0),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "433 Boradway Floor 3",
                              style: TextStyle(
                                fontSize: getHeight(15.0),
                              ),
                            ),
                            Text(
                              "New York, NY 10013",
                              style: TextStyle(
                                fontSize: getHeight(15.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: getHeight(2.0),
                      ),
                      ListTile(
                        title: Text(
                          "Order Details",
                          style: TextStyle(
                            color: kBlack,
                            fontSize: getHeight(20.0),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Katsui",
                              style: TextStyle(
                                fontSize: getHeight(15.0),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "1x- Californiya Roll",
                              style: TextStyle(
                                fontSize: getHeight(15.0),
                              ),
                            ),
                          ],
                        ),
                        trailing: TextButton(
                          onPressed: () {},
                          child: Text(
                            "View Receipt",
                            style: TextStyle(
                              color: kRed,
                              fontWeight: FontWeight.w500,
                              fontSize: getHeight(15.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }

  Slider sliderinShowModal(StateSetter state) {
    return Slider(
      onChanged: (v) {
        state(() {
          _value = v;
        });
      },
      value: _value,
      min: 0,
      max: 20,
      activeColor: kRed,
      thumbColor: Colors.white,
      inactiveColor: kFilledField,
    );
  }
}
