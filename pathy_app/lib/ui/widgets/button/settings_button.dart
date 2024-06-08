import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pathy_app/core/extensions/context_extension.dart';
import 'package:pathy_app/routes/app_router.dart';
import 'package:pathy_app/ui/widgets/other/safe_on_tap.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeOnTap(
      onTap: () {
        context.push(AppRouter.settingsRoute);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade400, width: 1.5)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Icon(
              Icons.settings,
              color: context.textTheme.bodyMedium?.color,
            ),
          ),
        ),
      ),
    );
  }
}
