extension StringExtension on String {
  String toUpperCaseFirstLetter() {
    return this[0].toUpperCase() + substring(1);
  }

  String formatUsername() {
    return split('.')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }
}
