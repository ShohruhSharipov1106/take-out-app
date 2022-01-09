import 'package:take_out_app/constants/imports.dart';

class DietaryTab extends StatefulWidget {
  const DietaryTab({Key? key}) : super(key: key);
  @override
  _DietaryTabState createState() => _DietaryTabState();
}

class _DietaryTabState extends State<DietaryTab> {
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: getWidth(32), top: getHeight(3)),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/icons/gf.svg',
                height: getHeight(15),
                width: getWidth(15),
                color: Colors.black,
              ),
              SizedBox(
                width: getWidth(10),
              ),
              Text(
                "Gluten-free",
                style: TextStyle(
                  fontSize: getHeight(15),
                ),
              ),
              SizedBox(
                width: getWidth(175),
              ),
              Checkbox(
                activeColor: kRed,
                value: value1,
                onChanged: (v) {
                  setState(() {
                    value1 = v!;
                  });
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: getWidth(32), top: getHeight(45)),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/icons/heart.svg',
                height: getHeight(15),
                width: getWidth(15),
                color: Colors.black,
              ),
              SizedBox(
                width: getWidth(10),
              ),
              Text(
                "Vegam",
                style: TextStyle(
                  fontSize: getHeight(15),
                ),
              ),
              SizedBox(
                width: getWidth(200),
              ),
              Checkbox(
                activeColor: kRed,
                value: value2,
                onChanged: (v) {
                  setState(() {
                    value2 = v!;
                  });
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: getWidth(32), top: getHeight(40)),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/icons/vegeterian.svg',
                height: getHeight(15),
                width: getWidth(15),
                color: Colors.black,
              ),
              SizedBox(
                width: getWidth(10),
              ),
              Text(
                "Vegeterian",
                style: TextStyle(
                  fontSize: getHeight(15),
                ),
              ),
              SizedBox(
                width: getWidth(176),
              ),
              Checkbox(
                activeColor: kRed,
                value: value3,
                onChanged: (v) {
                  setState(() {
                    value3 = v!;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row handmadelisttitle(
      {required String assetsIconName,
      required String title,
      required bool valueforActive}) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/${assetsIconName}.svg',
          height: getHeight(15),
          width: getWidth(15),
          color: Colors.black,
        ),
        SizedBox(
          width: getWidth(10),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: getHeight(15),
          ),
        ),
        SizedBox(
          width: getWidth(168),
        ),
        Checkbox(
          value: valueforActive,
          onChanged: (v) {
            setState(() {
              value3 = v!;
            });
          },
        ),
      ],
    );
  }
}
