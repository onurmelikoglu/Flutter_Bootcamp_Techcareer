import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceryshopping/ui/cubit/bottomnavigation_cubit.dart';
import 'package:groceryshopping/ui/cubit/detailpage_cubit.dart';
import 'package:groceryshopping/ui/cubit/fortunewheel_cubit.dart';
import 'package:groceryshopping/ui/cubit/homepage_cubit.dart';
import 'package:groceryshopping/ui/cubit/loginpage_cubit.dart';
import 'package:groceryshopping/ui/cubit/shoppingcartpage_cubit.dart';
import 'package:groceryshopping/ui/cubit/signuppage_cubit.dart';
import 'package:groceryshopping/ui/cubit/userprofile_cubit.dart';
import 'package:groceryshopping/ui/views/splash_screen.dart';
import 'package:groceryshopping/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: invalid_use_of_visible_for_testing_member
  SharedPreferences.setMockInitialValues({});
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomepageCubit()),
        BlocProvider(create: (context) => DetailPageCubit()),
        BlocProvider(create: (context) => LoginPageCubit()),
        BlocProvider(create: (context) => SignUpPageCubit()),
        BlocProvider(create: (context) => ShoppingCartPageCubit()),
        BlocProvider(create: (context) => UserProfileCubit()),
        BlocProvider(create: (context) => BottomNavigationCubit()),
        BlocProvider(create: (context) => FortuneWheelCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
