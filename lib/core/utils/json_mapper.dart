

class JsonMapper {
  JsonMapper._();

  // bool
  static bool boolFromJson(int value) => value != 0;

  static int boolToJson(bool value) => value ? 1 : 0;

  // datetime
  static DateTime? dateTimeFromJsonNullable(int? value) =>
      value != null ? DateTime.fromMillisecondsSinceEpoch(value) : null;

  static int? dateTimeToJsonNullable(DateTime? value) => value?.millisecondsSinceEpoch;
}
