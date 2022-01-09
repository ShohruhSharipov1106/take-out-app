

import 'package:take_out_app/constants/imports.dart';

class ReviewExpress extends StatefulWidget {
  double totals;
  ReviewExpress({required this.totals});

  @override
  _ReviewExpressState createState() => _ReviewExpressState();
}

class _ReviewExpressState extends State<ReviewExpress> {
  final TextEditingController _adressController =
      TextEditingController(text: "434 Broadway Floor 3 \nNew York, Ny10013");
  final TextEditingController _deliverytimeController =
      TextEditingController(text: 'ASAP (10-20 min)');
  final TextEditingController _paymentController =
      TextEditingController(text: 'Apple Pay');
  double? fullPrice;

  int currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fullPrice = widget.totals;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appbarHandMade(),
          const Divider(
            height: 15,
            thickness: 0.5,
          ),
          textkatsuei(),
          subtitleofKatsuei(),
          adress(),
          TextFieldMethod(cont: _adressController),
          TextofTitles(text: "Delivery Time"),
          TextFieldMethod(cont: _deliverytimeController),
          TextofTitles(text: "Payment Method"),
          TextFieldMethod(cont: _paymentController),
          TextofTitles(text: "Courier Tip"),
          SizedBox(
            height: getHeight(8),
          ),
          chooseprocent(),
          SizedBox(
            height: getHeight(5),
          ),
          Padding(
            padding: EdgeInsets.only(left: getWidth(23)),
            child: Text(
              "100% of your tip goes to the courier.",
              style: TextStyle(
                fontSize: getHeight(12),
              ),
            ),
          ),
          SizedBox(
            height: getHeight(20),
          ),
          Padding(
            padding: EdgeInsets.only(left: getWidth(20), right: getWidth(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total with tip applied",
                  style: TextStyle(
                    fontSize: getWidth(18),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "\$${fullPrice!.toStringAsFixed(2)}",
                  style: TextStyle(
                      fontSize: getWidth(17), fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          SizedBox(
            height: getHeight(14),
          ),
          Padding(
            padding: EdgeInsets.only(left: getWidth(20), bottom: getHeight(38)),
            child: SizedBox(
              width: getWidth(335),
              height: getHeight(58),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: kRed,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(getWidth(10)))),
                onPressed: () {
                  ShowModallBottomShit3().showModalSecondOne2(context);
                },
                child: Text(
                  "Order Takeout",
                  style: TextStyle(
                      fontWeight: FontWeight.w700, fontSize: getWidth(18)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container chooseprocent() {
    return Container(
      // alignment: Alignment.center,
      margin: EdgeInsets.only(
        left: getWidth(20),
      ),
      height: getHeight(47),
      width: getWidth(335),
      // padding: EdgeInsets.only(top: getHeight(10)),
      decoration: BoxDecoration(
          color: const Color(0xFFF2F2F2),
          borderRadius: BorderRadius.circular(getWidth(10))),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          procents(index: 0, percentage: '15%'),
          procents(index: 1, percentage: "18%"),
          procents(index: 2, percentage: "20%"),
          procents(index: 3, percentage: "Others"),
        ],
      ),
    );
  }

  Widget procents({required String percentage, required int index}) {
    return GestureDetector(
      onTap: () {
        currentIndex = index;
        index == 0
            ? fullPrice = widget.totals * 1.15
            : (index == 1
                ? fullPrice = widget.totals * 1.18
                : fullPrice = widget.totals * 1.20);

        setState(() {});
      },
      child: Container(
        alignment: Alignment.center,
        width: getWidth(75),
        height: getHeight(47),
        decoration: BoxDecoration(
            color: currentIndex == index ? kRed : Colors.transparent,
            borderRadius: BorderRadius.circular(getHeight(10))),
        child: Text(
          percentage,
          style: TextStyle(
            fontSize: getWidth(15),
            fontWeight: FontWeight.w700,
            color: currentIndex == index ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Padding subtitleofKatsuei() {
    return Padding(
      padding: EdgeInsets.only(left: getWidth(20)),
      child: Text("Japanese + Sushi",
          style: TextStyle(
            fontSize: getHeight(12),
            color: kDeepGrey,
          )),
    );
  }

  Padding TextofTitles({required String text}) {
    return Padding(
      padding: EdgeInsets.only(
          left: getWidth(20), right: getWidth(10), top: getHeight(30)),
      child: Text(
        text,
        style: TextStyle(fontSize: getHeight(20), fontWeight: FontWeight.w600),
      ),
    );
  }

  Padding TextFieldMethod({required TextEditingController cont}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getWidth(20), vertical: getHeight(10)),
      child: TextFormField(
        onChanged: (v) {},
        validator: (v) {
          if (v!.isEmpty) {
            return 'please enter something';
          }
        },
        style: TextStyle(fontSize: getHeight(14)),
        controller: cont,
        decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(getHeight(10)),
              borderSide: const BorderSide(
                color: Colors.transparent,
              )),
          filled: true,
          fillColor: const Color(0xFFF2F2F2),
          enabled: true,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(getHeight(10))),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              getHeight(10),
            ),
          ),
        ),
      ),
    );
  }

  Padding adress() {
    return Padding(
      padding: EdgeInsets.only(
          left: getWidth(20), right: getWidth(10), top: getHeight(18)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Addresss",
            style:
                TextStyle(fontSize: getHeight(20), fontWeight: FontWeight.w600),
          ),
          Text(
            "Add delivery not + ",
            style: TextStyle(fontSize: getHeight(12), color: kRed),
          )
        ],
      ),
    );
  }

  Padding textkatsuei() {
    return Padding(
      padding: EdgeInsets.only(left: getWidth(20), top: getWidth(5)),
      child: Row(
        children: [
          Text(
            "Katsuei",
            style: TextStyle(
              fontSize: getHeight(40),
            ),
          ),
          SizedBox(
            width: getHeight(6.5),
          ),
          Container(
            height: getHeight(26.5),
            width: getWidth(26.6),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/wok1.png'),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                    bottom: 1,
                    child: SvgPicture.asset(
                      'assets/icons/trueRed.svg',
                      height: getHeight(11),
                      width: getWidth(11),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding appbarHandMade() {
    return Padding(
      padding: EdgeInsets.only(
        left: getWidth(20),
        top: getHeight(51),
      ),
      child: Row(
        children: [
          SvgPicture.asset('assets/icons/back.svg'),
          SizedBox(
            width: getHeight(105),
          ),
          Text(
            "Review Order",
            style: TextStyle(color: kDeepGrey, fontSize: getHeight(20)),
          )
        ],
      ),
    );
  }
}
