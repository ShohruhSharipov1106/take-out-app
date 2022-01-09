
//Search page to'g'ri ishlashi uchun mahsulot nomini to'liq kiritish lozim

import 'package:take_out_app/constants/imports.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  Text menuText({String? name}) {
    return Text(
      '$name',
      style: TextStyle(
        color: const Color(0xFFE92F48),
        fontSize: getHeight(15),
      ),
    );
  }

  late List<Widget> widgets;
  @override
  void initState() {
    super.initState();
    widgets = [
      recentText(),
      menuText(
        name: 'Sushi',
      ),
      menuText(
        name: "Joe's Pizza",
      ),
      menuText(
        name: 'Chipotle',
      ),
      menuText(
        name: 'Burger',
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: Appbar(title: 'Search').bar(),
      body: SafeArea(
        bottom: false,
        right: false,
        maintainBottomViewPadding: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: getWidth(20.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getHeight(20.0)),
              searchInAdress(context),
              SizedBox(height: getHeight(25.0)),
              FutureBuilder(
                  future: Api('foods').getDocuments(),
                  builder: (context, AsyncSnapshot<List<FoodData>> snap) {
                    if (!snap.hasData ||
                        snap.data == null ||
                        snap.connectionState == ConnectionState.waiting ||
                        snap.connectionState == ConnectionState.none) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return ListView.separated(
                      separatorBuilder: (_, i) {
                        return SizedBox(
                            height:
                                _searchController.text.split(' ').join() == ''
                                    ? getHeight(15.0)
                                    : getHeight(20.0));
                      },
                      itemBuilder: (context, index) {
                        if (_searchController.text.split(' ').join() == '') {
                          return widgets[index];
                        }
                        return PostWidget(data: snap.data![index]);
                      },
                      itemCount: _searchController.text.split(' ').join() == ''
                          ? widgets.length
                          : snap.data!.length,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget recentText() {
    return Text(
      'Recent searches',
      style: TextStyle(
          fontSize: getWidth(18),
          color: const Color(0xFF424242),
          fontWeight: FontWeight.w600),
    );
  }

  searchInAdress(BuildContext ctx) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        height: getHeight(45.0),
        width: getWidth(335.0),
      ),
      child: Row(
        children: [
          Expanded(
              child: SearchFeild(
                  controller: _searchController,
                  onChanged: (x) {
                    setState(() {});
                  },
                  onTap: () {})),
          SizedBox(
            width: getWidth(15.0),
          ),
          FilterWidget(
            onPressed: () {
              Navigator.of(ctx)
                  .push(MaterialPageRoute(builder: (context) => AdressPage()));
            },
          ),
        ],
      ),
    );
  }
}
