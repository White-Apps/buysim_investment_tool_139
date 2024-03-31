// ignore_for_file: use_build_context_synchronously

import 'package:apphud/apphud.dart';
import 'package:buysim_investment_tool_137/core/bi_dc.dart';
import 'package:buysim_investment_tool_137/core/con_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> getBuysimInvestmentPedf() async {
  final preferences = await SharedPreferences.getInstance();
  return preferences.getBool('vmsdjnksdsd') ?? false;
}

Future<void> setBuysimInvestmentPedf() async {
  final vsds = await SharedPreferences.getInstance();
  vsds.setBool('vmsdjnksdsd', true);
}

Future<void> restoreBuysimInvestmentPedf(BuildContext context) async {
  final hasPremiumAccess = await Apphud.hasPremiumAccess();
  final hasActiveSubscription = await Apphud.hasActiveSubscription();
  if (hasPremiumAccess || hasActiveSubscription) {
    final vsds = await SharedPreferences.getInstance();
    vsds.setBool("vmsdjnksdsd", true);
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Success!'),
        content: const Text('Your purchase has been restored!'),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const BiBottomBar()),
                (route) => false,
              );
            },
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Restore purchase'),
        content: const Text(
            'Your purchase is not found. Write to support: ${DocFF.s}'),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => {Navigator.of(context).pop()},
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }
}
