import 'package:take_out_app/constants/imports.dart';

class TabsContents extends StatefulWidget {
  String? menuText;
  String? iconName;
  Color? containerColor;
  Color? textColor;
  double? height;
  double? width;
    int index;

  TabsContents({
    this.menuText,
    this.iconName,
    this.containerColor,
    this.textColor,
    this.height,
    this.width,
    required this.index
  });

  @override
  State<TabsContents> createState() => _TabsContentsState();
}

class _TabsContentsState extends State<TabsContents> {
  
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: (){
        setState(() {
          currentIndex = widget.index;
        });
      },
      child: Container(
        height: widget.height,
        width: widget.width,
        margin: EdgeInsets.only(left: getWidth(20), top: getHeight(38)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              getWidth(10),
            ),
            color:currentIndex == widget.index ? kRed : Colors.transparent ),
        child: Row(
          children: [
            SizedBox(
              width: getWidth(10),
            ),
            SvgPicture.asset(
              'assets/icons/${widget.iconName!}.svg',
              height: getHeight(14.3),
              width: getWidth(15.0),
              color:currentIndex == widget.index ? Colors.white : Colors.black,
            ),
            SizedBox(
              width: getWidth(10),
            ),
            Text(
              widget.menuText!,
              style: TextStyle(
                fontSize: getHeight(15),
                color:currentIndex == widget.index ? Colors.white : Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
