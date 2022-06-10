import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumiaa/views/HomeLayout/view.dart';
import 'package:jumiaa/views/address/cubits/cubits.dart';
import 'package:jumiaa/views/cart/cubits/cubits.dart';
import 'package:jumiaa/views/categroy/cubits/controller.dart';
import 'package:jumiaa/views/contacts/cubits/cubits.dart';
import 'package:jumiaa/views/edit_profile/cubits/cubits.dart';
import 'package:jumiaa/views/favourite/cubits/cubits.dart';
import 'package:jumiaa/views/home/cubits/controller.dart';
import 'package:jumiaa/views/homeSearch/cubits/controller.dart';
import 'package:jumiaa/views/login/cubits/LoginController.dart';
import 'package:jumiaa/views/login/view.dart';
import 'package:jumiaa/views/notifcations/cubits/cubits.dart';
import 'package:jumiaa/views/prodductDetails/cubits/cubits.dart';
import 'package:jumiaa/views/profile/cubits/cubits.dart';
import 'package:jumiaa/views/signup/cubits/signUpController.dart';
import 'package:jumiaa/views/signup/view.dart';
import 'package:jumiaa/views/splash/view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/langs',
        // <-- change the path of the translation files
        fallbackLocale: Locale('en'),
        saveLocale: true,
        child: MAIN()
    ),
  );
}


class MAIN extends StatelessWidget {
  SearchController searchController= SearchController();

  @override
  Widget build(BuildContext context) {

    context.setLocale(Locale("en"));
    return MultiBlocProvider(

      providers: [

        BlocProvider(
          create: (context) => CategoryController()..function(),
        ),
        BlocProvider(
          create: (context) =>
          Controller()
            ..function(),

        ),
        BlocProvider(
          create: (context) =>
          SearchController(),

        ),
        BlocProvider(
            create: (context)=>
            NotificationsController()..function()),
        BlocProvider(
            create: (context)=>
            ContactsController()..function()),

        BlocProvider(
            create: (context)=>
            FavouriteCubit()..function()),
        BlocProvider(
            create: (context)=>
            CounterController()..add()),
        BlocProvider(
            create: (context)=>
            CounterController()..subtract()),
        BlocProvider(
            create: (context)=>
            CartCubit()..function()),
        BlocProvider(
            create: (context)=>
            AddressCubit()..getAddress()),
        BlocProvider(
            create: (context)=>
            EditProfileController()),
        BlocProvider(
            create: (context)=>
            ProfileController()..getProfile()),

      ],
      child: MaterialApp(

        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: HomeLayout(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
// - images/a_dot_burr.jpeg
// - images/a_dot_ham.jpeg