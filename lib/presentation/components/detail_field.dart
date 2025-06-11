import 'package:flutter/material.dart';

class DetailField extends StatelessWidget {
  const DetailField({
    required this.title,
    required this.children,
    super.key,
    this.editable = false,
  });

  final Text title;
  final List<Widget> children;
  final bool editable;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Row(
          children: [
            title,
            if (editable) ...[
              const SizedBox(width: 8),
              const Icon(Icons.edit, size: 18),
            ],
          ],
        ),
        Row(children: children),
      ],
    );
  }
}
