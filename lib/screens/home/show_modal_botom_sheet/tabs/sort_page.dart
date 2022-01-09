import 'package:take_out_app/constants/imports.dart';

class SortTab extends StatefulWidget {
  const SortTab({Key? key}) : super(key: key);

  @override
  _SortTabState createState() => _SortTabState();
}

class _SortTabState extends State<SortTab> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        tabsMenu(
          index: 0,
          menuText: 'Recommended',
          iconName: 'star',
          containerColor: kRed,
          textColor: Colors.white,
          height: getHeight(29),
          width: getWidth(141),
        ),
        tabsMenu(
          index: 1,
          menuText: 'Exppress',
          iconName: 'Vector',
          containerColor: Colors.transparent,
          textColor: Colors.black,
          height: getHeight(29),
          width: getWidth(90),
        ),
        tabsMenu(
          index: 2,
          menuText: 'Trivia',
          iconName: 'question_mark',
          containerColor: Colors.transparent,
          textColor: Colors.black,
          height: getHeight(29),
          width: getWidth(73),
        ),
        Spacer(),
        SizedBox(
          height: getHeight(15),
        ),
        Spacer(),
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
