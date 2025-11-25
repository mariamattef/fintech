import 'package:fintech/core/not_found.dart';
import 'package:fintech/core/splash.dart';
import 'package:fintech/features/auth/presentation/screens/login_screen.dart';
import 'package:fintech/features/auth/presentation/screens/register_screen.dart';
import 'package:fintech/features/home/buy_crypto_screen.dart';
import 'package:fintech/features/home/presentation/screens/coin_details_screen.dart';
import 'package:fintech/features/home/presentation/screens/crypto_home_screen.dart';
import 'package:fintech/features/market/presentation/screens/market_screen.dart';
import 'package:fintech/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:fintech/features/portfolio/presentation/screens/portfolio_screen.dart';
import 'package:fintech/features/settings/presentation/screens/settings_screen.dart';
import 'package:fintech/root.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static final Map<String, WidgetBuilder> routes = {
    Root.routeName: (context) => const Root(),
    CryptoHomeScreen.routeName: (context) => const CryptoHomeScreen(),
    CoinDetailsScreen.routeName: (context) => const CoinDetailsScreen(),
    MarketScreen.routeName: (context) => const MarketScreen(),
    PortfolioScreen.routeName: (context) => const PortfolioScreen(),
    SettingsScreen.routeName: (context) => const SettingsScreen(),
    BuyCryptoScreen.routeName: (context) => const BuyCryptoScreen(),
    Splash.routename: (context) => const Splash(),
    OnBoardingScreen.routename: (context) => const OnBoardingScreen(),
    LoginScreen.routename: (context) => const LoginScreen(),
    RegisterScreen.routename: (context) => const RegisterScreen(),

    // PaymentMethodScreen.routeName: (context) => const PaymentMethodScreen(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final builder = routes[settings.name];
    if (builder != null) {
      return MaterialPageRoute(builder: builder);
    }
    return MaterialPageRoute(builder: (context) => const NotFound());
  }
}
