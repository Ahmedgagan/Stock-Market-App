import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sma/bloc/indexes/indexes_bloc.dart';
import 'package:sma/bloc/portfolio/portfolio_bloc.dart';
import 'package:sma/bloc/profile/profile_bloc.dart';
import 'package:sma/bloc/search/search_bloc.dart';
import 'package:sma/bloc/sector_performance/sector_performance_bloc.dart';
import 'package:sma/widgets/home.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<IndexesBloc>(
          create: (context) => IndexesBloc(),
        ),
        BlocProvider<PortfolioBloc>(
          create: (context) => PortfolioBloc(),
        ),
        BlocProvider<ProfileBloc>(
          create: (context) => ProfileBloc(),
        ),
        BlocProvider<SearchBloc>(
          create: (context) => SearchBloc(),
        ),
        BlocProvider<SectorPerformanceBloc>(
          create: (context) => SectorPerformanceBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Stock Market App',
        theme: ThemeData(brightness: Brightness.dark),
        home: StockMarketAppHome(),
        debugShowCheckedModeBanner: false,
      )
    )
  );
}