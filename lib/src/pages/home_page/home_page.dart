import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_analytics_example/src/pages/otp_screen.dart';

import '../../helper/helper_function.dart';
import '../code_autofill_page.dart';
import 'analytics_button.dart';

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
            const SizedBox(height: 16.0),
            AnalyticsButton(
              onPress: viewItemAnalytics,
              label: 'Trigger viewItem event',
            ),
            const SizedBox(height: 16.0),
            AnalyticsButton(
              onPress: checkoutAnalytics,
              label: 'Trigger checkout event',
            ),
            const SizedBox(height: 16.0),
            AnalyticsButton(
              onPress: purchaseAnalytics,
              label: 'Trigger purchase event',
            ),
            ElevatedButton(
              onPressed: () {
                // navigate to OTP screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OtpPage(),
                  ),
                );
              },
              child: Text('GO to OTP Screen'),
            ),
          ],
        ),
      ),
    );
  }

  void viewItemAnalytics() async {
    await FirebaseAnalytics.instance.logViewItem(
      value: 10.0,
      currency: 'USD',
      items: [
        AnalyticsEventItem(
          itemName: 'Socks',
          itemId: Helper.randomText(8),
          price: Helper.randomNumber(),
        ),
      ],
    );
  }

  void checkoutAnalytics() async {
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

  void purchaseAnalytics() async {
    await FirebaseAnalytics.instance.logPurchase(
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
