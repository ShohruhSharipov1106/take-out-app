
import 'package:take_out_app/constants/imports.dart';

class AnsverOptionBox extends StatelessWidget {
  final String text;
  Color? color;
   AnsverOptionBox(this.text, {this.color,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: const Alignment(0.0, 0.0),
      height: getHeight(60.0),
      width: getWidth(280.0),
      margin: EdgeInsets.symmetric(
        vertical: getHeight(7.0),
      ),
      decoration: BoxDecoration(
        color: color ?? kFilledField,
        borderRadius: BorderRadius.circular(
          getWidth(10.0),
        ),
      ),
      child: SetText(
text,
        size:   (text.length < 34)
                ? 22.0
                : ((text.length < 54)
                    ? 18.0
                    : ((text.length < 75) ? 14.0 : 12.0)),
           
        fw: FontWeight.w600,
      ),
    );
  }
}
