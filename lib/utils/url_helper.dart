abstract class UrlHelper {
  static int getId(String url) {
    return int.parse(url.substring(url.lastIndexOf('/') + 1));
  }
}
