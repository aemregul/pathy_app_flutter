import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:pathy_app/bloc/ai/ai_cubit.dart';
import 'package:pathy_app/bloc/language/language_cubit.dart';
import 'package:pathy_app/core/extensions/context_extension.dart';
import 'package:pathy_app/ui/widgets/dialog/loading_dialog.dart';
import 'package:pathy_app/ui/widgets/sheet/gpt_response_sheet.dart';

class AskToAiButton extends StatelessWidget {
  const AskToAiButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.sized.dynamicWidth(0.6),
      child: FloatingActionButton.extended(
          label: Center(
              child: Text(
            context.translate.ask_to_pathy_ai.toUpperCase(),
            style: context.textTheme.bodyLarge
                ?.copyWith(fontWeight: FontWeight.w600),
          )),
          onPressed: () async {
            showDialog(
              context: context,
              builder: (context) => const LoadingDialog(),
            );
            BlocProvider.of<AiCubit>(context)
                .askToAi(
                    context.read<LanguageCubit>().state.locale.languageCode)
                .then((value) {
              Navigator.pop(context);
              showModalBottomSheet(
                  context: context,
                  builder: (value) => const GptResponseSheet());
            });
          }),
    );
  }
}
