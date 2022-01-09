import 'package:take_out_app/constants/imports.dart';

class RestaurantOverview extends StatefulWidget {
  const RestaurantOverview({Key? key}) : super(key: key);

  @override
  _RestaurantOverviewState createState() => _RestaurantOverviewState();
}

class _RestaurantOverviewState extends State<RestaurantOverview>
    with TickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  List<String> leaderboardImages = [
    "https://s3-alpha-sig.figma.com/img/0305/ae6b/2da09d3614f2daa940abfa5b36d87aa6?Expires=1639353600&Signature=e0LH~xZofckQlwboiKu43YY2fcYrawg7flqklXETgQNIhGQKMahxDuf364Zn6I~7MXktq5vJplcFEadCgrJFtchao7L5AGqWYoa2j0uKM0TPaWBXx36Ej0iBKaM1xHgcy03v7cYrsBJKeQL7EPmqezOXz7ieRAFECTs8JjGoEUZfblJv4apLmx3h5hbP09Xu4gSrgBSTdQkbWRu13CjAyBFiZve8LiiSEG2l3zGMCWyjh9RfeCh1tVrA9NH4ScIaoncUccNCpJi03GR47nPW~Xg6MglsB2HgiQBIFzMwABtOKBLI0EN-W~rwzx5jzPeVTwMNXN0FcuThbJZaZiD2cQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
    "https://s3-alpha-sig.figma.com/img/c534/828a/52089b9adbb6b21850a7ac038de74ca4?Expires=1639353600&Signature=P0v0KRi510jhBYH6~po59FRPpjarVAxXoNK66WvC3sZcJN3Tz1i9s9pZXGPJN6kzHAYpqjZiOvzQTD3I1MNyZepYi-2e6MKyKJYJp3OF9pnvh8pldXO8C7Avz4v0Io1Y75Q04wJmIWbw2e~McWXbx0npkBrNOurgDqag-Rw8U5DkQOA2NvME2nsSImO3TSR1rJ17p6cJiaGKx~-wbHCxAyVvfB~zHmp3sVJvyOSNtoEjjIE0bIOSPuTbKGY6TUdCPMpq1rMxfUk-svY6xpzycozXxh5pXbjezOh~F39egmokm56tfwQpAuuGlJzg4GgKczWFen6uJ-sE4x9fqoO~1g__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
    "https://s3-alpha-sig.figma.com/img/a161/e75f/680f38e29a57fcd64c56573175e47d3f?Expires=1639353600&Signature=X4~WHPfWb7ricPH5EZbiCkpJSuHk~vtpdMaxULN431Jbkam~N5yrz4I7RfjB7E4EeHYBXci2HxWYPDucvI9bBhIiVKN1eryRV4zyDoSKMWHPvSdsJrWFDOvIewyhdLs6BMnnl4kMZs7m-VKZmQEykBF3YsewjesRYRg~DBzxMZT7znucUC6Tf-R9XXNLhEH5LcDqa1WcvyujtOgpz~tyaa4cY-65IGCIgV4DXSW9OK2edlCMGYwsKroDMRvdsUW5Qhpjs5BtmwJeTnBjRqipcZCTeuWtCPwy0Y-gb9ZoFhwFZOfGnVEVUWjJh-0qN~SDXqoFFcEKcFza6SSDH0T8Mg__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
    "https://s3-alpha-sig.figma.com/img/463c/2b60/53a699acbaed533b67c9ce94ef2f3cd1?Expires=1639353600&Signature=EdGxa54hR6AoDKWWbvH4jL4sCnACEBgaiapXxli2g6gxsWYg0PLeput1xExfWza33cdRfeApR3GGscwjww6YN-MmMbwftzpC9wcKDUbWXSLGqWPq7UCReN2KNkREnqn14S7YY8zsm1ZS-lTSOH6l2iDlZVLcTmPQ2UdvfYH3y8D1jbeAoYnwMU8NLg6ICteJ6mNQUEhQj~k0oJ90qZkFBZBoRkgzEvNrwmDNeLqWsxXmOJroFkWkbpPP8l1sx~Cgsi2g-lO9Ufpc64MuUckSzWOZdxEt1tcbefGEJR7CqtAKibe-V7JUZRxb1Mkmgk~Zy7rVwHFkHcxHXPxYanKmKw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
    "https://s3-alpha-sig.figma.com/img/e0a9/0c7e/6bdbced0900d3b5555602414445df8d8?Expires=1639353600&Signature=bMnzwPeAOHPvqaepj11rDYO-HKYqI4g2iA2rEfs4AKCcP1J~QWTvI~AqHGdxyLLzIWw7owgFL71KL3GME9gVniudH0JloB7omTgo97NMwtaVsklTo5W7aP0jWVDmgikoduA-hkXzF4wzE2P4F2zOQBu-kDnuqYFl3hyng-Z6wWOIvR0hx9rf8A~sfTnOwrnC~dV5v2RGnp3LoPqPQLr2BsDEdKPBEMllgXa0DvBL2yKlkjxS9tWXUvPKxK7y2YWAPj5KyWrc4Li872mxrLLAeh3WfveWXr6lpV79kpodDet8FeEYNxSyk1C0JxUUNPTWoS~wLsSdy-pMLYtW~Pkjjw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
    "https://s3-alpha-sig.figma.com/img/f8f8/72b7/ec79b01bbb310a80b4b01e411d355f3e?Expires=1639353600&Signature=Inz2MGbwDUjT5o-Yh-dnkf7ibHSEG3zpVRRosMXVtC9USLeqI~PgYtqBq1TFbjKgtMCnrjO~q4O9VjQxqIXPkDhV68Ran~TA5fvPqxXyBuVHBIVXFYfJP9LTi6FjllcU14V0L8YsZud90kcMu4wKbX6s3MGwRb3oJ7o~o7jxKkkrbIhttaI4WNu8YjMF3UwkbaxYxE9qOh0~O0iqRCLIgMsvM64C0A4se5StA0KAyfgMXtyfUwh2E-qw29Z4LvcEB~aB6yXlb74gWaUQP7GdUmCXZz5K1smz1vc7sMSvkX30FlrfASoB9VdczWeJEIRic5y5jNrUQPBcEaJuq8BDBg__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
    "https://s3-alpha-sig.figma.com/img/3640/4896/81899d396af497a500164288d279baea?Expires=1639353600&Signature=I8AzwUuCStD6FdxAL1BMfKG5ahe90EMndiL2Y3ub23GziLp0RomzGsO6J0IKuYarskzaOk2kvF9G2ChG47W3HPlAs5t9uz1a~G9Ph6kK~OGRDT42ZHdAGyPLNksGl7~JRS16227Cq8Un25riu6i5u3DgKlVCp60etIN7GyfacmU3d6shaDsoMLUq~IHKKeLexjCnVZX4QciPVFzoQfpUMGKdD4dX8y10ouUyPzoncgGfLWe-dGQYPy0-6sH3JBOSWz2J6er4TpvIHRC7zEMl9qGt3oe0ssGcams07WPwrTUAewrYr0WyiUWWYxPuJLTeEv7fLgy9IsWE4wjdt4SfVg__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
  ];
  List<String> leaderboardNames = [
    "Chloé",
    "Heidi",
    "Marcus",
    "Mindi",
    "Emma",
    "Aaliyah",
    "John",
  ];
  List<int> leaderboardBalls = [
    130,
    125,
    115,
    110,
    90,
    85,
    75,
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: kFilledField,
        elevation: 0,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  "assets/icons/search.svg",
                  height: getHeight(16.0),
                  width: getWidth(15.45),
                  fit: BoxFit.cover,
                  color: kDeepGrey,
                ),
              ),
            ],
          ),
          SizedBox(width: getWidth(20.28)),
        ],
        centerTitle: true,
        leadingWidth: getWidth(50.0),
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                "assets/icons/back.svg",
                height: getHeight(12.39),
                width: getWidth(18.0),
                fit: BoxFit.cover,
                color: kDeepGrey,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: getWidth(20.0),
                  top: getHeight(32.81),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _foodInformation(),
                    SizedBox(height: getHeight(10.0)),
                    _deliveryInformation(),
                    SizedBox(height: getHeight(20.0)),
                    _leaderboardField(),
                    SizedBox(height: getHeight(26.46)),
                    _viewFullDetails(),
                    _divider(
                      topSide: getHeight(35.0),
                      bottomSide: getHeight(36.0),
                    ),
                    _recommendationTitle(),
                    SizedBox(height: getHeight(15.0)),
                    _recommendationBody(),
                    _divider(
                      topSide: getHeight(20.0),
                      bottomSide: getHeight(25.0),
                    ),
                    _tabBar(),
                    _tabBarView(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Text _recommendationTitle() {
    return const Text(
      "Popular",
      style: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.w600,
        color: kBlack,
      ),
    );
  }

  SizedBox _recommendationBody() {
    return SizedBox(
      height: getHeight(214.0),
      child: ListView(
        children: [
          _foodCard(
            "https://s3-alpha-sig.figma.com/img/35c6/dbb1/5a30025cad8cd0b99d8eceea28960aa7?Expires=1639353600&Signature=E2K5sNIR33ElzviZVNbnN7ENLximcKncTAnXqRgGNoHCRNmhB6dg587TOEbB8ibsxpbkEVy7okbXWePHeXVZ3V06wx8flQYfstZ5tQSrZB2MWDOxi1U-EO4ap~O75OZqpsCRk5n4-97X1Q6pNWmXnNGCnq2vwavoL~iSr1aCv2jHz9AjsUztKr4ppudxm9PoNemZoiEsGtPM-Js7srM8oXS~FdGozgKWQ1xSmdoXoHvmVWWMqRNziT58bLihIYAVZzK1KZPOpmJdiE6LJYBNPFlV1sEMYJ8M1fpXMsfzAXyN33qq~qD3~1-es9y2mtHFj-OAPLJsF2E98lnlKEBjVw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
            "Salmon Sashimi",
            "smoked salmon over rice",
            "\$4.99",
          ),
          _foodCard(
            "https://s3-alpha-sig.figma.com/img/3e1b/9391/738827f699bb1db17810e829d6e7528d?Expires=1639353600&Signature=CS9xaUsiyrHhldF7gDKRyGN80lB~OTta5fz3n4yU5sZRZwmIyU0wRNpNXGxNc~RpvvTAV1dptp8Jekr-UMowCn79EgjbvfZIsthzd9qRBB7QYjHV-8-I29PdmW41lxSjJMha1UCzmQdAxliO912WNq8u6X9LjbDGCnfLHo--1RvnuyjY4Hhe16yDq4YMTjBGtMu5bwpYuG9CrvSKj2B~Br~Dy-jTmNfczxVWUYQGcTCCUHMJKRHAnYb0BkhiSMGdbYqhrG8c3HmWuRBMuDu3sCE1Ir6iaY~~vQdKGZdCnhOs5f9M6knoyWjMd9-FKpwq7hakZLrpFxG~m2CKstGY9g__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
            "Assorted Sushi",
            "Seven assorted pieces of sushi and one California roll.",
            "\$12.99",
          ),
        ],
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  SizedBox _tabBarView() {
    return SizedBox(
      height: getHeight(470.0),
      child: TabBarView(
        controller: _tabController,
        children: [
          _tabBarViewItem1("Sushi Rolls"),
          _tabBarViewItem2("Bento Boxes"),
          _tabBarViewItem1("Soups"),
          _tabBarViewItem2("From The Kitchen"),
        ],
      ),
    );
  }

  SizedBox _tabBar() {
    return SizedBox(
      height: getHeight(25.0),
      child: TabBar(
        isScrollable: true,
        indicatorColor: Colors.transparent,
        labelColor: kBlack,
        labelStyle: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelColor: kUnSelectedText,
        unselectedLabelStyle: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w700,
          color: kUnSelectedText,
        ),
        tabs: const [
          Text("Sushi Rolls"),
          Text("Bento Boxes"),
          Text("Soups"),
          Text("From The Kitchen"),
        ],
        controller: _tabController,
      ),
    );
  }

  Padding _tabBarViewItem2(String tabBarViewTitle) {
    return Padding(
      padding: EdgeInsets.only(top: getHeight(35.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tabBarViewTitle,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
              color: kBlack,
            ),
          ),
          SizedBox(height: getHeight(15.0)),
          _itemListTile(
            "Shrimp Teriyaki",
            "shrimp, vegetables, rice, & avocado",
            4.99,
            img:
                "https://s3-alpha-sig.figma.com/img/a637/95b4/a0c818badf6cde8896cda797e7bdb94f?Expires=1639353600&Signature=HGeycpogjXlZBgbWyf2W42KPRJF3FKsOWtb-FMglBdpcPldi7mXXNyqtqWPJyeCX9CUObdgtQ~8ehXOI83G5e3tSP0XzmVioc5kqDyxrA~dH~xFmTzUp3NzNAQooxrp-cdDMnqUTBYWPXjse9k-vH7et-slZAv6n6uJRe0wBXvot0y8fSNhokbRU2heeaIt5-X6JFFW-XqUdnJzSo-TQ1N2SyOgFktYE829mrmBmDhayUPvl~BkmIeJ0baYi1cAhb7Zzsc~0kgM1~0RLR7xdiF6aOouHbQtBF-HukkoAorj4~z8sM5DweiQODBf8eTq2KwLqBmC-O0BcPET7aH0AEQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
          ),
          _divider(
            topSide: getHeight(16.0),
            bottomSide: getHeight(20.0),
          ),
          _itemListTile(
            "Salmon Teriyaki",
            "salmon, california roll, vegetables, & salad",
            4.99,
            img:
                "https://s3-alpha-sig.figma.com/img/b67d/59b2/951886518d72c9d1a8f5cc9b79512afa?Expires=1639353600&Signature=EF54FXaeQf6N5QHdGr29jBdWmlVmBWW~hfp~4y1KlfyMk-6fbL5U-GGsvrh8wG5ZpL3vTWJ9lPoc0kDEOZI0X~W9KYv0AwsdYIO1zPV1Iw9lY-3Wvz86h99VI5i~0TdlESgMXaFirwqy2iQQa-jP9kh1daBZhSIyIF~ESNMKbWkuhRAIxyat8-j0wtWb5~7o4w~a6ASznVuQmNxWWWPBKhTtHlfOtWCTfksCOdy9b2-iJANfgPRHQYBDoSSbS4R0mb8dHaV5r-aNq5RkG1McHsYmASbDjWuq5gtdNKFkMMKTKqId5KSYcE4gYFZlCIs32FKCxPuJ99TGeTybwJ~oIA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
          ),
          _divider(
            topSide: getHeight(16.0),
            bottomSide: getHeight(20.0),
          ),
          _itemListTile(
            "Vegetable Teriyaki",
            "salad, veggie roll, & noodles",
            4.99,
            img:
                "https://s3-alpha-sig.figma.com/img/9f73/0a03/aa772d83e280325aab98cafdfec44bf1?Expires=1639353600&Signature=M9zh~LTEJXfFpAp-nckG5~S9UZI7u267g2x3CEMAZRu2L4IEAqEhZHYKZfDJpscJPS1W9T~ylGhl~lzPm3zEky1CTerJiHgA~eRZQjIZoVudDdCTLJWagpujs6wSdnT5pJiNQ8nNJQYKAMsaCzcJqAd64lw~JZrkLPO4m4W~l3znCTn-A8ged-5H8vDxGsAVZowLPJIHquyL9rhc6RY-hCqpnuPFHHSa-qzl~f-WdsadVxr3Lt4vfPPVAG0cUv8HICn60p37ktmhqMlT2v54vT4~uiUTgVGusteJtSb5TZrKnyQqrAJ823H9-rFaanKPjS40nXT3IfLP1y~sFtV3hg__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
          ),
        ],
      ),
    );
  }

  Padding _tabBarViewItem1(String tabBarViewTitle) {
    return Padding(
      padding: EdgeInsets.only(top: getHeight(35.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tabBarViewTitle,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
              color: kBlack,
            ),
          ),
          SizedBox(height: getHeight(15.0)),
          _itemListTile(
            "California Roll",
            "crab & cucumber",
            4.99,
          ),
          _divider(
            topSide: getHeight(16.0),
            bottomSide: getHeight(20.0),
          ),
          _itemListTile(
            "Tuna Roll",
            "tuna & cucumber",
            4.99,
            img:
                "https://s3-alpha-sig.figma.com/img/3fe4/aede/43be8c0d91bfc39c3f506db85ca215bc?Expires=1639353600&Signature=NHwiBq4ftjZWTBlyfyrHjje8x88mfVfX72nNUZFvCeC9vzdfjwZXhN5y~7J4ja6NFsmou3wm1SrHvkwEb2xIGfL73a7U1rni52ikoGIh5J6Y24kp4FxKqWJirM8xiY7EcsGi7MNIapbHH02uRZzpleDjgwWZGr0KpWpx7ZF3xc8g6ji0544p8n3LkcsEONeEPPuPmkOzOVH~GVsZ8vX44alsXG7f7nt4Hkr4DOYSknAKoyRtyWMGK-No9aQLFPbWC3bwNnBp0KSPvJI5X2dzQ3me9K7KfiqHOhGiqml9uN7GQbRkDGntNuXMAjRt8OR4U9UL38XQ1FLCUhq~PT-T-A__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
          ),
          _divider(
            topSide: getHeight(16.0),
            bottomSide: getHeight(20.0),
          ),
          _itemListTile(
            "Salmon Roll",
            "salmon & cucumber",
            4.99,
            img:
                "https://s3-alpha-sig.figma.com/img/0e00/b23a/9e0711013bdabbdd13bd91fbf534a628?Expires=1639353600&Signature=VcrHZSIFkxtteiGgH5cq39MDzIQXzjXdhLYXuxPNU4rHgZzUoR8M01XKTQazOG4OZ9i4v2OmcWtn5-7wjBWI-iUsFZgCxrSipt~a3Kov4B6MSgOJL3JlLw-vjw170Xv-vtWtTGie2RwU-8EqLsepydC8XEonYfKRjfxjy8JuZVjQoFHjMzX7HNvwm1osWLY-zXjq0igPQybeslY4gFS90X6eCpfbLwLYS4wq0rmtbfnnqToIQe05qkNJqPULCBfKY7NDRf8i46JHr~tJnMAL8aDN04zdwpvuANhEU7XIjKQ6O4HrshZEMp4G8pCPICKTFH7yc5nWN9z4WXG~8Q5iiQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
          ),
          _divider(
            topSide: getHeight(16.0),
            bottomSide: getHeight(20.0),
          ),
          _itemListTile(
            "Veggie Roll",
            "avocado, cucumber & lettuce",
            4.99,
            img:
                "https://s3-alpha-sig.figma.com/img/a41f/7ab0/25e15554050bb5b636de1f2d3da68e46?Expires=1639353600&Signature=H4umTJc5YfHJlF48p0YLSWaW6GRLPQB2y4D907Y2qAu38qDGFR~t-NJ6yA4IFwLZzUsjo~gwcigRFWSuE-l7w6bYs5al2oaIWa7lN9fIkgHgG2XLBEqzLjdB~O1PRH9rGZcGy8TI51CjRAsdZdY1rpxblMNyYoqMH8vvUeYz8QWku2kSsN0dabT8VXVwJmV0GEFkhxRWgWkQKdoAyQN7hSrZJxgGPZ342v4fcs-C5yT86htltAyrBKpvRHGG9SJhVtFxB0wE4TrBPXY5FwHQjtgwZLUE1G8HpzinUSnygT-ZDJdz4-FsXusUBIzRFkK0rdAreVFX07yC0ad95DU1UA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
          ),
        ],
      ),
    );
  }

  ListTile _itemListTile(String title, String product, double price,
      {String img = ""}) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RestaurantItem(
                  food: {
                    "title": title,
                    "product": product,
                    "price": price,
                    "img": img
                  },
                )));
      },
      dense: true,
      leading: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: kFilledField,
          image: DecorationImage(
            image: img == ""
                ? const NetworkImage(
                    "https://upload.wikimedia.org/wikipedia/commons/8/89/HD_transparent_picture.png")
                : NetworkImage(img),
            fit: BoxFit.cover,
          ),
        ),
        height: getHeight(80.0),
        width: getWidth(80.0),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w500,
          color: kBlack,
        ),
      ),
      subtitle: Text(
        "$product\n\$$price",
        style: const TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
          color: kDeepGrey,
        ),
      ),
    );
  }

  Padding _foodCard(
    String foodImg,
    String foodTitle,
    String foodSubtitle,
    String foodPrice,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getWidth(5.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: getHeight(150.0),
            width: getWidth(335.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage(foodImg),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: getHeight(13.0)),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: foodTitle + "\n",
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                    color: kBlack,
                  ),
                ),
                TextSpan(
                  text: foodSubtitle + "\n",
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    color: kDeepGrey,
                  ),
                ),
                TextSpan(
                  text: foodPrice,
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    color: kDeepGrey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding _divider(
      {double rightSide = 0,
      double leftSide = 0,
      double topSide = 0,
      double bottomSide = 0}) {
    return Padding(
      padding: EdgeInsets.only(
        right: rightSide,
        left: leftSide,
        top: topSide,
        bottom: bottomSide,
      ),
      child: const Divider(color: kDeepGrey),
    );
  }

  Padding _viewFullDetails() {
    return Padding(
      padding: EdgeInsets.only(right: getWidth(20.0)),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        tileColor: kFilledField,
        dense: true,
        title: const Text(
          "View Full Details",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
            color: kBlack,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 17.0,
        ),
        onTap: () {
          _bottomSheet();
        },
      ),
    );
  }

  Future<dynamic> _bottomSheet() {
    return showModalBottomSheet(
      backgroundColor: Colors.amber,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      context: context,
      builder: (context) => BottomSheet(
        onClosing: () {},
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 0.85,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: getWidth(20.0),
                      right: getWidth(20.0),
                      top: getHeight(54.0),
                    ),
                    child: Column(
                      children: [
                        _foodInformation(),
                        SizedBox(height: getHeight(10.0)),
                        _deliveryInformation(),
                        SizedBox(height: getHeight(25.0)),
                        _bottomSheetMap(),
                        _bottomSheetMapInformation1(),
                        _bottomSheetMapInformation2(),
                        SizedBox(height: getHeight(28.0)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: getWidth(20.0),
                      right: getWidth(20.0),
                      top: getHeight(30.0),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: kRed,
                    ),
                    height: getHeight(1600.0),
                    width: getWidth(375.0),
                    child: Column(
                      children: [
                        _titleLeaderboard(),
                        _friends_all_field(),
                        SizedBox(height: getHeight(22.0)),
                        _bottomSheetLeaders(),
                        SizedBox(height: getHeight(50.0)),
                        _bottomSheetFullRanking(),
                        _titleMe(),
                        _meRankBottomSheet(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Container _meRankBottomSheet() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getWidth(20.0)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      height: getHeight(440.0),
      width: getWidth(335.0),
      child: Column(
        children: [
          Stack(
            children: [
              // MAIN CIRCLE
              const CircleAvatar(
                radius: 160 / 2,
                backgroundColor: Colors.white,
              ),

              // AVATAR CIRCLE

              Positioned(
                child: const CircleAvatar(
                  radius: 130 / 2,
                  backgroundImage: NetworkImage(
                    "https://s3-alpha-sig.figma.com/img/3bee/0491/2873dcc09f0fdcc5671b1c4d1f20324a?Expires=1639353600&Signature=UPZ3tNrIh3J3kB899ktIqeQnhk6s9fwTjNOVp1jiIO7dpuRP6SXwC~XLxQ5NUIQ9Tl8-PiG8jkLMfXTpRyVeK8EUm9Jkax09RaqMn2~Snd3VryijLF1X~Mi4m~u5BhIx9RVkEcYcFduYdxD8Ny8YzDhlR0mrDiotevr~Pa4Jqmq47tWssK8j-mWeK9YcTft3YkXlfjgtxk43uUCE9s3rMq0xFU3QB5Lj6ORk2-RUg4EydiyKiWFISh3seYS4KqiUvCOXThqultp7KxhhQgMwjb0bbGvbyFbnxnLbRQpzbjanXfXnBmxlOU0ER-Cz7QD4eJatYOPFXtw05tywFxf3qQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
                  ),
                ),
                top: 9.0,
                right: getWidth(10.1),
                left: getWidth(10.11),
              ),

              // MAIN RANKING CIRCLE

              Positioned(
                child: const CircleAvatar(
                  radius: 58.15 / 2,

                  // 2 - RANKING CIRCLE

                  child: CircleAvatar(
                    radius: 39.54 / 2,
                    backgroundColor: kRed,
                    child: Text(
                      "★2",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  backgroundColor: Colors.white,
                ),
                bottom: 0.0,
                left: getWidth(45),
              ),
            ],
          ),
          Chip(
            backgroundColor: kFilledField,
            label: const Text(
              "24 points til",
              style: TextStyle(
                fontSize: 15.0,
                color: kBlack,
              ),
            ),
            onDeleted: () {},
            deleteIcon: const CircleAvatar(
              backgroundColor: kRed,
              child: Text(
                "★3",
                style: TextStyle(
                  fontSize: 8.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: getHeight(23.0)),
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "Enzo\n",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: "BluuSuuperstar",
                    color: kBlack,
                  ),
                ),
                TextSpan(
                  text: "Brooklyn, NY",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: kDeepGrey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: getHeight(35.49)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "\t12\n",
                      style: TextStyle(
                          fontSize: 25.0,
                          color: kBlack,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: "friends",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: kBlack,
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "\t4\n",
                      style: TextStyle(
                          fontSize: 25.0,
                          color: kBlack,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: "badges",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: kBlack,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Padding _titleMe() {
    return Padding(
      padding: EdgeInsets.only(
        top: getHeight(40.0),
        bottom: getHeight(18.0),
      ),
      child: const Text(
        "Me",
        style: TextStyle(
          fontSize: 38.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }

  Container _bottomSheetFullRanking() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getWidth(20.0)),
      padding: EdgeInsets.symmetric(
        horizontal: getWidth(13.0),
        vertical: getHeight(11.0),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      height: getHeight(560.0),
      width: getWidth(335.0),
      child: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          leading: SizedBox(
            width: getWidth(100.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${index + 4}",
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    color: kBlack,
                  ),
                ),
                Expanded(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(leaderboardImages[index]),
                    radius: getWidth(49.0),
                  ),
                ),
              ],
            ),
          ),
          title: Text(
            "${leaderboardNames[index]}",
            style: const TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
              color: kBlack,
            ),
          ),
          trailing: Chip(
            shape: const StadiumBorder(),
            backgroundColor: kFilledField,
            label: Text(
              "${leaderboardBalls[index]}",
              style: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
                color: kBlack,
              ),
            ),
          ),
        ),
        itemCount: leaderboardNames.length,
        itemExtent: getHeight(69.0),
      ),
    );
  }

  Column _bottomSheetLeaders() {
    return Column(
      children: [
        _bottomSheetLeaderboard(
          "https://s3-alpha-sig.figma.com/img/6e4f/4ba7/63eae0cbb642ece7ba9d669824ec85c9?Expires=1639353600&Signature=WATmbYWJCo5hVYvnqXqcqV~XUyCPI47bXUnx0vsluDob8FdLKyLm8xS6szJuHAlxZfaK55UsKGp6jN32vn6yjmDODcoL~FX5oVRNGZta0yX~oUf24HcK-k7Jj6FAsJGmAJKWrdxK68XTtpL8hbGENdUTpZTzkpBYf49EyEI1-Dl9bQPsZH1Mx85goph3EoYNKymVLPykSH-5uRENGyC04ebztuao54KGRlhPS2u~OjyLFtgp7jq0UQXjRHcdtYE8UF~z4p6pCRJ5o4rDxTIIxY3ZHTvQUezCdDHBFewsjjLeKYplTbh~~HpLSmfbTzCYma~4T4R~pLxUXIPP0B636w__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
          "Naomi",
          100,
          kYellowDragon,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _bottomSheetLeaderboard(
              "https://s3-alpha-sig.figma.com/img/8f7e/5f55/4c5d8bc005bef24345136f2d8b3fe30f?Expires=1639353600&Signature=g7loLM6t1bC-qRRZhqwa~tA5ZmLp515S~yp5hBBQcFQNBjptxQadRUWvAlVXoUSF0S9HJdPwLLMec00leG9r6ZkPkRbqb72~WLAUaYpzUG~qG~LSuGAbuolwwYtqWO-elwRzfCgrp8J8nejd2SYawsajXExfAi3m~GDUdgJ1x3E1aEsUjeaqgV6j4jfXcf34gTKGJRdBO531hViJEhwQxzP6YS9YbpbZdju7sX22eJDUUpXyR3oQ4Pi3tHZ5ZxnzR8YZErDnWW1aEcJVzS05Kxp6E96ffWeC~39sg9CHeNI8XYJpfNztSYP-BJ~Wco7-n4i~iuuUtCvDD2vHYCQHdQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
              "Zak",
              100,
              kSilverSycee,
            ),
            _bottomSheetLeaderboard(
              "https://s3-alpha-sig.figma.com/img/e896/064a/a3474fa7bf2e6ec7fc45ff76eaa38e37?Expires=1639353600&Signature=RC2jrbV5e7Z1SBWY1D37fjfPumEEJshdRlErRYr5fZFS06CEfboiM7-0gUzQp2K55xABL~fmcNyTH1MFcCbV9U9uKCXFOlaaudji-Koh4BnO-ecj29~NGKq-v0-UOQcpknPBlmExz7FXKoRepg3R0oITqjLm-GlM3PSv8tlTG1QxbPXY6qz8Q304uWYtTnfoYY6aEsbOP0ymqr4JjaufBFugtvMNgbqfDcrusBvSLKsDJcp8NXkZNyfXt7~PffboLFMDQTayNaM2i-P7JJj8YZC6UtOjc92H1xV5Elqw2wTvFk6vk9RZBzI9d0vDywfWgp~Aax1ijnqxSol5SNAtgA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
              "Mia",
              100,
              kBronze,
            ),
          ],
        ),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Container _friends_all_field() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      height: getHeight(22.0),
      width: getWidth(191.0),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: getHeight(2.0),
                horizontal: getWidth(2.0),
              ),
              child: const Material(
                color: Colors.white,
                child: Center(
                  child: Text(
                    "Friends",
                    style: TextStyle(
                      fontSize: 11.0,
                      fontWeight: FontWeight.w700,
                      color: kRed,
                    ),
                  ),
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: getHeight(2.0),
                horizontal: getWidth(2.0),
              ),
              child: const Material(
                child: Center(
                  child: Text(
                    "All",
                    style: TextStyle(
                      fontSize: 11.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                color: kRed,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Text _titleLeaderboard() {
    return const Text(
      "Leaderboard",
      style: TextStyle(
        fontSize: 38.0,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }

  Row _bottomSheetMapInformation2() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.circle,
          color: kGreen,
          size: 10.0,
        ),
        SizedBox(
          width: getWidth(6),
        ),
        const Text(
          "Taking orders until 9:30 pm",
          style: TextStyle(
            fontSize: 15.0,
            color: kBlack,
          ),
        ),
      ],
    );
  }

  Padding _bottomSheetMapInformation1() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getHeight(12.0)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/Vector.png",
            color: kBlack,
            fit: BoxFit.cover,
            width: getWidth(10.0),
            height: getHeight(15.0),
          ),
          SizedBox(
            width: getWidth(5.5),
          ),
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "210 7th Ave, Brooklyn, NY 11215\n",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                    color: kBlack,
                  ),
                ),
                TextSpan(
                  text: "1.5 miles away",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: kDeepGrey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _bottomSheetMap() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: kFilledField,
        image: const DecorationImage(
          image: NetworkImage(
            "https://s3-alpha-sig.figma.com/img/b1bf/ccc9/48f7bba66a18a71b557b1877df1bf91f?Expires=1639353600&Signature=Xha7xIPXMugewfP0jVZd79ObWR3XdCtMULSzUCleAmgEkwSIWXrWmVqzM95hZhgMfgr76wbyqHoZR5BHPWL8bwo--WBfbaa6oujUGa22ms3JN6CaCQ-3zuiC~G9lxKgWQ1p3B0i~jt88qv~OYT-VgcWzZJWYJqPwBXp5LddrdYYjOMmjQwbSxiGymtdwt8K538fHZ~CpmOSG5xy9o3HpESswZPLAqGqTsTelWtH-zLIcQ1E-LcQbMF6ySa3s6vzXRng460G01w5SuT1L1~3SFU0DY1DdxHqoQMKK6P9S5FvRprHlBQeH4sfHVnOIKEYuHWF2RUhyBa1NPqSGK7m8cQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
          ),
          fit: BoxFit.cover,
        ),
      ),
      height: getHeight(202.0),
      width: getWidth(335.0),
      child: Image.asset(
        "assets/images/Vector.png",
        color: kRed,
        height: getHeight(37.0),
        width: getWidth(24.67),
      ),
    );
  }

  SizedBox _bottomSheetLeaderboard(
    String bottomSheetLeaderboardImg,
    String bottomSheetLeaderboardName,
    int bottomSheetLeaderboardBall,
    Color bottomSheetLeaderboardColor,
  ) {
    return SizedBox(
      child: Column(
        children: [
          CircleAvatar(
            radius: 63.0,
            backgroundColor: bottomSheetLeaderboardColor,
            child: CircleAvatar(
              radius: 55.0,
              backgroundImage: NetworkImage(bottomSheetLeaderboardImg),
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$bottomSheetLeaderboardName\n",
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: "$bottomSheetLeaderboardBall",
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _foodInformation() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
            children: [
              // FOOD NAME TITLE

              TextSpan(
                text: "Katsuei\n",
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w700,
                  color: kBlack,
                ),
              ),

              // FOOD INFORMATION

              TextSpan(
                text: "Japanese • Sushi",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                  color: kDeepGrey,
                ),
              ),
            ],
          ),
        ),

        // FOOD ICON

        Image.asset(
          "assets/images/Wok_icon.png",
          fit: BoxFit.cover,
          width: getWidth(30.87),
          height: getHeight(30.87),
        ),
      ],
    );
  }

  Row _deliveryInformation() {
    return Row(
      children: [
        // DELIVERY TIME CHIP

        const Chip(
          label: Text(
            "10-20 min",
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
              color: kBlack,
            ),
          ),
          backgroundColor: kLightGrey,
          shape: StadiumBorder(),
          avatar: Icon(
            Icons.access_time_filled_outlined,
            color: kBlack,
            size: 18.0,
          ),
        ),
        SizedBox(width: getWidth(12.0)),

        // DELIVERY PRICE CHIP

        const Chip(
          label: Text(
            "\$2.99",
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
              color: kBlack,
            ),
          ),
          backgroundColor: kLightGrey,
          shape: StadiumBorder(),
          avatar: Icon(
            Icons.monetization_on,
            color: kBlack,
            size: 18.0,
          ),
        ),
        SizedBox(width: getWidth(12.0)),
        // DELIVERY RATING CHIP

        const Chip(
          label: Text(
            "4.8",
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
              color: kBlack,
            ),
          ),
          backgroundColor: kLightGrey,
          shape: StadiumBorder(),
          avatar: Icon(
            Icons.star,
            color: kBlack,
            size: 18.0,
          ),
        ),
      ],
    );
  }

  Row _leaderboardField() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // RESTAURANT LEADERBOARD FIELD

        SizedBox(
          height: getHeight(161.0),
          child: Column(
            children: [
              Chip(
                padding: EdgeInsets.symmetric(horizontal: getWidth(8.5)),
                label: const Text(
                  "Restaurant Leaderboard",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                    color: kBlack,
                  ),
                ),
                backgroundColor: kLightGrey,
                shape: const StadiumBorder(),
              ),
              SizedBox(height: getHeight(10.0)),
              Stack(
                children: [
                  SizedBox(
                    width: getWidth(179.0),
                    height: getHeight(95.0),
                  ),

                  // FOR 3RD PLACE

                  _rankingCircle(
                    Colors.white,
                    "https://s3-alpha-sig.figma.com/img/e896/064a/a3474fa7bf2e6ec7fc45ff76eaa38e37?Expires=1639353600&Signature=RC2jrbV5e7Z1SBWY1D37fjfPumEEJshdRlErRYr5fZFS06CEfboiM7-0gUzQp2K55xABL~fmcNyTH1MFcCbV9U9uKCXFOlaaudji-Koh4BnO-ecj29~NGKq-v0-UOQcpknPBlmExz7FXKoRepg3R0oITqjLm-GlM3PSv8tlTG1QxbPXY6qz8Q304uWYtTnfoYY6aEsbOP0ymqr4JjaufBFugtvMNgbqfDcrusBvSLKsDJcp8NXkZNyfXt7~PffboLFMDQTayNaM2i-P7JJj8YZC6UtOjc92H1xV5Elqw2wTvFk6vk9RZBzI9d0vDywfWgp~Aax1ijnqxSol5SNAtgA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
                    kBronze,
                    "3rd",
                    getWidth(111.45),
                  ),

                  // FOR 2ND PLACE

                  _rankingCircle(
                    Colors.white,
                    "https://s3-alpha-sig.figma.com/img/8f7e/5f55/4c5d8bc005bef24345136f2d8b3fe30f?Expires=1639353600&Signature=g7loLM6t1bC-qRRZhqwa~tA5ZmLp515S~yp5hBBQcFQNBjptxQadRUWvAlVXoUSF0S9HJdPwLLMec00leG9r6ZkPkRbqb72~WLAUaYpzUG~qG~LSuGAbuolwwYtqWO-elwRzfCgrp8J8nejd2SYawsajXExfAi3m~GDUdgJ1x3E1aEsUjeaqgV6j4jfXcf34gTKGJRdBO531hViJEhwQxzP6YS9YbpbZdju7sX22eJDUUpXyR3oQ4Pi3tHZ5ZxnzR8YZErDnWW1aEcJVzS05Kxp6E96ffWeC~39sg9CHeNI8XYJpfNztSYP-BJ~Wco7-n4i~iuuUtCvDD2vHYCQHdQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
                    kSilverSycee,
                    "2nd",
                    getWidth(55.72),
                  ),

                  // FOR 1ST PLACE

                  _rankingCircle(
                    Colors.white,
                    "https://s3-alpha-sig.figma.com/img/6e4f/4ba7/63eae0cbb642ece7ba9d669824ec85c9?Expires=1639353600&Signature=WATmbYWJCo5hVYvnqXqcqV~XUyCPI47bXUnx0vsluDob8FdLKyLm8xS6szJuHAlxZfaK55UsKGp6jN32vn6yjmDODcoL~FX5oVRNGZta0yX~oUf24HcK-k7Jj6FAsJGmAJKWrdxK68XTtpL8hbGENdUTpZTzkpBYf49EyEI1-Dl9bQPsZH1Mx85goph3EoYNKymVLPykSH-5uRENGyC04ebztuao54KGRlhPS2u~OjyLFtgp7jq0UQXjRHcdtYE8UF~z4p6pCRJ5o4rDxTIIxY3ZHTvQUezCdDHBFewsjjLeKYplTbh~~HpLSmfbTzCYma~4T4R~pLxUXIPP0B636w__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
                    kYellowDragon,
                    "1st",
                    getWidth(0.0),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(width: getWidth(10.0)),

        // MY TRIVIA RANKING FIELD

        SizedBox(
          height: getHeight(161.0),
          child: Column(
            children: [
              Chip(
                padding: EdgeInsets.symmetric(horizontal: getWidth(6.0)),
                label: const Text(
                  "My Trivia Ranking",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                    color: kBlack,
                  ),
                ),
                backgroundColor: kLightGrey,
                shape: const StadiumBorder(),
              ),
              SizedBox(height: getHeight(10.0)),
              Stack(
                children: [
                  SizedBox(
                    width: getWidth(84.93),
                    height: getHeight(84.93),
                  ),
                  _rankingCircle(
                    Colors.white,
                    "https://s3-alpha-sig.figma.com/img/3bee/0491/2873dcc09f0fdcc5671b1c4d1f20324a?Expires=1639353600&Signature=UPZ3tNrIh3J3kB899ktIqeQnhk6s9fwTjNOVp1jiIO7dpuRP6SXwC~XLxQ5NUIQ9Tl8-PiG8jkLMfXTpRyVeK8EUm9Jkax09RaqMn2~Snd3VryijLF1X~Mi4m~u5BhIx9RVkEcYcFduYdxD8Ny8YzDhlR0mrDiotevr~Pa4Jqmq47tWssK8j-mWeK9YcTft3YkXlfjgtxk43uUCE9s3rMq0xFU3QB5Lj6ORk2-RUg4EydiyKiWFISh3seYS4KqiUvCOXThqultp7KxhhQgMwjb0bbGvbyFbnxnLbRQpzbjanXfXnBmxlOU0ER-Cz7QD4eJatYOPFXtw05tywFxf3qQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
                    kRed,
                    "★2",
                    getWidth(0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Positioned _rankingCircle(
    Color mainCircleColor,
    String img,
    Color positionColor,
    String position,
    double leftSidePosition,
  ) {
    return Positioned(
      child: Stack(
        children: [
          // MAIN CIRCLE
          CircleAvatar(
            radius: 84.73 / 2,
            backgroundColor: mainCircleColor,
          ),

          // AVATAR CIRCLE

          Positioned(
            child: CircleAvatar(
              radius: 64.52 / 2,
              backgroundImage: NetworkImage(img),
            ),
            top: 9.0,
            right: getWidth(10.1),
            left: getWidth(10.11),
          ),

          // MAIN RANKING CIRCLE

          Positioned(
            child: CircleAvatar(
              radius: 34.34 / 2,

              // 2 - RANKING CIRCLE

              child: CircleAvatar(
                radius: 24.97 / 2,
                backgroundColor: positionColor.withOpacity(0.5),
                // 3 - RANKING CIRCLE
                child: CircleAvatar(
                  radius: 19.71 / 2,
                  backgroundColor: positionColor,
                  child: Text(
                    position,
                    style: const TextStyle(
                        fontSize: 9.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
              ),
              backgroundColor: Colors.white,
            ),
            bottom: 0.0,
            left: getWidth(22.5),
          ),
        ],
      ),
      left: leftSidePosition,
    );
  }
}
