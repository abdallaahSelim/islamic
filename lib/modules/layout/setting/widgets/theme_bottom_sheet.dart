import 'package:flutter/material.dart';
import 'package:islamic_app/core/functions/get_translation.dart';
import 'package:islamic_app/providers/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          InkWell(
              splashColor: Theme.of(context).colorScheme.secondary,
              onTap: () {
                setState(() {
                  if (themeProvider.currentTheme != ThemeMode.light) {
                    themeProvider.changeTheme(ThemeMode.light);
                  }
                });
              },
              child: themeProvider.isDarkEnable()
                  ? _getUnSelectedItem(context, getTranslation(context).light)
                  : _getSelectedItem(context, getTranslation(context).light)),
          const SizedBox(
            height: 24,
          ),
          InkWell(
              splashColor: Theme.of(context).colorScheme.secondary,
              onTap: () {
                setState(() {
                  themeProvider.changeTheme(ThemeMode.dark);
                });
              },
              child: themeProvider.isDarkEnable()
                  ? _getSelectedItem(context, getTranslation(context).dark)
                  : _getUnSelectedItem(context, getTranslation(context).dark)),
        ],
      ),
    );
  }

  Widget _getSelectedItem(BuildContext context, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Theme.of(context).colorScheme.secondary)),
        Icon(
          Icons.check_circle_outline_outlined,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ],
    );
  }
  Widget _getUnSelectedItem(BuildContext context, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
