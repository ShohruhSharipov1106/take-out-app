

import 'package:take_out_app/constants/imports.dart';

class SetText extends StatelessWidget {
  Color? color;
  double? size;
  FontWeight? fw;
  TextAlign? align;
  final String text;
  SetText(
    this.text, {
    this.size,
    this.color,
    this.align,
    this.fw,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align ?? TextAlign.left,
      style: TextStyle(
        color: color ?? kBlack,
        fontSize: size != null ? getWidth(size!) : getWidth(14.0),
        fontWeight: fw ?? FontWeight.normal,
      ),
    );
  }
}
