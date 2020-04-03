import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sma/bloc/profile/profile_bloc.dart';
import 'package:sma/shared/colors.dart';

import 'package:sma/widgets/profile/screen.dart';
import 'package:sma/widgets/widgets/loading_indicator.dart';

class Profile extends StatelessWidget {

  final String symbol;
  
  Profile({
    @required this.symbol,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (BuildContext context, ProfileState state) {

        if (state is ProfileLoadingError) {
          return Scaffold(
            backgroundColor: kScaffoldBackground,
            body: Center(child: Text(state.error)),
            appBar: AppBar(
              backgroundColor: kNegativeColor,
            ),
          );
        }

        if (state is ProfileLoaded) {
          return ProfileScreen(
            profile: state.profileModel,

            isMarketOpen: state.isMarketOpen,
            isSaved: state.isSymbolSaved,
            
            color: state.profileModel.stockProfile.changes < 0 
              ? kNegativeColor
              : kPositiveColor
          );
        }

        return Scaffold(
          backgroundColor: kScaffoldBackground,
          body: LoadingIndicatorWidget()
        );
      }
    );
  }
}