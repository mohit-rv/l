import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:qcop/resources/resources.dart';
import 'package:qcop/screens/dashboard_screen.dart';

class QAReportListScreen extends StatefulWidget {
  const QAReportListScreen({super.key});

  @override
  State<QAReportListScreen> createState() => _QAReportListScreenState();
}

class _QAReportListScreenState extends State<QAReportListScreen> {

  List<Map<String, dynamic>> fieldLists = [
    {"selectedValue" : "Select", "lists" : ["Select", "Level 2", "Level 3", "Level 4", "Level 5"]},
    {"selectedValue" : "Check List", "lists" : ["Check List", "Level 2", "Level 3", "Level 4", "Level 5"]},
    {"selectedValue" : "Element", "lists" : ["Element", "Level 2", "Level 3", "Level 4", "Level 5"]},
    {"selectedValue" : "Intimated To", "lists" : ["Intimated To", "Level 2", "Level 3", "Level 4", "Level 5"]},
    {"selectedValue" : "Level 5", "lists" : ["Level 1", "Level 2", "Level 3", "Level 4", "Level 5", "Level 6", "Level 7"]},
  ];

  List<Map<String, dynamic>> reportLists= [
    {"reportType" : "New", "Date" : "${DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now())}", "category" : "Aluminum Framework", "checkList" : "Before Shuttering",
    "IR Date" : "21/10/2023 12:07 PM", "Last Updated by" : "Maker User", "Latest Comments" : "Final Comments", "Maker" : "Maker User",
    "Checker" : "Checker User", "Approver" : "", "Drawing No" : "vvv", "Contractor" : "Test Contractor","Work order": "Text", "location1" : "Tower 1",
    "location2" : "Floor 01", "location3" : "Flat 101", "location4" : "C13", "isSynced" : true, "isLastEdited" : false},
    {"reportType" : "New", "Date" : "${DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now())}", "category" : "Aluminum Framework", "checkList" : "Before Shuttering",
      "IR Date" : "21/10/2023 12:07 PM", "Last Updated by" : "Maker User", "Latest Comments" : "Final Comments", "Maker" : "Maker User",
      "Checker" : "Checker User", "Approver" : "", "Drawing No" : "vvv", "Contractor" : "Test Contractor","Work order": "Text", "location1" : "Tower 1",
      "location2" : "Floor 01", "location3" : "Flat 101", "location4" : "C13", "isSynced" : true, "isLastEdited" : false},
    {"reportType" : "Re-Submit", "Date" : "${DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now())}", "category" : "Aluminum Framework", "checkList" : "Before Shuttering",
      "IR Date" : "21/10/2023 12:07 PM", "Last Updated by" : "Maker User", "Latest Comments" : "Both Conversations Closed", "Maker" : "Maker User (TEST)",
      "Checker" : "Checker User", "Approver" : "Checker User", "Drawing No" : "vvv", "Contractor" : "Test Contractor","Work order": "Text", "location1" : "Tower 1",
      "location2" : "Floor 01", "location3" : "Flat 101", "location4" : "C13", "isSynced" : true, "isLastEdited" : false},
    {"reportType" : "Re-Submit", "Date" : "${DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now())}", "category" : "Aluminum Framework", "checkList" : "Before Shuttering",
      "IR Date" : "21/10/2023 12:07 PM", "Last Updated by" : "Maker User", "Latest Comments" : "", "Maker" : "Maker User (TEST)",
      "Checker" : "Checker User", "Approver" : "", "Drawing No" : "", "Contractor" : "Test Contractor","Work order": "Text", "location1" : "Tower 1",
      "location2" : "Floor 01", "location3" : "Flat 101", "location4" : "C13", "isSynced" : false, "isLastEdited" : false},
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
                    return getReportCard(1);
                  }),
            ),
          )
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
                      '${index + 1}/${reportLists.length}',
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
                    color: reportLists[index]['reportType'].toString() == "New" ? Color(0xFF0C3C88) : Color(0xFF15C059),
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
                      'IR Date',
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
                        reportLists[index]['IR Date'].toString(),
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
                      'Approver',
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
                      reportLists[index]['Approver'].toString(),
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
                      'Drawing No',
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
                      reportLists[index]['Drawing No'].toString(),
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
                      'Contractor',
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
                      reportLists[index]['Contractor'].toString(),
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
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
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
                      reportLists[index]['Work order'].toString(),
                      style: TextStyle(
                        color: Color(0xFF394A5D),
                        fontSize: 13,
                        fontFamily: 'Poppins medium',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  )
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
                mainAxisAlignment: MainAxisAlignment.center,
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
                      'Syncd',
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
}
