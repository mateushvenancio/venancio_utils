import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:venancio_utils/services/copy_clipboard_service.dart';
import 'package:venancio_utils/services/launch_url_service.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({Key? key}) : super(key: key);

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  final textController = TextEditingController();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  final launchUrlService = LaunchUrlService();
  final copyClipboardService = CopyClipboardService();

  QRViewController? controller;

  void _onCreateQr(QRViewController controller) {
    this.controller = controller;
    this.controller?.scannedDataStream.listen((event) {
      if (event.code != null) {
        textController.text = event.code ?? '';
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.width * 0.5,
            child: AspectRatio(
              aspectRatio: 1,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onCreateQr,
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: textController,
            enabled: false,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'QR CODE',
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () async {
                    try {
                      await launchUrlService.launch(textController.text);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('$e'),
                      ));
                    }
                  },
                  label: const Text('ABRIR'),
                  icon: const Icon(FontAwesomeIcons.arrowUpRightFromSquare),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () async {
                    try {
                      await copyClipboardService.copy(textController.text);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('$e'),
                      ));
                    }
                  },
                  label: const Text('COPIAR'),
                  icon: const Icon(FontAwesomeIcons.copy),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
