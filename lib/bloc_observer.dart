import 'package:bloc/bloc.dart';

import 'dart:developer';

class MyBlocObserver extends BlocObserver {

  const MyBlocObserver();

  @override
  void onTransition(Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    super.onTransition(bloc, transition);
    log("$transition");
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log("$error");
    super.onError(bloc, error, stackTrace);
  }
}