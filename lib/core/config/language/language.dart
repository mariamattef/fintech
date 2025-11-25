import 'package:fintech/core/config/language/cubit/language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


Languages appLan(BuildContext context) => context.read<LanguageCubit>().appLang;

bool appLangIsArabic({BuildContext? context}) =>
    context != null && context.read<LanguageCubit>().isArabic;
