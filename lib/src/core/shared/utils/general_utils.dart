class GeneralUtils {
  static Map<String, String> getUriParameters() {
    final uri = Uri.dataFromString(Uri.base.toString());
    return uri.queryParameters;
  }
}
