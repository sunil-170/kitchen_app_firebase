// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LanguageModel {
  final String languagename;
  final String languagecode;
  final String countrycode;
  const LanguageModel({
    required this.languagename,
    required this.languagecode,
    required this.countrycode,
  });

  factory LanguageModel.fromJson({required String json}) {
    final Map<String, dynamic> data =
        json.isEmpty ? <String, dynamic>{} : jsonDecode(json);
    return LanguageModel(
        languagename: data['name'] ?? 'English',
        languagecode: data['language_code'] ?? 'en',
        countrycode: data['country_code'] ?? 'US');
  }

  String toJson() => jsonEncode({
        "name": languagename,
        "language_code": languagecode,
        "country_code": countrycode
      });

  @override
  String toString() => '${languagecode}_${countrycode}';

  @override
  bool operator ==(Object other) {
    return this.languagename == (other as LanguageModel).languagename &&
        this.languagecode == other.languagecode &&
        this.countrycode == other.countrycode;
  }

  @override
  int get hashCode =>
      languagename.hashCode ^ languagecode.hashCode ^ countrycode.hashCode;
}
