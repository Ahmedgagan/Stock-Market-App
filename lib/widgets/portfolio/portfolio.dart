import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:sma/bloc/portfolio/portfolio_bloc.dart';

import 'package:sma/models/market_index.dart';
import 'package:sma/models/stock_overview.dart';
import 'package:sma/widgets/portfolio/search_delegate.dart';

import 'package:sma/widgets/portfolio/widgets/portfolio_card.dart';
import 'package:sma/widgets/portfolio/widgets/portfolio_tile.dart';
import 'package:sma/widgets/widgets/loading_indicator.dart';

class Portfolio extends StatelessWidget {

  Widget _renderTop(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text('Portfolio', style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold
            )),

            GestureDetector(
              child: FaIcon(FontAwesomeIcons.search, size: 22,),

              // onTap: () => Navigator
              // .of(context)
              // .push(MaterialPageRoute(builder: (context) => SearchScreen()))

              onTap: () => showSearch(context: context, delegate: StockSearchWidget()),
            )
          ],
        ),
      ],
    );
  }


  Widget _renderMarketIndexes(List<MarketIndex> indexes) {
    return Container(
      height: 205,
      padding: EdgeInsets.symmetric(vertical: 18),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: indexes.length,
        itemBuilder: (BuildContext context, int index) => PortfolioCard(index: indexes[index]),
      ),
    );
  }

  Widget _renderWatchlistText() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text('Watchlist', style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold
      )),
    );
  }

  Widget _renderWatchList(List<StockOverview> stocks) {
    return Container(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: stocks.length,
        itemBuilder: (BuildContext context, int index) => PortfolioTitle(stock: stocks[index]),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioBloc, PortfolioState>(
      builder: (BuildContext context, PortfolioState state) {
      
        if (state is PortfolioInitial) {

          BlocProvider
          .of<PortfolioBloc>(context)
          .add(FetchPortfoliData(
            stockSymbols: 'BAC,DAL,BRK-B,AAPL,MSFT,V,MA,FB,JNJ,CVX'.split(','),
            marketSymbols: '^DJI,^IXIC,^GSPC'.split(',')
          ));
        }

        if (state is PortfolioLoading) {
          return LoadingIndicatorWidget();
        }

        if (state is PortfolioLoaded) {
          return ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(left: 18, right: 18, top: 14),
            children: <Widget> [
              this._renderTop(context),
              this._renderMarketIndexes(state.indexes),
              this._renderWatchlistText(),
              this._renderWatchList(state.stocks),
            ]
          );
        }

        return LoadingIndicatorWidget();    
      },
    );
  }
}