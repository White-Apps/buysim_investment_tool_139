import 'package:buysim_investment_tool_137/trade/cubit/currency_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyPairTradeWidget extends StatefulWidget {
  const CurrencyPairTradeWidget({Key? key}) : super(key: key);

  @override
  State<CurrencyPairTradeWidget> createState() =>
      _CurrencyPairTradeWidgetState();
}

class _CurrencyPairTradeWidgetState extends State<CurrencyPairTradeWidget> {
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  bool isMenuOpen = false;
  String selectedCurrencyPair = 'EUR/USD';

  List<String> currencyPairs = [
    'EUR/USD',
    'USD/JPY',
    'GBP/USD',
    'USD/CHF',
    'AUD/USD',
    'USD/CAD',
    'NZD/USD',
    'EUR/GBP',
    'EUR/JPY',
    'GBP/JPY',
    'AUD/JPY',
    'EUR/AUD',
    'USD/SGD',
    'USD/HKD',
    'GBP/CHF',
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleDropdown,
      child: CompositedTransformTarget(
        link: _layerLink,
        child: Container(
          height: 70.h,
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.08),
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Currency Pairs',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    selectedCurrencyPair,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Icon(
                  isMenuOpen
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toggleDropdown() {
    if (isMenuOpen) {
      _overlayEntry?.remove();
      if (mounted) {
        setState(() {
          isMenuOpen = false;
        });
      }
    } else {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
      if (mounted) {
        setState(() {
          isMenuOpen = true;
        });
      }
    }
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    double itemHeight = 40.h;
    double displayCount = 5;
    double listHeight = displayCount * itemHeight;

    double listWidth = size.width;
    MediaQuery.of(context).size.height - offset.dy - size.height;

    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        width: listWidth,
        top: offset.dy - listHeight,
        child: Material(
          color: Colors.transparent,
          elevation: 4,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: listHeight,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.08),
                borderRadius: BorderRadius.circular(24.r),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: currencyPairs.length,
                itemBuilder: (context, index) => GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    if (mounted) {
                      BlocProvider.of<CurrencyPairCubit>(context)
                          .changeCurrencyPair(currencyPairs[index]);

                      setState(() {
                        selectedCurrencyPair = currencyPairs[index];
                        _toggleDropdown();
                      });
                    }
                  },
                  child: Container(
                    height: itemHeight,
                    alignment: Alignment.center,
                    child: Text(
                      currencyPairs[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => Divider(
                  color: Colors.white30,
                  height: 1.h,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    if (isMenuOpen) {
      _overlayEntry?.remove();
    }
    super.dispose();
  }
}
