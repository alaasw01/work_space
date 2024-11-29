part of '../view/onboarding_view.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
  final PageController pageController = PageController();
  int activePage = 0;
  final List<Map<String, dynamic>> pages = [
    {
      'title': 'Your favorite place to work',
      'image': AppImages.onboarding1,
      'description':
          'In Shaghaf Co-working space,we provide a place that makes you more productive, enjoyable and comfortable A place made up of different parts.',
    },
    {
      'title': 'Delightful open air',
      'image': AppImages.onboarding2,
      'description':
          'You can choose a game to play from the many games we have , sit at a comfortable base, or take pictures in the different places that have been specially made to take beautiful pictures.',
    },
    {
      'title': 'Choose your favorite room',
      'image': AppImages.onboarding3,
      'description':
          'You can find the right room for your current mood, as we have many rooms that meet all needs, You can move between funny room, training room and meeting room.',
    },
  ];
  onPageChanged(page) {
    activePage = page;
    emit(OnPageChanged());
  }

  void onNextPage(BuildContext context) {
    if (activePage < pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
      );
    } else {
      context.push(Routes.login);
    }
    emit(OnPageChanged());
  }
}
