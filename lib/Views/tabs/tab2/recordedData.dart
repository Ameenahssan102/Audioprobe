// ignore_for_file: prefer_const_constructors

import 'package:audio_probe/Custom/base_widget.dart';
import 'package:audio_probe/Custom/custom_text.dart';
import 'package:audio_probe/Models/analysisSummary.model.dart';
import 'package:audio_probe/Provider/recording.provider.dart';
import 'package:audio_probe/Values/values.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class RecAnalysisScreen extends StatefulWidget {
  final AnalysisDatas analysisData;
  final String clientId;
  final String date;
  final String comments;
  const RecAnalysisScreen(
      {super.key,
      required this.analysisData,
      required this.clientId,
      required this.date,
      required this.comments});

  @override
  State<RecAnalysisScreen> createState() => _RecAnalysisScreenState();
}

class _RecAnalysisScreenState extends State<RecAnalysisScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RecordingProvider>(builder: (context, provider, child) {
      return BaseWidget(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Row(
                  children: [
                    SizedBox(width: 10),
                    Padding(
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
                    SizedBox(width: 10),
                    Align(
                      alignment: AlignmentDirectional(0.00, -1.00),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/logo.jpg',
                          height: 50.0,
                          fit: BoxFit.fitHeight,
                          alignment: Alignment(0.00, 0.00),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "AudioProbe",
                      style: GoogleFonts.lato(
                        color: AppColors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15),
                customText(
                  text: "Analysed Speech Results powered by praat",
                  id: 1,
                  textSize: 18,
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                customText(
                  text: "Recorded on date: ${widget.date}",
                  id: 2,
                  textSize: 16,
                  weight: FontWeight.bold,
                ),
                Divider(),
                Expanded(
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          Table(
                            columnWidths: {
                              0: FractionColumnWidth(0.5),
                              1: FractionColumnWidth(0.3)
                            },
                            border: TableBorder.all(), // Add borders to cells
                            children: [
                              TableRow(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        AppColors.primaryColor.withOpacity(.4),
                                        AppColors.primaryColor.withOpacity(.4),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomCenter,
                                      stops: const [0.0, 1.0],
                                      tileMode: TileMode.clamp),
                                ),
                                children: [
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:
                                        Center(child: Text('Meanlocaljitter')),
                                  )),
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(widget
                                                .analysisData.meanlocaljitter
                                                ?.toString()
                                                .substring(0, 7) ??
                                            '')),
                                  )),
                                ],
                              ),
                              TableRow(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        AppColors.primaryColor.withOpacity(.4),
                                        AppColors.primaryColor.withOpacity(.4),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomCenter,
                                      stops: const [0.0, 1.0],
                                      tileMode: TileMode.clamp),
                                ),
                                children: [
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text('Meanlocalabsolute')),
                                  )),
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(widget
                                                .analysisData.meanlocalabsolute
                                                ?.toString()
                                                .substring(0, 7) ??
                                            '')),
                                  )),
                                ],
                              ),
                              TableRow(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        AppColors.primaryColor.withOpacity(.4),
                                        AppColors.primaryColor.withOpacity(.4),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomCenter,
                                      stops: const [0.0, 1.0],
                                      tileMode: TileMode.clamp),
                                ),
                                children: [
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(child: Text('Meanrap')),
                                  )),
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(widget.analysisData.meanrap
                                                ?.toString()
                                                .substring(0, 7) ??
                                            '')),
                                  )),
                                ],
                              ),
                              TableRow(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        AppColors.primaryColor.withOpacity(.4),
                                        AppColors.primaryColor.withOpacity(.4),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomCenter,
                                      stops: const [0.0, 1.0],
                                      tileMode: TileMode.clamp),
                                ),
                                children: [
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(child: Text('Meanppq5')),
                                  )),
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(widget.analysisData.meanppq5
                                                ?.toString()
                                                .substring(0, 7) ??
                                            '')),
                                  )),
                                ],
                              ),
                              TableRow(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        AppColors.primaryColor.withOpacity(.4),
                                        AppColors.primaryColor.withOpacity(.4),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomCenter,
                                      stops: const [0.0, 1.0],
                                      tileMode: TileMode.clamp),
                                ),
                                children: [
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(child: Text('Meanddp')),
                                  )),
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(widget.analysisData.meanddp
                                                ?.toString()
                                                .substring(0, 7) ??
                                            '')),
                                  )),
                                ],
                              ),
                              TableRow(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        AppColors.primaryColor.withOpacity(.4),
                                        AppColors.primaryColor.withOpacity(.4),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomCenter,
                                      stops: const [0.0, 1.0],
                                      tileMode: TileMode.clamp),
                                ),
                                children: [
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:
                                        Center(child: Text('Meanlocalshimmer')),
                                  )),
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(widget
                                                .analysisData.meanlocalshimmer
                                                ?.toString()
                                                .substring(0, 7) ??
                                            '')),
                                  )),
                                ],
                              ),
                              TableRow(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        AppColors.primaryColor.withOpacity(.4),
                                        AppColors.primaryColor.withOpacity(.4),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomCenter,
                                      stops: const [0.0, 1.0],
                                      tileMode: TileMode.clamp),
                                ),
                                children: [
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(child: Text('Meanlocaldb')),
                                  )),
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(widget
                                                .analysisData.meanlocaldb
                                                ?.toString()
                                                .substring(0, 7) ??
                                            '')),
                                  )),
                                ],
                              ),
                              TableRow(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        AppColors.primaryColor.withOpacity(.4),
                                        AppColors.primaryColor.withOpacity(.4),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomCenter,
                                      stops: const [0.0, 1.0],
                                      tileMode: TileMode.clamp),
                                ),
                                children: [
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(child: Text('Meanapq3')),
                                  )),
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(widget.analysisData.meanapq3
                                                ?.toString()
                                                .substring(0, 7) ??
                                            '')),
                                  )),
                                ],
                              ),
                              TableRow(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        AppColors.primaryColor.withOpacity(.4),
                                        AppColors.primaryColor.withOpacity(.4),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomCenter,
                                      stops: const [0.0, 1.0],
                                      tileMode: TileMode.clamp),
                                ),
                                children: [
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(child: Text('Meanaqpq5')),
                                  )),
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(widget
                                                .analysisData.meanaqpq5
                                                ?.toString()
                                                .substring(0, 7) ??
                                            '')),
                                  )),
                                ],
                              ),
                              TableRow(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        AppColors.primaryColor.withOpacity(.4),
                                        AppColors.primaryColor.withOpacity(.4),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomCenter,
                                      stops: const [0.0, 1.0],
                                      tileMode: TileMode.clamp),
                                ),
                                children: [
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(child: Text('Meanapq11')),
                                  )),
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(widget
                                                .analysisData.meanapq11
                                                ?.toString()
                                                .substring(0, 7) ??
                                            '')),
                                  )),
                                ],
                              ),
                              TableRow(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        AppColors.primaryColor.withOpacity(.4),
                                        AppColors.primaryColor.withOpacity(.4),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomCenter,
                                      stops: const [0.0, 1.0],
                                      tileMode: TileMode.clamp),
                                ),
                                children: [
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(child: Text('Meandda')),
                                  )),
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(widget.analysisData.meandda
                                                ?.toString()
                                                .substring(0, 7) ??
                                            '')),
                                  )),
                                ],
                              ),
                              TableRow(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        AppColors.primaryColor.withOpacity(.4),
                                        AppColors.primaryColor.withOpacity(.4),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomCenter,
                                      stops: const [0.0, 1.0],
                                      tileMode: TileMode.clamp),
                                ),
                                children: [
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(child: Text('Meanpitch')),
                                  )),
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(widget
                                                .analysisData.meanpitch
                                                ?.toString()
                                                .substring(0, 7) ??
                                            '')),
                                  )),
                                ],
                              ),
                              TableRow(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        AppColors.primaryColor.withOpacity(.4),
                                        AppColors.primaryColor.withOpacity(.4),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomCenter,
                                      stops: const [0.0, 1.0],
                                      tileMode: TileMode.clamp),
                                ),
                                children: [
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(child: Text('Meansdpitch')),
                                  )),
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(widget
                                                .analysisData.meansdpitch
                                                ?.toString()
                                                .substring(0, 7) ??
                                            '')),
                                  )),
                                ],
                              ),
                              TableRow(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        AppColors.primaryColor.withOpacity(.4),
                                        AppColors.primaryColor.withOpacity(.4),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomCenter,
                                      stops: const [0.0, 1.0],
                                      tileMode: TileMode.clamp),
                                ),
                                children: [
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(child: Text('Minpitch')),
                                  )),
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(widget.analysisData.minpitch
                                                ?.toString()
                                                .substring(0, 7) ??
                                            '')),
                                  )),
                                ],
                              ),
                              TableRow(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        AppColors.primaryColor.withOpacity(.4),
                                        AppColors.primaryColor.withOpacity(.4),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomCenter,
                                      stops: const [0.0, 1.0],
                                      tileMode: TileMode.clamp),
                                ),
                                children: [
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(child: Text('Maxpitch')),
                                  )),
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(widget.analysisData.maxpitch
                                                ?.toString()
                                                .substring(0, 7) ??
                                            '')),
                                  )),
                                ],
                              ),
                              TableRow(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        AppColors.primaryColor.withOpacity(.4),
                                        AppColors.primaryColor.withOpacity(.4),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomCenter,
                                      stops: const [0.0, 1.0],
                                      tileMode: TileMode.clamp),
                                ),
                                children: [
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(child: Text('MeanHNR')),
                                  )),
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(widget.analysisData.meanHnr
                                                ?.toString()
                                                .substring(0, 7) ??
                                            '')),
                                  )),
                                ],
                              ),
                              TableRow(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        AppColors.primaryColor.withOpacity(.4),
                                        AppColors.primaryColor.withOpacity(.4),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomCenter,
                                      stops: const [0.0, 1.0],
                                      tileMode: TileMode.clamp),
                                ),
                                children: [
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(child: Text('MeansdHNR')),
                                  )),
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(widget
                                                .analysisData.meansdHnr
                                                ?.toString()
                                                .substring(0, 7) ??
                                            '')),
                                  )),
                                ],
                              ),
                              TableRow(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        AppColors.primaryColor.withOpacity(.4),
                                        AppColors.primaryColor.withOpacity(.4),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomCenter,
                                      stops: const [0.0, 1.0],
                                      tileMode: TileMode.clamp),
                                ),
                                children: [
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(child: Text('f1')),
                                  )),
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(widget.analysisData.f1
                                                ?.toString()
                                                .substring(0, 7) ??
                                            '')),
                                  )),
                                ],
                              ),
                              TableRow(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        AppColors.primaryColor.withOpacity(.4),
                                        AppColors.primaryColor.withOpacity(.4),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomCenter,
                                      stops: const [0.0, 1.0],
                                      tileMode: TileMode.clamp),
                                ),
                                children: [
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(child: Text('f2')),
                                  )),
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(widget.analysisData.f2
                                                ?.toString()
                                                .substring(0, 7) ??
                                            '')),
                                  )),
                                ],
                              ),
                              TableRow(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        AppColors.primaryColor.withOpacity(.4),
                                        AppColors.primaryColor.withOpacity(.4),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomCenter,
                                      stops: const [0.0, 1.0],
                                      tileMode: TileMode.clamp),
                                ),
                                children: [
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(child: Text('f3')),
                                  )),
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(widget.analysisData.f3
                                                ?.toString()
                                                .substring(0, 7) ??
                                            '')),
                                  )),
                                ],
                              ),
                              TableRow(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        AppColors.primaryColor.withOpacity(.4),
                                        AppColors.primaryColor.withOpacity(.4),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomCenter,
                                      stops: const [0.0, 1.0],
                                      tileMode: TileMode.clamp),
                                ),
                                children: [
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(child: Text('f4')),
                                  )),
                                  TableCell(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(widget.analysisData.f4
                                                ?.toString()
                                                .substring(0, 7) ??
                                            '')),
                                  )),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ])));
    });
  }
}
