import 'package:flutter/material.dart';
import 'package:planee/presentation/widgets/box_icon.dart';

enum DetailFieldVariant { simple, detailed }

class DetailField extends StatelessWidget {
  final Text title;
  final Text description;
  final Icon icon;
  final DetailFieldVariant variant;
  final Text? description2;

  DetailField._internal({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.variant,
    this.description2,
  }) {
    if (variant == DetailFieldVariant.detailed && description2 == null) {
      throw Exception(
        'DetailField.detailed는 반드시 description2 인자를 초기화해야합니다. 현재 description2 = $description2',
      );
    }
  }

  DetailField.simple({
    Key? key,
    required Text title,
    required Text description,
    required Icon icon,
  }) : this._internal(
         key: key,
         title: title,
         description: description,
         icon: icon,
         variant: DetailFieldVariant.simple,
         description2: null,
       );

  DetailField.detailed({
    Key? key,
    required Text title,
    required Text description,
    required Icon icon,
    Text? description2,
  }) : this._internal(
         key: key,
         title: title,
         description: description,
         icon: icon,
         variant: DetailFieldVariant.detailed,
         description2: description2,
       );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        title,
        Row(
          spacing: 12,
          children: [
            BoxIcon(icon: icon),
            variant == DetailFieldVariant.simple
                ? description
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [description, description2!],
                  ),
          ],
        ),
      ],
    );
  }
}
