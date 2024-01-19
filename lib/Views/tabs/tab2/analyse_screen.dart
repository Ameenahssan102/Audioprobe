import 'package:audio_probe/Custom/base_widget.dart';
import 'package:audio_probe/Custom/custom_text.dart';
import 'package:audio_probe/Values/values.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class AnalysedScreen extends StatefulWidget {
  const AnalysedScreen({super.key});

  @override
  State<AnalysedScreen> createState() => _AnalysedScreenState();
}

class _AnalysedScreenState extends State<AnalysedScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              // SizedBox(height: 25),
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
              Table(
                border: TableBorder.all(), // Add borders to cells
                children: const [
                  TableRow(
                    children: [
                      TableCell(child: Center(child: Text('Meanlocaljitter'))),
                      TableCell(
                          child: Center(child: Text('0.016261163686529266'))),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                          child: Center(child: Text('Meanlocalabsolute'))),
                      TableCell(
                          child: Center(child: Text('0.00013859579781528458'))),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(child: Center(child: Text('Meanrap'))),
                      TableCell(
                          child: Center(child: Text('0.008105996015821253'))),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(child: Center(child: Text('Meanppq5'))),
                      TableCell(
                          child: Center(child: Text('0.007791861506808822'))),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(child: Center(child: Text('Meanddp'))),
                      TableCell(
                          child: Center(child: Text('0.02431798804746376'))),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(child: Center(child: Text('Meanlocalshimmer'))),
                      TableCell(
                          child: Center(child: Text('0.05765432934480073'))),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(child: Center(child: Text('Meanlocaldb'))),
                      TableCell(
                          child: Center(child: Text('0.6191512715332255'))),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(child: Center(child: Text('Meanapq3'))),
                      TableCell(
                          child: Center(child: Text('0.02488876112302581'))),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(child: Center(child: Text('Meanaqpq5'))),
                      TableCell(
                          child: Center(child: Text('0.029697797182145734'))),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(child: Center(child: Text('Meanapq11'))),
                      TableCell(
                          child: Center(child: Text('0.040840528988996934'))),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(child: Center(child: Text('Meandda'))),
                      TableCell(
                          child: Center(child: Text('0.07466628336907744'))),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(child: Center(child: Text('Meanpitch'))),
                      TableCell(
                          child: Center(child: Text('117.92550400942153'))),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(child: Center(child: Text('Minpitch'))),
                      TableCell(
                          child: Center(child: Text('100.47498608281488'))),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(child: Center(child: Text('Maxpitch'))),
                      TableCell(
                          child: Center(child: Text('141.72435357903396'))),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(child: Center(child: Text('MeanHNR'))),
                      TableCell(
                          child: Center(child: Text('18.417308312721758'))),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(child: Center(child: Text('MeansdHNR'))),
                      TableCell(
                          child: Center(child: Text('15.148514701475401'))),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(child: Center(child: Text('MeansdHNR'))),
                      TableCell(
                          child: Center(child: Text('15.148514701475401'))),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(child: Center(child: Text('MeansdHNR'))),
                      TableCell(
                          child: Center(child: Text('5.148514701475401'))),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(child: Center(child: Text('f1'))),
                      TableCell(
                          child: Center(child: Text('625.3066282671671'))),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(child: Center(child: Text('f2'))),
                      TableCell(
                          child: Center(child: Text('1674.7192403396614'))),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(child: Center(child: Text('f3'))),
                      TableCell(
                          child: Center(child: Text('3043.547074563492'))),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(child: Center(child: Text('f4'))),
                      TableCell(
                          child: Center(child: Text('3858.0705436683547'))),
                    ],
                  ),
                ],
              ),
            ])));
  }
}
