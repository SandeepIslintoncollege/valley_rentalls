import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:provider/provider.dart';
import 'package:valleyrentals/pages/add_faq_page.dart';
import 'package:valleyrentals/pages/edit_faq_page.dart';
import 'package:valleyrentals/pages/faq_page.dart';
import 'package:valleyrentals/pages/khalti_payment_page.dart';
import 'package:valleyrentals/pages/room_detail_map_page.dart';
import 'package:valleyrentals/pages/add_rent_floor_page.dart';
import 'package:valleyrentals/pages/auth_page.dart';
import 'package:valleyrentals/pages/edit_profile_page.dart';
import 'package:valleyrentals/pages/edit_rent_floor_page.dart';
import 'package:valleyrentals/pages/update_password_page.dart';
import 'package:valleyrentals/pages/dashboard_page.dart';
import 'package:valleyrentals/pages/my_rents_edit_page.dart';
import 'package:valleyrentals/pages/rent_floor_detail_page.dart';
import 'package:valleyrentals/pages/search_page_by_address_page.dart';
import 'package:valleyrentals/pages/splash_page.dart';
import 'package:valleyrentals/providers/faqs.dart';
import 'package:valleyrentals/providers/profile_provider.dart';
import 'package:valleyrentals/providers/rooms_provider.dart';
import 'package:valleyrentals/services/shared_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Rooms>(
          create: (context) => Rooms(),
        ),
        ChangeNotifierProvider<ProfileProvider>(
          create: (context) => ProfileProvider(),
        ),
        ChangeNotifierProvider<Faqs>(
          create: (context) => Faqs(),
        ),
      ],
      child: KhaltiScope(
        publicKey: "test_public_key_838f3eccb49044dda55c4b505a94bc51",
        builder: (context, navigatorKey) {
          return MaterialApp(
            navigatorKey: navigatorKey,
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('ne', 'NP'),
            ],
            localizationsDelegates: const [
              KhaltiLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch().copyWith(
                primary: SharedService.primaryColor,
              ),
            ),
            home: const SplashPage(),
            routes: {
              SplashPage.routeName: (context) => const SplashPage(),
              AuthPage.routeName: (context) => const AuthPage(),
              DashboardPage.routeName: (context) => const DashboardPage(),
              EditProfilePage.routeName: (context) => const EditProfilePage(),
              UpdatePasswordPage.routeName: (context) =>
                  const UpdatePasswordPage(),
              RentFloorDetailPage.routeName: (context) =>
                  const RentFloorDetailPage(),
              SearchPageAddress.routeName: (context) =>
                  const SearchPageAddress(),
              AddRentPage.routeName: (context) => const AddRentPage(),
              MyRentEditPage.routeName: (context) => const MyRentEditPage(),
              EditRentFloorPage.routeName: (context) =>
                  const EditRentFloorPage(),
              RoomDetailMapPage.routeName: (context) =>
                  const RoomDetailMapPage(),
              KhaltiPaymentPage.routeName: (context) =>
                  const KhaltiPaymentPage(),
              FaqPage.routeName: (context) => const FaqPage(),
              AddFAQPage.routeName: (context) => const AddFAQPage(),
              EditFaqPage.routeName: (context) => const EditFaqPage(),
            },
          );
        },
      ),
    );
  }
}
