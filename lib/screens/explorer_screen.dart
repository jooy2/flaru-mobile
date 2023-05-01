import 'package:file_picker/file_picker.dart';
import 'package:flaru/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExplorerScreen extends StatefulWidget {
  const ExplorerScreen({Key? key}) : super(key: key);

  @override
  State<ExplorerScreen> createState() => _ExplorerScreenState();
}

class _ExplorerScreenState extends State<ExplorerScreen> {
  @override
  void initState() {
    super.initState();
  }

  void _handleClickSelectSWF(BuildContext context) async {
    FilePicker.platform
        .pickFiles(
      type: FileType.any,
    )
        .then((FilePickerResult? result) {
      if (result != null) {
        String filePath = result.files.single.path!;

        context.pushNamed(RouteNames.player.name, queryParameters: {'path': filePath});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Explorer')),
        body: SafeArea(
            child: Column(children: [
          Card(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              elevation: 3,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1.0, color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(20.0),
                onTap: () => _handleClickSelectSWF(context),
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                    width: double.infinity,
                    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
                      Text('Click here to select the SWF file you want to run.', textAlign: TextAlign.center, style: TextStyle(fontSize: 17)),
                      SizedBox(height: 25),
                      Icon(
                        Icons.folder_open_outlined,
                        size: 40,
                      )
                    ])),
              ))
        ])));
  }
}
