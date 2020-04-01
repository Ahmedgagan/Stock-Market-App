import 'package:dio/dio.dart';
import 'package:sembast/sembast.dart';
import 'package:sma/helpers/database_helper.dart';
import 'package:sma/key.dart';

import 'package:sma/models/search/search.dart';

class SearchClient {

  static StoreRef<int, Map<String, dynamic>>  _store = intMapStoreFactory.store('hh');

  static Future<List<StockSearch>> searchStock({String symbol}) async {

    final Uri uri = Uri.https('www.alphavantage.co', '/query', {
      'function': 'SYMBOL_SEARCH',
      'keywords': symbol,
      'apikey': alphavantageKey
    });


    final response = await Dio().getUri(uri);
    final data = response.data['bestMatches'];

    return StockSearch.convertToList(data);
  }
  
  Future<Database> get _database async => await DatabaseManager.instance.database;

  Future<List<String>> fetch() async {

    final Finder finder = Finder(sortOrders: [SortOrder(Field.key, false)]);
    final response = await _store.find(await _database, finder: finder);

    return response
    .map((x) => x.value['symbol'].toString())
    .toList();
  }

  Future<void> save({String symbol}) async {
    await _store.add(await _database, {'symbol': symbol});
  }

  Future<void> delete({String symbol}) async {
    // Delete symbol from history.
    // final filter = Filter.equals('symbol', symbol);
    // final Finder finder = Finder( filter: filter);

    // final result = await _store.delete(await _database, finder: finder);

    // print(result);
  }



}