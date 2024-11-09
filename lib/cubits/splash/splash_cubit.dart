import 'package:flutter_bloc/flutter_bloc.dart';

enum SplashState { initial, loading, completed }

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.initial);

  Future<void> initializeApp() async {
    emit(SplashState.loading);

    await Future.delayed(const Duration(seconds: 2));

    emit(SplashState.completed);
  }
}
