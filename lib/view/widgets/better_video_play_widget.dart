import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:better_player/better_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';


///[like type choose from settings]
///
///

// ignore: must_be_immutable
class VideoPlayerPage extends StatefulWidget with WidgetsBindingObserver {

  // String movieName;
  // String imageUrl;
  // String movieUrl;

  VideoPlayerPage(
      // this.movieName,
      // this.imageUrl,
      // this.movieUrl
      );

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  // late String thumbnailURL;
  late BetterPlayerController _betterPlayerController;
  late BetterPlayerDataSource _betterPlayerDataSource;
  late BetterPlayerEvent _betterPlayerEvent;

  List dataSourceList = <BetterPlayerDataSource>[];
  String status="";
  bool waiting=false;

  bool downloading = false;
  var progressString = "";



  CheckingWatchType() async {

    BetterPlayerConfiguration _betterPlayerConfiguration =
    const BetterPlayerConfiguration(
      allowedScreenSleep: false,
      autoDispose: true,
      rotation: 0,
      autoPlay: false,
      looping: false,
      //  fullScreenByDefault: true,
      autoDetectFullscreenDeviceOrientation: true,
      controlsConfiguration: BetterPlayerControlsConfiguration(
          enableMute: true,
          enableOverflowMenu: true,
          // overflowMenuIcon: const IconData(
          //   0xe146,
          //   fontFamily: 'MaterialIcons',
          // ),
          showControlsOnInitialize: false,
          playerTheme: BetterPlayerTheme.material,
          enableProgressText: true),
    );

    _betterPlayerDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      // "https://api.mc2cr.com/watch/A402DFA09A3A",
      'https://media.w3.org/2010/05/sintel/trailer.mp4',
      // resolutions: cleanedURLs,
      // liveStream: args.containsKey("liveType") ? args["liveType"] : false,
      // placeholder: Image(
      //   image: CachedNetworkImageProvider(
      //     tUrl,
      //   ),
      //   //  fit: BoxFit.fitHeight,
      // ),
      // notificationConfiguration: BetterPlayerNotificationConfiguration(
      //   showNotification: true,
      //   title: title,
      //   author: "",
      //   imageUrl: tUrl,
      // ),
    );

    _betterPlayerController = BetterPlayerController(_betterPlayerConfiguration)
      ..addEventsListener((p0) {
        log(p0.betterPlayerEventType.toString());
        if (p0.betterPlayerEventType == BetterPlayerEventType.pause ||
            p0.betterPlayerEventType == BetterPlayerEventType.finished) {
          // showInAppReview();
        }
        p0.betterPlayerEventType == BetterPlayerEventType.finished;
      });
    _betterPlayerController.setupDataSource(_betterPlayerDataSource);

  }
  ///-------------------------------------------------------














  @override
  void initState() {

    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        // "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
        // "http://tv.trexiptv.com:80/play/live.php?mac=00:1A:79:67:EB:60&stream=941718&extension=ts&play_token=iH3ITPwthM"
        // "https://foreveralive1-a.akamaihd.net/7cbf965de49a4f308eb64b980e690a38/ap-southeast-1/6057949479001/profile_2/chunklist.m3u8"
        // 'http://185.132.176.54:8080/EnduhappylivePlus/EnduhappylivePlus/42'
        // 'http://185.132.176.54:8080/EnduhappylivePlus/EnduhappylivePlus/42'
        // 'https://cdn.happylive.plus/file/happycdn/picture/M-Picture/2022/CM/Aug/17.8/TopGunMaverickhappyliveplus_Aug.txt'
        // 'http://185.132.176.54:8080/live/EnduhappylivePlus/EnduhappylivePlus/46.m3u8'
        // 'http://185.132.176.54:8080/live/EnduhappylivePlus/EnduhappylivePlus/10.m3u8'
        'http://185.132.176.54:8080/live/EnduhappylivePlus/EnduhappylivePlus/42.m3u8'
    );
    _betterPlayerController = BetterPlayerController(
        const BetterPlayerConfiguration(
          autoPlay: true,
          fit: BoxFit.contain,
          controlsConfiguration: BetterPlayerControlsConfiguration(
            enableOverflowMenu: false,
            showControlsOnInitialize: false,
            enableRetry: true,
            showControls: true,
          ),
        ),
        // betterPlayerDataSource: BetterPlayerDataSource.network('http://samples.mplayerhq.hu/MPEG-4/embedded_subs/1Video_2Audio_2SUBs_timed_text_streams_.mp4'),
        betterPlayerDataSource: betterPlayerDataSource
    );
    super.initState();



  }


  @override
  void dispose() {
    _betterPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back,color: Colors.black,),
          ),
          title: Text("",style: TextStyle(color: Colors.black),),
        ),
        body:  Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height/3.3,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child:BetterPlayer(controller: _betterPlayerController),//
                // BetterPlayerPlaylist(
                //     betterPlayerConfiguration: BetterPlayerConfiguration(),
                //     betterPlayerPlaylistConfiguration:  BetterPlayerPlaylistConfiguration(),
                //     betterPlayerDataSourceList: createDataSet()
                // ),
                //BetterPlayer(controller: _betterPlayerController),//
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height/1.7,
              child:ListView(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          IconButton(onPressed: (){
                            final platform = Theme.of(context).platform;
                            // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyHomePage(title: '',platform: platform,)));
                          }, icon: Icon(Icons.add_box_sharp)),
                          Text("Add to List")
                        ],
                      ),



                    ],
                  ),
                  Divider(height: 15,),
                  //     _permissionReady
                  // ? _downladIcon()
                  // : _buildNoPermissionWarning(),
                ],
              )

            )
          ],
        )
    );
  }
}
