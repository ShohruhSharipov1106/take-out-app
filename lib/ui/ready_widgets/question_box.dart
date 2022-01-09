
import 'package:take_out_app/constants/imports.dart';

class QuestionBox extends StatelessWidget {
  final String text;
  const QuestionBox(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(73.0),
      width: getWidth(280.0),
      child: Text(
         text,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: (text.length < 34)
                ? getWidth(22.0)
                : ((text.length < 65)
                    ? getWidth(18.0)
                    : ((text.length < 85) ? getWidth(14.0) :(text.length < 116? getWidth(12.0): getWidth(10.0)))),
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
