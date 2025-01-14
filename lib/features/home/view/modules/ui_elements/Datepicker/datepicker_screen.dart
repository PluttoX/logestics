
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logestics/features/home/view/modules/ui_elements/Datepicker/year_month_picker.dart';
import 'package:provider/provider.dart';

import '../../../../Controllers/controllers.dart';
import '../../../../theme/theme.dart';
import 'custom_date_range_picker.dart';
import 'custom_datepicker.dart';
import 'custom_multipul_picker.dart';
import 'custom_singal_picker.dart';
import 'date_range_picker_forms.dart';
import 'datepicker_inline_calendar.dart';
import 'datepicker_open_method.dart';
import 'datepicker_with_different_locale.dart';
import 'disabled_datepicker.dart';

class DatepickerScreen extends StatefulWidget {
  const DatepickerScreen({super.key});

  @override
  State<DatepickerScreen> createState() => _DatepickerScreenState();
}

class _DatepickerScreenState extends State<DatepickerScreen> {
  MainDrawerController mainDrawerController = Get.put(MainDrawerController());

  // Basic Datepicker
  final TextEditingController basicDatepickerController =
      TextEditingController();
  DateTime basicDatepickerDate = DateTime.now();

  // Date Range Picker Comparison Ranges
  final TextEditingController comparisonRangesController1 =
      TextEditingController();
  final DateFormat comparisonRangesDate1 = DateFormat('MM/dd/yyyy');
  final TextEditingController comparisonRangesController2 =
      TextEditingController();
  final DateFormat comparisonRangesDate2 = DateFormat('MM/dd/yyyy');

  // Datepicker Action Buttons
  final TextEditingController actionButtonsController1 =
      TextEditingController();
  DateTime actionButtonsDate1 = DateTime.now();
  final TextEditingController actionButtonsController2 =
      TextEditingController();
  final DateFormat actionButtonsDate2 = DateFormat('MM/dd/yyyy');
  String? actionButtonsStartDate;
  String? actionButtonsEndDate;

  // Date Range Picker with Custom a Selection Strategy
  final TextEditingController customaSelectionStrategyController1 =
      TextEditingController();
  final DateFormat customaSelectionStrategyDate1 = DateFormat('MM/dd/yyyy');

  // Datepicker Palette Colors
  final TextEditingController datepickerPaletteColorsController1 =
      TextEditingController();
  final TextEditingController datepickerPaletteColorsController2 =
      TextEditingController();
  DateTime datepickerPaletteColorsDate1 = DateTime.now();
  DateTime datepickerPaletteColorsDate2 = DateTime.now();

  // Datepicker with Custom Icon
  final TextEditingController customIconController = TextEditingController();
  DateTime customIconDate = DateTime.now();

  // Datepicker with Custom Date Classes
  final TextEditingController customDateclassesController =
      TextEditingController();
  DateTime customDateclassesDate = DateTime.now();

  // Datepicker with Filter Validation
  final TextEditingController filterValidationController =
      TextEditingController();
  DateTime filterValidationDate = DateTime.now();

  // Datepicker with Custom Formats
  final TextEditingController customFormatsController = TextEditingController();
  DateTime customFormatsDate = DateTime.now();

  // Datepicker with Min & Max Validation
  final TextEditingController minandMaxController = TextEditingController();
  DateTime minandMaxDate = DateTime.now();

  // Datepicker that uses Moment.js Dates
  final TextEditingController momentJsController = TextEditingController();
  DateTime momentJsDate = DateTime.now();

  // Datepicker Start Date
  final TextEditingController startDateController = TextEditingController();
  DateTime startDate = DateTime(1990);

  // Datepicker Touch UI
  final TextEditingController touchUIController = TextEditingController();
  DateTime touchUIDate = DateTime.now();

  // Datepicker Selected Value
  final TextEditingController angularFormsController = TextEditingController();
  DateTime angularFormsDate = DateTime.now();
  final TextEditingController deserialivationController =
      TextEditingController();
  DateTime deserialivationDate = DateTime.now();
  final TextEditingController valueBindingController = TextEditingController();
  DateTime valueBindingDate = DateTime.now();

  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: width < 650 ? 55 : 40,
            width: width,
            child: width < 650
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Datepicker",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: notifier.text,
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          InkWell(
                            onTap: () =>
                                mainDrawerController.updateSelectedIndex(0),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/home.png",
                                  height: 15,
                                  color: Color(0xFF0f7bf4),
                                ),
                                Text(
                                  " Dashboard",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Text(
                            "UI Elements",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Text(
                            "Datepicker",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 15,
                              color: notifier.text,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Datepicker",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: notifier.text,
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          InkWell(
                            onTap: () =>
                                mainDrawerController.updateSelectedIndex(0),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/home.png",
                                  height: 15,
                                  color: Color(0xFF0f7bf4),
                                ),
                                Text(
                                  " Dashboard",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Text(
                            "UI Elements",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Text(
                            "Datepicker",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 15,
                              color: notifier.text,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
          SizedBox(height: 20),
          width < 1000
              ? Column(
                  children: [
                    CustomSingalPicker(
                      title: "Basic Datepicker",
                      text: "MM/DD/YYYY",
                      child: CustomDatepicker(
                        controller: basicDatepickerController,
                        selectedDate: basicDatepickerDate,
                      ),
                    ),
                    SizedBox(height: 20),
                    DateRangePickerForms(),
                    SizedBox(height: 20),
                    CustomMultipulPicker(
                      title: "Date Range Picker Comparison Ranges",
                      child1: CustomDateRangePicker(
                        dateController: comparisonRangesController1,
                        dateFormat: comparisonRangesDate1,
                      ),
                      child2: CustomDateRangePicker(
                        dateController: comparisonRangesController2,
                        dateFormat: comparisonRangesDate2,
                      ),
                      text1: "MM/DD/YYYY - MM/DD/YYYY",
                      text2: "MM/DD/YYYY - MM/DD/YYYY",
                    ),
                    SizedBox(height: 20),
                    CustomMultipulPicker(
                      title: "Datepicker Action Buttons",
                      child1: CustomDatepicker(
                        controller: actionButtonsController1,
                        selectedDate: actionButtonsDate1,
                      ),
                      child2: CustomDateRangePicker(
                        dateController: actionButtonsController2,
                        dateFormat: actionButtonsDate2,
                        selectedStartDate: actionButtonsStartDate,
                        selectedEndDate: actionButtonsEndDate,
                        showActionButtons: true,
                      ),
                      text1: "MM/DD/YYYY",
                      text2: "MM/DD/YYYY - MM/DD/YYYY",
                    ),
                    SizedBox(height: 20),
                    CustomSingalPicker(
                      title:
                          "Date Range Picker with Custom a Selection Strategy",
                      text: "MM/DD/YYYY - MM/DD/YYYY",
                      child: CustomDateRangePicker(
                        dateController: customaSelectionStrategyController1,
                        dateFormat: customaSelectionStrategyDate1,
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomMultipulPicker(
                      title: "Datepicker Palette Colors",
                      child1: CustomDatepicker(
                        controller: datepickerPaletteColorsController1,
                        selectedDate: datepickerPaletteColorsDate1,
                        labelText: "Inherited calender color",
                      ),
                      child2: CustomDatepicker(
                        controller: datepickerPaletteColorsController2,
                        selectedDate: datepickerPaletteColorsDate2,
                        labelText: "Custom calender color",
                      ),
                      text1: "MM/DD/YYYY",
                      text2: "MM/DD/YYYY",
                    ),
                    SizedBox(height: 20),
                    DatepickerOpenMethod(),
                    SizedBox(height: 20),
                    CustomSingalPicker(
                      title: "Datepicker with Custom Icon",
                      text: "MM/DD/YYYY",
                      child: CustomDatepicker(
                        controller: customIconController,
                        selectedDate: customIconDate,
                        showDownArrow: true,
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomSingalPicker(
                      title: "Datepicker with Custom Date Classes",
                      text: "MM/DD/YYYY",
                      child: CustomDatepicker(
                        controller: customDateclassesController,
                        selectedDate: customDateclassesDate,
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomSingalPicker(
                      title: "Datepicker with Filter Validation",
                      text: "MM/DD/YYYY",
                      child: CustomDatepicker(
                        controller: filterValidationController,
                        selectedDate: filterValidationDate,
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomSingalPicker(
                      title: "Datepicker with Custom Formats",
                      text: "MMMM DD, YYYY",
                      child: CustomDatepicker(
                        controller: customFormatsController,
                        selectedDate: customFormatsDate,
                        labelText: "Verbose datepicker",
                      ),
                    ),
                    SizedBox(height: 20),
                    DatepickerWithDifferentLocale(),
                    SizedBox(height: 20),
                    CustomSingalPicker(
                      title: "Datepicker with Min & Max Validation",
                      text: "MM/DD/YYYY",
                      child: CustomDatepicker(
                        controller: minandMaxController,
                        selectedDate: minandMaxDate,
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomSingalPicker(
                      title: "Datepicker that uses Moment.js Dates",
                      text: "MM/DD/YYYY",
                      child: CustomDatepicker(
                        controller: customFormatsController,
                        selectedDate: customFormatsDate,
                        labelText: "Moment.js datepicker",
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomSingalPicker(
                      title: "Datepicker Start Date",
                      text: "MM/DD/YYYY",
                      child: CustomDatepicker(
                        controller: startDateController,
                        selectedDate: startDate,
                        firstDate: DateTime(1990),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(height: 20),
                    CustomSingalPicker(
                      title: "Datepicker Touch UI",
                      text: "MM/DD/YYYY",
                      child: CustomDatepicker(
                        controller: touchUIController,
                        selectedDate: touchUIDate,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(),
                      child: CustomMultipulPicker(
                        title: "Datepicker Selected Value",
                        child1: CustomDatepicker(
                          controller: angularFormsController,
                          selectedDate: angularFormsDate,
                          labelText: "Angular forms",
                        ),
                        child2: CustomDatepicker(
                          controller: deserialivationController,
                          selectedDate: deserialivationDate,
                          labelText: "Angular forms (w/deserialization)",
                        ),
                        child3: CustomDatepicker(
                          controller: valueBindingController,
                          selectedDate: valueBindingDate,
                          labelText: "Valuebinding",
                        ),
                        text1: "MM/DD/YYYY",
                        text2: "MM/DD/YYYY",
                        text3: "MM/DD/YYYY",
                      ),
                    ),
                    SizedBox(height: 20),
                    YearMonthPicker(),
                    SizedBox(height: 20),
                    DisabledDatepicker(),
                    SizedBox(height: 20),
                    DatepickerInlineCalendar(),
                  ],
                )
              : Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              CustomSingalPicker(
                                title: "Basic Datepicker",
                                text: "MM/DD/YYYY",
                                child: CustomDatepicker(
                                  controller: basicDatepickerController,
                                  selectedDate: basicDatepickerDate,
                                ),
                              ),
                              SizedBox(height: 20),
                              DateRangePickerForms(),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          decoration: BoxDecoration(),
                          width: width / 2,
                          child: Column(
                            children: [
                              CustomMultipulPicker(
                                title: "Date Range Picker Comparison Ranges",
                                child1: CustomDateRangePicker(
                                  dateController: comparisonRangesController1,
                                  dateFormat: comparisonRangesDate1,
                                ),
                                child2: CustomDateRangePicker(
                                  dateController: comparisonRangesController2,
                                  dateFormat: comparisonRangesDate2,
                                ),
                                text1: "MM/DD/YYYY - MM/DD/YYYY",
                                text2: "MM/DD/YYYY - MM/DD/YYYY",
                              ),
                              SizedBox(height: 20),
                              CustomMultipulPicker(
                                title: "Datepicker Action Buttons",
                                child1: CustomDatepicker(
                                  controller: actionButtonsController1,
                                  selectedDate: actionButtonsDate1,
                                ),
                                child2: CustomDateRangePicker(
                                  dateController: actionButtonsController2,
                                  dateFormat: actionButtonsDate2,
                                  selectedStartDate: actionButtonsStartDate,
                                  selectedEndDate: actionButtonsEndDate,
                                  showActionButtons: true,
                                ),
                                text1: "MM/DD/YYYY",
                                text2: "MM/DD/YYYY - MM/DD/YYYY",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomSingalPicker(
                            title:
                                "Date Range Picker with Custom a Selection Strategy",
                            text: "MM/DD/YYYY - MM/DD/YYYY",
                            child: CustomDateRangePicker(
                              dateController:
                                  customaSelectionStrategyController1,
                              dateFormat: customaSelectionStrategyDate1,
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          decoration: BoxDecoration(),
                          width: width / 2.2,
                          child: CustomMultipulPicker(
                            title: "Datepicker Palette Colors",
                            child1: CustomDatepicker(
                              controller: datepickerPaletteColorsController1,
                              selectedDate: datepickerPaletteColorsDate1,
                              labelText: "Inherited calender color",
                            ),
                            child2: CustomDatepicker(
                              controller: datepickerPaletteColorsController2,
                              selectedDate: datepickerPaletteColorsDate2,
                              labelText: "Custom calender color",
                            ),
                            text1: "MM/DD/YYYY",
                            text2: "MM/DD/YYYY",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: DatepickerOpenMethod()),
                        SizedBox(width: 20),
                        Expanded(
                          child: CustomSingalPicker(
                            title: "Datepicker with Custom Icon",
                            text: "MM/DD/YYYY",
                            child: CustomDatepicker(
                              controller: customIconController,
                              selectedDate: customIconDate,
                              showDownArrow: true,
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: CustomSingalPicker(
                            title: "Datepicker with Custom Date Classes",
                            text: "MM/DD/YYYY",
                            child: CustomDatepicker(
                              controller: customDateclassesController,
                              selectedDate: customDateclassesDate,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomSingalPicker(
                            title: "Datepicker with Filter Validation",
                            text: "MM/DD/YYYY",
                            child: CustomDatepicker(
                              controller: filterValidationController,
                              selectedDate: filterValidationDate,
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: CustomSingalPicker(
                            title: "Datepicker with Custom Formats",
                            text: "MMMM DD, YYYY",
                            child: CustomDatepicker(
                              controller: customFormatsController,
                              selectedDate: customFormatsDate,
                              labelText: "Verbose datepicker",
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(child: DatepickerWithDifferentLocale()),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomSingalPicker(
                            title: "Datepicker with Min & Max Validation",
                            text: "MM/DD/YYYY",
                            child: CustomDatepicker(
                              controller: minandMaxController,
                              selectedDate: minandMaxDate,
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: CustomSingalPicker(
                            title: "Datepicker that uses Moment.js Dates",
                            text: "MM/DD/YYYY",
                            child: CustomDatepicker(
                              controller: customFormatsController,
                              selectedDate: customFormatsDate,
                              labelText: "Moment.js datepicker",
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: CustomSingalPicker(
                            title: "Datepicker Start Date",
                            text: "MM/DD/YYYY",
                            child: CustomDatepicker(
                              controller: startDateController,
                              selectedDate: startDate,
                              firstDate: DateTime(1990),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    width < 1300
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomSingalPicker(
                                title: "Datepicker Touch UI",
                                text: "MM/DD/YYYY",
                                child: CustomDatepicker(
                                  controller: touchUIController,
                                  selectedDate: touchUIDate,
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                decoration: BoxDecoration(),
                                child: CustomMultipulPicker(
                                  title: "Datepicker Selected Value",
                                  child1: CustomDatepicker(
                                    controller: angularFormsController,
                                    selectedDate: angularFormsDate,
                                    labelText: "Angular forms",
                                  ),
                                  child2: CustomDatepicker(
                                    controller: deserialivationController,
                                    selectedDate: deserialivationDate,
                                    labelText:
                                        "Angular forms (w/deserialization)",
                                  ),
                                  child3: CustomDatepicker(
                                    controller: valueBindingController,
                                    selectedDate: valueBindingDate,
                                    labelText: "Valuebinding",
                                  ),
                                  text1: "MM/DD/YYYY",
                                  text2: "MM/DD/YYYY",
                                  text3: "MM/DD/YYYY",
                                ),
                              ),
                            ],
                          )
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: CustomSingalPicker(
                                  title: "Datepicker Touch UI",
                                  text: "MM/DD/YYYY",
                                  child: CustomDatepicker(
                                    controller: touchUIController,
                                    selectedDate: touchUIDate,
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              Container(
                                decoration: BoxDecoration(),
                                width: width / 2,
                                child: CustomMultipulPicker(
                                  title: "Datepicker Selected Value",
                                  child1: CustomDatepicker(
                                    controller: angularFormsController,
                                    selectedDate: angularFormsDate,
                                    labelText: "Angular forms",
                                  ),
                                  child2: CustomDatepicker(
                                    controller: deserialivationController,
                                    selectedDate: deserialivationDate,
                                    labelText:
                                        "Angular forms (w/deserialization)",
                                  ),
                                  child3: CustomDatepicker(
                                    controller: valueBindingController,
                                    selectedDate: valueBindingDate,
                                    labelText: "Valuebinding",
                                  ),
                                  text1: "MM/DD/YYYY",
                                  text2: "MM/DD/YYYY",
                                  text3: "MM/DD/YYYY",
                                ),
                              ),
                            ],
                          ),
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Expanded(child: YearMonthPicker()),
                        SizedBox(width: 20),
                        Expanded(child: DisabledDatepicker()),
                        SizedBox(width: 20),
                        Expanded(child: DatepickerInlineCalendar()),
                      ],
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
