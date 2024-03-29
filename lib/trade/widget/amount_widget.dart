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
    Key? key,
    required this.onAmountEntered,
  }) : super(key: key);

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

  void handleTrade() {
    double enteredAmount = double.tryParse(_controller.text) ?? 0.0;
    double currentBalance = UserPreferences.getBalance();

    if (enteredAmount > currentBalance) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: AlertDialog(
              surfaceTintColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              content: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.r),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'You entered an amount greater than your balance',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: BiColors.whate,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    BiMotion(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.r),
                        width: MediaQuery.of(context).size.width,
                        height: 44.h,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: <Color>[
                              Color(0xFF3F8E00),
                              Color(0xFFFAFF00)
                            ],
                          ),
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        child: Center(
                          child: Text(
                            'Change',
                            style: TextStyle(
                              fontSize: 16.h,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } else {
      widget.onAmountEntered(enteredAmount);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      padding: EdgeInsets.symmetric(vertical: 8.r, horizontal: 12.r),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Amount',
                style: TextStyle(
                  fontSize: 12.h,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 25.h,
                width: 50.w,
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(4),
                  ],
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    fontSize: 16.h,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                  onSubmitted: (_) => handleTrade(),
                ),
              ),
            ],
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