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
import 'package:flutter_share/flutter_share.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf_flutter/pdf_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class JobKnowledgeListDocumentsDetail extends StatefulWidget {
  final String url;
  final String fileName;

  const JobKnowledgeListDocumentsDetail({Key key, this.url, this.fileName})
      : super(key: key);

  @override
  _JobKnowledgeListDocumentsDetailState createState() =>
      _JobKnowledgeListDocumentsDetailState();
}

class _JobKnowledgeListDocumentsDetailState
    extends State<JobKnowledgeListDocumentsDetail> {
  var _height = 0.0;
  var _localPath = "";
  ReceivePort _port = ReceivePort();

  @override
  void initState() {
    super.initState();

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
    _localPath = (await _findLocalPath());

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
    final directory = await getApplicationDocumentsDirectory();
    return Platform.isAndroid ? "/storage/emulated/0/Download" : directory.path;
  }

  Future<void> _share() async {
    await FlutterShare.share(
        title: Strings.appName,
        text: Strings.downloadHere,
        linkUrl: widget.url,
        chooserTitle: Strings.bagikan);
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
            flex: 6,
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
          SizedBox(
            height: dp8(context),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Button(
                  width: widthInPercent(40, context),
                  color: Colors.blue,
                  fontSize: Dimens.fontNormal,
                  title: Strings.share,
                  onPressed: () async {
                    await _share();
                  },
                ),
                Button(
                  width: widthInPercent(40, context),
                  color: Colors.green,
                  fontSize: Dimens.fontNormal,
                  title: Strings.download,
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
