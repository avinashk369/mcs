import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mcs/blocs/cart/cart_bloc.dart';
import 'package:mcs/blocs/category/categorybloc.dart';
import 'package:mcs/blocs/data/data_bloc.dart';
import 'package:mcs/blocs/navigation/navigationbloc.dart';
import 'package:mcs/resources/data/data_repositoryImpl.dart';
import 'package:mcs/resources/product/product_repositoryImpl.dart';
import 'package:mcs/resources/repository.dart';
import 'package:mcs/routes/routes_generator.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/views/welcome.dart';

import 'blocs/bloc_delegate.dart';
import 'blocs/location/location_bloc.dart';
import 'blocs/product/productbloc.dart';
import 'blocs/subcat/subcat_bloc.dart';
import 'blocs/user/user_bloc.dart';
import 'resources/cart/cart_repositoryImpl.dart';
import 'resources/category/category_repositoryImpl.dart';
import 'resources/order/order_repositoryImpl.dart';
import 'services/ApiClient.dart';
import 'widgets/themes/config.dart';
import 'widgets/themes/custom_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceUtils.getInstance();
  Paint.enableDithering = true;
  //await Firebase.initializeApp();
  await dotenv.load(fileName: '.env');

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    // systemNavigationBarColor: Colors.transparent,
    // systemNavigationBarIconBrightness: Brightness.dark,
  ));
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    // DeviceOrientation.landscapeLeft,
    // DeviceOrientation.landscapeRight
  ]);
  // initialize api client
  Dio dio = Dio();
  dio.interceptors.add(LogInterceptor(
    responseBody: true,
    request: true,
    requestBody: true,
  ));
  ApiClient apiClient = ApiClient(dio);
  Bloc.observer = SimpleBlocDelegate();
  runApp(MyApp(apiClient: apiClient));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key, required this.apiClient}) : super(key: key);
  final ApiClient apiClient;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      print("ok i am listening");

      /// if dynamic theming is required
      /// can be also used to check separate theme for different client

      // setState(() {
      //   print("what do you want me to do");
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (context) =>
                DataRepositoryImpl(apiClient: widget.apiClient)),
        RepositoryProvider(
          create: (context) => UserRepositoryImpl(
            apiClient: widget.apiClient,
          ),
        ),
        RepositoryProvider(
          create: (_) => ProductRepositoryImpl(
            apiClient: widget.apiClient,
          ),
        ),
        RepositoryProvider(
          create: (_) => CategoryRepositoryImpl(
            apiClient: widget.apiClient,
          ),
        ),
        RepositoryProvider(
          create: (_) => CartRepositoryImpl(
            apiClient: widget.apiClient,
          ),
        ),
        RepositoryProvider(
          create: (_) => OrderRepositoryImpl(
            apiClient: widget.apiClient,
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                DataBloc(dataRepositoryImpl: context.read<DataRepositoryImpl>())
                  ..add(const LoadCities())
                  ..add(const LoadBanners(cityId: "4")),
          ),
          BlocProvider(
              create: (context) => LocationBloc()..add(const LoadLocation())),
          BlocProvider(
            create: ((context) =>
                ProductBloc(context.read<ProductRepositoryImpl>())),
          ),
          BlocProvider<UserBloc>(
            create: (context) => UserBloc(context.read<UserRepositoryImpl>()),
          ),
          BlocProvider(
            create: (context) => CategoryBloc(
              context.read<CategoryRepositoryImpl>(),
            )..add(const CategoryEvent.loadCategory(cityId: "4")),
          ),
          BlocProvider<SubcatBloc>(
            create: (context) => SubcatBloc(
              context.read<CategoryRepositoryImpl>(),
            ),
          ),
          BlocProvider<NavigationBloc>(
            create: (context) => NavigationBloc(),
          ),
          BlocProvider<CartBloc>(
              create: (context) => CartBloc(
                  cartRepositoryImpl: context.read<CartRepositoryImpl>()))
        ],
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: MaterialApp(
            title: appName,
            initialRoute: Welcome.tag,
            onGenerateRoute: RouteGenerator.generateRoute,
            debugShowCheckedModeBanner: false,
            theme: CustomTheme.lightTheme, //3
            darkTheme: CustomTheme.lightTheme, //4
            themeMode: currentTheme.currentTheme,
          ),
        ),
      ),
    );
  }
}
