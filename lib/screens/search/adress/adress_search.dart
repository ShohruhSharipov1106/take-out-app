import 'package:take_out_app/constants/imports.dart';

class AdressPage extends StatefulWidget {
  @override
  _AdressPageState createState() => _AdressPageState();
}

class _AdressPageState extends State<AdressPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: Appbar(title: 'Adress').bar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: getWidth(20.0)),
        child: Column(
          children: [
            SizedBox(height: getHeight(20)),
            SearchFeild(
              controller: TextEditingController(),
              onChanged: (v) {},
              onTap: () {},
            ),
            SizedBox(height: getHeight(5)),
            location(
                path: 'assets/icons/navigator.svg',
                title: 'Use Current Location',
                subtitle: '200 Eastern Pkwy, Brooklyn, NY 11238'),
            location(
                path: 'assets/icons/location_fill.svg',
                title: 'Home',
                subtitle: '29 Norman Ave, Brooklyn, NY 11222'),
            location(
              path: 'assets/icons/location_fill.svg',
              title: 'Work',
              subtitle: '434 Broadway Floor 3, New York, NY 10013',
            )
          ],
        ),
      ),
    );
  }

  Padding location({String? path, String? title, String? subtitle}) {
    return Padding(
      padding: EdgeInsets.only(
        top: getHeight(20),
      ),
      child: SizedBox(
        height: getHeight(56),
        width: getWidth(335),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(path!),
                SizedBox(
                  width: getWidth(17),
                ),
                Text(
                  title!,
                  style: TextStyle(
                    fontSize: getWidth(15),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: getWidth(30)),
              child: Text(
                subtitle!,
                style: TextStyle(color: kDeepGrey, fontSize: getWidth(12)),
              ),
            ),
            SizedBox(
              height: getHeight(18),
            ),
            const Divider(
              height: 0,
              thickness: 0.5,
            ),
          ],
        ),
      ),
    );
  }
}
