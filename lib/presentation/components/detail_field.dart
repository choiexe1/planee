import 'package:flutter/material.dart';

class DetailField extends StatelessWidget {
  const DetailField({
    required this.title,
    required this.children,
    super.key,
    this.onTapEdit,
    this.editable = false,
  });

  final Text title;
  final List<Widget> children;
  final bool editable;
  final VoidCallback? onTapEdit;

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
              GestureDetector(
                onTap: () {
                  onTapEdit?.call();
                },
                child: const Icon(Icons.edit, size: 18),
              ),
            ],
          ],
        ),
        Row(children: children),
      ],
    );
  }
}
