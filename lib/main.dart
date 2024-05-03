import 'package:flutter/material.dart';
import 'package:invoice_generate_pdf/services/file_handle_api_service.dart';
import 'package:invoice_generate_pdf/services/pdf_invoice_api_service.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Invoice PDF Generate',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PdfColor themeColor = PdfColors.black;
  pw.Font font = pw.Font.courier();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Invoice"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            DropdownButtonFormField(
              decoration: const InputDecoration(hintText: "Select Them Color"),
              items: const [
                DropdownMenuItem(
                  value: PdfColors.black,
                  child: Text('Black'),
                ),
                DropdownMenuItem(
                  value: PdfColors.grey900,
                  child: Text('Dark Grey'),
                ),
                DropdownMenuItem(
                  value: PdfColors.green,
                  child: Text('Green'),
                ),
                DropdownMenuItem(
                  value: PdfColors.blue,
                  child: Text('Blue'),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    themeColor = value;
                  });
                }
              },
            ),
            DropdownButtonFormField(
              decoration: const InputDecoration(hintText: "Select Font"),
              items: const [
                DropdownMenuItem(
                  value: pw.Font.courier,
                  child: Text('Courier'),
                ),
                DropdownMenuItem(
                  value: pw.Font.helvetica,
                  child: Text('Helvetica'),
                ),
                DropdownMenuItem(
                  value: pw.Font.times,
                  child: Text('Times'),
                ),
                DropdownMenuItem(
                  value: pw.Font.zapfDingbats,
                  child: Text('ZapfDingbats'),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    font = value();
                  });
                }
              },
            ),
            ElevatedButton(
              onPressed: () async {
                final pdfFile = await PdfInvoiceApiService.generate(themeColor, pw.Font.courier());

                // open file pdf
                FileHandleApiService.openFile(pdfFile);
              },
              child: const Text("Generate Invoice"),
            ),
          ],
        ),
      ),
    );
  }
}
