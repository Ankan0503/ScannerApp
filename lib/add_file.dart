import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
// import 'package:scanner_app/cam_permission.dart';

class AddFile extends StatefulWidget {
  const AddFile({super.key});
  @override
  AddFileState createState() => AddFileState();
}

class AddFileState extends State<AddFile> {
  String? _fileName;
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
            const SnackBar(
              content: Text('Only images and PDFs are allowed!'),
              backgroundColor: Colors.red,
            ),
          );
          return;
        }

        setState(() {
          _fileName = file.name;
        });
      }
    } catch (e) {
      // Handle errors
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          const Text(
            "Upload a JPG or PDF file",
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: _pickFile,
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  backgroundColor: WidgetStateProperty.all(
                    const Color.fromARGB(215, 94, 156, 207),
                  ),
                ),
                child: const Text(
                  'Select File',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.camera_alt_rounded),
                iconSize: 32,
              ),
            ],
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              _fileName != null
                  ? 'Selected File: $_fileName'
                  : 'No file selected',
              style: TextStyle(fontSize: 15),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              fixedSize: WidgetStateProperty.all(Size(170, 40)),
              backgroundColor: WidgetStateProperty.all(
                const Color.fromARGB(188, 40, 91, 203),
              ),
            ),
            child: Wrap(
              children: [
                Text(
                  "Upload ",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Icon(Icons.upload, size: 27, color: Colors.white),
              ],
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              fixedSize: WidgetStateProperty.all(Size(170, 40)),
              backgroundColor: WidgetStateProperty.all(Colors.red),
            ),
            child: Wrap(
              children: [
                Text(
                  "Reset ",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Icon(Icons.restore_from_trash, size: 27, color: Colors.white),
              ],
            ),
          ),
          SizedBox(height: 25),
          const Text(
            "Download your CSV file here",
            style: TextStyle(fontSize: 14, color: Colors.blue),
          ),
          SizedBox(height: 5),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                Color.fromARGB(188, 40, 91, 203),
              ),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              fixedSize: WidgetStateProperty.all(Size(170, 40)),
            ),
            child: Wrap(
              children: [
                Text(
                  "Download ",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Icon(Icons.download, size: 27, color: Colors.white),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
