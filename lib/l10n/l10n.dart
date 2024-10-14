import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class L10n {
  static final all = [
    const Locale("en"), //English
    const Locale('ar'), //Arabic
    const Locale("de"), //German
    const Locale("es"), //Spanish
    const Locale("hi"), //Hindi
  ];
  static int typeLanguageVoid(context) {
    if (AppLocalizations.of(context)!.language == "العربية") {
      return 1;
    } else if (AppLocalizations.of(context)!.language == "Deutsch") {
      return 2;
    } else if (AppLocalizations.of(context)!.language == "Español") {
      return 3;
    } else if (AppLocalizations.of(context)!.language == "हिन्दी भाषा") {
      return 4;
    } else {
      return 0;
    }
  }

  static String storyLanguageVoid(context, xLive) {
    if (AppLocalizations.of(context)!.language == "العربية") {
      if (xLive["story"]["ar"] != null) {
        return "ar";
      } else {
        return "en";
      }
    } else if (AppLocalizations.of(context)!.language == "Deutsch") {
      if (xLive["story"]["de"] != null) {
        return "de";
      } else {
        return "en";
      }
    } else if (AppLocalizations.of(context)!.language == "Español") {
      if (xLive["story"]["de"] != null) {
        return "de";
      } else {
        return "en";
      }
    } else if (AppLocalizations.of(context)!.language == "हिन्दी भाषा") {
      if (xLive["story"]["de"] != null) {
        return "de";
      } else {
        return "en";
      }
    } else {
      return "en";
    }
  }

  static String timeMonthVoid(context, xLive) {
    List<String> timeMonth;
    switch (xLive["time"].toDate().month) {
      case 1:
        timeMonth = ["January", "يناير", "Januar", "Enero", "जनवरी"];
        break;
      case 2:
        timeMonth = ["February", "فبراير", "Februar", "Febrero", "फ़रवरी"];
        break;
      case 3:
        timeMonth = ["March", "مارس", "Marsch", "Marzo", "मार्च"];
        break;
      case 4:
        timeMonth = ["April", "ابريل", "April", "Abril", "अप्रैल"];
        break;
      case 5:
        timeMonth = ["mayo", "مايو", "Mai", "mayonesa", "मेयो"];
        break;
      case 6:
        timeMonth = ["June", "يونيو", "Juni", "Junio", "जून"];
        break;
      case 7:
        timeMonth = ["July", "يوليو", "Juli", "Julio", "जुलाई"];
        break;
      case 8:
        timeMonth = ["August", "أغسطس", "August", "Agosto", "अगस्त"];
        break;
      case 9:
        timeMonth = [
          "September",
          "سبتمبر",
          "September",
          "Septiembre",
          "सितंबर"
        ];
        break;
      case 10:
        timeMonth = ["October", "أكتوبر", "Oktober", "Octubre", "अक्टूबर"];
        break;
      case 11:
        timeMonth = ["November", "نوفمبر", "November", "Noviembre", "नवंबर"];
        break;
      default:
        timeMonth = ["December", "ديسمبر", "Dezember", "Diciembre", "दिसंबर"];
        break;
    }
    return timeMonth[typeLanguageVoid(context)];
  }
}
