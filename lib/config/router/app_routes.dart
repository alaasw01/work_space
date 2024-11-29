import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:work_space/config/router/app_pages.dart';
import 'package:work_space/features/login/presentation/login_view.dart';
import 'package:work_space/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:work_space/features/splash/presentation/view/splash_view.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: Routes.initial,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashView();
      },
      routes: <RouteBase>[
        GoRoute(
          path: Routes.onboarding,
          builder: (BuildContext context, GoRouterState state) {
            return const OnboardingView();
          },
        ),
        GoRoute(
          path: Routes.login,
          builder: (BuildContext context, GoRouterState state) {
            return const LoginView();
          },
        ),
      ],
    ),
  ],
);
