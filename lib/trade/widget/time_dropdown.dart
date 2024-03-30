import 'package:buysim_investment_tool_137/core/bi_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeDropdownTradeWidget extends StatefulWidget {
  final Function(String) onTimeSelected;
  const TimeDropdownTradeWidget({super.key, required this.onTimeSelected});

  @override
  State<TimeDropdownTradeWidget> createState() =>
      _TimeDropdownTradeWidgetState();
}

class _TimeDropdownTradeWidgetState extends State<TimeDropdownTradeWidget> {
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  bool isMenuOpen = false;
  String selectedTime = '1 min';

  List<String> times = [
    '1 min',
    '3 min',
    '5 min',
  ];

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: _toggleDropdown,
        child: Container(
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
            children: [
              Text(
                selectedTime,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              Icon(
                isMenuOpen
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: Colors.white,
                size: 23.r,
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
      setState(() {
        isMenuOpen = false;
      });
    } else {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
      setState(() {
        isMenuOpen = true;
      });
      widget.onTimeSelected(selectedTime);
    }
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    // double listHeight = times.length * 40.h;
    double listWidth = size.width;

    double top = offset.dy + size.height;

    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        width: listWidth,
        top: top,
        child: Material(
          color: Colors.transparent,
          elevation: 4,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.08),
              borderRadius: BorderRadius.circular(15.r),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: times.length,
              itemBuilder: (context, index) => GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  setState(() {
                    selectedTime = times[index];
                    _toggleDropdown();
                  });
                },
                child: Container(
                  width: listWidth,
                  height: 40.h,
                  alignment: Alignment.center,
                  child: Text(
                    times[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
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
