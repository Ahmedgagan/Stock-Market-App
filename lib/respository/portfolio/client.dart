import 'package:dio/dio.dart';
import 'package:sma/helpers/http_helper.dart';
import 'package:sma/helpers/variables.dart';
import 'package:sma/models/data_overview.dart';
import 'package:sma/models/profile/market_index.dart';

class PortfolioClient {

  Future<List<MarketIndexModel>> fetchIndexes() async {
    final Uri uri = Uri.https(authority, '/api/v3/quote/^DJI,^GSPC,^IXIC,^RUT,^VIX');
    final Response<dynamic> response = await FetchClient().fetchData(uri: uri);
    return MarketIndexModel.toList(response.data);
  }

  Future<StockOverviewModel> fetchData({String symbol}) async {
    final Uri uri = Uri.https(authority, '/api/v3/quote/$symbol');
    final Response<dynamic> response = await FetchClient().fetchData(uri: uri);
    return StockOverviewModel.fromJson(response.data[0]);
  }
}