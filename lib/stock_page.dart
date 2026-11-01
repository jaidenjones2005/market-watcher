
import 'package:flutter/material.dart';
import 'stock.dart';
import 'stock_bloc.dart';


class StockPage extends StatelessWidget {
  StockPage({super.key});

  final StockBloc bloc = StockBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Market Watcher'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: StreamBuilder<Stock>(
          stream: bloc.stockStream,
          initialData: bloc.currentStock,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }

            final stock = snapshot.data!;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  stock.symbol,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  '\$${stock.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: stock.dailyChange > 0
                        ? Colors.green
                        : stock.dailyChange < 0
                        ? Colors.red
                        : Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Daily Change: \$${stock.dailyChange.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
