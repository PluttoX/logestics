
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../theme/theme.dart';
import '../../../widget/my_text_field.dart';

late ColorNotifier notifier;

Widget workingSchedule(context) {
  List events = [
    "Project unity milestone 1 due new week.",
    "David Doe is assigned to lead the development phase starting on 02 Dec. Please coordinate with other team members.",
    "Client meeting scheduled for 13 Dec. Prepare project Update presentation and gather any client-specific requirements.",
    "Team training session scheduled for 20 Dec to introduce new tools. Ensure all team members attend.",
  ];

  List eventsdate = [
    "November 21",
    "December 06",
    "December 13",
    "December 20",
  ];

  List eventstime = [
    "(10:00 - 11:00 AM)",
    "(02:00 PM)",
    "(03:00 PM)",
    "(12:00AM)",
  ];

  List<Color> colors = [
    Color(0xFF0f79f3),
    Color(0xFF00cae3),
    Color(0xFFffb264),
    Color(0xFF796df6),
  ];

  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  notifier = Provider.of(context, listen: true);

  return LayoutBuilder(
    builder: (context, constraints) {
      return Container(

        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: notifier.getBgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Working Schedule",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: "Outfit",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: notifier.text,
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              // height: 200,
              child: Theme(
                data: Theme.of(context).copyWith(
                  datePickerTheme: DatePickerThemeData(
                    backgroundColor: notifier.getBgColor,
                  ),
                  colorScheme: ColorScheme.light(
                    onSurface: notifier.text,
                    surface: notifier.getBgColor,
                    primary: Color(0xFF2B79F3),
                  ),
                ),
                child: SfDateRangePicker(
                  backgroundColor: notifier.getBgColor,
                  allowViewNavigation: true,
                  view: DateRangePickerView.month,
                  headerStyle: DateRangePickerHeaderStyle(
                    backgroundColor: notifier.getBgColor,
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(
                      fontFamily: "Outfit",
                      fontSize: 20,
                      color: notifier.text,
                    ),
                  ),
                  selectionTextStyle: TextStyle(
                    color: notifier.text,
                  ),
                  selectionColor: Color(0xFF0f79f3),
                  selectionMode: DateRangePickerSelectionMode.single,
                  onSelectionChanged: (dateRangePickerSelectionChangedArgs) {},
                ),
              ),
            ),
            Text(
              "EVENTS",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: "Outfit",
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: notifier.text,
              ),
            ),
            SizedBox(height: 20),
            ListView.separated(
              shrinkWrap: true,
              itemCount: events.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return SizedBox(
                  width: constraints.maxWidth,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            color: colors[index],
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: constraints.maxWidth / 1.3,
                            child: Text(
                              events[index],
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontFamily: "Outfit",
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          RichText(
                            text: TextSpan(
                              text: eventsdate[index],
                              style: TextStyle(
                                fontFamily: "Outfit",
                                fontSize: 15,
                                color: Color(0xFF0f79f3),
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: " ${eventstime[index]}",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return StyledDivider(
                  lineStyle: DividerLineStyle.dashed,
                  color: Colors.grey.shade400,
                );
              },
            ),
            StyledDivider(
              lineStyle: DividerLineStyle.dashed,
              color: Colors.grey.shade400,
            ),
            SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      showAddNewEventDialog(context);
                    },
                    child: Text(
                      "+ Add New Event",
                      style: TextStyle(
                        color: Color(0xFF0f7bf4),
                        fontFamily: "Outfit",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

showAddNewEventDialog(context) {
  notifier = Provider.of(context, listen: false);

  DateTime selectedDate = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            datePickerTheme: DatePickerThemeData(
              backgroundColor: notifier.getBgColor,
            ),
            colorScheme: ColorScheme.light(
              onSurface: notifier.text,
              surface: notifier.getBgColor,
              primary: Color(0xFF2B79F3),
            ), // body text color
          ),
          child: child!,
        );
      },
    );
  }

  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  var assignedselected = "Shawn Kennedy";
  var priorityselected = "High";
  var statusselected = "In Progress";

  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: notifier.getBgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 2,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Add New Event",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: "Outfit",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: notifier.text,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.close, color: notifier.text),
              ),
            ],
          ),
          content: SizedBox(
            width: width / 3,
            height: 270,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTextFormField(
                  titleText: "Event Name",
                  hintText: "E.g. Project unity milestone 1 due next week.",
                  labelText: "Envent Name",
                ),
                SizedBox(height: 10),
                MyTextFormField(
                  titleText: "Event Date",
                  hintText: "",
                  labelText: "choose a date",
                  suffixIcon: IconButton(
                    onPressed: () {
                      selectDate(context);
                    },
                    icon: Icon(Icons.calendar_today_rounded),
                  ),
                ),
                SizedBox(height: 10),
                MyTextFormField(
                  titleText: "Event Time",
                  hintText: "E.g. 12:00 AM",
                  labelText: "Event Time",
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                backgroundColor: Color(0xFFe74c3c),
                minimumSize: Size(130, 60),
              ),
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "outfit",
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                backgroundColor: Color(0xFF0f79f3),
                minimumSize: Size(130, 60),
              ),
              child: Text(
                "Create",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "outfit",
                ),
              ),
            ),
          ],
        );
      });
}
