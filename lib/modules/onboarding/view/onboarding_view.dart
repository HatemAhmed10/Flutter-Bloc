import 'package:bloc_mvvm/domain/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../presentation/resources/assets_manager.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/constants_manager.dart';
import '../../../presentation/resources/routes_manager.dart';
import '../../../presentation/resources/strings_manager.dart';
import '../../../presentation/resources/values_manager.dart';
import '../../counter/cubit/cubit.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController();
    return BlocProvider(
      create: (BuildContext context) => OnBoardingCubit(),
      child: BlocConsumer<OnBoardingCubit, OnBoardingStates>(
        listener: (BuildContext context, OnBoardingStates state) {},
        builder: (BuildContext context, OnBoardingStates state) {
          OnBoardingCubit cubit = OnBoardingCubit.get(context);

          return Scaffold(
            backgroundColor: ColorManager.white,
            appBar: AppBar(
              backgroundColor: ColorManager.white,
              elevation: AppSize.s0,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: ColorManager.white,
                  statusBarBrightness: Brightness.dark),
            ),
            body: PageView.builder(
                controller: _pageController,
                itemCount: cubit.getSliderData.length,
                onPageChanged: (index) {
                  cubit.changeindex(index);
                },
                itemBuilder: (context, index) {
                 return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: AppSize.s40),
                      Padding(
                        padding: const EdgeInsets.all(AppPadding.p8),
                        child: Text(
                         cubit.getSliderData[cubit.currentIndex].title,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(AppPadding.p8),
                        child: Text(
                          cubit.getSliderData[cubit.currentIndex].subTitle,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      const SizedBox(height: AppSize.s60),
                      SvgPicture.asset(cubit.getSliderData[cubit.currentIndex].image)
                    ],
                  );
                }),
            bottomSheet: Container(
              color: ColorManager.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, Routes.counterRoute);
                      },
                      child: Text(
                        AppStrings.skip,
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                  Container(
                   color: ColorManager.primary,
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // left arrow
                        Padding(
                          padding: const EdgeInsets.all(AppPadding.p14),
                          child: GestureDetector(
                           child: SizedBox(
                          width: AppSize.s20,
                          height: AppSize.s20,
                          child: SvgPicture.asset(ImageAssets.leftArrowIc),
                        ),
                        onTap: () {
                          _pageController.animateToPage(cubit.goPrevious(),
                              duration: const Duration(
                                  milliseconds: AppConstants.sliderAnimationTime),
                              curve: Curves.bounceInOut);
                        },
                      ),
                    ),
                        Row(
                      children: [
                        for (int i = 0; i < cubit.getSliderData.length; i++)
                          Padding(
                            padding: const EdgeInsets.all(AppPadding.p8),
                            child: _getProperCircle(i,cubit.currentIndex),
                          )
                      ],
                    ),
                        Padding(
                      padding: const EdgeInsets.all(AppPadding.p14),
                      child: GestureDetector(
                          child: SizedBox(
                            width: AppSize.s20,
                            height: AppSize.s20,
                            child: SvgPicture.asset(ImageAssets.rightArrowIc),
                          ),
                          onTap: () {
                            // go to previous slide
                            _pageController.animateToPage(cubit.goNext(),
                                duration: const Duration(
                                    milliseconds: AppConstants.sliderAnimationTime),
                                curve: Curves.bounceInOut);
                          }),
                    )
                  ],
                ),
              ),
                ],
              ),
            ),

          );
        },
      ),
    );

  }


  Widget _getProperCircle(int index, int currentIndex) {
    if (index == currentIndex) {
      return Row(
        children: [
          SvgPicture.asset(ImageAssets.hollowCircleIc),
        ],
      );
    } else {
      return SvgPicture.asset(ImageAssets.solidCircleIc);
    }
  }
}
