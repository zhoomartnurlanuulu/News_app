class Language {
  final int id;
  final String name;
  final String flag;
  final String langeuageCode;

  Language(this.id, this.name, this.flag, this.langeuageCode);

  static List<Language> languageList() {
    return <Language>[
      Language(1, '🇬🇧', 'English', 'en'),
      Language(2, '🇷🇺', 'Русский', 'ru'),
      Language(3, '🇰🇬', 'Кыргызский', 'kgz'),
      ];
  }
}
