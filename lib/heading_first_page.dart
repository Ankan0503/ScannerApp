import 'package:flutter/material.dart';
import 'package:scanner_app/add_file.dart';

class HeadingFirstPage extends StatelessWidget {
  const HeadingFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Scanner App',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                elevation: 10,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    const Text(
                      'Add Heading',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 10.0,
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'Please Enter a Heading',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            fixedSize: WidgetStateProperty.all(Size(130, 40)),
                            backgroundColor: WidgetStateProperty.all(
                              Colors.green,
                            ),
                          ),
                          child: Wrap(
                            children: [
                              Text(
                                "Add ",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              Icon(Icons.add, size: 27, color: Colors.white),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            fixedSize: WidgetStateProperty.all(Size(130, 40)),
                            backgroundColor: WidgetStateProperty.all(
                              Colors.red,
                            ),
                          ),
                          child: Wrap(
                            children: [
                              Text(
                                "Reset ",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.restore_from_trash,
                                size: 27,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              Card(
                elevation: 10,
                margin: const EdgeInsets.only(top: 20),
                child: AddFile(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
