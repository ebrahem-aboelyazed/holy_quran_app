class EndPoints {
  EndPoints._();

  /// Base Url
  // static const String baseUrl = 'https://mongzsa.com/api/v1/';

  //777666000
  //567567
  // static const String baseUrl = 'https://mongz.site/api/v1/';

  // حسابات للانشطة على الموقع الجديد
  // Username : 777788881 - Password : 123456 - منجز 7 للمطاعم
  // Username : 777788882 - Password : 123456 - منجز 7 للتأجير
  // Username : 777788883 - Password : 123456 - منجز 7 محطات الوقود
  // Username : 777788884 - Password : 123456 - منجز 7 بيع التجزئة
  static const String baseUrl = 'https://monjez.sa/api/v1/';

  /*
  https://mongz.site/
  Username : 111133331 - Password : 123456 - منجز 7 للمطاعم
  Username : 111133332 - Password : 123456 - منجز 7 للتأجير
  Username : 111133333 - Password : 123456 - منجز 7 محطات الوقود
  Username : 111133334 - Password : 123456 - منجز 7 بيع التجزئة
  **/

  // static const String baseUrl = 'http://18.232.250.211:3000/api/v1/';
  //

  // Username : 54000000013
  // Password : 123321

  // https://mongz.site/
  //static const String baseUrl = 'https://54.157.41.19/api/v1/';
  //static const String baseUrl = 'http://18.232.250.211:3000/api/v1/';

  static const String baseSellersUrl = '${baseUrl}sellers/';

  /// Endpoints
  static const String loginUser = 'signin';
  static const String orderConstants = 'orders-constants';
  static const String users = 'users';
  static String products = 'products';
  static const String restautantsProducts = 'restautants-selling-products';
  static const String services = 'services';
  static const String categories = 'select-categories';
  static const String floors = 'select-floors';
  static const String tables = 'select-tables';
  static String orders = 'orders';

  static String restaurantsOrders = 'restaurant-orders';

  static String addPendingOrder = 'restaurant-orders-without-payment';
  static const String returnOrder = 'client-returns';
  static const String receiveRentOrder = 'orders';
  static const String addOfferPath = 'offer-price';
  static const String invoices = 'restaurant-orders';
  static const String allInvoices = 'orders';
  static const String clients = 'select-clients';
  static const String canAddClients = 'sellers/check-permission/ADDCLIENT';
  static const String addClient = 'clients';
  static const String addProduct = 'fast-products';
  static const String addService = 'services';
  static const String addLaterPayment = 'later-payments';
  static const String productLocation = 'select-product-location';
  static const String validateOrder = 'check-orders';
}
