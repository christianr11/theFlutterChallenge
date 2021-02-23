import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterChallenge/blocs/login/login_block.dart';
import 'package:flutterChallenge/blocs/map/location_bloc.dart';
import 'package:flutterChallenge/blocs/map/random_location_bloc.dart';
import 'package:flutterChallenge/repositories/location_repository.dart';
import 'package:flutterChallenge/repositories/user_repository.dart';
import 'package:flutterChallenge/ui/pages/login/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => LoginBloc(userRepository: UserRepository())),
        BlocProvider(
            create: (context) =>
                LocationBloc(locationRepository: LocationRepositorySet())),
        BlocProvider(
            create: (context) => RandomLocationBloc(
                locationRepository: LocationRepositorySet())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.white,
          fontFamily: 'OpenSans',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Login(),
      ),
    );
  }
}
