import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scanner_app/main.dart';
import 'package:scanner_app/add_file.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final TextEditingController headingController = TextEditingController();
  List<String> headings = [];

  void addHeading() {
    if (headingController.text.isNotEmpty) {
      setState(() {
        headings.add(headingController.text);
        headingController.clear();
      });
    }
  }

  void resetHeading() {
    setState(() {
      headings.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor().scfld,
      appBar: AppBar(
        backgroundColor: AppColor().pastelBlue,
        centerTitle: true,
        title: Text(
          'Scanner App',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 28,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              'Add Heading',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 21,
                color: AppColor().darkText,
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 250,
              child: TextField(
                textCapitalization: TextCapitalization.words,
                controller: headingController,
                decoration: InputDecoration(
                  hintText: 'Type a Heading',
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 18,
                    color: AppColor().pastelGray,
                  ),
                  contentPadding: const EdgeInsets.all(10.0),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: AppColor().borderColor),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    addHeading();
                  },
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
                      AppColor().pastelBlue,
                    ),
                  ),
                  child: Wrap(
                    children: [
                      Text(
                        "Add ",
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),
                      Icon(Icons.add, size: 22, color: Colors.white),
                    ],
                  ),
                ),
                SizedBox(width: 15),
                ElevatedButton(
                  onPressed: () {
                    resetHeading();
                  },
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    padding: WidgetStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                    ),
                    backgroundColor: WidgetStateProperty.all(
                      AppColor().pastelRed,
                    ),
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
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Added Headings:\n',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                        color: AppColor().darkText,
                      ),
                    ),
                    TextSpan(
                      text: headings.join(', '),
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: AppColor().darkText,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Wrap(children: [AddFile()]),
          ],
        ),
      ),
    );
  }
}
