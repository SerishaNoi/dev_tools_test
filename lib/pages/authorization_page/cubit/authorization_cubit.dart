import 'package:dev_tools_test/core/models/transaction_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dev_tools_test/core/methods/log_in_by_email.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'authorization_state.dart';
part 'authorization_cubit.freezed.dart';

class AuthorizationCubit extends Cubit<AuthorizationCubitState> {
  AuthorizationCubit() : super(const AuthorizationCubitState.initial());

  void init() async {
    final currentUser = await FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      emit(const AuthorizationCubitState.loggedIn());
    } else {
      emit(const AuthorizationCubitState.initial());
    }
  }

  void logInByEmail({required String email, required String password}) async {
    final currentUser = await FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      try {
        final userCredential = await signInWithEmail(email: email, password: password);

        userCredential != null ? emit(const AuthorizationCubitState.loggedIn()) : null;
      } catch (e) {
        emit(AuthorizationCubitState.error(e.toString()));
        throw Exception(e);
      }
    } else if (currentUser != null) {
      emit(const AuthorizationCubitState.loggedIn());
    }
  }

  void logOut() async {
    final Box<TransactionModel> transactionBox =
        await Hive.openBox<TransactionModel>("transactions");

    await FirebaseAuth.instance.signOut();
    final currentUser = await FirebaseAuth.instance.currentUser;

    transactionBox.deleteFromDisk();

    print(currentUser);
    emit(const AuthorizationCubitState.initial());
  }
}
