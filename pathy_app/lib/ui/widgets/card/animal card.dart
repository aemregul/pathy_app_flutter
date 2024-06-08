import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:pathy_app/core/extensions/context_extension.dart';
import 'package:pathy_app/model/animal_model.dart';
import 'package:pathy_app/ui/widgets/sheet/animal_detail_bottom_sheet.dart';

class AnimalCard extends StatelessWidget {
  final AnimalModel animal;
  final String languageCode;
  const AnimalCard(
      {super.key, required this.animal, required this.languageCode});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      width: context.sized.dynamicWidth(0.6),
      decoration: BoxDecoration(
        color: context.theme.cardColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Padding(
          padding: const EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                animal.image,
                width: double.infinity,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              animal.name,
              style: context.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 7),
            Text(
              animal.species,
              style: context.textTheme.bodySmall,
            ),
            const SizedBox(height: 7),
            Text(
              animal.getDescriptionByLanguage(languageCode).description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.labelMedium
                  ?.copyWith(color: Colors.grey.shade600),
            ),
            const Spacer(),
            Center(
                child: TextButton(
                    onPressed: () {
                      showBottomSheet(
                        context: context,
                        builder: (context) =>
                            AnimalDetailBottomSheet(animal: animal),
                      );
                    },
                    child: Text(context.translate.view_more)))
          ])),
    );
  }
}
