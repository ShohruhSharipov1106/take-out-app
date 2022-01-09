import 'package:take_out_app/constants/imports.dart';

class Appbar {
  Appbar({required this.title});
  final String? title;

  bar() {
    return AppBar(
      
      bottom: PreferredSize(
        preferredSize: Size(getWidth(375.0), 0),
        child: const Divider(height: 0),
      ),
      title: Text(
        title!,
        style: TextStyle(

          color: kDeepGrey,
          fontSize: getWidth(18),
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        onPressed: () {},
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          height: getHeight(12.39),
          width: getWidth(18),
        ),
      ),
    );
  }
}
