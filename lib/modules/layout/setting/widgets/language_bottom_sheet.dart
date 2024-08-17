import 'package:flutter/material.dart';
import 'package:islamic_app/providers/locale/locale_provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var localeProvider = LocaleProvider.get(context);
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        children: [
          InkWell(
              splashColor: Theme.of(context).colorScheme.secondary,
              onTap: () {
                setState(() {
                  localeProvider.changeLocale('en');
                });
              },
              child: localeProvider.currentLocaleCode == 'en'
                  ? _getSelectedItem(context, 'English')
                  : _getUnSelectedItem(context, 'English')),
          const SizedBox(
            height: 24,
          ),
          InkWell(
              splashColor: Theme.of(context).colorScheme.secondary,
              onTap: () {
                setState(() {
                  localeProvider.changeLocale('ar');
                });
              },
              child: localeProvider.currentLocaleCode == 'ar'
                  ? _getSelectedItem(context, 'ِالعربية')
                  : _getUnSelectedItem(context, 'العربية')),
        ],
      ),
    );
  }

  Widget _getSelectedItem(BuildContext context, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.secondary)),
        ),
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
