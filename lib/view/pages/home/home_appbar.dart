import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../widget/responsive.dart';
import '../../../bridge.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});
  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  late String _dropdownButton;
  @override
  Widget build(BuildContext context) {
    _dropdownButton = AppLocalizations.of(context)!.language;
    return Row(
      children: [
        if (!Responsive.isAndroid(context))
          textButton("H", () => Bridge.home()),
        const SizedBox(width: 10),
        Expanded(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Container(
                  height: 35,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
              ),
              Row(
                children: [
                  const SizedBox(width: 5),
                  const Text(
                    "",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Center(
                      child: TextField(
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!.search,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 5),
        if (Responsive.isDesktop(context))
          textButton(AppLocalizations.of(context)!.watchlist, () {}),
        textButton(AppLocalizations.of(context)!.signIn, () {}),
        if (!Responsive.isMobile(context))
          SizedBox(
            width: 100,
            child: DropdownButton(
              dropdownColor: Colors.black,
              value: _dropdownButton,
              iconSize: 20,
              iconEnabledColor: Colors.white,
              iconDisabledColor: Colors.amber,
              onChanged: (Object? value) {
                if (value is String) {
                  setState(() {
                    _dropdownButton = value;
                  });
                }
              },
              items: const [
                DropdownMenuItem(
                  value: "English",
                  child: Text('English', style: TextStyle(color: Colors.white)),
                ),
                DropdownMenuItem(
                  value: "العربية",
                  child: Text('العربية', style: TextStyle(color: Colors.white)),
                ),
                DropdownMenuItem(
                  value: "Deutsch",
                  child: Text('Deutsch', style: TextStyle(color: Colors.white)),
                ),
                DropdownMenuItem(
                  value: "Español",
                  child: Text('Español', style: TextStyle(color: Colors.white)),
                ),
                DropdownMenuItem(
                  value: "हिन्दी भाषा",
                  child: Text('हिन्दी भाषा',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Padding textButton(text, fun) {
    return Padding(
      padding: const EdgeInsets.all(2.5),
      child: TextButton(
        onPressed: fun,
        style: const ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.all(2.5)),
          overlayColor: WidgetStatePropertyAll(Colors.white12),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
