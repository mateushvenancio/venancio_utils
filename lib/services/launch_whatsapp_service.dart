import 'package:url_launcher/url_launcher.dart';

class LaunchWhatsappService {
  String _sanitizeNumber(String number) {
    final _pattern = RegExp('[0-9]');
    String _newNumber = '';

    for (var item in number.split('')) {
      if (_pattern.hasMatch(item)) {
        _newNumber += item;
      }
    }

    if (!_newNumber.contains(RegExp('^55'))) {
      _newNumber = '55' + _newNumber;
    }

    return _newNumber;
  }

  Future<void> launchWhatsapp(String number) async {
    final _url = Uri(
      scheme: 'https',
      host: 'api.whatsapp.com',
      path: 'send',
      queryParameters: {
        'phone': _sanitizeNumber(number),
      },
    );

    await launchUrl(_url, mode: LaunchMode.externalApplication);

    // await launch('whatsapp://send?phone=5538998837290');
  }
}
