// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:audio_probe/Custom/avatar.dart';
import 'package:audio_probe/Custom/custom_text.dart';
import 'package:audio_probe/Custom/custom_textfield.dart';
import 'package:audio_probe/Custom/systempadding.dart';
import 'package:audio_probe/Custom/widgets/base_widget.dart';
import 'package:audio_probe/Values/values.dart';
import 'package:audio_probe/Views/tabs/tab2/detailscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class Tab2 extends StatefulWidget {
  const Tab2({super.key});

  @override
  State<Tab2> createState() => _Tab2State();
}

class _Tab2State extends State<Tab2> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BaseWidget(
      floatingActionButton: FloatingActionButton(
        onPressed: () => addPatient(),
        backgroundColor: AppColors.primaryDarkColor,
        child: Icon(
          Iconsax.add,
          color: AppColors.white,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 25),
            Row(
              children: [
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
                  "Patients",
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextFormField(
                controller: TextEditingController(),
                hint: 'Search Patients by Name,Id..',
                color: AppColors.hint,
              ),
            ),
            Divider(height: 4),
            Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) => InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailScreen(id: index.toString()))),
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14)),
                              elevation: 2,
                              child: Container(
                                  height: 100,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    gradient: LinearGradient(
                                        colors: [
                                          AppColors.primaryDarkColor,
                                          AppColors.primaryDarkColor
                                              .withOpacity(.5),
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomCenter,
                                        stops: const [0.0, 1.0],
                                        tileMode: TileMode.clamp),
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                    backgroundColor: AppColors
                                                        .white10
                                                        .withOpacity(.3),
                                                    radius: 30,
                                                    child: Avatar(size: 50.0)),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    customText(
                                                        text: "Patient $index",
                                                        textSize: 19,
                                                        weight: FontWeight.bold,
                                                        color: AppColors.white10
                                                            .withOpacity(.7),
                                                        id: 1),
                                                    customText(
                                                      text: "#id $index",
                                                      id: 1,
                                                      textSize: 15,
                                                      weight: FontWeight.w600,
                                                      color: AppColors.black,
                                                    ),
                                                    customText(
                                                      text: "Age: 1$index",
                                                      id: 1,
                                                      textSize: 15,
                                                      color: AppColors.black,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ])))),
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 4,
                        ),
                    itemCount: 3))
          ],
        ),
      ),
    );
  }

  addPatient() {
    return showGeneralDialog(
        context: context,
        barrierLabel: "Add by id",
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: Duration(milliseconds: 300),
        pageBuilder: (filtercontext, __, ___) {
          return StatefulBuilder(builder: (context, setState) {
            return SystemPadding(
                child: Center(
                    child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          Material(
                              child: Row(
                            children: [
                              customText(
                                  textSize: 18,
                                  weight: FontWeight.bold,
                                  text: "Add New Patient",
                                  id: 1),
                            ],
                          )),
                          Divider(),
                          SizedBox(
                            height: 10,
                          ),
                          Material(
                              color: AppColors.white,
                              child: CustomTextFormField(
                                controller: TextEditingController(),
                                hint: 'ID',
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Material(
                              color: AppColors.white,
                              child: CustomTextFormField(
                                controller: TextEditingController(),
                                hint: 'Patient Name',
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Material(
                              color: AppColors.white,
                              child: CustomTextFormField(
                                controller: TextEditingController(),
                                hint: 'Age',
                              )),
                          SizedBox(height: 20),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 1.0),
                                  child: Container(
                                    height: 55.0,
                                    width: MediaQuery.of(context).size.width *
                                        0.40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: MaterialButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      color: AppColors.primaryDarkColor
                                          .withOpacity(0.8),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0)),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.cancel_outlined,
                                              color: AppColors.white,
                                            ),
                                            SizedBox(
                                              width: 7.0,
                                            ),
                                            customText(
                                                text: "Cancel",
                                                id: 1,
                                                color: Colors.white),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 1.0),
                                    child: Container(
                                        height: 55.0,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: MaterialButton(
                                            onPressed: () {
                                              Navigator.pop(context, true);
                                            },
                                            color: AppColors.primaryDarkColor
                                                .withOpacity(0.8),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0)),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  Icon(
                                                    Icons
                                                        .check_circle_outline_outlined,
                                                    color: AppColors.white,
                                                  ),
                                                  SizedBox(
                                                    width: 7.0,
                                                  ),
                                                  customText(
                                                      text: "Add",
                                                      id: 1,
                                                      color: Colors.white),
                                                ],
                                              ),
                                            ))))
                              ])
                        ]))));
          });
        });
  }
}
