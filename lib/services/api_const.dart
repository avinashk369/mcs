class ApiConst {
//"http://192.168.43.170:3000/";
//"https://mcs-rest-api.herokuapp.com/";
  /// online canteen api base url
  /// https://onlinecanteen.in/canteen_api/Api_controller/GetCity
  static const String apiUrl = "https://onlinecanteen.in/tentionfreekart/";

  static const String cityList = 'Api_controller/GetCity';

  static const String banners = 'Api_controller/GetBanner';
  static const String products = 'Api_controller/GetProducts';
  static const String searchProducts = 'Api_controller/SearchProducts';
  static const String login = 'Api_controller/EnterMobile';
  static const String otpVerify = 'Api_controller/VarifyOtp';
  static const String resendOtp = 'Api_controller/ResendOtp';
  static const String getCategory = 'Api_controller/GetCategory';
  static const String getSubCategory = 'Api_controller/GetSubCategory';
  static const String saveAddress = 'Api_controller/AddDeliveryAddress';
  static const String userRegisteration = 'Api_controller/UserRegistration';
  static const String applyCoupon = 'Api_controller/ApplyCoupon';
  static const String userAddress = 'Api_controller/GetDeliveryAddress';
  static const String shippingCharge = 'Api_controller/GetShippingCharge';
  static const String loadOrder = 'Api_controller/MyOrderList';
  static const String placeOrder = 'Api_controller/PlaceOrder';
  static const String orderDetail = 'Api_controller/OrderDetails';
  static const String currentCity = 'Api_controller/GetCurrentCity';
}
