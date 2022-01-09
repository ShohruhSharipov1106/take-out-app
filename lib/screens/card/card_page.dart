

import 'package:take_out_app/constants/imports.dart';




class CardPage extends StatefulWidget {
  List<Map<String, dynamic>> items;
  double? total;

  CardPage({required this.items, required this.total});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  int index = 0;
  bool changingPoint = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          "Cart",
          style: TextStyle(
            color: kDeepGrey,
            fontSize: getHeight(20.0),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: getWidth(20.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _yourOrderpart(),
            _listviewPart(),
            _summaryPart(),
            changingPoint == true
                ? _apptake_outCredits()
                : const SizedBox(
                    child: null,
                  ),
            paymentPart(
                title: "Subtotal",
                payment: "\$${widget.total!.toStringAsFixed(2)}"),
            const Divider(
              thickness: 1,
            ),
            paymentPart(title: "Delivery Free", payment: "\$1.99"),
            const Divider(
              thickness: 1,
            ),
            paymentPart(
                title: "Taxes",
                payment: "\$${(widget.total! * 0.1).toStringAsFixed(2)}"),
            const Divider(
              thickness: 1,
            ),
            SizedBox(
              child: changingPoint == false
                  ? _newpartwillbeAdding()
                  : const SizedBox(
                      child: null,
                    ),
            ),
            _totalPrice(),
            _beginCheckout(),
          ],
        ),
      ),
    );
  }

  Container _newpartwillbeAdding() {
    return Container(
      alignment: Alignment.center,
      height: getHeight(26.0),
      width: getWidth(335.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          getWidth(10.0),
        ),
        color: kFilledField,
      ),
      child: Row(
        children: [
          Padding(
            padding:
                EdgeInsets.only(left: getWidth(10.0), right: getWidth(5.0)),
            child: SvgPicture.asset(
              "assets/icons/take_out.svg",
              height: getHeight(16.0),
              width: getWidth(16.0),
            ),
          ),
          Text(
            "Trivia Credits Applied",
            style: TextStyle(
              color: kBlack,
              fontSize: getWidth(15.0),
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            width: getWidth(90.0),
          ),
          Text(
            "-\$5.75",
            style: TextStyle(
              color: kBlack,
              fontSize: getWidth(15.0),
            ),
          ),
        ],
      ),
    );
  }

  ElevatedButton _beginCheckout() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: kRed,
          fixedSize: Size(
            getWidth(335.0),
            getHeight(48.0),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
      child: Text(
        "Begin CheckOut",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: getHeight(20.0),
        ),
      ),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ReviewExpress(
                      totals: (widget.total! + 1.99 + widget.total! * 0.1),
                    )));
      },
    );
  }

  Padding _totalPrice() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Total",
            style: TextStyle(
              color: kBlack,
              fontSize: getHeight(18.0),
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "\$${((widget.total!) + 1.99 + (widget.total! * 0.1))}",
            style: TextStyle(
              color: kBlack,
              fontSize: getHeight(
                18.0,
              ),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Padding paymentPart({required String title, required String payment}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: kDeepGrey,
              fontSize: getHeight(15.0),
            ),
          ),
          Text(
            payment,
            style: TextStyle(
              color: kDeepGrey,
              fontSize: getHeight(15.0),
            ),
          )
        ],
      ),
    );
  }

  InkWell _apptake_outCredits() {
    return InkWell(
      child: Container(
        height: getHeight(48.0),
        width: getWidth(335.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: kFilledField,
        ),
        child: index % 2 == 0
            ? Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 13.0, 8.0, 13.0),
                    child: Image.asset(
                      "assets/images/take_out.png",
                      height: getHeight(22.0),
                      width: getWidth(22.0),
                    ),
                  ),
                  const Text(
                    "Apply Take-Out credits",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: kBlack,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50.0, 13.0, 15.0, 13.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: kRed,
                          fixedSize: Size(
                            getWidth(70.0),
                            getHeight(18.0),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                      onPressed: () {
                        ShowBottomShit1().showBottom1(context);
                        setState(() {
                          changingPoint != changingPoint;
                        });
                      },
                      child: const Text(
                        "\$5.00",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              )
            : Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 13.0, 8.0, 13.0),
                    child: Image.asset(
                      "assets/images/take_out.png",
                      height: getHeight(22.0),
                      width: getWidth(22.0),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(8.0, 15.0, 8.0, 15.0),
                    child: Text(
                      "Earn credits by playing trivia after checkout!",
                      style: TextStyle(
                        fontSize: 13.0,
                        color: kBlack,
                      ),
                    ),
                  ),
                ],
              ),
      ),
      onTap: () {
        setState(() {
          index += 1;
        });
      },
    );
  }

  Padding _summaryPart() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 10.0),
      child: Text(
        "Summary",
        style: TextStyle(
          decoration: TextDecoration.underline,
          decorationColor: kRed,
          decorationThickness: 3,
          color: kBlack,
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  ListView _listviewPart() {
    return ListView.separated(
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        return ordersListTile(
            title: widget.items[index]["Name1"],
            leading: widget.items[index]["value"].toString(),
            subtitle: widget.items[index]["Name2"],
            trialing: widget.items[index]["price"].toStringAsFixed(2));
      },
      separatorBuilder: (_, index) {
        return Divider(
          thickness: getHeight(1.0),
        );
      },
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
    );
  }

  ListTile ordersListTile(
      {required String title,
      required String leading,
      required String subtitle,
      required String trialing}) {
    return ListTile(
      leading: Ink(
        height: getHeight(18.0),
        width: getWidth(18.0),
        decoration: BoxDecoration(
          color: kRed,
          borderRadius: BorderRadius.circular(3.0),
        ),
        child: Text(
          leading,
          style: const TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: kBlack,
          fontSize: 15.0,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          fontSize: 12.0,
          color: kDeepGrey,
        ),
      ),
      trailing: Text(
        trialing,
        style: const TextStyle(
          color: kBlack,
          fontSize: 15.0,
        ),
      ),
    );
  }

  Row _yourOrderpart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Your Order",
          style: TextStyle(
            color: kBlack,
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextButton(
          onPressed: () {
            Example().showBottom(context);
          },
          child: const Text(
            "Add items+",
            style: TextStyle(
              color: kRed,
              fontSize: 14.0,
            ),
          ),
        ),
      ],
    );
  }
}
