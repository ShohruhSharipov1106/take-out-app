
import 'package:take_out_app/constants/imports.dart';

class UnderLabeledImage extends StatelessWidget {
  final Widget image;
  final String label;
  const UnderLabeledImage(this.image, this.label, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(60.0),
      width: getWidth(55.0),
      child: Column(
        children: [
          SizedBox(
            height: getHeight(35.0),
            width: getWidth(35.0),
            child: image,
          ),
          SizedBox(
            height: getHeight(4.0),
          ),
          SetText(
            label,
            color: Colors.white,
            size: 12.0,
            fw: FontWeight.w500,
          )
        ],
      ),
    );
  }
}
