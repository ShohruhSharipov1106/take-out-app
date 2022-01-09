import 'package:take_out_app/constants/imports.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({Key? key, required this.onPressed}) : super(key: key);
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      iconSize: getWidth(45),
      onPressed: onPressed,
      icon: Container(
        padding: EdgeInsets.zero,
        alignment: Alignment.center,
        margin: EdgeInsets.zero,
        child: assetIcon(
          path: 'assets/icons/Filter Icon.svg',
          color: kDeepGrey,
          height: 15.44,
          width: 15.0,
        ),
        height: getHeight(45.0),
        width: getWidth(37.0),
        decoration: BoxDecoration(
          color: kFilledField,
          borderRadius: BorderRadius.circular(getWidth(10.0)),
        ),
      ),
    );
  }
}
