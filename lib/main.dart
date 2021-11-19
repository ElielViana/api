import 'package:api/pages/user_controller.dart';
import 'package:api/pages/user_page.dart';
import 'package:api/repositories/user/user_repository.dart';
import 'package:api/stores/user_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt getIt = GetIt.instance;
  getIt.registerSingleton(UserStore());
  getIt.registerFactory(()=> UserRepository());
  getIt.registerFactory(()=>UserController(repository: getIt.get(), store: getIt.get()));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: UserPage(),
    );
  }
}
