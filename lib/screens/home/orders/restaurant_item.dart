import 'package:take_out_app/constants/imports.dart';

class RestaurantItem extends StatefulWidget {
  final Map<String, dynamic> food;

  const RestaurantItem({required this.food});
  @override

  _RestaurantItemState createState() => _RestaurantItemState(food: food);
}

class _RestaurantItemState extends State<RestaurantItem> {
  final Map<String, dynamic> food;
  _RestaurantItemState({required this.food});
  int _count = 1;
  bool _checkBoxValue = false;
  bool isPressed = false;
  String? _radioGroupValue = "test";
  String radioItem1 = "hand";
  String radioItem2 = "regular";
  final int _brownRicePrice = 1;
  String _addToCartValue = "Add to cart";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(
          left: getWidth(20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _arrowBack(context),
            _foodItem(),
            _foodChoice(),
            _substitutionOption(),
            _specialInstructions(),
            _buttonQuantitySelector(),
          ],
        ),
      ),
    );
  }

  Column _buttonQuantitySelector() {
    return Column(
      children: [
        SizedBox(
          height: isPressed ? getHeight(148.5) : getHeight(195.0),
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: kLightGrey,
                borderRadius: BorderRadius.circular(10.0),
              ),
              height: getHeight(58.0),
              width: getWidth(100.0),
              padding: EdgeInsets.symmetric(
                horizontal: getWidth(10.0),
                vertical: getHeight(15.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(
                        () {
                          _count <= 0 ? _count = 0 : _count -= 1;
                        },
                      );
                    },
                    child: const Text(
                      "-",
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w400,
                        color: kDeepGrey,
                      ),
                    ),
                  ),
                  Text(
                    "$_count",
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: kBlack,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _count += 1;
                      });
                    },
                    child: const Text(
                      "+",
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w400,
                        color: kDeepGrey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: getWidth(10.0)),
            InkWell(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: kRed,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                height: getHeight(58.0),
                width: getWidth(225.0),
                padding: EdgeInsets.symmetric(
                  horizontal: getWidth(10.0),
                  vertical: getHeight(15.0),
                ),
                child: Text(
                  _checkBoxValue ||
                          (_radioGroupValue! == "regular" ||
                              _radioGroupValue! == "hand")
                      ? "Add $_addToCartValue"
                      : "Add to cart",
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              onTap: () {
                Example().showBottom(context);
              },
            ),
          ],
        ),
      ],
    );
  }

  Row _specialInstructions() {
    return Row(
      children: [
        const Text(
          "Add special instructions",
          style: TextStyle(
            fontSize: 20.0,
            color: kBlack,
          ),
        ),
        InkWell(
          onTap: () {},
          child: const Icon(
            Icons.add,
            color: kRed,
            size: 25.0,
          ),
        ),
      ],
    );
  }

  Column _substitutionOption() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            isPressed = !isPressed;
            setState(() {});
          },
          child: Row(
            children: [
              const Text(
                "Choice of substitution",
                style: TextStyle(
                  fontSize: 20.0,
                  color: kBlack,
                ),
              ),
              Icon(
                isPressed ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                color: kRed,
                size: 25.0,
              ),
            ],
          ),
        ),
        const Text(
          "(optional)",
          style: TextStyle(
            fontSize: 15.0,
            color: kDeepGrey,
          ),
        ),
        isPressed
            ? Column(
                children: [
                  CheckboxListTile(
                    dense: true,
                    contentPadding: EdgeInsets.only(
                      left: getWidth(0),
                      right: getWidth(20),
                    ),
                    secondary: Text(
                      "+\$$_brownRicePrice.00",
                      style: const TextStyle(
                        fontSize: 15.0,
                        color: kDeepGrey,
                      ),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text(
                      "Brown Rice",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: kBlack,
                      ),
                    ),
                    checkColor: Colors.white,
                    activeColor: kRed,
                    value: _checkBoxValue,
                    onChanged: (v) {
                      setState(() {
                        _checkBoxValue = !_checkBoxValue;
                        _addToCartValue = _checkBoxValue.toString() == "true" &&
                                (_radioGroupValue! == "regular" ||
                                    _radioGroupValue! == "hand")
                            ? "${_brownRicePrice + food['price']}"
                            : (_checkBoxValue.toString() == "false" &&
                                    (_radioGroupValue! == "regular" ||
                                        _radioGroupValue! == "hand")
                                ? "${food['price']}"
                                : "$_brownRicePrice.00");
                      });
                    },
                  ),
                  SizedBox(height: getHeight(45.0)),
                ],
              )
            : SizedBox(
                height: getHeight(45.0),
              ),
      ],
    );
  }

  Column _foodChoice() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: getHeight(60.0)),
        const Text(
          "Choose a roll type",
          style: TextStyle(
            fontSize: 20.0,
            color: kBlack,
          ),
        ),
        SizedBox(
          width: getWidth(157.0),
          child: const Divider(
            color: kRed,
            thickness: 3.0,
          ),
        ),
        Column(
          children: [
            SizedBox(height: getHeight(15.0)),
            RadioListTile(
              activeColor: kRed,
              secondary: Text(
                "+\$${food['price']}",
                style: const TextStyle(
                  fontSize: 15.0,
                  color: kDeepGrey,
                ),
              ),
              dense: true,
              value: radioItem1,
              contentPadding: EdgeInsets.only(
                  right: getWidth(20.0),
                  left: getWidth(0.0),
                  bottom: getHeight(10.0)),
              groupValue: _radioGroupValue,
              onChanged: (v) {
                _radioGroupValue = radioItem1;
                _addToCartValue = _addToCartValue =
                    _checkBoxValue.toString() == "true" &&
                            (_radioGroupValue! == "regular" ||
                                _radioGroupValue! == "hand")
                        ? "${_brownRicePrice + food['price']}"
                        : (_checkBoxValue.toString() == "false" &&
                                (_radioGroupValue! == "regular" ||
                                    _radioGroupValue! == "hand")
                            ? "${food['price']}"
                            : "$_brownRicePrice.00");
                setState(() {});
              },
              title: Text(
                "Hand ${widget.food["title"]}",
                style: const TextStyle(
                  fontSize: 15.0,
                  color: kBlack,
                ),
              ),
            ),
            SizedBox(
              width: getWidth(335.0),
              child: const Divider(
                color: kDeepGrey,
              ),
            ),
            RadioListTile(
              dense: true,
              toggleable: true,
              value: radioItem2,
              activeColor: kRed,
              secondary: Text(
                "+\$${food['price']}",
                style: const TextStyle(
                  fontSize: 15.0,
                  color: kDeepGrey,
                ),
              ),
              contentPadding: EdgeInsets.only(
                right: getWidth(20.0),
                left: getWidth(0.0),
                top: getHeight(10.0),
              ),
              title: Text(
                "Regular ${widget.food["title"]}",
                style: const TextStyle(
                  fontSize: 15.0,
                  color: kBlack,
                ),
              ),
              groupValue: _radioGroupValue,
              onChanged: (v) {
                setState(() {
                  _radioGroupValue = radioItem2;
                  _addToCartValue = _addToCartValue =
                      _checkBoxValue.toString() == "true" &&
                              (_radioGroupValue! == "regular" ||
                                  _radioGroupValue! == "hand")
                          ? "${_brownRicePrice + food['price']}"
                          : (_checkBoxValue.toString() == "false" &&
                                  (_radioGroupValue! == "regular" ||
                                      _radioGroupValue! == "hand")
                              ? "${food['price']}"
                              : "$_brownRicePrice.00");
                });
              },
            ),
            SizedBox(height: getHeight(30.0)),
          ],
        ),
      ],
    );
  }

  Column _foodItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${widget.food['title']}",
          style: const TextStyle(
            fontSize: 40.0,
            fontFamily: "BluuSuuperstar",
            color: kBlack,
          ),
        ),
        const Text(
          "smoked salmon over rice",
          style: TextStyle(
            fontSize: 15.0,
            color: kDeepGrey,
          ),
        ),
      ],
    );
  }

  Column _arrowBack(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: getHeight(53.81)),
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset(
            "assets/icons/back.svg",
            height: getHeight(12.39),
            width: getWidth(18.0),
            fit: BoxFit.cover,
            color: kDeepGrey,
          ),
        ),
        SizedBox(height: getHeight(22.81)),
      ],
    );
  }
}
