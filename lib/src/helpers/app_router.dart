import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../pages/banner/listBanner.dart';
import '../pages/cart_deprecated/cart_page.dart';
import '../pages/cart_deprecated/delivery_method_page.dart';
import '../pages/cart_deprecated/payment_method_page.dart';
import '../pages/discounts/discount_page_list_view.dart';
import '../pages/map/map_page.dart';
import '../pages/news/level_below/news_list_page.dart';
import '../pages/news/level_below/level_below/page_news.dart';
import '../pages/support_service/support_service_page.dart';
import '../pages/support_service/whatsapp_contacts_page.dart';
import '../pages/user/add_address/add_address_page.dart';
import '../pages/user/add_phone/add_phone_page.dart';
import '../pages/info/info_page.dart';
import '../pages/intro/intro_page.dart';
import '../pages/user/personal_data/personal_data_page.dart';
import '../pages/auth/auth_page.dart';
import '../pages/current_orders/current_orders_page.dart';
import '../pages/discounts/discount_page.dart';
import '../pages/filter/filter_page.dart';
import '../pages/help_to_buyer/help_to_buyer_page.dart';
import '../pages/favorite/favorite_page.dart';
import '../pages/orders_hist/orders_hist_page.dart';
import '../pages/products_by_catalog/products_by_catalog_page.dart';
import '../pages/user/profile/profile_page.dart';
import '../pages/search/search_page.dart';
import '../pages/test/test_page.dart';
import '../pages/discounts/discounts_list_page.dart';
import '../pages/notifications/notifications_page.dart';
import '../pages/verify_code/verify_page.dart';
import '../pages/main/main_page.dart';
import '../pages/current_orders/order_page/order_page.dart';
import '../pages/user/profile_params/profile_params_page.dart';
import '../helpers/prefs.dart';

class AppRouter {
  static const String pageNews = '/pageNews';
  static const String listNews = '/newsList';
  static const String listBanners = '/listBanner';
  static const String main = '/main';
  static const String intro = '/intro';
  static const String test = '/test';
  static const String auth = '/auth';
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
  static const String notifications = '/notifications';
  static const String order = '/order';
  static const String deliveryAndTerms = '/delivery_and_terms';
  static const String paymentAndInstallments = '/payment_and_installments';
  static const String pickupPoints = '/pickup_points';
  static const String organizationsAndBusiness = '/organizations_and_business';
  static const String faq = '/faq';
  static const String aboutCompany = '/about_company';
  static const String contacts = '/contacts';
  static const String saleRules = '/sale_rules';
  static const String suppliersAndManufacturers = '/suppliers_and_manufacturers';
  static const String vacancy = '/vacancy';
  static const String personalData = '/personal_data';
  static const String addPhone = '/add_phone';
  static const String addAddress = '/add_address';
  static const String supportService = '/support_service';
  static const String whatsappContacts = '/whatsapp_contacts';
  static const String deliveryMethod = '/delivery_method';
  static const String paymentMethod = '/payment_method';
  static const String map = '/map';

  static String get initialRoute => Prefs.firstTime ? intro : main;

  static final pages = [

    GetPage(name: listNews, page: () => NewsListPage()),
    GetPage(name: listBanners, page: () => listBanner()),
    GetPage(name: test, page: ()  => TestPage()),
    GetPage(name: auth, page: () => AuthPage()),
    GetPage(name: main, page: () => MainPage()),
    GetPage(name: intro, page: () => IntroPage()),

    GetPage(
        name: productsByCatalog,
        page: () => ProductsByCatalogPage()),
    GetPage(name: search, page: () => SearchPage()),
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
    GetPage(name: verify, page: () => VerifyPage()),
    GetPage(name: notifications, page: () => NotificationsPage()),
    GetPage(name: order, page: () => OrderPage()),
    GetPage(name: personalData, page: () => PersonalDataPage()),
    GetPage(name: addPhone, page: () => AddPhonePage()),
    GetPage(name: addAddress, page: () => AddAddressPage()),
    GetPage(name: supportService, page: () => SupportServicePage()),
    GetPage(name: whatsappContacts, page: () => WhatsappContactsPage()),
    GetPage(name: deliveryMethod, page: () => DeliveryMethodPage()),
    GetPage(name: paymentMethod, page: () => PaymentMethodPage()),
    GetPage(name: map, page: () => MapPage()),

    GetPage(name: deliveryAndTerms,
        page: () => InfoPage(InfoPage.DELIVERY_AND_TERMS)),
    GetPage(name: paymentAndInstallments,
        page: () => InfoPage(InfoPage.PAYMENT_AND_INSTALLMENTS)),
    GetPage(name: pickupPoints,
        page: () => InfoPage(InfoPage.PICKUP_POINTS)),
    GetPage(name: organizationsAndBusiness,
        page: () => InfoPage(InfoPage.ORGANIZATIONS_AND_BUSINESS)),
    GetPage(name: faq,
        page: () => InfoPage(InfoPage.FAQ)),
    GetPage(name: aboutCompany,
        page: () => InfoPage(InfoPage.ABOUT_COMPANY)),
    GetPage(name: contacts,
        page: () => InfoPage(InfoPage.CONTACTS)),
    GetPage(name: saleRules,
        page: () => InfoPage(InfoPage.SALES_RULES)),
    GetPage(name: suppliersAndManufacturers,
        page: () => InfoPage(InfoPage.SUPPLIERS_AND_MANUFACTURERS)),
    GetPage(name: vacancy,
        page: () => InfoPage(InfoPage.VACANCY)),
  ];
}