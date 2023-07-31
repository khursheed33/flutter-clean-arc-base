/// The code is defining an extension called `StringCasingExtension` on the `String` class in Dart. This
/// extension adds three methods to the `String` class: `toCapitalized()`, `toTitleCase()`, and
/// `replaceUnderscore()`.
extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');

  String replaceUnderscore() => replaceAll("_", " ");
}
