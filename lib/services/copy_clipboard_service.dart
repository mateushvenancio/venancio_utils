import 'package:flutter/services.dart';

class CopyClipboardService {
  Future<void> copy(String content) async {
    await Clipboard.setData(ClipboardData(text: content));
  }
}
