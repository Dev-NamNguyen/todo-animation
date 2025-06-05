extension StringExtension on String {
  String get capitalizeFirstLetter {
    if (this.isEmpty) return this;
    return '${this[0].toUpperCase()}${this.substring(1)}';
  }

  String get toLowerCaseFirstLetter {
    if (this.isEmpty) return this;
    return '${this[0].toLowerCase()}${this.substring(1)}';
  }

  String get removeAllWhitespace => this.replaceAll(RegExp(r'\s+'), '');
}
