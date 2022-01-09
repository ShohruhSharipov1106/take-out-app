import 'package:take_out_app/constants/imports.dart';

class ExpressPage extends StatefulWidget {
  const ExpressPage({Key? key}) : super(key: key);

  @override
  _ExpressPageState createState() => _ExpressPageState();
}

class _ExpressPageState extends State<ExpressPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: getHeight(22.0)),
        _takeout_express(),
        SizedBox(height: getHeight(15.0)),
        _express_info(),
        SizedBox(height: getHeight(25.0)),
        _posts(),
      ],
    );
  }

  _posts() {
    return FutureBuilder(
      builder: (_, AsyncSnapshot<List<FoodData>> snapshot) {
        var data = snapshot.data;
        if (!snapshot.hasData ||
            snapshot.data == null ||
            snapshot.connectionState == ConnectionState.waiting ||
            snapshot.connectionState == ConnectionState.none) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.separated(
          separatorBuilder: (_, i) {
            return SizedBox(height: getHeight(20.0));
          },
          itemBuilder: (context, index) {
            return PostWidget(data:data![index]);
          },
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: data!.length,
          padding: EdgeInsets.zero,
        );
      },
      future: Api('foods').getDocuments(true),
    );
  }

  Row _express_info() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _takeOutItem(
          width: 88.0,
          height: 60.0,
          title: '3',
          subtitle: 'Restaurants',
        ),
        _takeOutItem(
          width: 136.0,
          height: 60.0,
          title: '10:00pm',
          subtitle: 'Express Delivery Time',
        ),
        Ink(
          width: getWidth(79.0),
          height: getHeight(60.0),
          decoration: BoxDecoration(
            border: Border.all(
              width: getWidth(2.0),
              color: kRed,
            ),
            borderRadius: BorderRadius.circular(
              getWidth(10.0),
            ),
          ),
          child: Column(
            children: [
              const Spacer(flex: 11),
              Text(
                '4:24',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: getWidth(22.0),
                  color: kRed,
                ),
              ),
              const Spacer(flex: 8),
              Text(
                'Left to order',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: getWidth(12.0),
                  color: kRed,
                ),
              ),
              const Spacer(flex: 11),
            ],
          ),
        ),
      ],
    );
  }

  Ink _takeOutItem(
      {String? title, String? subtitle, double? width, double? height}) {
    return Ink(
      width: getWidth(width!),
      height: getHeight(height!),
      decoration: BoxDecoration(
        color: kFilledField,
        borderRadius: BorderRadius.circular(getWidth(10.0)),
      ),
      child: Column(
        children: [
          const Spacer(flex: 11),
          Text(
            title!,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: getWidth(22.0),
            ),
          ),
          const Spacer(flex: 8),
          Text(
            subtitle!,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: getWidth(12.0),
            ),
          ),
          const Spacer(flex: 11),
        ],
      ),
    );
  }

  Text _takeout_express() {
    return Text(
      'Take-Out Express',
      style: TextStyle(
        color: kBlack,
        fontFamily: 'Bluu Suuperstar Medium',
        fontWeight: FontWeight.w700,
        fontSize: getWidth(22.0),
      ),
    );
  }

 
}
