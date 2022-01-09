import 'package:take_out_app/constants/imports.dart';

class ExpressMenu {
  List<Map<String, dynamic>> myInfo = [
    {
      "Name1": "California Roll",
      "Name2": "crab & cucumber",
      "value": 1,
      "price": 4.99,
      "isTap": false
    },
    {
      "Name1": "Tuna Roll",
      "Name2": "tuna & cucumber",
      "value": 1,
      "price": 4.99,
      "isTap": false
    },
    {
      "Name1": "Salmon Roll",
      "Name2": "Salmon & cucumber",
      "value": 1,
      "price": 4.99,
      "isTap": false
    },
    {
      "Name1": "ssalmon Shashimi",
      "Name2": "thin salmon ocer rice",
      "value": 1,
      "price": 2.99,
      "isTap": false
    },
    {
      "Name1": "Vegateblse Lo Mein",
      "Name2": "crab & cucumber",
      "value": 1,
      "price": 5.99,
      "isTap": false
    },
  ];
  double total = 0.0;

  showsheet(context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return SizedBox(
            height: getHeight(774),
            width: getWidth(375),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  topOverLay(),
                  SizedBox(
                    height: getHeight(590),
                    width: getWidth(335),
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [expressitems()] +
                          List.generate(
                            myInfo.length,
                            (index) => Container(
                              margin: EdgeInsets.only(top: getHeight(26)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  photoOfSushi(index),
                                  SizedBox(
                                    width: getWidth(10),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        myInfo[index]['Name1'],
                                        style: TextStyle(
                                            fontSize: getHeight(15),
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(height: getHeight(5)),
                                      Text(
                                        myInfo[index]['Name2'],
                                        style: TextStyle(
                                            fontSize: getHeight(11),
                                            fontWeight: FontWeight.w400,
                                            color: kDeepGrey),
                                      ),
                                      SizedBox(height: getHeight(8)),
                                      Container(
                                        height: getHeight(26),
                                        width: getWidth(74),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF2F2F2),
                                          borderRadius: BorderRadius.circular(
                                            getWidth(10),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  if (myInfo[index]['value'] >
                                                      0) {
                                                    if (!myInfo[index]
                                                        ["isTap"]) {
                                                      myInfo[index]["value"] -=
                                                          1;
                                                    }
                                                  }
                                                });
                                              },
                                              child: const Text(
                                                "-",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                            GestureDetector(
                                              child: Text(
                                                "${myInfo[index]['value']}",
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  if (!myInfo[index]["isTap"]) {
                                                    myInfo[index]["value"] += 1;
                                                  }
                                                });
                                              },
                                              child: const Text(
                                                "+",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  myInfo[index]["value"] != 0
                                      ? GestureDetector(
                                          onTap: () {
                                            if (myInfo[index]["isTap"]) {
                                              myInfo[index]["value"] = 1;
                                            }
                                            myInfo[index]["isTap"] =
                                                !myInfo[index]["isTap"];
                                            total = 0.0;
                                            for (var item in myInfo) {
                                              if (item["isTap"]) {
                                                total += item["value"] *
                                                    item["price"];
                                              }
                                            }
                                            setState(() {});
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: getHeight(38),
                                            width: getWidth(88),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  getWidth(10),
                                                ),
                                                color: myInfo[index]["isTap"]
                                                    ? const Color(0xFFF2C9C9)
                                                    : kRed),
                                            child: !myInfo[index]["isTap"]
                                                ? Text(
                                                    "Add " +
                                                       ( myInfo[index]["price"] *
                                                            myInfo[index]
                                                                    ["value"])
                                                                .toStringAsFixed(
                                                                    2),
                                                    style: TextStyle(
                                                        fontSize: getWidth(15),
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.white),
                                                  )
                                                : Row(
                                                    children: [
                                                      const Icon(
                                                          Icons.cancel_outlined,
                                                          color: Color(
                                                              0xFF741C28)),
                                                      Text(
                                                          "Added ${myInfo[index]['value']}",
                                                          style: const TextStyle(
                                                              color: Color(
                                                                  0xFF741C28))),
                                                    ],
                                                  ),
                                          ),
                                        )
                                      : Container()
                                ],
                              ),
                            ),
                          ),
                    ),
                  ),
                  SizedBox(
                    height: getHeight(40),
                  ),
                  total != 0.0
                      ? SizedBox(
                          height: getHeight(58),
                          width: getWidth(335),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: kRed,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(getWidth(10)))),
                            onPressed: () {
                              //

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CardPage(
                                          items: myInfo
                                              .where((element) =>
                                                  element["isTap"] == true)
                                              .toList(),
                                          total: total)));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("View Cart - "),
                                Text("\$ ${total.toStringAsFixed(2)}"),
                              ],
                            ),
                          ),
                        )
                      : Center()
                ],
              ),
            ),
          );
        });
      },
    );
  }

  Container photoOfSushi(int index) {
    return Container(
      height: getHeight(80),
      width: getWidth(80),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(getWidth(10)),
          image: DecorationImage(
              image: NetworkImage(
                "https://source.unsplash.com/random/$index",
              ),
              fit: BoxFit.cover)),
    );
  }

  Container expressitems() {
    return Container(
      height: getHeight(60),
      width: getWidth(335),
      child: Row(
        children: [
          SizedBox(
            height: getHeight(60),
            width: getWidth(212),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Express Items",
                  style: TextStyle(
                      fontSize: getHeight(22), fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: getHeight(4),
                ),
                Wrap(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Order up to 8 of these items from ",
                            style: TextStyle(
                                fontSize: getWidth(11),
                                fontWeight: FontWeight.w600,
                                color: kDeepGrey),
                          ),
                          TextSpan(
                            text: 'Katsuei',
                            style: TextStyle(
                              fontSize: getWidth(11),
                              color: kRed,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                          TextSpan(
                            text: ' and receive your order by',
                            style: TextStyle(
                                fontSize: getWidth(11),
                                fontWeight: FontWeight.w600,
                                color: kDeepGrey),
                          ),
                          TextSpan(
                            text: ' 10:00pm',
                            style: TextStyle(
                                fontSize: getWidth(11),
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            width: getWidth(44),
          ),
          Container(
            height: getHeight(60),
            width: getWidth(79),
            decoration: BoxDecoration(
              border: Border.all(color: kRed),
              borderRadius: BorderRadius.circular(getWidth(10)),
            ),
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(
                  height: getHeight(10),
                ),
                Text(
                  "4:24",
                  style: TextStyle(
                      fontSize: getWidth(22),
                      fontWeight: FontWeight.w600,
                      color: kRed),
                ),
                Text(
                  "left to order",
                  style: TextStyle(
                    fontSize: getWidth(11),
                    color: kRed,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding topOverLay() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getHeight(136), vertical: getHeight(10)),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(getHeight(100))),
        child: SizedBox(
          height: getHeight(3),
          width: getWidth(63),
        ),
        color: const Color(0xFFC4C4C4),
      ),
    );
  }
}
