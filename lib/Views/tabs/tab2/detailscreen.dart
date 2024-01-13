// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:audio_probe/Custom/base_widget.dart';
import 'package:audio_probe/Custom/custom_text.dart';
import 'package:audio_probe/Provider/recording.provider.dart';
import 'package:audio_probe/Values/values.dart';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final String id;
  const DetailScreen({super.key, required this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late final RecorderController recorderController;
  bool isRecording = false;
  @override
  void initState() {
    super.initState();
    recorderController = RecorderController();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final recordingState = Provider.of<RecordingProvider>(context);
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
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AudioWaveforms(
                  waveStyle: WaveStyle(
                      durationStyle:
                          TextStyle(fontSize: 11, color: AppColors.black),
                      durationTextPadding: 25,
                      showTop: true,
                      showBottom: false,
                      showDurationLabel: true,
                      extendWaveform: true),
                  shouldCalculateScrolledPosition: true,
                  size: Size(MediaQuery.of(context).size.width - 24, 170.0),
                  recorderController: recorderController,
                ),
              ],
            ),
          ),
          Divider(),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    IconButton(
                      color: AppColors.hint.withOpacity(.3),
                      onPressed: () async {
                        if (!recordingState.isRecording) {
                          await recorderController.record();
                          recordingState.toggleRecording();
                        } else {
                          await recorderController.pause();
                          recordingState.toggleRecording();
                        }
                      },
                      icon: Icon(
                        recorderController.isRecording
                            ? Iconsax.pause
                            : !recorderController.isRecording
                                ? Iconsax.microphone
                                : Iconsax.play,
                        color: Colors.red.shade800,
                        size: 30,
                      ),
                    ),
                    customText(
                      text: !recordingState.isRecording ? "Record" : "Pause",
                      id: 1,
                    )
                  ],
                ),
                recorderController.isRecording ||
                        recorderController.recorderState.isPaused
                    ? SizedBox(
                        width: 60,
                      )
                    : SizedBox(),
                recorderController.isRecording ||
                        recorderController.recorderState.isPaused
                    ? Column(
                        children: [
                          IconButton(
                              onPressed: () async {
                                final path = await recorderController.stop();
                                print(path);
                              },
                              icon: Icon(
                                Iconsax.stop,
                                color: Colors.red.shade800,
                                size: 30,
                              )),
                          customText(
                            text: "Stop",
                            id: 1,
                          )
                        ],
                      )
                    : SizedBox()
              ],
            ),
          ),
        ],
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
                        customText(
                            text: "Add Voice Sample", textSize: 20, id: 1),
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
    );
  }

  // final path = await recorderController.stop();
  @override
  void dispose() {
    recorderController.dispose();
    super.dispose();
  }
}
