import 'package:flutter/material.dart';
import '../../constants/consts.dart';
import '../../model/chart_data.dart';
import '../../services/http.dart';
import '../line_chart/line_chart.dart';

/// Main page of the app
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FutureBuilder<ChartData>(
      future: fetchChartPoints(chartEndpoint),
      builder: (context, snapshot) => MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                title: const Text('BTC/AUD'),
              ),
              body: SafeArea(
                child: snapshot.hasData
                    ? Column(
                        children: [
                          const _ChartHeader(),
                          Expanded(
                            child: LineChart(snapshot.data as ChartData),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: _TransactionRow(),
                          ),
                        ],
                      )
                    : const Center(child: CircularProgressIndicator()),
              ),
            ),
          ));
}

class _ChartHeader extends StatelessWidget {
  const _ChartHeader();

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                children: const [
                  Text(
                    'Bitcoin ',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  Text(
                    '| BTC',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text(
                  '\$72,400.12',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Icon(
                    Icons.arrow_drop_up,
                    color: Colors.green,
                    size: 16,
                  ),
                ),
                Text(
                  '\$800 (4.8%)',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                children: const [
                  Text('High: '),
                  Text('72,000'),
                  Spacer(),
                  Text('Low: '),
                  Text('72,000'),
                  Spacer(),
                  Text('Vol: '),
                  Text('213'),
                  Spacer(),
                  Text('\$800,000,000'),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      );
}

class _TransactionRow extends StatelessWidget {
  const _TransactionRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 60,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Buy'),
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: SizedBox(
                height: 60,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Sell'),
                ),
              ),
            ),
          ],
        ),
      );
}
