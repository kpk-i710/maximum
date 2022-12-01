import 'app_model.dart';

enum OrderStatus { NOT_VERIFIED, VERIFIED, NOT_PAID, PAID, CANCELED, COMPLETED }

class Order extends AppModel {
  String? date;
  String? deliveryDate;
  double? price;
  double? paidPrice;
  OrderStatus? status;

  Order(
      {id,
      this.date,
      this.deliveryDate,
      this.price,
      this.paidPrice,
      this.status})
      : super(id: id);

  Order.fromMap(Map<String, dynamic> map) {
    date = map['date'] ?? '';
    deliveryDate = map['delivery_date'] ?? '';
    price = map['price'] ?? 0.0;
    paidPrice = map['paid'] ?? 0.0;
    status = int.parse(map['status']) as OrderStatus;
  }

  fromMap(map) {
    return Order.fromMap(map);
  }

  @override
  toMap() {
    return {
      'id': id,
      'date': date,
      'delivery_date': deliveryDate,
      'price': price,
      'paid': paidPrice
    };
  }
}
