import 'package:evently/core/providers/app_theme_provider.dart';
import 'package:evently/core/utils/firebase_utils.dart';
import 'package:evently/core/utils/toast_utils.dart';
import 'package:evently/data/model/event.dart';
import 'package:evently/data/model/event_type.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/presentation/widgets/custom_text_form_field.dart';
import 'package:evently/presentation/widgets/date_or_time.dart';
import 'package:evently/presentation/widgets/event_type_item.dart';
import 'package:evently/presentation/widgets/my_Elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../core/providers/auth_provider.dart';

class AddEventScreen extends StatefulWidget {
  AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> _formState = GlobalKey();

  int currentIndex = 0;
  DateTime? _dateTime;
  TimeOfDay? _timeOfDay;
  String? _formateDate;
  String? _formateTime;

  @override
  Widget build(BuildContext context) {
    List<EventType> category = EventType.getCategories(context).sublist(1);
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(10.r),
          child: OutlinedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ),
        title: Text(
          AppLocalizations.of(context)!.addEvent,
          style: Theme
              .of(context)
              .textTheme
              .titleLarge,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: SingleChildScrollView(
          child: Form(
            key: _formState,
            child: Column(
              crossAxisAlignment: .start,
              spacing: 10.h,
              children: [
                Container(
                  width: double.infinity,
                  height: 195.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusGeometry.circular(16.r),
                    border: Border.all(
                      color: Theme
                          .of(context)
                          .colorScheme
                          .onSecondary,
                    ),
                    image: DecorationImage(
                      image: AssetImage(
                        themeProvider.isDark
                            ? category[currentIndex].imageDarkPath
                            : category[currentIndex].imageLightPath,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        InkWell(
                          onTap: () {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                          child: EventTypeItem(
                            category: category[index],
                            isSelected: currentIndex == index,
                          ),
                        ),
                    separatorBuilder: (context, index) => SizedBox(width: 4.w),
                    itemCount: category.length,
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.title,
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleSmall,
                ),
                CustomTextFormField(
                  hint: AppLocalizations.of(context)!.eventTitle,
                  controller: titleController,
                  validator: (value) {
                    if (value == null || value
                        .trim()
                        .isEmpty) {
                      return 'Enter title';
                    } else {
                      return null;
                    }
                  },
                ),
                Text(
                  AppLocalizations.of(context)!.description,
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleSmall,
                ),
                CustomTextFormField(
                  hint: AppLocalizations.of(context)!.eventDescription,
                  lines: 5,
                  controller: descriptionController,
                  validator: (value) {
                    if (value == null || value
                        .trim()
                        .isEmpty) {
                      return 'Enter description';
                    } else {
                      return null;
                    }
                  },
                ),
                DateOrTime(
                  dateOrTimeIcon: Icons.date_range_outlined,
                  title: AppLocalizations.of(context)!.eventDate,
                  buttonLabel: _formateDate == null
                      ? AppLocalizations.of(context)!.chooseDate
                      : _formateDate!,
                  onpressed: onDateClick,
                ),
                DateOrTime(
                  dateOrTimeIcon: Icons.timer_outlined,
                  title: AppLocalizations.of(context)!.eventTime,
                  buttonLabel: _formateTime == null
                      ? AppLocalizations.of(context)!.chooseTime
                      : _formateTime!,
                  onpressed: onTimeClick,
                ),
                MyElevatedButton(
                  label: AppLocalizations.of(context)!.addEvent,
                  onpressed: () {
                    if (_dateTime == null || _timeOfDay == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please select date and time'),
                        ),
                      );
                      return;
                    }
                    if (_formState.currentState!.validate()) {
                      FirebaseUtils.addEvent(
                        Event(
                          eventName: category[currentIndex].type,
                          imagePathLight: category[currentIndex].imageLightPath,
                          imagePathDark: category[currentIndex].imageDarkPath,
                          eventIndex: currentIndex + 1,
                          title: titleController.text,
                          description: descriptionController.text,
                          eventDate: _dateTime ?? DateTime.now(),
                        ),
                        context
                            .read<AuthProvider>()
                            .currentUser!
                            .id,
                      ).then((value) {
                        ToastUtils.showToast(
                          msg: "Event added successfully",
                          gravity: ToastGravity.CENTER,
                          backColor: Colors.green,
                          textColor: Colors.white,
                        );
                        Navigator.of(context).pop(true);
                      }).onError((error, stackTrace) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(error.toString()),
                          ),
                        );
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onDateClick() async {
    _dateTime = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {
      if (_dateTime != null) {
        _formateDate = DateFormat("dd/MM/yyyy").format(_dateTime!);
      }
    });
  }

  Future<void> onTimeClick() async {
    _timeOfDay = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {
      if (_timeOfDay != null) {
        _formateTime = _timeOfDay!.format(context);
      }
    });
  }
}


//
// {
// final result = await Navigator.of(context).pushNamed(
// AppRoutes.addEventScreen,
// );
//
// if (result == true) {
// print("EVENT ADDED SUCCESSFULLY");
// ToastUtils.showToast(
// msg: "Event added successfully",
// gravity: ToastGravity.CENTER,
// backColor: Colors.green,
// textColor: Colors.white,
// );
// }
// }
