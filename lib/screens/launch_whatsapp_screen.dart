import 'package:flutter/material.dart';
import 'package:venancio_utils/services/launch_whatsapp.dart';

class LaunchWhatsappScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final service = LaunchWhatsappService();
  final textController = TextEditingController();

  LaunchWhatsappScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: textController,
              decoration: const InputDecoration(
                labelText: 'Número de telefone',
                hintText: '(38) 9 9883-7290',
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    await service.launchWhatsapp(textController.text);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                  }
                },
                child: const Text('LAUNCH'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
