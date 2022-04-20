
import 'package:bloc/bloc.dart';
import 'package:bloc_mvvm/modules/onboarding/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models.dart';
import '../../../presentation/resources/assets_manager.dart';
import '../../../presentation/resources/strings_manager.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates> {
  OnBoardingCubit() : super(OnBoardingInitialState());

  static OnBoardingCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  int nextIndex =0 ;
  int previousIndex = 0 ;

  List<SliderObject> getSliderData = [
    SliderObject(AppStrings.onBoardingTitle1,
        AppStrings.onBoardingSubTitle1, ImageAssets.onboardingLogo1),
    SliderObject(AppStrings.onBoardingTitle2,
        AppStrings.onBoardingSubTitle2, ImageAssets.onboardingLogo2),
    SliderObject(AppStrings.onBoardingTitle3,
        AppStrings.onBoardingSubTitle3, ImageAssets.onboardingLogo3),
    SliderObject(AppStrings.onBoardingTitle4,
        AppStrings.onBoardingSubTitle4, ImageAssets.onboardingLogo4),
  ];

  void changeindex(int index){
    currentIndex = index ;
    emit(OnBoardingChangeIndexStates());
  }

  int goNext(){
    if(currentIndex < getSliderData.length-1){
       nextIndex = ++ currentIndex;
    }else{
      nextIndex =getSliderData.length;
    }
    return nextIndex ;
  }

  int goPrevious(){
    if(currentIndex >0){
      previousIndex = --currentIndex;
    }else{
      previousIndex =0 ;
    }
    return previousIndex;
  }
}
