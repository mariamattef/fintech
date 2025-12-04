import 'package:fintech/core/not_found.dart';
import 'package:fintech/core/routting/routes_contants.dart';
import 'package:fintech/core/splash.dart';
import 'package:fintech/features/login/presentation/screens/face_id_screen.dart';
import 'package:fintech/features/login/presentation/screens/faceid_verified_screen.dart';
import 'package:fintech/features/login/presentation/screens/fingure_print_screen.dart';
import 'package:fintech/features/login/presentation/screens/fingure_verified_screen.dart';
import 'package:fintech/features/auth/presentation/screens/login_screen.dart';
import 'package:fintech/features/auth/presentation/screens/register_screen.dart';
import 'package:fintech/features/register/presentation/screens/set_faceid_or_skip_screen.dart';
import 'package:fintech/features/home/buy_crypto_screen.dart';
import 'package:fintech/features/home/presentation/screens/crypto_home_screen.dart';
import 'package:fintech/features/market/presentation/screens/coin_details_screen.dart';
import 'package:fintech/features/market/presentation/screens/market_screen.dart';
import 'package:fintech/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:fintech/features/portfolio/presentation/screens/portfolio_screen.dart';
import 'package:fintech/features/register/presentation/screens/set_faceid_screen.dart';
import 'package:fintech/features/register/presentation/screens/set_faceid_verified.dart';
import 'package:fintech/features/register/presentation/screens/set_fingure_print_screen.dart';
import 'package:fintech/features/register/presentation/screens/set_fingure_verified.dart';
import 'package:fintech/features/settings/presentation/screens/settings_screen.dart';
import 'package:fintech/root.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static final Map<String, WidgetBuilder> routes = {
    RoutesContants.root: (context) => const Root(),
    RoutesContants.home: (context) => const CryptoHomeScreen(),
    RoutesContants.coinDetails: (context) => const CoinDetailsScreen(),
    RoutesContants.market: (context) => const MarketScreen(),
    RoutesContants.portfolio: (context) => const PortfolioScreen(),
    RoutesContants.settings: (context) => const SettingsScreen(),
    RoutesContants.buyCrypto: (context) => const BuyCryptoScreen(),
    RoutesContants.splash: (context) => const Splash(),
    RoutesContants.onboarding: (context) => const OnBoardingScreen(),
    RoutesContants.login: (context) => const LoginScreen(),
    RoutesContants.register: (context) => const RegisterScreen(),
    RoutesContants.faceId: (context) => const FaceIdScreen(),
    RoutesContants.setFaceidOrSkip: (context) => const SetFaceidOrSkipScreen(),
    RoutesContants.setFaceid: (context) => const SetFaceidScreen(),
    RoutesContants.setFaceidVerified: (context) => const SetFaceidVerified(),
    RoutesContants.faceidVerified: (context) => const FaceidVerifiedScreen(),
    RoutesContants.fingureVerified: (context) => const FingureVerifiedScreen(),
    RoutesContants.setFingurePrintVerified: (context) =>
        const SetFingureVerified(),
    RoutesContants.fingurePrint: (context) => const FingurePrintScreen(),
    RoutesContants.setFingurePrint: (context) => const SetFingurePrintScreen(),

    // RoutesContants.paymentMethod: (context) => const PaymentMethodScreen(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final builder = routes[settings.name];
    if (builder != null) {
      return MaterialPageRoute(builder: builder);
    }
    return MaterialPageRoute(builder: (context) => const NotFound());
  }
}
