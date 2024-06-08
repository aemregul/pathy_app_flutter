import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:pathy_app/bloc/animal/animal_cubit.dart';
import 'package:pathy_app/bloc/animal/animal_state.dart';
import 'package:pathy_app/bloc/language/language_cubit.dart';
import 'package:pathy_app/core/extensions/context_extension.dart';
import 'package:pathy_app/ui/widgets/button/ask_to_ai_button.dart';
import 'package:pathy_app/ui/widgets/button/settings_button.dart';
import 'package:pathy_app/ui/widgets/card/animal%20card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SizedBox(
          width: context.sized.dynamicWidth(0.6),
          child: const AskToAiButton(),
        ),
        appBar: AppBar(
          title: const Text(
            'PathyApp',
          ),
          actions: const [
            SettingsButton(),
          ],
        ),
        body: BlocBuilder<AnimalCubit, AnimalState>(builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(context.translate.pets,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 320,
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: state.pets
                        .map((pet) => AnimalCard(
                              animal: pet,
                              languageCode: context
                                  .read<LanguageCubit>()
                                  .state
                                  .locale
                                  .languageCode,
                            ))
                        .toList(),
                  ),
                ),
                const SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(context.translate.wild_animals,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 320,
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: state.wilds
                        .map((wild) => AnimalCard(
                              animal: wild,
                              languageCode: context
                                  .read<LanguageCubit>()
                                  .state
                                  .locale
                                  .languageCode,
                            ))
                        .toList(),
                  ),
                ),
                const SizedBox(height: 150),
              ],
            ),
          );
        }));
  }
}
