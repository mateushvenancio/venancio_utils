import 'package:url_launcher/url_launcher.dart';

class LaunchUrlService {
  Future<void> launch(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri);
  }
}
