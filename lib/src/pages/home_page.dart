import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

import '../helper/helper_function.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'This is the home page.',
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: firebaseAnalytics,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),
              child: Text(
                'Trigger analytics event',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void firebaseAnalytics() async {
    await FirebaseAnalytics.instance.logBeginCheckout(
      value: 10.0,
      currency: 'USD',
      items: [
        AnalyticsEventItem(
          itemName: 'Socks',
          itemId: Helper.randomText(8),
          price: Helper.randomNumber(),
        ),
      ],
      coupon: Helper.randomText(12),
    );
  }
}
