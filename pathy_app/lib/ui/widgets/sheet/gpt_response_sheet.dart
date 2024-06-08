import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pathy_app/bloc/ai/ai_cubit.dart';
import 'package:pathy_app/bloc/ai/ai_state.dart';
import 'package:pathy_app/core/extensions/context_extension.dart';

class GptResponseSheet extends StatelessWidget {
  const GptResponseSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AiCubit, AiState>(builder: (context, state) {
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
                  context.translate.answer_of_pathy_ai,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                context.translate.powered_by_pathy_ai,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                    state.response?.content ?? context.translate.ai_thinking),
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
