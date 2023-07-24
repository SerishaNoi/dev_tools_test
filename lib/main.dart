import 'package:dev_tools_test/core/models/transaction_model.dart';
import 'package:dev_tools_test/firebase_options.dart';
import 'package:dev_tools_test/pages/authorization_page/authorization_page.dart';
import 'package:dev_tools_test/pages/authorization_page/cubit/authorization_cubit.dart';
import 'package:dev_tools_test/pages/diagram_page/diagram_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<AuthorizationCubit>(
        create: (context) => AuthorizationCubit()..init(),
        child: BlocBuilder<AuthorizationCubit, AuthorizationCubitState>(
          builder: (context, state) {
            return state.maybeWhen(
              initial: () => const AuthorizationPage(),
              loggedIn: () => const DiagramPage(),
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }
}
