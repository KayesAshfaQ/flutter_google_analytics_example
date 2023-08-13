import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

import 'code_autofill_page.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String _code = "";
  String signature = "{{ app signature }}";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const PhoneFieldHint(),
              const Spacer(),
              PinFieldAutoFill(
                decoration: CirclePinDecoration(
                  textStyle: const TextStyle(fontSize: 20, color: Colors.black),
                  strokeColorBuilder: FixedColorBuilder(
                    Colors.black.withOpacity(0.3),
                  ),
                ),
                currentCode: _code,
                onCodeSubmitted: (code) {},
                onCodeChanged: (code) {
                  if (code!.length == 6) {
                    FocusScope.of(context).requestFocus(FocusNode());
                  }
                },
              ),
              const Spacer(),
              TextFieldPinAutoFill(
                currentCode: _code,
              ),
              const Spacer(),
              ElevatedButton(
                child: const Text('Listen for sms code'),
                onPressed: () async {
                  await SmsAutoFill().listenForCode();
                },
              ),
              ElevatedButton(
                child: const Text('Set code to 123456'),
                onPressed: () async {
                  setState(() {
                    _code = '123456';
                  });
                },
              ),
              const SizedBox(height: 8.0),
              const Divider(height: 1.0),
              const SizedBox(height: 4.0),
              Text("App Signature : $signature"),
              const SizedBox(height: 4.0),
              ElevatedButton(
                child: const Text('Get app signature'),
                onPressed: () async {
                  signature = await SmsAutoFill().getAppSignature;
                  setState(() {});
                },
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const CodeAutoFillTestPage()));
                },
                child: const Text("Test CodeAutoFill mixin"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
