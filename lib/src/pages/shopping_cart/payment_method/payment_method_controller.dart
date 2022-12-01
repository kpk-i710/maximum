import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

enum DeliveryOrPayment { DELIVERY, PAYMENT }

class PaymentMethodController extends GetxController {
  RxBool status = false.obs;
  RxBool isSelectedDelivryMethod = false.obs;
  RxBool isSelectedPaymentMethod = false.obs;

  bool currentStatusButton(DeliveryOrPayment select) {
    if (select == DeliveryOrPayment.DELIVERY) {
      return isSelectedDelivryMethod.value;
    } else
      return isSelectedPaymentMethod.value;
  }

  var demoList = <bool>[
    false,
    false,
    false,
    false,
  ].obs;
}
