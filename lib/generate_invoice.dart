import 'package:flutter/material.dart';

class GenerateInvoiceScreen extends StatelessWidget {
  const GenerateInvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.picture_as_pdf,
            size: 72,
            color: Colors.white,
          ),
          const SizedBox(height: 15),
          const Text(
            'Generate Invoice',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () async {},
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 8),
              child: Text(
                "Invoice PDF",
                style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
