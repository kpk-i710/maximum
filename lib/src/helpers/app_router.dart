import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:maxkgapp/src/pages/configurator/configurator.dart';
import 'package:maxkgapp/src/pages/network/network.dart';
import 'package:maxkgapp/src/pages/orders_history/orders_history_page.dart';
import 'package:maxkgapp/src/pages/user/notifications_settings/notifications_page.dart';
import 'package:maxkgapp/src/pages/user/organization/organization_page.dart';
import '../pages/auth/auth_enter_code/auth_enter_code.dart';
import '../pages/auth/auth_by_phone.dart';
import '../pages/auth/auth_page/auth_page.dart';
import '../pages/banner/listBanner.dart';
import '../pages/cart_deprecated/cart_page.dart';
import '../pages/cart_deprecated/delivery_method_page.dart';
import '../pages/shopping_cart/before_payment_delivry/payment_method/payment_method_page.dart';
import '../pages/discounts/discount_list_page/discounts_list_page.dart';
import '../pages/discounts/discount_list_page/discount_page_list_view/discount_page_list_view.dart';
import '../pages/map/map_page.dart';
import '../pages/news/all_news_page.dart';
import '../pages/between_pages_all/between_all_pages.dart';
import '../pages/promotions/all_promotions_page.dart';
import '../pages/shopping_cart/before_payment_delivry/shipping_methods/shipping_methods_page.dart';
import '../pages/support_service/support_service_page.dart';
import '../pages/support_service/whatsapp_contacts_page.dart';
import '../pages/user/add_address/add_address_page.dart';
import '../pages/user/add_phone/add_phone_page.dart';
import '../pages/info/info_page.dart';
import '../pages/intro/intro_page.dart';
import '../pages/user/personal_data/personal_data_page.dart';
import '../pages/current_orders/current_orders_page.dart';
import '../pages/filter/filter_page.dart';
import '../pages/help_to_buyer/help_to_buyer_page.dart';
import '../pages/favorite/favorite_page.dart';
import '../pages/products_by_catalog/products_by_catalog_page.dart';
import '../pages/user/profile/profile_page.dart';

import '../pages/test/test_page.dart';
import '../pages/notifications/notifications_page.dart';
import '../pages/main/main_page.dart';
import '../pages/current_orders/order_page/order_page.dart';
import '../pages/user/profile_params/profile_params_page.dart';
import '../helpers/prefs.dart';

class AppRouter {
  static const String spashScreen = '/spashScreen';
  static const String pageNews = '/pageNews';
  static const String netWork = '/netWork';
  static const String betweenAllPage = '/newsList';
  static const String listBanners = '/listBanner';
  static const String organizationPage = '/organizationPage';
  static const String main = '/main';
  static const String intro = '/intro';
  static const String test = '/test';
  static const String auth = '/auth';
  static const String shippingMethodsPage = '/shippingMethodsPage';
  static const String authByPhone = '/authByPhone';
  static const String authEnterCode = '/authEnterCode';
  static const String productDetails = '/product_details';
  static const String productsByCatalog = '/products_by_catalog';
  static const String search = '/search';
  static const String cart = '/cart';
  static const String profile = '/profile';
  static const String profileParams = '/profile_params';
  static const String filter = '/filter';
  static const String favorite = '/favorite';
  static const String helpToBuyer = '/help_to_buyer';
  static const String currentOrders = '/current_orders';
  static const String orderHist = '/order_hist';
  static const String discountList = '/discount_list';
  static const String discount = '/discount';
  static const String verify = '/verify';
  static const String notificationsDelivry = '/notifications';
  static const String configurator = '/configurator';
  static const String notifacationsPage = '/notifacationsPage';
  static const String order = '/order';
  static const String deliveryAndTerms = '/delivery_and_terms';
  static const String paymentAndInstallments = '/payment_and_installments';
  static const String pickupPoints = '/pickup_points';
  static const String organizationsAndBusiness = '/organizations_and_business';
  static const String faq = '/faq';
  static const String aboutCompany = '/about_company';
  static const String contacts = '/contacts';
  static const String saleRules = '/sale_rules';
  static const String allPromotionsPage = '/allPromotionsPage';
  static const String suppliersAndManufacturers =
      '/suppliers_and_manufacturers';
  static const String vacancy = '/vacancy';
  static const String allNewsPage = '/allNewsPage';
  static const String personalData = '/personal_data';
  static const String addPhone = '/add_phone';
  static const String addAddress = '/add_address';
  static const String supportService = '/support_service';
  static const String whatsappContacts = '/whatsapp_contacts';
  static const String deliveryMethod = '/delivery_method';
  static const String paymentMethod = '/payment_method';
  static const String map = '/map';

  static String get initialRoute => main;

  static final pages = [
    GetPage(name: configurator, page: () => Confugarator()),
    GetPage(name: netWork, page: () => NetWork()),
    GetPage(name: betweenAllPage, page: () => BetweenAllPages()),
    GetPage(name: listBanners, page: () => listBanner()),
    GetPage(name: organizationPage, page: () => OrganizationPage()),
    GetPage(name: test, page: () => TestPage()),
    GetPage(name: auth, page: () => AuthPage()),
    GetPage(name: shippingMethodsPage, page: () => ShippingMethodsPage()),
    GetPage(name: authByPhone, page: () => AuthByPhone()),
    GetPage(name: authEnterCode, page: () => AuthEnterCode()),
    GetPage(name: main, page: () => MainPage()),
    GetPage(name: intro, page: () => IntroPage()),
    GetPage(name: productsByCatalog, page: () => ProductsByCatalogPage()),

    GetPage(name: cart, page: () => CartPage()),
    GetPage(name: profile, page: () => ProfilePage()),
    GetPage(name: profileParams, page: () => ProfileParamsPage()),
    GetPage(
        name: filter,
        transition: Transition.downToUp,
        page: () => FilterPage()),
    GetPage(name: favorite, page: () => FavoritePage()),
    GetPage(name: helpToBuyer, page: () => HelpToBuyerPage()),
    GetPage(name: currentOrders, page: () => CurrentOrdersPage()),
    GetPage(name: orderHist, page: () => OrdersHistPage()),
    GetPage(name: discountList, page: () => DiscountsListPage()),
    GetPage(name: discount, page: () => DiscountPageListView()),
    GetPage(name: notificationsDelivry, page: () => NotificationsDelivryPage()),
    GetPage(name: notifacationsPage, page: () => NotifacationsPage()),
    GetPage(name: order, page: () => OrderPage()),
    GetPage(name: personalData, page: () => PersonalDataPage()),
    GetPage(name: addPhone, page: () => AddPhonePage()),
    GetPage(name: addAddress, page: () => AddAddressPage()),
    GetPage(name: supportService, page: () => SupportServicePage()),
    GetPage(name: whatsappContacts, page: () => WhatsappContactsPage()),
    GetPage(name: allNewsPage, page: () => AllNewsPage()),
    GetPage(name: deliveryMethod, page: () => DeliveryMethodPage()),
    GetPage(name: paymentMethod, page: () => PaymentMethodPage()),
    GetPage(name: map, page: () => MapPage()),
    GetPage(name: allPromotionsPage, page: () => AllPromotionsPage()),
    GetPage(
        name: deliveryAndTerms,
        page: () => InfoPage(InfoPage.DELIVERY_AND_TERMS)),
    GetPage(
        name: paymentAndInstallments,
        page: () => InfoPage(InfoPage.PAYMENT_AND_INSTALLMENTS)),
    GetPage(name: pickupPoints, page: () => InfoPage(InfoPage.PICKUP_POINTS)),
    GetPage(
        name: organizationsAndBusiness,
        page: () => InfoPage(InfoPage.ORGANIZATIONS_AND_BUSINESS)),
    GetPage(name: faq, page: () => InfoPage(InfoPage.FAQ)),
    GetPage(name: aboutCompany, page: () => InfoPage(InfoPage.ABOUT_COMPANY)),
    GetPage(name: contacts, page: () => InfoPage(InfoPage.CONTACTS)),
    GetPage(name: saleRules, page: () => InfoPage(InfoPage.SALES_RULES)),
    GetPage(
        name: suppliersAndManufacturers,
        page: () => InfoPage(InfoPage.SUPPLIERS_AND_MANUFACTURERS)),
    GetPage(name: vacancy, page: () => InfoPage(InfoPage.VACANCY)),
  ];
}
