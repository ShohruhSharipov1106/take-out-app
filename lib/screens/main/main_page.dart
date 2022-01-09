import 'package:take_out_app/constants/imports.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget>? pages;
  int index = 0;
  @override
  void initState() {
    super.initState();
    pages = [
      const HomePage(),
      const OrdersPage(),
      const RestaurantOverview()
    ];
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: pages![index%3],
      bottomNavigationBar: CurvedNavigationBar(
        index: index,
        onTap: (i) {
          setState(() {
            index = i;
          });
        },
        height: getHeight(71.29),
        color: kRed,
        backgroundColor: Colors.white,
        items: [
          SvgPicture.asset(
            'assets/icons/home.svg',
            width: getWidth(25.5),
            height: getHeight(22.67),
            semanticsLabel: "Home",
          ),
          SvgPicture.asset(
            'assets/icons/cart_icon.svg',
            width: getWidth(25.5),
            height: getHeight(22.67),
          ),
          SvgPicture.asset(
            'assets/icons/leaderboard.svg',
            width: getWidth(34.5),
            height: getHeight(32.67),
          ),
          SvgPicture.asset(
            'assets/icons/profile.svg',
            width: getWidth(34.5),
            height: getHeight(32.67),
          ),
        ],
      ),
    );
  }
}
