import 'package:take_out_app/constants/imports.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? _tabController;
  Icon dumalo = const Icon(
    Icons.circle,
    color: Colors.red,
    size: 10,
  );
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    categories = ['Nearby', 'Trivia', 'Express', 'Asia'];
    _tabController!.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  List<String> categories = [];
  List<Widget> widgets = [NearbyPage(), const ExpressPage()];
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: getWidth(20.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: getHeight(51.0)),
          appBar(),
          SizedBox(height: getHeight(15.0)),
          searchSection(),
          SizedBox(height: getHeight(25.0)),
          discover(),
          SizedBox(height: getHeight(12.0)),
          discoverMenu(),
          widgets[_selected != 2 ? 0 : 1],
        ],
      ),
    ));
  }

  ConstrainedBox discoverMenu() {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(height: getHeight(36.0)),
      child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: getHeight(3.0)),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              width: getWidth(86.0),
              height: getHeight(30.0),
              margin: EdgeInsets.only(right: getWidth(15.0)),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(getWidth(10.0)),
                color: index == _selected ? kRed : kFilledField,
                boxShadow: index == _selected
                    ? [
                        BoxShadow(
                            color: kRed.withOpacity(0.3),
                            offset: const Offset(1, 3),
                            spreadRadius: 0.5),
                        BoxShadow(
                          color: kRed.withOpacity(0.3),
                          offset: const Offset(-1, 0.0),
                          spreadRadius: 0.5,
                        ),
                      ]
                    : null,
              ),
              child: RichText(
                text: TextSpan(
                    text: categories[index],
                    style: TextStyle(
                      fontSize: getWidth(15.0),
                      fontWeight: FontWeight.w600,
                      color: index == _selected ? Colors.white : kDeepGrey,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        setState(() {});
                        _selected = index;
                      }),
                textAlign: TextAlign.center,
              ),
            );
          },
          itemCount: categories.length),
    );
  }

  Text discover() {
    return Text(
      'Discover',
      style: TextStyle(
        fontFamily: 'Bluu Suuperstar Medium',
        fontSize: getWidth(22.0),
        fontWeight: FontWeight.w700,
      ),
    );
  }

  ConstrainedBox searchSection() {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        height: getHeight(45.0),
        width: getWidth(335.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: SearchFeild(
              controller: TextEditingController(),
              readOnly: true,
              onChanged: c,
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SearchPage()));
              },
            ),
          ),
          SizedBox(width: getWidth(15.0)),
          FilterWidget(onPressed: () {
            FilterSheet s =
                FilterSheet(icon: dumalo, tabController: _tabController!);
            s.showBottomSheet(context);
          }),
        ],
      ),
    );
  }

  void c(s) {
    // print(s);
  }

  Row appBar() {
    return Row(children: [
      const Text(
        'Delivering to',
        style: TextStyle(
          color: Color(0xff7E8389),
          fontWeight: FontWeight.w400,
        ),
      ),
      SizedBox(width: getWidth(4.0)),
      assetIcon(
          width: getWidth(15.0),
          height: getHeight(10.32),
          path: 'assets/icons/arrow.svg',
          color: kBlack),
      SizedBox(width: getWidth(4.0)),
      SizedBox(
        width: getWidth(97.0),
        child: Text('Brooklyn',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Bluu Suuperstar Medium',
              color: kBlack,
              fontWeight: FontWeight.w700,
              fontSize: getWidth(20.0),
            )),
      ),
      SizedBox(width: getWidth(2.0)),
      assetIcon(
        path: 'assets/icons/Dropdown Triangle.svg',
        color: kBlack,
        height: 6.0,
        width: 6.0,
      ),
      const Spacer(),
      trivia()
    ]);
  }

  InkWell trivia() {
    return InkWell(
      onTap:_selected==1? () {
        ExpressMenu().showsheet(context);
      }: () {
              ExpressMenu().showsheet(context);
            },
      child: Stack(
        children: [
          SizedBox(
            width: getWidth(36.0),
            height: getHeight(38.0),
          ),
          Positioned(
              left: getWidth(3.9),
              child: Image.asset(
                'assets/icons/premium-icon-wok-1318529.png',
                height: getHeight(30.0),
                width: getWidth(30.0),
              )),
          Positioned(
            top: getHeight(26.0),
            child: Ink(
              width: getWidth(36.0),
              height: getHeight(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(getWidth(10.0)),
                color: Colors.green,
              ),
              child: const Text(
                '5.00\$',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 9.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
