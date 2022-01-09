import 'package:take_out_app/constants/imports.dart';

class NearbyPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: getHeight(22.0)),
        _posts(),
      ],
    );
  }

  _posts() {
    return FutureBuilder(
      future: Api('foods').getDocuments(),
      builder: (context, AsyncSnapshot<List<FoodData>> snapshot) {
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
    );
  }
}
