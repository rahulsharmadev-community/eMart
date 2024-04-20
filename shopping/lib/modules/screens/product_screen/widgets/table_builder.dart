import 'package:flutter/material.dart';

class TableBuilder extends StatelessWidget {
  final bool showBorder;
  final EdgeInsetsGeometry padding;
  final List<(String, String)> data;

  const TableBuilder({
    super.key,
    required this.data,
    this.showBorder = false,
    this.padding = const EdgeInsets.all(8),
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      border: showBorder ? TableBorder.all() : null,
      defaultColumnWidth: const IntrinsicColumnWidth(),
      children: [
        for (var entry in data)
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: padding,
                  child: Text(
                    entry.$1,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: padding,
                  child: Text(entry.$2),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
