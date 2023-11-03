extension BoolParsing on String {
  bool? boolParse() {
    if (toLowerCase() == 'true') {
      return true;
    } else if (toLowerCase() == 'false') {
      return false;
    }
    return null;
  }
}
