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
          const Text('Click the button below to select and run your SWF file.'),
          IconButton(onPressed: () => _handleClickSelectSWF(context), icon: const Icon(Icons.folder_copy_outlined))
        ])));
  }
}
