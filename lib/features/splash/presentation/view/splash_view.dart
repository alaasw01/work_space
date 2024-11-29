import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:work_space/utils/constants/work_space.dart';
part '../cubit/splash_cubit.dart';
part '../cubit/splash_state.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(context),
      child: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashInitial) {
            context.read<SplashCubit>().initializeSplash(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.lightGreenColor,
            body: TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0.5, end: 2),
              duration: const Duration(seconds: 3),
              builder: (context, value, child) {
                return Transform.scale(
                  scale: value,
                  child: child,
                );
              },
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.logo,
                      height: 170,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
