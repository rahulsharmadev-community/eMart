import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final bool materialAppWraper;
  final bool canPop;
  final String? msg;
  const ErrorScreen({
    this.materialAppWraper = false,
    this.canPop = false,
    this.msg,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final scaffold = PopScope(
        canPop: canPop,
        child: Scaffold(
          body: Center(child: Text(msg ?? 'Ooops... Error Occor!')),
        ));
    return materialAppWraper ? MaterialApp(title: 'Error!', home: scaffold) : scaffold;
  }
}
