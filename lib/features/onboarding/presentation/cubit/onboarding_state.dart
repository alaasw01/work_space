part of '../view/onboarding_view.dart';

sealed class OnboardingState {}

final class OnboardingInitial extends OnboardingState {}

final class OnPageChanged extends OnboardingState {}
