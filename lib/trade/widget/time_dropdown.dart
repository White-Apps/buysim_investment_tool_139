import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeDropdownTradeWidget extends StatefulWidget {
  final Function(String) onTimeSelected;
  const TimeDropdownTradeWidget({Key? key, required this.onTimeSelected})
      : super(key: key);

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
    '15 min',
    '45 min',
  ];

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: _toggleDropdown,
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
                    'Time',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    selectedTime,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Icon(
                isMenuOpen
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: Colors.white,
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

    double listHeight = times.length * 40.h;
    double listWidth = size.width;
    double top = offset.dy - listHeight;
    double topMargin = MediaQuery.of(context).padding.top;
    if (top < topMargin) {
      top = topMargin;
    }

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
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.r),
                topRight: Radius.circular(24.r),
              ),
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
                  height: 40.h, // height for each list item
                  alignment: Alignment.center,
                  child: Text(
                    times[index],
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
