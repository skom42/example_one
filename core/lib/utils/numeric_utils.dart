class NumericUtils {
  static String volunteeredHourCount({required double hourVolunteered}) {
    final bool isInteger = _isInteger(hourVolunteered);
    if (isInteger) {
      return hourVolunteered.toInt().toString();
    } else {
      return hourVolunteered.toString();
    }
  }

  static bool _isInteger(num value) => value is int || value == value.roundToDouble();
}
