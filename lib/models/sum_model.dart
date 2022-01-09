import 'package:take_out_app/constants/imports.dart';
class PaymentModel {
  List<FoodData>? foods;
  double _taxes=1.48;
  double _deliveryFee=1.99;
  PaymentModel(this.foods);
  summa(){
    double payment=0.0;
    if(foods!.isEmpty){
      return 0;
    }
    foods!.forEach((element) {
      payment+=element.price!;
     });
     payment+=_taxes;
     payment+=_deliveryFee;
     return payment;
  }
}