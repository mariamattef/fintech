import 'dart:ui' as ui;
import 'package:collection/collection.dart';
import 'package:fintech/core/databases/cache/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum Languages { en, ar }

class LanguageCubit extends Cubit<Languages> {
  static Languages defaultLang = Languages.en;

  LanguageCubit() : super(defaultLang);

  Languages get appLang => state;

  Future<void> fetchLocale() async {
    if (CacheHelper.getLanguage() == null) {
      final detected =
          Languages.values.firstWhereOrNull(
            (lang) => ui.PlatformDispatcher.instance.locale.languageCode
                .contains(lang.name),
          ) ??
          defaultLang;

      emit(detected);
    } else {
      final saved = Languages.values.firstWhere(
        (lang) => lang.name == CacheHelper.getLanguage(),
      );

      emit(saved);
    }
  }

  Future<void> changeLanguage({Languages? language}) async {
    Languages newLanguage;

    if (language != null) {
      newLanguage = language;
    } else {
      newLanguage = state == Languages.ar ? Languages.en : Languages.ar;
    }

    if (newLanguage == state) return;

    await CacheHelper.setLanguage(lang: newLanguage.name);
    emit(newLanguage);
  }

  bool get isArabic => state == Languages.ar;
}
