import 'dart:ui';

import 'package:buysim_investment_tool_137/core/bi_colors.dart';
import 'package:buysim_investment_tool_137/core/bi_motin.dart';
import 'package:buysim_investment_tool_137/trade/widget/methos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AmountTradeWidget extends StatefulWidget {
  final void Function(double) onAmountEntered;
  const AmountTradeWidget({
    super.key,
    required this.onAmountEntered,
    required this.ooo,
  });
  final ValueChanged ooo;
  @override
  State<AmountTradeWidget> createState() => _AmountTradeWidgetState();
}

class _AmountTradeWidgetState extends State<AmountTradeWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = "100";
  }

  // void handleTrade() {
  //   double enteredAmount = double.tryParse(_controller.text) ?? 0.0;
  //   double currentBalance = UserPreferences.getBalance();
  //   if (enteredAmount > currentBalance) {
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return BackdropFilter(
  //           filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
  //           child: AlertDialog(
  //             surfaceTintColor: Colors.transparent,
  //             backgroundColor: Colors.transparent,
  //             content: Container(
  //               width: double.infinity,
  //               padding: EdgeInsets.all(16.r),
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //                   Text(
  //                     'You entered an amount greater than your balance',
  //                     textAlign: TextAlign.center,
  //                     style: TextStyle(
  //                       fontSize: 20.sp,
  //                       fontWeight: FontWeight.w500,
  //                       color: BiColors.whate,
  //                     ),
  //                   ),
  //                   SizedBox(height: 16.h),
  //                   BiMotion(
  //                     onPressed: () {
  //                       Navigator.of(context).pop();
  //                     },
  //                     child: Container(
  //                       margin: EdgeInsets.symmetric(horizontal: 5.r),
  //                       width: MediaQuery.of(context).size.width,
  //                       height: 44.h,
  //                       decoration: BoxDecoration(
  //                         gradient: const LinearGradient(
  //                           begin: Alignment.centerLeft,
  //                           end: Alignment.centerRight,
  //                           colors: <Color>[
  //                             Color(0xFF3F8E00),
  //                             Color(0xFFFAFF00)
  //                           ],
  //                         ),
  //                         borderRadius: BorderRadius.circular(24.r),
  //                       ),
  //                       child: Center(
  //                         child: Text(
  //                           'Change',
  //                           style: TextStyle(
  //                             fontSize: 16.h,
  //                             fontWeight: FontWeight.w400,
  //                             color: Colors.white,
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         );
  //       },
  //     );
  //   } else {
  //     widget.onAmountEntered(enteredAmount);
  //   }
  // }
  bool ccc = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 53.h,
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        color: BiColors.blue262450,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: Colors.white.withOpacity(0.15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4),
                ],
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  fontSize: 16.h,
                  fontWeight: FontWeight.w400,
                  color: ccc == false ? Colors.white : Colors.red,
                ),
                onChanged: (value) {
                  setState(() {
                    double balance = UserPreferences.getBalance();
                    double aaa = double.tryParse(_controller.text) ?? 0;
                    if (aaa > balance) {
                      setState(() {
                        ccc = true;
                        widget.ooo(ccc);
                      });
                    } else {
                      setState(() {
                        ccc = false;
                        widget.ooo(ccc);
                      });
                    }
                  });
                },
                // onSubmitted: (_) => handleTrade(),
              ),
            ),
          ),
          Text(
            'usdt',
            style: TextStyle(
              fontSize: 15.h,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
