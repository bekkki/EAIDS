class Language {
  final int id;
  final String name;
  final String flag;
  final String languageCode;
  Language(this.id, this.name, this.flag, this.languageCode);
  static List<Language> languagelist() {
    return <Language>[
      Language(1, 'πͺπΉ', 'α αα­α', 'am'),
      Language(2, 'πΊπΈ', 'English', 'en'),
      Language(3, 'πͺπΉ', 'Oromiffa', 'hi'),
    ];
  }
}
