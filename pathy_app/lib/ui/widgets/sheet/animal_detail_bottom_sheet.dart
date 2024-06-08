import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pathy_app/bloc/language/language_cubit.dart';
import 'package:pathy_app/bloc/language/language_state.dart';
import 'package:pathy_app/model/animal_model.dart';

class AnimalDetailBottomSheet extends StatelessWidget {
  final AnimalModel animal;
  const AnimalDetailBottomSheet({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, languageState) {
      return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  animal.name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(animal
                    .getDescriptionByLanguage(languageState.locale.languageCode)
                    .description),
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 15),
              const SizedBox(height: 30),
            ],
          ),
        ),
      );
    });
  }
}
