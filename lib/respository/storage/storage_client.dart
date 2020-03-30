import 'package:sembast/sembast.dart';
import 'package:sma/helpers/database.dart';

class DatabaseClient {

  final  StoreRef<int, Map<String, dynamic>>  _store = intMapStoreFactory.store('d');

  // Sembast Database.
  Future<Database> get _database async => await DatabaseManager.instance.database;

  // Gets all the symbols storaged.
  Future<List<String>> fetch() async {
    final Finder finder = Finder(sortOrders: [SortOrder(Field.key, false)]);
    final response = await _store.find(
      await _database,
      finder: finder
    );

    final data = response
    .map((x) => x.value['symbol'].toString())
    .toList();
    
    return data;
  }

  Future<int> save({String symbol}) async {
    final int response = await _store.add(await _database, {'symbol': symbol});
    return response;
  }

  Future<void> delete({String symbol}) async {

    final Finder finder = Finder(
      filter: Filter.equals('symbol', symbol)
    );

    await _store.delete(await _database, finder: finder);
  }
}