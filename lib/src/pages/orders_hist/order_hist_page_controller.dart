import 'package:get/get.dart';
import 'package:maxkgapp/src/models/order.dart';

class OrderHistPageController extends GetxController {
  final orderList = <Order>[
    Order(
        id: '234',
        date: '11.02.2021 16:59',
        deliveryDate: '12.02.2021 16:59',
        price: 100.0,
        paidPrice: 0.0,
        status: OrderStatus.COMPLETED),
    Order(
        id: '234',
        date: '11.02.2021 16:59',
        deliveryDate: '12.02.2021 16:59',
        price: 100.0,
        paidPrice: 50.0,
        status: OrderStatus.CANCELED),
    Order(
        id: '234',
        date: '11.02.2021 16:59',
        deliveryDate: '12.02.2021 16:59',
        price: 1000.0,
        paidPrice: 0.0,
        status: OrderStatus.COMPLETED),
  ].obs;

  @override
  void onClose() {
    orderList.close();
    super.onClose();
  }
}
