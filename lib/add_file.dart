import 'package:flutter/material.dart';
import 'package:scanner_app/main.dart';
import 'package:scanner_app/snack_bar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class AddFile extends StatefulWidget {
  const AddFile({super.key});
  @override
  AddFileState createState() => AddFileState();
}

class AddFileState extends State<AddFile> {
  List<String> fileName = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _openCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        String customImageName =
            'photo_${DateTime.now().millisecondsSinceEpoch}.jpg';
        fileName.add(customImageName);
      });
    }
  }

  Future<void> _pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: true,
      );

      if (result != null) {
        final PlatformFile file = result.files.first;
        final String extension = file.extension?.toLowerCase() ?? '';

        const allowed = {'jpg', 'jpeg', 'png', 'gif', 'bmp', 'pdf'};
        if (!allowed.contains(extension)) {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Only images and PDFs are allowed!'),
              backgroundColor: AppColor().pastelRed,
            ),
          );
          return;
        }

        setState(() {
          fileName.add(file.name);
        });
      }
    } catch (e) {
      // Handle errors
    }
  }

  void resetFile() {
    setState(() {
      fileName.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Upload a JPG or PDF file",
          style: GoogleFonts.poppins(
            fontSize: 21,
            fontWeight: FontWeight.w600,
            color: AppColor().darkText,
          ),
        ),
        SizedBox(height: 4),
        Row(
          children: [
            TextButton(
              onPressed: _pickFile,
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                ),
                backgroundColor: WidgetStateProperty.all(
                  AppColor().pastelOrange,
                ),
              ),
              child: Text(
                'Select File',
                style: GoogleFonts.poppins(color: AppColor().darkText),
              ),
            ),
            SizedBox(width: 15),
            IconButton(
              onPressed: () {
                _openCamera();
              },
              icon: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: AppColor().pastelPink,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.camera_alt_rounded),
              ),
              color: AppColor().darkText,
            ),
          ],
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Selected Files:\n',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: AppColor().darkText,
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(
                  text: fileName.join(',\n'),
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: AppColor().darkText,
                  ),
                ),
              ],
            ),
          ),
        ),

        Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                ),
                backgroundColor: WidgetStateProperty.all(
                  AppColor().pastelPurple,
                ),
              ),
              child: Wrap(
                children: [
                  Text(
                    "Upload ",
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                  Icon(Icons.upload, size: 24, color: Colors.white),
                ],
              ),
            ),
            SizedBox(width: 15),
            ElevatedButton(
              onPressed: () {
                resetFile();
              },
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                ),
                backgroundColor: WidgetStateProperty.all(AppColor().pastelRed),
              ),
              child: Wrap(
                children: [
                  Text(
                    "Reset ",
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                  Icon(Icons.delete, size: 22, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Text(
          "Download your CSV file here",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColor().darkText,
          ),
        ),
        SizedBox(height: 15),
        Center(child: CustomSnackBar()),
      ],
    );
  }
}
