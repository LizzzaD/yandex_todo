// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class L10n {
  L10n();

  static L10n? _current;

  static L10n get current {
    assert(_current != null,
        'No instance of L10n was loaded. Try to initialize the L10n delegate before accessing L10n.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<L10n> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = L10n();
      L10n._current = instance;

      return instance;
    });
  }

  static L10n of(BuildContext context) {
    final instance = L10n.maybeOf(context);
    assert(instance != null,
        'No instance of L10n present in the widget tree. Did you add L10n.delegate in localizationsDelegates?');
    return instance!;
  }

  static L10n? maybeOf(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  /// `Мои дела`
  String get todosPageTitle {
    return Intl.message(
      'Мои дела',
      name: 'todosPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Выполнено`
  String get todosPageIsDoneLengthLabel {
    return Intl.message(
      'Выполнено',
      name: 'todosPageIsDoneLengthLabel',
      desc: '',
      args: [],
    );
  }

  /// `Нет`
  String get todoPriorityNo {
    return Intl.message(
      'Нет',
      name: 'todoPriorityNo',
      desc: '',
      args: [],
    );
  }

  /// `Низкий`
  String get todoPriorityLow {
    return Intl.message(
      'Низкий',
      name: 'todoPriorityLow',
      desc: '',
      args: [],
    );
  }

  /// `Высокий`
  String get todoPriorityHigh {
    return Intl.message(
      'Высокий',
      name: 'todoPriorityHigh',
      desc: '',
      args: [],
    );
  }

  /// `Новое`
  String get todosPageNewTodoLabel {
    return Intl.message(
      'Новое',
      name: 'todosPageNewTodoLabel',
      desc: '',
      args: [],
    );
  }

  /// `СОХРАНИТЬ`
  String get todoViewPageSaveButton {
    return Intl.message(
      'СОХРАНИТЬ',
      name: 'todoViewPageSaveButton',
      desc: '',
      args: [],
    );
  }

  /// `Удалить`
  String get todoViewPageDeleteButton {
    return Intl.message(
      'Удалить',
      name: 'todoViewPageDeleteButton',
      desc: '',
      args: [],
    );
  }

  /// `Сделать до`
  String get todoViewPageDeadlineLabel {
    return Intl.message(
      'Сделать до',
      name: 'todoViewPageDeadlineLabel',
      desc: '',
      args: [],
    );
  }

  /// `Важность`
  String get todoViewPagePriorityLabel {
    return Intl.message(
      'Важность',
      name: 'todoViewPagePriorityLabel',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<L10n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<L10n> load(Locale locale) => L10n.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
