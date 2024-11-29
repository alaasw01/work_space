import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:work_space/utils/constants/work_space.dart';

part '../cubit/onboarding_cubit.dart';
part '../cubit/onboarding_state.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          var cubit = context.read<OnboardingCubit>();
          return Scaffold(
              backgroundColor: AppColors.meduimGreenColor,
              body: PageView.builder(
                onPageChanged: cubit.onPageChanged,
                controller: cubit.pageController,
                itemCount: cubit.pages.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () => context.push(Routes.login),
                            child: Text(
                              'Skip',
                              style: AppStyles.textStyle16.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: Image.asset(
                          cubit.pages[index]['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        cubit.pages[index]['title'],
                        style:
                            AppStyles.textStyle20.copyWith(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        cubit.pages[index]['description'],
                        textAlign: TextAlign.center,
                        style: AppStyles.textStyle16
                            .copyWith(color: AppColors.yellowColor),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(cubit.pages.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 7),
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: cubit.activePage == index
                                    ? AppColors.orangeColor
                                    : AppColors.lightGreenColor,
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () => cubit.onNextPage(context),
                        child: const CircleAvatar(
                          radius: 30,
                          backgroundColor: AppColors.darkGreenColor,
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
