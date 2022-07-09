import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mcs/blocs/category/categorybloc.dart';
import 'package:mcs/resources/product/product_repositoryImpl.dart';
import 'package:mcs/resources/repository.dart';
import 'package:mcs/routes/routes_generator.dart';
import 'package:mcs/utils/utils.dart';

import 'blocs/bloc_delegate.dart';
import 'blocs/product/productbloc.dart';
import 'resources/category/category_repositoryImpl.dart';
import 'routes/route_constants.dart';
import 'services/ApiClient.dart';
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
      // responseBody: true,
      // request: true,
      // requestBody: true,
      ));
  ApiClient apiClient = ApiClient(dio);
  BlocOverrides.runZoned(
    () => runApp(MyApp(
      apiClient: apiClient,
    )),
    blocObserver: SimpleBlocDelegate(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.apiClient}) : super(key: key);
  final ApiClient apiClient;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => UserRepositoryImpl(
            apiClient: apiClient,
          ),
        ),
        RepositoryProvider(
          create: (_) => ProductRepositoryImpl(
            apiClient: apiClient,
          ),
        ),
        RepositoryProvider(
          create: (_) => CategoryRepositoryImpl(
            apiClient: apiClient,
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: ((context) =>
                ProductBloc(context.read<ProductRepositoryImpl>())
                  ..add(
                    const ProductEvent.loadProduct(),
                  )),
          ),
          BlocProvider(
            create: (context) => CategoryBloc(
              context.read<CategoryRepositoryImpl>(),
            )..add(
                const CategoryEvent.loadCategory(),
              ),
          ),
        ],
        child: MaterialApp(
          title: appName,
          initialRoute: homeRoute,
          onGenerateRoute: RouteGenerator.generateRoute,
          debugShowCheckedModeBanner: false,
          theme: CustomTheme.lightTheme,
        ),
      ),
    );
  }
}
