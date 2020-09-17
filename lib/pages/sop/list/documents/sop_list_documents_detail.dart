import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:brupedia/resources/resources.dart';
import 'package:brupedia/utils/helper.dart' as helper;
import 'package:brupedia/utils/utils.dart';
import 'package:brupedia/widgets/parent.dart';
import 'package:brupedia/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf_flutter/pdf_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

///*********************************************
/// Created by ukietux on 30/08/20 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
class SopListDocumentsDetail extends StatefulWidget {
  final String url;
  final String fileName;

  const SopListDocumentsDetail({Key key, this.url, this.fileName})
      : super(key: key);

  @override
  _SopListDocumentsDetailState createState() => _SopListDocumentsDetailState();
}

class _SopListDocumentsDetailState extends State<SopListDocumentsDetail> {
  var _height = 0.0;
  var _localPath = "";
  ReceivePort _port = ReceivePort();

  @override
  void initState() {
    super.initState();
    "test".toToastLoading();
    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];
      helper.logs("id $id > status $status > progress $progress");
      if (status == DownloadTaskStatus.complete) {
        helper.logs("${Strings.fileDisimpan} $_localPath");
        "${Strings.fileDisimpan} $_localPath".toToastSuccess();
      }
    });

    FlutterDownloader.registerCallback(downloadCallback);
    _prepareData();
  }

  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send.send([id, status, progress]);
  }

  _prepareData() async {
    await _checkPermission();
    _localPath = (await _findLocalPath()) + Platform.pathSeparator + 'Download';

    final savedDir = Directory(_localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
  }

  Future<bool> _checkPermission() async {
    if (Platform.isAndroid) {
      final status = await Permission.storage.status;
      if (status != PermissionStatus.granted) {
        final result = await Permission.storage.request();
        if (result == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

  Future<String> _findLocalPath() async {
    final directory = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    return directory.path;
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: context.appBar(),
      isScroll: false,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            widget.fileName ?? "",
            style: TextStyles.primaryBold.copyWith(fontSize: Dimens.fontLarge),
          ),
          Expanded(
            flex: 5,
            child: MeasureSize(
              onChange: (value) {
                setState(() {
                  _height = value.height;
                });
              },
              child: PDF.network(
                widget.url,
                width: widthInPercent(100, context),
                height: _height,
                placeHolder: Center(
                  child: Loading(),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button(
                  width: widthInPercent(40, context),
                  color: Colors.blue,
                  fontSize: Dimens.fontNormal,
                  title: "Share",
                ),
                Button(
                  width: widthInPercent(40, context),
                  color: Colors.green,
                  fontSize: Dimens.fontNormal,
                  title: "Download",
                  onPressed: () async {
                    var taskId = await FlutterDownloader.enqueue(
                        url: widget.url,
                        savedDir: _localPath,
                        showNotification: true,
                        openFileFromNotification: true);
                    context.logs("taskId : $taskId");
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
