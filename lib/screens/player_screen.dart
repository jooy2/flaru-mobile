import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:webview_flutter/webview_flutter.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late final WebViewController _webViewController;
  ValueNotifier<String> _fileName = ValueNotifier('Unknown');

  @override
  void initState() {
    super.initState();
  }

  Future<void> startLocalAssetServer(String swfFilePath) async {
    final handler = const Pipeline().addHandler((Request request) async {
      print('Request: ${request.url.path}');

      switch (request.url.path) {
        case "swf-asset":
          File swfFile = File(swfFilePath);

          final stat = swfFile.statSync();
          final headers = {
            HttpHeaders.lastModifiedHeader: formatHttpDate(stat.modified),
            HttpHeaders.acceptRangesHeader: 'bytes',
            HttpHeaders.contentTypeHeader: 'application/x-shockwave-flash',
          };
          return Response.ok(swfFile.openRead(), headers: headers..[HttpHeaders.contentLengthHeader] = '${stat.size}');
        default:
          final byteData = await rootBundle.load('assets/www/${request.url.path}');

          String mimeType = 'text/plain';

          switch (extension(request.url.path)) {
            case '.html':
              mimeType = 'text/html';
              break;
            case '.js':
              mimeType = 'text/javascript';
              break;
            case '.css':
              mimeType = 'text/css';
              break;
            case '.wasm':
              mimeType = 'application/wasm';
              break;
            case '.map':
            case '.json':
              mimeType = 'application/json';
              break;
          }

          final headers = {
            HttpHeaders.acceptRangesHeader: 'bytes',
            HttpHeaders.contentTypeHeader: mimeType,
          };

          return Response.ok(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes),
              headers: headers..[HttpHeaders.contentLengthHeader] = '${byteData.lengthInBytes}');
      }
    });

    await io.serve(handler, 'localhost', 8080);
    print('server running at: http://localhost:8080');
  }

  Future<void> _initializeWebView() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null) {
      String filePath = result.files.single.path!;
      print('Load file: $filePath');
      await startLocalAssetServer(filePath);

      _fileName.value = basename(filePath);
    }

    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse('http://localhost:8080/index.html'));
  }

  Widget _createPlayerContainerWidget() {
    return Column(children: [
      _createPlayerWidget(),
    ]);
  }

  Widget _createPlayerWidget() {
    return Expanded(child: WebViewWidget(controller: _webViewController));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: ValueListenableBuilder(
                builder: (BuildContext context, String fileName, Widget? child) {
                  return Text(fileName);
                },
                valueListenable: _fileName)),
        body: SafeArea(
            child: FutureBuilder(
                future: _initializeWebView(),
                builder: (BuildContext fbContext, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return _createPlayerContainerWidget();
                  } else {
                    return const SizedBox.shrink();
                  }
                })));
  }
}
