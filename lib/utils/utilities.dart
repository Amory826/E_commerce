import 'package:e_commerce/utils/UColors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

void showToast(String? msg) async {
  if (msg == null) return;

  try {
    await Fluttertoast.cancel();
  } finally {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 4,
      backgroundColor: UColors.primary,
      textColor: UColors.white,
      fontSize: 16,
    );
  }
}

bool _isShowing = false;

bool get showLoadingIsShowing => _isShowing;

void showLoading(BuildContext context) {
  _isShowing = true;
  showDialog(
    barrierColor: UColors.primary,
    barrierDismissible: false,
    context: context,
    builder: (_) {
      return WillPopScope(
        child: const Center(child: const CircularProgressIndicator()),
        onWillPop: () async {
          return false;
        },
      );
    },
  ).whenComplete(() => _isShowing = false);
}

String formatCurrency(
  int amount, {
  String locale = 'vi_VN',
  String symbol = 'VND',
}) {
  final format = NumberFormat.currency(
    locale: locale,
    symbol: symbol,
    decimalDigits: 0,
  );
  return format.format(amount).replaceAll('.', ',');
}
