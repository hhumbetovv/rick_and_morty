abstract class LanguageLocal {
  static const isoLangs = {
    "az": (name: "Azerbaijani", nativeName: "Azərbaycanca"),
    "en": (name: "English", nativeName: "İngilizce"),
    "tr": (name: "Turkish", nativeName: "Türkçe"),
  };

  static ({String name, String nativeName}) getDisplayLanguage(key) {
    if (isoLangs.containsKey(key)) {
      return isoLangs[key]!;
    } else {
      throw Exception("Language key incorrect");
    }
  }
}
