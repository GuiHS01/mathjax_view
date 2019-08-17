import 'dart:io';
import 'dart:async';
import 'package:http_server/http_server.dart';

class MathjaxServer {
  MathjaxServer();

  void start() {
    var staticFiles = VirtualDirectory('.')..allowDirectoryListing = true;

    runZoned(() {
      HttpServer.bind('0.0.0.0', 8080).then((server) {
        server.listen(staticFiles.serveRequest);
      });
    },
        onError: (e, stackTrace) =>
            print('MathjaxServer Error: $e $stackTrace'));
  }
}
