import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treyd_crypto/modules/deposit-crypto/view/confirm_deposit_page.dart';
import 'package:treyd_crypto/modules/deposit-crypto/view/deposit_crypto_page.dart';
import 'package:treyd_crypto/modules/deposit-crypto/view/deposit_crypto_transaction_page.dart';
import 'package:treyd_crypto/modules/deposit-fiat/view/deposit_fiat_page.dart';
import 'package:treyd_crypto/modules/deposit-fiat/view/select_deposit_fiat_card_page.dart';
import 'package:treyd_crypto/modules/home/view/home_page.dart';
import 'package:treyd_crypto/modules/login-register/view/create_user_page.dart';
import 'package:treyd_crypto/modules/login-register/view/forgot_password_page.dart';
import 'package:treyd_crypto/modules/login-register/view/login_page.dart';
import 'package:treyd_crypto/modules/login-register/view/change_pass_page.dart';
import 'package:treyd_crypto/modules/login-register/view/otp_page.dart';
import 'package:treyd_crypto/modules/login-register/view/otp_reg_page.dart';
import 'package:treyd_crypto/modules/login-register/view/register_page.dart';
import 'package:treyd_crypto/modules/login-register/view/transaction_pin_page.dart';
import 'package:treyd_crypto/modules/login-register/view/welcome_user_page.dart';
import 'package:treyd_crypto/modules/onboarding/view/onboarding_page.dart';
import 'package:treyd_crypto/modules/profile/view/preferences_page.dart';
import 'package:treyd_crypto/modules/search/view/search_page.dart';
import 'package:treyd_crypto/modules/shop/view/buy_now_page.dart';
import 'package:treyd_crypto/modules/shop/view/confirm_order_page.dart';
import 'package:treyd_crypto/modules/shop/view/shop_page.dart';
import 'package:treyd_crypto/modules/splash/view/splash_page.dart';
import 'package:treyd_crypto/modules/swap/view/swap_page.dart';
import 'package:treyd_crypto/modules/trade/view/trade_page.dart';
import 'package:treyd_crypto/modules/transfer-crypto/view/confirm_crypto_page.dart';
import 'package:treyd_crypto/modules/transfer-crypto/view/confirm_transaction_page.dart';
import 'package:treyd_crypto/modules/transfer-crypto/view/transfer_crypto_page.dart';
import 'package:treyd_crypto/modules/transfer-fiat/view/fiat_transaction_page.dart';
import 'package:treyd_crypto/modules/transfer-fiat/view/select_fiat_account_page.dart';
import 'package:treyd_crypto/modules/transfer-fiat/view/transfer_fiat_page.dart';
import 'package:treyd_crypto/modules/wallet/view/wallet_page.dart';
import '../modules/bottom_navigation/view/bottom_navigation_page.dart';
import '../modules/deposit-fiat/view/fiat_deposit_transaction_page.dart';
import '../modules/notification/view/notification_page.dart';
import '../modules/profile/view/account_page.dart';
import '../modules/profile/view/my_profile_page.dart';
import '../modules/profile/view/security_page.dart';
import '../modules/shop/view/product_detail_page.dart';
import '../modules/shop/view/product_search_page.dart';
import '../modules/swap/view/swap_confirm_page.dart';
import 'app_routes.dart';

class AppPages extends Routes {
  static final pages = [
    GetPage(name: Routes.INITIAL, page: () => SplashPage()),
    GetPage(name: Routes.ONBOARDING, page: () => OnboardingPage()),
    GetPage(name: Routes.LOGIN, page: () => LoginPage()),
    GetPage(name: Routes.FORGOT_PASSWORD, page: () => ForgotPasswordPage()),
    GetPage(name: Routes.OTP, page: () => OtpPage()),
    GetPage(name: Routes.OTP_REG, page: () => OtpRegPage()),
    GetPage(name: Routes.CHANGE_PASSWORD, page: () => ChangePassPage()),
    GetPage(name: Routes.WELCOME_BACK_USER, page: () => WelcomeUserPage()),
    GetPage(name: Routes.REGISTER, page: () => RegisterPage()),
    GetPage(name: Routes.TRANSACTION_PIN, page: () => TransactionPinPage()),
    GetPage(name: Routes.CREATE_USER, page: () => CreateUserPage()),
    GetPage(name: Routes.HOME, page: () => HomePage()),
    GetPage(name: Routes.TRADE, page: () => TradePage()),
    GetPage(name: Routes.WALLET, page: () => WalletPage()),
    GetPage(name: Routes.SHOP, page: () => ShopPage()),
    GetPage(name: Routes.TRANSFER_CRYPTO, page: () => TransferCryptoPage()),
    GetPage(name: Routes.TRANSFER_FIAT, page: () => TransferFiatPage()),
    GetPage(name: Routes.SELECT_FIAT, page: () => SelectFiatAccountPage()),
    GetPage(name: Routes.PRODUCT_DETAIL, page: () => ProductDetailPage()),
    GetPage(name: Routes.BUY_NOW, page: () => BuyNowPage()),
    GetPage(name: Routes.CONFIRM_ORDER, page: () => ConfirmOrderPage()),
    GetPage(
        name: Routes.SELECT_DEPOSIT_FIAT,
        page: () => SelectDepositFiatCardPage()),
    GetPage(
      name: Routes.CONFIRM_CRYPTO,
      page: () => ConfirmCryptoPage(),
    ),
    GetPage(
      name: Routes.CONFIRM_DEPOSIT,
      page: () => ConfirmDepositPage(),
    ),
    GetPage(
      name: Routes.DEPOSIT_CRYPTO,
      page: () => DepositCryptoPage(),
    ),
    GetPage(
      name: Routes.DEPOSIT_FIAT,
      page: () => DepositFiatPage(),
    ),
    GetPage(name: Routes.BOTTOM_NAVIGATION, page: () => BottomNavigationPage()),
    GetPage(
        name: Routes.CONFIRM_TRANSACTION, page: () => ConfirmTransactionPage()),
    GetPage(name: Routes.FIAT_TRANSACTION, page: () => FiatTransactionPage()),
    GetPage(
        name: Routes.FIAT_DEPOSIT_TRANSACTION,
        page: () => FiatDepositTransactionPage()),
    GetPage(
        name: Routes.CRYPTO_DEPOSIT_TRANSACTION,
        page: () => DepositCryptoTransactionPage()),
    GetPage(name: Routes.SEARCH, page: () => SearchPage()),
    GetPage(name: Routes.PRODUCT_SEARCH, page: () => ProductSearchPage()),
    GetPage(name: Routes.SWAP, page: () => SwapPage()),
    GetPage(
      name: Routes.ACCOUNT,
      page: () => AccountPage(),
    ),
    GetPage(
      name: Routes.SECURITY,
      page: () => SecurityPage(),
    ),
    GetPage(name: Routes.SWAP_CONFIRM, page: () => SwapConfirmPage()),
    GetPage(name: Routes.MY_PROFILE, page: () => MyProfilePage()),
    GetPage(name: Routes.PREFERENCES, page: () => PreferencesPage()),
    GetPage(name: Routes.NOTIFICATION, page: () => NotificationPage()),
  ];

  static GetPageRoute<dynamic> generateRoute(RouteSettings settings) =>
      getRoute(settings);
/*  static final GoRouter router = GoRouter(
    routes: [

      GoRoute(
        path: Routes.INITIAL,
        builder: (context, state) => const RootPage(),
        routes: [
          GoRoute(
            path: Routes.SUPER_ADMIN_DASHBOARD,
            builder: (context, state) => const SuperAdminDashboardPage(),
          )
        ],
        redirect: (state) {
          final authModel = Get.find<AuthService>().authModel;
          if(authModel != null ){
           return Routes.INITIAL;
          }
          else{
            return "/login";
          }

        }
      ),
      GoRoute(
        path: Routes.INITIAL,
        builder: (context, state) => LoginPage(),
      ),
    ],
  );
  */
// static GetPageRoute<dynamic> generateSuperAdminRoute(RouteSettings settings) => getSuperAdminRoute(settings);
// static GetPageRoute<dynamic> generateEmployeeRoute(RouteSettings settings) => getEmployeeRoute(settings);
}

GetPageRoute<dynamic> getRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.HOME:
      return _getPageRoute(HomePage());

    case Routes.WALLET:
      return _getPageRoute(
        WalletPage(),
      );
    case Routes.TRADE:
      return _getPageRoute(
        TradePage(),
      );
    case Routes.SHOP:
      return _getPageRoute(ShopPage());

    default:
      return _getPageRoute(HomePage());
  }
}

GetPageRoute _getPageRoute(Widget child, {Bindings? bindings}) {
  return GetPageRoute(page: () => child, binding: bindings);
}
