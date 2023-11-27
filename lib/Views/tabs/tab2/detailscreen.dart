// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_probe/Custom/base_widget.dart';
import 'package:audio_probe/Custom/celevatedbutton.dart';
import 'package:audio_probe/Custom/custom_text.dart';
import 'package:audio_probe/Values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
import 'package:permission_handler/permission_handler.dart';

class DetailScreen extends StatefulWidget {
  final String id;
  const DetailScreen({super.key, required this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  FlutterSoundRecorder? _recordingSession;
  final recordingPlayer = AssetsAudioPlayer();
  String pathToAudio = "";
  bool _playAudio = false;
  String _timerText = '00:00:00';
  @override
  void initState() {
    super.initState();
    initializer();
  }

  void initializer() async {
    pathToAudio = '/sdcard/Download/temp.wav';
    await _recordingSession?.openRecorder();
    await _recordingSession
        ?.setSubscriptionDuration(Duration(milliseconds: 10));
    await initializeDateFormatting();
    await Permission.microphone.request();
    await Permission.storage.request();
    await Permission.manageExternalStorage.request();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BaseWidget(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: AppColors.white10),
            child: IconButton(
              icon: Icon(Iconsax.arrow_left_2),
              onPressed: () {
                Navigator.pop(context);
              },
              color: AppColors.hint,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: customText(
          text: "Patient Details",
          id: 1,
          textSize: Sizes.TEXT_SIZE_20,
          color: AppColors.primaryDarkColor,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Stack(
          children: [
            ScrollConfiguration(
              behavior: ScrollBehavior(),
              child: GlowingOverscrollIndicator(
                axisDirection: AxisDirection.down,
                color: Colors.white,
                child: ListView(shrinkWrap: true, children: [
                  Column(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Divider(
                        color: AppColors.primaryColor,
                        thickness: 0.2,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              AppColors.primaryColor.withOpacity(0.4),
                              AppColors.primaryDarkColor.withOpacity(0.4),
                            ]),
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customText(
                                    text: "Id No: ${widget.id}",
                                    id: 1,
                                    weight: FontWeight.bold,
                                    textSize: 20,
                                  ),
                                  Divider(),
                                  Row(
                                    children: [
                                      Icon(Iconsax.user),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Flexible(
                                        child: Container(
                                          padding: EdgeInsets.only(right: 13.0),
                                          child: Text("Alex Thomas",
                                              overflow: TextOverflow.clip,
                                              style: GoogleFonts.poppins()),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Iconsax.location),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Flexible(
                                        child: Container(
                                          padding: EdgeInsets.only(right: 8.0),
                                          child: Text(
                                              "101 Quinton Road,Coventry,CV35FE,WestMidlands,Uk",
                                              overflow: TextOverflow.clip,
                                              style: GoogleFonts.poppins()),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(children: [
                                    customText(
                                      text: "Details :",
                                      id: 1,
                                    ),
                                    SizedBox(
                                      width: size.width * 0.02,
                                    ),
                                    Expanded(
                                      child: Container(
                                        color: AppColors.primaryColor,
                                        height: 1.0,
                                      ),
                                    ),
                                  ]),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          customText(
                                            text: "Age :",
                                            id: 1,
                                            color: AppColors.hint,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Flexible(
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(right: 8.0),
                                              child: Text("12",
                                                  overflow: TextOverflow.clip,
                                                  style: GoogleFonts.poppins()),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Row(
                                        children: [
                                          customText(
                                            text: "Subject :",
                                            id: 1,
                                            color: AppColors.hint,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Flexible(
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(right: 8.0),
                                              child: Text("Apraxia ",
                                                  overflow: TextOverflow.clip,
                                                  style: GoogleFonts.poppins()),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      // Row(
                                      //   children: [
                                      //     Icon(Iconsax.message),
                                      //     SizedBox(
                                      //       width: 5,
                                      //     ),
                                      //     Flexible(
                                      //       child: Container(
                                      //         padding:
                                      //             EdgeInsets.only(right: 8.0),
                                      //         child: Text(
                                      //             "alextrp@outlook.com",
                                      //             overflow: TextOverflow.clip,
                                      //             style:
                                      //                 GoogleFonts.poppins()),
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),
                                      // SizedBox(
                                      //   height: 2,
                                      // ),
                                      // Row(
                                      //   children: [
                                      //     Icon(Iconsax.call),
                                      //     SizedBox(
                                      //       width: 5,
                                      //     ),
                                      //     Flexible(
                                      //       child: Container(
                                      //         padding:
                                      //             EdgeInsets.only(right: 8.0),
                                      //         child: Text("+44 7388888888",
                                      //             overflow: TextOverflow.clip,
                                      //             style:
                                      //                 GoogleFonts.poppins()),
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),

                    // CElevatedButton(
                    //     color: AppColors.primaryColor,
                    //     size: Size(100, 50),
                    //     onpressed: () {},
                    //     text: Row(
                    //       mainAxisSize: MainAxisSize.min,
                    //       children: [
                    //         customText(
                    //           text: "Record",
                    //           id: 1,
                    //           textSize: 18,
                    //         ),
                    //         Icon(
                    //           Iconsax.record_circle1,
                    //           color: Colors.red.shade800,
                    //         ),
                    //       ],
                    //     )),
                    // SizedBox(
                    //   height: 5,
                    // ),
                    Row(
                      children: [
                        customText(
                            text: "Recent Analysis", textSize: 20, id: 1),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        Expanded(
                          child: Container(
                            color: AppColors.primaryColor,
                            height: 1.0,
                          ),
                        ),
                        Container(
                          color: AppColors.primaryColor,
                          height: 10.0,
                          width: 10.0,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                        elevation: 3,
                        child: Container(
                            height: 70,
                            width: size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              gradient: LinearGradient(
                                  colors: [
                                    AppColors.primaryDarkColor,
                                    AppColors.primaryDarkColor.withOpacity(.5),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomCenter,
                                  stops: const [0.0, 1.0],
                                  tileMode: TileMode.clamp),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            customText(
                                              text: "Report",
                                              id: 1,
                                              color: AppColors.white,
                                            ),
                                            Row(
                                              children: [
                                                Icon(Iconsax.eye),
                                                SizedBox(
                                                  width: 14,
                                                ),
                                                Icon(Icons.share),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ])))),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        customText(
                          text: "View All",
                          id: 1,
                          textSize: 18,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      children: [
                        customText(text: "Add Voice", textSize: 20, id: 1),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        Expanded(
                          child: Container(
                            color: AppColors.primaryColor,
                            height: 1.0,
                          ),
                        ),
                        Container(
                          color: AppColors.primaryColor,
                          height: 10.0,
                          width: 10.0,
                        ),
                      ],
                    ),
                  ])
                ]),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: Center(
              child: Text(
                _timerText,
                style: TextStyle(fontSize: 50, color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 30,
                    ),
                    createElevatedButton(
                      icon: Icons.mic,
                      iconColor: Colors.red,
                      onPressFunc: startRecording,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    createElevatedButton(
                      icon: Icons.stop,
                      iconColor: Colors.red,
                      onPressFunc: stopRecording,
                    ),
                  ],
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(size.width * 0.3, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 9.0,
                      primary: Colors.red),
                  onPressed: () {
                    setState(() {
                      _playAudio = !_playAudio;
                    });
                    if (_playAudio) playFunc();
                    if (!_playAudio) stopPlayFunc();
                  },
                  icon: _playAudio
                      ? Icon(
                          Icons.stop,
                        )
                      : Icon(Icons.play_arrow),
                  label: _playAudio
                      ? Text(
                          "Stop",
                          style: TextStyle(
                            fontSize: 28,
                          ),
                        )
                      : Text(
                          "Play",
                          style: TextStyle(
                            fontSize: 28,
                          ),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  InkWell createElevatedButton(
      {IconData? icon, Color? iconColor, Function()? onPressFunc}) {
    return InkWell(
      onTap: onPressFunc,
      child: CircleAvatar(
        radius: 35,
        backgroundColor: AppColors.white10,
        child: CircleAvatar(
            radius: 29,
            backgroundColor: AppColors.primaryColor.withOpacity(.5),
            child: Icon(
              icon,
              color: iconColor,
            )),
      ),
    );
  }

  Future<void> startRecording() async {
    Directory directory = Directory(path.dirname(pathToAudio));
    if (!directory.existsSync()) {
      directory.createSync();
    }
    _recordingSession?.openRecorder();
    await _recordingSession?.startRecorder(
      toFile: pathToAudio,
      codec: Codec.pcm16WAV,
    );
    StreamSubscription _recorderSubscription =
        _recordingSession!.onProgress!.listen((e) {
      var date = DateTime.fromMillisecondsSinceEpoch(e.duration.inMilliseconds,
          isUtc: true);
      var timeText = DateFormat('mm:ss:SS', 'en_GB').format(date);
      setState(() {
        _timerText = timeText.substring(0, 8);
      });
    });
    _recorderSubscription.cancel();
  }

  Future<String?> stopRecording() async {
    _recordingSession?.closeRecorder();
    return await _recordingSession!.stopRecorder();
  }

  Future<void> playFunc() async {
    recordingPlayer.open(
      Audio.file(pathToAudio),
      autoStart: true,
      showNotification: true,
    );
  }

  Future<void> stopPlayFunc() async {
    recordingPlayer.stop();
  }
}
