// ignore_for_file: prefer_const_constructors
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';

class Pdf_Api {
  String documentHeader;
  String documentBody;

  Pdf_Api({required this.documentHeader, required this.documentBody});

  static Future<File> generateCenteredText(
      {required String documentHeader, required String documentBody}) async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.MultiPage(
          build: ((context) => <pw.Widget>[
                pw.Header(
                  child: pw.Center(
                    child: pw.Text(documentHeader,
                        style: pw.TextStyle(
                            fontSize: 35, fontBold: pw.Font.timesItalic())),
                  ),
                ),
                pw.Paragraph(
                    text: documentBody, style: pw.TextStyle(fontSize: 25)),
              ])),
    );
    return saveDocument(name: '$documentHeader.pdf', pdf: pdf);
  }

  static Future<File> saveDocument(
      {required String name, required pw.Document pdf}) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();

    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;

    // Reset the permission status to undetermined
    await Permission.storage.request().then((status) {
      if (status.isGranted) {
        // Permission granted, open the file
        OpenFile.open(url);
      } else if (status.isDenied) {
        print('Permission denied');
      } else if (status.isPermanentlyDenied) {
        print(
            'Permission permanently denied. You can open settings to enable it.');
      }
    });
  }
}
