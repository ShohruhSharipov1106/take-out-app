import 'package:take_out_app/constants/imports.dart';

class MyStatefullBuilderNavigationBottomBar extends StatefulWidget {
  const MyStatefullBuilderNavigationBottomBar({Key? key}) : super(key: key);

  @override
  State<MyStatefullBuilderNavigationBottomBar> createState() =>
      _MyStatefullBuilderNavigationBottomBarState();
}

class _MyStatefullBuilderNavigationBottomBarState
    extends State<MyStatefullBuilderNavigationBottomBar> {
  double _sliderValue = 10.0;

  @override
  Widget build(BuildContext context) {
    return _bottomSheetOpenerButton(true, context);
  }

  void _showBottomSheetDialog(context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15.0),
        ),
      ),
      isScrollControlled: true,
      elevation: 0.0,
      barrierColor: Colors.transparent,
      backgroundColor: Colors.white,
      context: context,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, StateSetter state) {
            return SizedBox(
              height: getHeight(762.0),
              width: getWidth(375.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _bottomSheetOpenerButton(false, context),
                    _mapInBottomSheet(),
                    _driverTile(),
                    _deliveryInfos()
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  _bottomSheetOpenerButton(idf, context) {
    return InkWell(
      onTap: () {
        idf ? _showBottomSheetDialog(context) : Navigator.pop(context);
      },
      child: Container(
        height: getHeight(130.0),
        width: getWidth(375.0),
        padding: EdgeInsets.symmetric(
          vertical: getHeight(10.0),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              getWidth(10.0),
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: getHeight(4.0),
                width: getWidth(63.0),
                decoration: BoxDecoration(
                  color: kSilverSycee,
                  borderRadius: BorderRadius.circular(
                    getHeight(2.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: getWidth(20.0),
                right: getWidth(20.0),
                top: getHeight(11.8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SetText(
                    "Driver is headed to restaurant",
                    size: 15.0,
                    fw: FontWeight.w600,
                  ),
                  Ink(
                    decoration: BoxDecoration(
                      color: kDeepGrey,
                      borderRadius: BorderRadius.circular(getWidth(10.0)),
                    ),
                    height: getHeight(20.0),
                    width: getWidth(50.0),
                    child: SetText(
                      "HELP",
                      size: 12.0,
                      fw: FontWeight.w500,
                      color: kDeepGrey,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getWidth(20.0)),
              child: SetText(
                "Arriving in 10-20 min",
                size: 15.0,
                fw: FontWeight.w400,
                color: kDeepGrey,
              ),
            ),
            Slider(
              mouseCursor: MouseCursor.uncontrolled,
              autofocus: false,
              thumbColor: Colors.white,
              activeColor: kRed,
              inactiveColor: kFilledField,
              min: 0.0,
              max: 30.0,
              value: _sliderValue,
              onChanged: (v) {
                _sliderValue = v;
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }

  _mapInBottomSheet() {
    return Container(
      height: getHeight(336.0),
      width: getWidth(335.0),
      margin: EdgeInsets.symmetric(horizontal: getWidth(20.0)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          getWidth(10.0),
        ),
        image: const DecorationImage(
          image: AssetImage(
            "assets/images/Map.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          //Home Location
          Align(
            alignment: const Alignment(0.6, 0.6),
            child: SvgPicture.asset("assets/icons/location.svg",
                height: getHeight(55.0)),
          ),
          const Align(
              alignment: Alignment(0.57, 0.48),
              child: Icon(Icons.circle, size: 25.0, color: Colors.white)),
          Align(
            alignment: const Alignment(0.57, 0.48),
            child: SvgPicture.asset("assets/icons/home.svg",
                height: getHeight(20.0)),
          ),
          //Shop Location
          Align(
            alignment: const Alignment(-0.6, -0.8),
            child: SvgPicture.asset("assets/icons/location.svg",
                height: getHeight(55.0)),
          ),
          const Align(
              alignment: Alignment(-0.57, -0.78),
              child: Icon(Icons.circle, size: 25.0, color: Colors.white)),
          Align(
            alignment: const Alignment(-0.566, -0.76),
            child: SvgPicture.asset("assets/icons/shop.svg",
                height: getHeight(17.0)),
          ),

          //Where Is Delivering Car

          const Align(
              alignment: Alignment(0.2, -0.3),
              child: Icon(Icons.circle, size: 38.0, color: kRed)),
          Align(
            alignment: const Alignment(0.18, -0.27),
            child: SvgPicture.asset("assets/icons/car.svg",
                height: getHeight(14.0)),
          ),
        ],
      ),
    );
  }

  _driverTile() {
    return ListTile(
      leading: CircleAvatar(
        radius: getWidth(23.0),
        backgroundImage: const AssetImage("assets/images/DriverImage.png"),
      ),
      title: SetText(
        "Drivers Name",
        size: 20.0,
        fw: FontWeight.w600,
      ),
      subtitle: SetText(
        "Your driver",
        size: 15.0,
        fw: FontWeight.w400,
      ),
      trailing: InkWell(
        onTap: () {},
        child: Container(
          // alignment: Alignment.center,
          height: getHeight(20.0),
          width: getWidth(88.0),
          decoration: BoxDecoration(
            color: kFilledField,
            borderRadius: BorderRadius.circular(
              getWidth(10.0),
            ),
          ),
          child: SetText(
            "Contact Driver",
            size: 12.0,
            fw: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  _deliveryInfos() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        _infoTile("10:00 PM", "Estimated Delivery Time", trailing: false),
        const Divider(),
        _infoTile("Address", "434 Chilonzor 3-Qavat\nTashkent Shaxri, IN 10013",
            trailing: false),
        const Divider(),
        _infoTile("Order Details", "Katsuei\n1x - OqTepa Lavash",
            trailing: true),
        const Divider(),
        SizedBox(
          height: getHeight(54.0),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            height: getHeight(4.0),
            width: getWidth(134.0),
            decoration: BoxDecoration(
              color: kSilverSycee,
              borderRadius: BorderRadius.circular(
                getHeight(2.0),
              ),
            ),
          ),
        ),
        SizedBox(
          height: getHeight(10.0),
        )
      ],
    );
  }

  _infoTile(String title, String subTitle, {required bool trailing}) {
    return ListTile(
      title: SetText(
        title,
        size: 20.0,
        fw: FontWeight.w600,
      ),
      subtitle: SetText(
        subTitle,
        size: 15.0,
        fw: FontWeight.w400,
        color: kDeepGrey,
      ),
      trailing: trailing
          ? TextButton(
              onPressed: trailing ? () {} : null,
              child: SetText(
                "View Receipt",
                size: 15.0,
                color: kRed,
              ),
            )
          : const Text(""),
    );
  }
}
