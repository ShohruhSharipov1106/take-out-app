import 'package:take_out_app/constants/imports.dart';

class DeliveryTab extends StatefulWidget {
  const DeliveryTab({Key? key}) : super(key: key);

  @override
  _DeliveryTabState createState() => _DeliveryTabState();
}

class _DeliveryTabState extends State<DeliveryTab> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        tabsMenu(
          index: 0,
          height: getHeight(29),
          width: getWidth(106),
          menuText: 'Cheapest',
          iconName: 'dollor',
          containerColor: kRed,
          textColor: Colors.white,
        ),
        tabsMenu(
          index: 1,
          height: getHeight(29),
          width: getWidth(90),
          menuText: 'Fastes',
          iconName: 'run',
          containerColor: kRed,
          textColor: Colors.white,
        ),
      ],
    );
  }

  Widget tabsMenu({
    String? menuText,
    required int index,
    String? iconName,
    Color? containerColor,
    Color? textColor,
    required double height,
    required double width,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Container(
        height: height,
        width: width,
        margin: EdgeInsets.only(left: getWidth(20), top: getHeight(38)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              getWidth(10),
            ),
            color: currentIndex == index ? kRed : Colors.transparent),
        child: Row(
          children: [
            SizedBox(
              width: getWidth(10),
            ),
            SvgPicture.asset(
              'assets/icons/${iconName!}.svg',
              height: getHeight(14.3),
              width: getWidth(9.3),
              fit: BoxFit.none,
              color: currentIndex == index ? Colors.white : Colors.black,
            ),
            SizedBox(
              width: getWidth(8),
            ),
            Text(
              menuText!,
              style: TextStyle(
                  fontSize: getHeight(15),
                  color: currentIndex == index ? Colors.white : Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
