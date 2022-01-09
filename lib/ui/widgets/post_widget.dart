import 'package:take_out_app/constants/imports.dart';

class PostWidget extends StatelessWidget {
  PostWidget({required this.data});
  FoodData data;
  Map<String, List<Widget>> widgets = {
    "leaders": [
      Positioned(
        child: Ink(
          width: getWidth(47.0),
          height: getHeight(47.0),
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('https://source.unsplash.com/random/1')),
            border: Border.all(
              color: Colors.white,
              width: getWidth(3.0),
            ),
            shape: BoxShape.circle,
          ),
        ),
        right: getWidth(5.0),
        bottom: getHeight(16.0),
      ),
      Positioned(
        child: Ink(
          width: getWidth(47.0),
          height: getHeight(47.0),
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('https://source.unsplash.com/random/2')),
            border: Border.all(
              color: Colors.white,
              width: getWidth(3.0),
            ),
            shape: BoxShape.circle,
          ),
        ),
        right: getWidth(35.0),
        bottom: getHeight(16.0),
      ),
      Positioned(
        child: Ink(
          width: getWidth(47.0),
          height: getHeight(47.0),
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('https://source.unsplash.com/random/4')),
            border: Border.all(
              color: Colors.white,
              width: getWidth(3.0),
            ),
            shape: BoxShape.circle,
          ),
        ),
        right: getWidth(70.0),
        bottom: getHeight(16.0),
      ),
      Positioned(
        child: Container(
            alignment: Alignment.center,
            width: getWidth(26.0),
            height: getHeight(26.0),
            decoration: BoxDecoration(
              color: kBronze.withOpacity(0.7),
              border: Border.all(
                color: Colors.white,
                width: getWidth(3),
              ),
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: getWidth(9.0),
              child: Text(
                "3rd",
                style: TextStyle(
                  fontSize: getWidth(8.0),
                  color: Colors.white,
                ),
              ),
              backgroundColor: kBronze,
            )),
        right: getWidth(10.0),
        bottom: 0.0,
      ),
      Positioned(
        child: Container(
            alignment: Alignment.center,
            width: getWidth(26.0),
            height: getHeight(26.0),
            decoration: BoxDecoration(
              color: kSilverSycee.withOpacity(0.7),
              border: Border.all(
                color: Colors.white,
                width: getWidth(3),
              ),
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: getWidth(9.0),
              child: Text(
                "2nd",
                style: TextStyle(
                  fontSize: getWidth(8.0),
                  color: Colors.white,
                ),
              ),
              backgroundColor: kSilverSycee,
            )),
        right: getWidth(43.0),
        bottom: 0.0,
      ),
      Positioned(
        child: Container(
            alignment: Alignment.center,
            width: getWidth(26.0),
            height: getHeight(26.0),
            decoration: BoxDecoration(
              color: kYellowDragon.withOpacity(0.7),
              border: Border.all(
                color: Colors.white,
                width: getWidth(3),
              ),
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: getWidth(9.0),
              child: Text(
                "1st",
                style: TextStyle(
                  fontSize: getWidth(8.0),
                  color: Colors.white,
                ),
              ),
              backgroundColor: kYellowDragon,
            )),
        right: getWidth(79.0),
        bottom: 0.0,
      ),
    ],
    "simple": [],
    "express": [
      Positioned(
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(getWidth(10.0)),
            color: kLightGrey,
          ),
          width: getWidth(93.0),
          height: getHeight(60.0),
          child: Column(
            children: [
              const Spacer(flex: 11),
              Text(
                Random().nextInt(6).toString(),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: getWidth(22.0),
                ),
              ),
              const Spacer(flex: 8),
              Text(
                'Restaurants',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: getWidth(12.0),
                ),
              ),
              const Spacer(flex: 11),
            ],
          ),
        ),
        bottom: 0.0,
        right: getWidth(5.0),
      )
    ]
  };
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return _getStack();
  }

  Stack _getStack() {
    List<Widget> list = widgets[data.category]!;
    return Stack(
        children: [
              SizedBox(
                width: getWidth(335.0),
                height: getHeight(218.0),
              ),
              Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(getWidth(10.0)),
                  image: DecorationImage(
                    image: NetworkImage(data.imagePath!),
                    fit: BoxFit.cover,
                  ),
                ),
                width: getWidth(335.0),
                height: getHeight(150.0),
              ),
              Positioned(
                left: getWidth(5.0),
                bottom: getHeight(38.0),
                child: Text(
                  'Katsuei',
                  style: TextStyle(
                    color: kBlack,
                    fontSize: getWidth(22.0),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                left: getWidth(82.26),
                bottom: getHeight(38.0),
                child: data.category != 'simple'
                    ? Image.asset(
                        'assets/icons/premium-icon-wok-1318529.png',
                        height: getHeight(22.74),
                        width: getWidth(22.74),
                      )
                    : const SizedBox.shrink(),
              ),
              Positioned(
                left: getWidth(5.0),
                bottom: getHeight(19.5),
                child: Text(
                  data.name!,
                  style: const TextStyle(color: kDeepGrey),
                ),
              ),
              Positioned(
                bottom: getHeight(0.5),
                left: getWidth(5.0),
                child: Text(
                  '${data.preparationTime![0]}-${data.preparationTime![1]} min • \$${data.price!} Delivery • ☆${data.rating}',
                  style: TextStyle(
                    color: kDeepGrey,
                    fontWeight: FontWeight.w400,
                    fontSize: getWidth(12.0),
                  ),
                ),
              ),
            ] +
            list);
  }
}
