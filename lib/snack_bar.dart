import 'package:flutter/material.dart';
import 'package:scanner_app/main.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSnackBar extends StatefulWidget {
  const CustomSnackBar({super.key});

  @override
  State<CustomSnackBar> createState() => _CustomSnackBarState();
}

class _CustomSnackBarState extends State<CustomSnackBar> {
  void downloadCSV() => ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('CSV file downloaded!', style: GoogleFonts.poppins()),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        downloadCSV();
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColor().pastelMint),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        ),
        elevation: WidgetStateProperty.all(10),
      ),
      child: Wrap(
        children: [
          Text(
            "Download ",
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColor().darkText,
            ),
          ),
          Icon(Icons.download, size: 27, color: AppColor().darkText),
        ],
      ),
    );
  }
}
