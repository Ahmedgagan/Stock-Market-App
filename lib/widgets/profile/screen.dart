import 'package:flutter/material.dart';

import 'package:sma/models/profile/index.dart';
import 'package:sma/models/profile/stock_chart.dart';
import 'package:sma/shared/colors.dart';
import 'package:sma/widgets/profile/widgets/graph.dart';
import 'package:sma/widgets/profile/widgets/price.dart';
import 'package:sma/widgets/profile/widgets/profile.dart';
import 'package:sma/widgets/profile/widgets/save_button.dart';
import 'package:sma/widgets/profile/widgets/statistics.dart';
import 'package:sma/widgets/profile/widgets/styles.dart';

class ProfileScreen extends StatelessWidget {

  final bool isMarketOpen;
  final bool isSaved;
  final Color color;
  final StockQuote quote;
  final StockProfile profile;
  final List<StockChart> chart;

  ProfileScreen({
    @required this.isMarketOpen,
    @required this.isSaved,
    @required this.quote,
    @required this.profile,
    @required this.color,
    @required this.chart

  });

  Widget _renderTop() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Text(this.quote.name, style: kProfileCompanyName),
          flex: 8,
        ),

        Expanded(
          child: Container(),
          flex: 4,
        ),
        
        WatchlistButtonWidget(
          color: this.color,
          isSaved: this.isSaved,
          symbol: this.quote.symbol,
        )
      ],
    );
  }

  Widget _renderPrice() {
    return  ProfilePrice(
      isMarketOpen: this.isMarketOpen,
      color: this.color,
      quote: this.quote,
    );
  }

  Widget _renderGraph() {
    return Container(
      height: 250,
      child: SimpleTimeSeriesChart(
        chart: this.chart,
        color: this.color
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.quote.symbol),
        backgroundColor: color,
      ),

      backgroundColor: kScaffoldBackground,
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: 26, right: 26, top: 26),
        children: <Widget>[
          this._renderTop(),
          SizedBox(height: 4),
          this._renderPrice(),
          SizedBox(height: 4),
          this._renderGraph(),
          StatisticsWidget(quote: this.quote),
          CompanyProfileWidget(profile: this.profile),
        ],
      ),
    );
  }
}