import 'package:flutter/material.dart';

class DomiIdCustomRangeSelector extends StatefulWidget {
  final double initialValue;
  final double minValue;
  final double maxValue;
  final ValueChanged<double> onChanged;

  const DomiIdCustomRangeSelector({
    super.key,
    required this.initialValue,
    required this.minValue,
    required this.maxValue,
    required this.onChanged,
  });

  @override
  _DomiIdCustomRangeSelectorState createState() => _DomiIdCustomRangeSelectorState();
}

class _DomiIdCustomRangeSelectorState extends State<DomiIdCustomRangeSelector> {
  late double _currentValue;
  bool _showLabel = false;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onHorizontalDragUpdate: (details) {
            final RenderBox box = context.findRenderObject() as RenderBox;
            final Offset localPosition = box.globalToLocal(details.globalPosition);
            final double newValue = (localPosition.dx / box.size.width) * (widget.maxValue - widget.minValue) + widget.minValue;
            setState(() {
              _currentValue = newValue.clamp(widget.minValue, widget.maxValue);
              _showLabel = true;
            });
            widget.onChanged(_currentValue);
          },
          onHorizontalDragEnd: (_) => setState(() => _showLabel = false),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: (_currentValue - widget.minValue ).round(),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFFCCFF00),
                        ),
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          '\$${_currentValue.toInt()}/mo',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis,

                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: (widget.maxValue - _currentValue - 35 ).round(),
                      child: const SizedBox(),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: (_currentValue - widget.minValue) / (widget.maxValue - widget.minValue) * MediaQuery.of(context).size.width -10,
                top: 0,
                bottom: 0,
                child: Container(
                  width: 20,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ),
              if (_showLabel)
                Positioned(
                  left: (_currentValue - widget.minValue) / (widget.maxValue - widget.minValue) * MediaQuery.of(context).size.width - 30,
                  top: -40,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '\$${_currentValue.toInt()}/mo',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}