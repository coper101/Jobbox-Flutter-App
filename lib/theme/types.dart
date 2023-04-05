enum FontFamilies { raleway }

extension FontFamilyExtension on FontFamilies {
  String get name {
    switch (this) {
      case FontFamilies.raleway:
        return 'Raleway';
    }
  }
}
