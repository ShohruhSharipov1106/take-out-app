import 'package:take_out_app/constants/imports.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Appbar(title: 'Orders').bar(),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: getWidth(20.0)),
          child: Column(
            children: [
              SizedBox(
                height: getHeight(25.0),
              ),
              historyWidget(
                items: 3,
                price: "18.26\$",
                name: 'Katsui',
                date: 'Saturday, Dec 21st',
              ),
              Divider(color: kDeepGrey, height: getHeight(20.0)),
            ],
          ),
        ));
  }

  Column historyWidget({
    required String name,
    required String price,
    required int items,
    required String date,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: getWidth(20.0),
                fontWeight: FontWeight.w500,
                color: kBlack,
              ),
            ),
            Text(
              price.toString(),
              style: TextStyle(
                fontSize: getWidth(15.0),
                color: kBlack,
              ),
            )
          ],
        ),
        SizedBox(height: getHeight(8.0)),
        Text(
          date.toString(),
          style: TextStyle(
            color: kDeepGrey,
            fontSize: getWidth(12.0),
          ),
        ),
        SizedBox(height: getHeight(8.0)),
        Text(
          items.toString(),
          style: TextStyle(
            color: kDeepGrey,
            fontSize: getWidth(12.0),
          ),
        ),
      ],
    );
  }
}
