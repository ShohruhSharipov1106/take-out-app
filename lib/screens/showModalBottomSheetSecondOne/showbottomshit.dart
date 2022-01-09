

// order Express Take Out Buttoni Bosa chiqadi ushatta ishlating 
// Rewiev expressnOrder
import 'package:take_out_app/constants/imports.dart';

class ShowBottomShit1 {
  bool changingPoint = true;
  showBottom1(context) {
    showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(getWidth(30.0)),
        topRight: Radius.circular(getWidth(30.0)),
      )),
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, StateSetter setState) {
          return SizedBox(
            height: getHeight(550.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
                  child: Container(
                    height: getHeight(220.0),
                    width: getWidth(335.0),
                    decoration: BoxDecoration(
                      color: kRed,
                      borderRadius: BorderRadius.circular(
                        getWidth(10.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(18.0, 18.0, 121.0, 0.0),
                          child: Text(
                            "Trivia Credits",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: getHeight(30.0),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(18.0, 94.0, 18.0, 18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "assets/images/take_out.png",
                                height: getHeight(40.0),
                                width: getWidth(40.0),
                              ),
                              Column(
                                children: [
                                  Text("\$5.75",
                                      style: TextStyle(
                                        fontSize: getWidth(30.0),
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      )),
                                  Text(
                                    "CREDIT",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: getWidth(15.0),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/take_out.png",
                      height: getHeight(34.1),
                      width: getWidth(34.1),
                    ),
                    Text(
                      "You can earn more credits \nby ordering from a Trivia certified resturant",
                      style: TextStyle(
                        fontSize: getWidth(15.0),
                        color: kBlack,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 55.0, 0.0, 20.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: kRed,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            getWidth(10.0),
                          ),
                        ),
                        fixedSize: Size(
                          getWidth(335.0),
                          getHeight(58.0),
                        ),
                      ),
                      child: Text(
                        "Apply Credits",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: getWidth(20.0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        changingPoint = false;
                        setState(() {});
                        Navigator.pop(context);
                      }),
                ),
              ],
            ),
          );
        });
      },
    );
  }
}
