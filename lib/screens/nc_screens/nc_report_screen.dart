import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:qcop/screens/dashboard_screen.dart';

import '../../resources/resources.dart';

class NCReportScreen extends StatefulWidget {
  const NCReportScreen({super.key});

  @override
  State<NCReportScreen> createState() => _NCReportScreenState();
}

class _NCReportScreenState extends State<NCReportScreen> {

  String photo1 = "";
  String photo2 = "";
  String photo3 = "";
  String photo4 = "";
  String photo5 = "";
  String photo6 = "";



  final picker = ImagePicker();

  List<Map<String, dynamic>> fieldLists = [
    {"selectedValue" : "Select", "lists" : ["Select", "Level 2", "Level 3", "Level 4", "Level 5"]},
  ];


  List<Map<String, dynamic>> reportLists= [

    {"reportType" : "Re-Open", "Date" : "${DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now())}", "category" : "Observation",
      "checkList" : "M.Bed,C.Bed BED1 looks not properly fix issues", "Latest Comments" : "Rejection Comments by Checker",
      "Last Updated by": "Checker User", "Checker": "Checker User","Maker": "Maker User", "Exp Date": "06/10/2023\n38 Days remaining",
       "Severity": "Medium", "Work Order": "Text", "location1" : "Tower 1",
      "location2" : "Floor 01", "location3" : "Flat 101", "location4" : "C13", "isSynced" : true, "isLastEdited" : false},

    {"reportType" : "Re-Open", "Date" : "${DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now())}", "category" : "Observation",
      "checkList" : "M.Bed,C.Bed BED1 looks not properly fix issues", "Latest Comments" : "Rejection Comments by Checker",
      "Last Updated by": "Checker User", "Checker": "Checker User","Maker": "Maker User", "Exp Date": "06/10/2023\n38 Days remaining",
      "Severity": "Medium","Work Order": "Text",  "location1" : "Tower 1",
      "location2" : "Floor 01", "location3" : "Flat 101", "location4" : "C13", "isSynced" : true, "isLastEdited" : false},

  ];

  List<DropdownMenuItem<String>> dropdownItems(index) {
    List<DropdownMenuItem<String>> menuItems = [];

    for (var i in fieldLists[index]['lists']) {
      menuItems.add(DropdownMenuItem(
          value: i,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              padding: EdgeInsets.only(left: 6, right: 6),
              alignment: Alignment.centerLeft,
              decoration: ShapeDecoration(
                color: fieldLists[index]['selectedValue'] == i ? Color(0xFF0C3C89) : Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
              child: Text(
                i.toString(),
                style: TextStyle(
                  color: fieldLists[index]['selectedValue'] == i ? Colors.white : Color(0xFFA7A9B7),
                  fontSize: 14,
                  fontFamily: 'Poppins medium',
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )));
    }

    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: InkWell(
        onTap: () {

          Navigator.of(context).pushAndRemoveUntil(CupertinoPageRoute(builder: (context) => DashboardScreen()), (route) => false);

        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 56,
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: 8, left: 24, right: 24),
          decoration: ShapeDecoration(
            color: Color(0xFF0C3C89),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Text(
            'Go Home',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Poppins Semibold',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          getFilterField(),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: reportLists.length,
                  //physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return getReportCard(index);
                  }),
            ),
          ),

        ],
      ),
    );
  }

  getFilterField() {
    var index = 0;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 54,
      margin: EdgeInsets.only(left: 24, right: 24,),
      decoration: ShapeDecoration(
        color: Color(0xFFF1F2F2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      ),
      child: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(left: 15, right: 15),
        child: Row(
          children: [
            /*Container(
                  margin: EdgeInsets.only(right: 14),
                  child: Image(
                    image: AssetImage(Resources.projectIcon),
                  ),
                ),*/
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    //elevation: 8,
                    selectedItemBuilder: (_) {
                      return dropdownItems(index)
                          .map(
                            (e) => Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            e.value.toString(),
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: Color(0xFF3C3C3C),
                              fontSize: 13,
                              fontFamily: 'Poppins Medium',
                              fontWeight: FontWeight.w500,
                              height: 0,
                              letterSpacing: 0.05,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                          .toList();
                    },
                    isExpanded: true,
                    /*buttonStyleData: const ButtonStyleData(
                      //padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 40,
                      width: 60,
                    ),*/
                    iconStyleData: IconStyleData(
                      icon: Icon(
                        Icons.arrow_drop_down_outlined,
                      ),
                      iconSize: 30,
                      iconEnabledColor: HexColor("#0C3C89"),
                      iconDisabledColor: HexColor("#0C3C89"),
                    ),
                    dropdownStyleData: DropdownStyleData(
                      width: MediaQuery.of(context).size.width - 50,
                      maxHeight: 150,
                      isOverButton: false,
                      //padding: EdgeInsets.only(left: 24, right: 24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white,
                      ),
                      offset: const Offset(-14, -10),
                      scrollbarTheme: ScrollbarThemeData(
                        radius: const Radius.circular(40),
                        thickness: MaterialStateProperty.all(6),
                        thumbVisibility:
                        MaterialStateProperty.all(true),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 50,
                      padding: EdgeInsets.only(
                          left: 14, right: 14, bottom: 8, top: 8),
                    ),
                    /*icon: Container(
                              margin: EdgeInsets.only(left: 10, right: 4),
                              child: Image(
                                image: AssetImage(Assets().downArrowIcon),
                                width: 10,
                                height: 10,
                              ),
                            ),*/
                    //borderRadius: BorderRadius.circular(10),
                    value: fieldLists[index]['selectedValue'].toString(),
                    items: dropdownItems(index),
                    //alignment: Alignment.center,
                    onChanged: (String? newValue) {
                      setState(() {
                        fieldLists[index]['selectedValue'] = newValue!;
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getReportCard(int index) {
    return Card(
      margin: EdgeInsets.only(left: 17, right: 17, bottom: 20),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 30,
                  margin: EdgeInsets.only(top: 15, left: 15),
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    color: Color(0xFFE1ECFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(82),
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(left: 12, right: 12),
                    child: Text(
                      //'${index + 1}/${reportLists.length}',
                      '${index + 1}/23',
                      style: TextStyle(
                        color: Color(0xFF0C3C88),
                        fontSize: 12,
                        fontFamily: 'Poppins medium',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  margin: EdgeInsets.only(top: 15, left: 4),
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    color: reportLists[index]['reportType'].toString() == "Re-Open" ? Color(0xFFD450D1) : Color(0xFF15C059),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(62),
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(left: 12, right: 12),
                    child: Text(
                      reportLists[index]['reportType'].toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  margin: EdgeInsets.only(top: 15, left: 4),
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFCACED8)),
                      borderRadius: BorderRadius.circular(108),
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(left: 12, right: 12),
                    child: Text(
                      reportLists[index]['Date'].toString(),
                      style: TextStyle(
                        color: Color(0xFF6C6C6C),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 32, left: 17, right: 17),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 34,
                    child: Text(
                      reportLists[index]['category'].toString(),
                      style: TextStyle(
                        color: Color(0xBC63676F),
                        fontSize: 12,
                        fontFamily: 'Poppins Medium',
                        fontWeight: FontWeight.w500,
                        height: 0,
                        letterSpacing: -0.36,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 34,
                    child: Text(
                      reportLists[index]['checkList'].toString(),
                      style: TextStyle(
                        color: Color(0xFF394A5D),
                        fontSize: 13,
                        fontFamily: 'Poppins medium',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),


            Container(
              margin: EdgeInsets.only(top: 10, left: 17, right: 17),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 34,
                    child: Text(
                      'Latest Comments',
                      style: TextStyle(
                        color: Color(0xBC63676F),
                        fontSize: 12,
                        fontFamily: 'Poppins Medium',
                        fontWeight: FontWeight.w500,
                        height: 0,
                        letterSpacing: -0.36,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 34,
                    child: Text(
                      reportLists[index]['Latest Comments'].toString(),
                      style: TextStyle(
                        color: Color(0xFF394A5D),
                        fontSize: 13,
                        fontFamily: 'Poppins medium',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),


            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {

                      getImage(ImageSource.gallery, 1);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width/3 - 30,
                      height: 102,
                      decoration: ShapeDecoration(
                          color: Color(0xFFF5F5F5),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Color(0x4C3C3C43)),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          image: photo1.isEmpty ?  DecorationImage(
                            image: AssetImage(Resources.addPhotoImg),
                            fit: BoxFit.cover,
                          ) :
                          DecorationImage(
                            image: FileImage(File(photo1)),
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {

                      getImage(ImageSource.gallery, 2);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width/3 - 30,
                      height: 102,
                      decoration: ShapeDecoration(
                          color: Color(0xFFF5F5F5),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Color(0x4C3C3C43)),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          image: photo2.isEmpty ?  DecorationImage(
                            image: AssetImage(Resources.addPhotoImg),
                            fit: BoxFit.cover,
                          ) :
                          DecorationImage(
                            image: FileImage(File(photo2)),
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {

                      getImage(ImageSource.gallery, 3);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width/3 - 30,
                      height: 102,
                      decoration: ShapeDecoration(
                          color: Color(0xFFF5F5F5),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Color(0x4C3C3C43)),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          image: photo3.isEmpty ?  DecorationImage(
                            image: AssetImage(Resources.addPhotoImg),
                            fit: BoxFit.cover,
                          ) :
                          DecorationImage(
                            image: FileImage(File(photo3)),
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 10, left: 17, right: 17),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 34,
                    child: Text(
                      'Last Updated by',
                      style: TextStyle(
                        color: Color(0xBC63676F),
                        fontSize: 12,
                        fontFamily: 'Poppins Medium',
                        fontWeight: FontWeight.w500,
                        height: 0,
                        letterSpacing: -0.36,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 34,
                    child: Text(
                      reportLists[index]['Last Updated by'].toString(),
                      style: TextStyle(
                        color: Color(0xFF394A5D),
                        fontSize: 13,
                        fontFamily: 'Poppins medium',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 10, left: 17, right: 17),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 34,
                    child: Text(
                      'Checker',
                      style: TextStyle(
                        color: Color(0xBC63676F),
                        fontSize: 12,
                        fontFamily: 'Poppins Medium',
                        fontWeight: FontWeight.w500,
                        height: 0,
                        letterSpacing: -0.36,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 34,
                    child: Text(
                      reportLists[index]['Checker'].toString(),
                      style: TextStyle(
                        color: Color(0xFF394A5D),
                        fontSize: 13,
                        fontFamily: 'Poppins medium',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 17, right: 17),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 34,
                    child: Text(
                      'Maker',
                      style: TextStyle(
                        color: Color(0xBC63676F),
                        fontSize: 12,
                        fontFamily: 'Poppins Medium',
                        fontWeight: FontWeight.w500,
                        height: 0,
                        letterSpacing: -0.36,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 34,
                    child: Text(
                      reportLists[index]['Maker'].toString(),
                      style: TextStyle(
                        color: Color(0xFF394A5D),
                        fontSize: 13,
                        fontFamily: 'Poppins medium',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),



            Container(
              margin: EdgeInsets.only(top: 10, left: 17, right: 17),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 34,
                    child: Text(
                      'Exp Date',
                      style: TextStyle(
                        color: Color(0xFFEF3B4F),
                        fontSize: 12,
                        fontFamily: 'Poppins Medium',
                        fontWeight: FontWeight.w500,
                        height: 0,
                        letterSpacing: -0.36,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 34,
                    child: Text(
                      reportLists[index]['Exp Date'].toString(),
                      style: TextStyle(
                        color: Color(0xFFEF3B4F),
                        fontSize: 13,
                        fontFamily: 'Poppins medium',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 17, right: 17),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 34,
                    child: Text(
                      'Severity',
                      style: TextStyle(
                        color: Color(0xBC63676F),
                        fontSize: 12,
                        fontFamily: 'Poppins Medium',
                        fontWeight: FontWeight.w500,
                        height: 0,
                        letterSpacing: -0.36,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 34,
                    child: Text(
                      reportLists[index]['Severity'].toString(),
                      style: TextStyle(
                        color: Color(0xFF394A5D),
                        fontSize: 13,
                        fontFamily: 'Poppins medium',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 10, left: 17, right: 17),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 34,
                    child: Text(
                      'Work Order',
                      style: TextStyle(
                        color: Color(0xBC63676F),
                        fontSize: 12,
                        fontFamily: 'Poppins Medium',
                        fontWeight: FontWeight.w500,
                        height: 0,
                        letterSpacing: -0.36,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 34,
                    child: Text(
                      reportLists[index]['Work Order'].toString(),
                      style: TextStyle(
                        color: Color(0xFF394A5D),
                        fontSize: 13,
                        fontFamily: 'Poppins medium',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 18, left: 15, right: 15),
              child: Row(
                children: [
                  Container(
                    child: Text(
                      reportLists[index]['location1'].toString(),
                      style: TextStyle(
                        color: Color(0xBC63676F),
                        fontSize: 12,
                        fontFamily: 'Poppins medium',
                        fontWeight: FontWeight.w500,
                        height: 0,
                        letterSpacing: -0.36,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 21, right: 21),
                    child: Image(
                      image: AssetImage(Resources.rightArrowIcon),
                      width: 7,
                      height: 13,
                    ),
                  ),
                  Container(
                    child: Text(
                      reportLists[index]['location2'].toString(),
                      style: TextStyle(
                        color: Color(0xBC63676F),
                        fontSize: 12,
                        fontFamily: 'Poppins medium',
                        fontWeight: FontWeight.w500,
                        height: 0,
                        letterSpacing: -0.36,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 21, right: 21),
                    child: Image(
                      image: AssetImage(Resources.rightArrowIcon),
                      width: 7,
                      height: 13,
                    ),
                  ),
                  Container(
                    child: Text(
                      reportLists[index]['location3'].toString(),
                      style: TextStyle(
                        color: Color(0xBC63676F),
                        fontSize: 12,
                        fontFamily: 'Poppins medium',
                        fontWeight: FontWeight.w500,
                        height: 0,
                        letterSpacing: -0.36,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 21, right: 21),
                    child: Image(
                      image: AssetImage(Resources.rightArrowIcon),
                      width: 7,
                      height: 13,
                    ),
                  ),
                  Container(
                    child: Text(
                      reportLists[index]['location4'].toString(),
                      style: TextStyle(
                        color: Color(0xBC63676F),
                        fontSize: 12,
                        fontFamily: 'Poppins medium',
                        fontWeight: FontWeight.w500,
                        height: 0,
                        letterSpacing: -0.36,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 27, left: 17, right: 17, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  reportLists[index]['isSynced'] ? Container(
                    height: 30,
                    padding: EdgeInsets.only(left: 16, right: 16),
                    alignment: Alignment.center,
                    decoration: ShapeDecoration(
                      color: Color(0xFF0C3C88),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(62),
                      ),
                    ),
                    child: Text(
                      'Completed',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Poppins Semibold',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ) :
                  Container(
                    height: 30,
                    padding: EdgeInsets.only(left: 16, right: 16),
                    margin: EdgeInsets.only(right: 5),
                    alignment: Alignment.center,
                    decoration: ShapeDecoration(
                      color: Color(0xFFEF3B4F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(62),
                      ),
                    ),
                    child: Text(
                      'Delete',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Poppins Semibold',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                  !reportLists[index]['isSynced'] ? Container(
                    height: 30,
                    padding: EdgeInsets.only(left: 16, right: 16),
                    margin: EdgeInsets.only(left: 5),
                    alignment: Alignment.center,
                    decoration: ShapeDecoration(
                      color: Color(0xFF0C3C88),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(62),
                      ),
                    ),
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Poppins Semibold',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ) : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Future getImage(
      ImageSource img,
      int path
      ) async {
    final pickedFile = await picker.pickImage(source: img);
    XFile? xfilePick = pickedFile;

    var imageAsUnit8 = await File(pickedFile!.path).readAsBytes();

    if (xfilePick != null) {
      final editedImage = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ImageEditor(
                image: imageAsUnit8, // <-- Uint8List of image
              ),
        ),
      );

      print(editedImage);

      if (editedImage != null) {

        File outPutImage = File(pickedFile!.path);
        outPutImage.writeAsBytesSync(editedImage);
        print(outPutImage.path);

        switch (path) {
          case 1 :
            {
              photo1 = outPutImage.path;
              break;
            }
          case 2 :
            {
              photo2 = outPutImage.path;
              break;
            }
          case 3 :
            {
              photo3 = outPutImage.path;
              break;
            }
          default :
            {
              photo1 = outPutImage.path;
              break;
            }
        }
        //titleTxt = "Submit";

        //uploadImg();

      } else {
        /*ScaffoldMessenger.of(context).showSnackBar(// is this context <<<
              const SnackBar(content: Text('Nothing is selected')));*/
      }
    }

    setState(() {

    });
  }

}
