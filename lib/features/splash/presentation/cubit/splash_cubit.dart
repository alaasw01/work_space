part of '../view/splash_view.dart';

class SplashCubit extends Cubit<SplashState> {
  final BuildContext context;
  SplashCubit(this.context) : super(SplashInitial()) {
    initializeSplash(context);
  }

  void initializeSplash(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      context.pushReplacement(Routes.onboarding);
    });
  }
}
