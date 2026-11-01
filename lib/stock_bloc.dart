
import 'dart:async';
import 'dart:math';
import 'stock.dart';

enum StockAction {
  increase,
  decrease,
  reset,
}

class StockBloc {
  final _actionController = StreamController<StockAction>();
  final _stockController = StreamController<Stock>.broadcast();

  Stock _currentStock = const Stock(
    symbol: 'AAPL',
    price: 150.0,
    dailyChange: 0.0,
  );

  Stream<Stock> get stockStream => _stockController.stream;

  Sink<StockAction> get actionSink => _actionController.sink;

  Stock get currentStock => _currentStock;


  StockBloc() {
    _actionController.stream.listen((action) {
      final random = Random();
      final change = random.nextDouble() * 2.0;

      // Determine how the price changes based on action.

      // Create a new Stock using copyWith().

      // Update _currentStock.

      // Send the updated stock into _stockController.sink.
    });
  }


  // We'll handle incoming actions here.

  void dispose() {
    _actionController.close();
    _stockController.close();
  }
}
