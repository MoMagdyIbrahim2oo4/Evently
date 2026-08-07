import 'package:evently/core/providers/app_theme_provider.dart';
import 'package:evently/data/model/event_type.dart';
import 'package:evently/presentation/widgets/custom_text_form_field.dart';
import 'package:evently/presentation/widgets/date_or_time.dart';
import 'package:evently/presentation/widgets/event_type_item.dart';
import 'package:evently/presentation/widgets/my_Elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddEventScreen extends StatefulWidget {
  AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  List<EventType> category = EventType.getCategories().sublist(1);

  int currentIndex = 0;
  DateTime? _dateTime;
  TimeOfDay? _timeOfDay;
  String? _formateDate;
  String? _formateTime;

  @override
  Widget build(BuildContext context) {
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
        title: Text("Add event", style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: SingleChildScrollView(
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
                    color: Theme.of(context).colorScheme.onSecondary,
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
                  itemBuilder: (context, index) => InkWell(
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
              Text("Title", style: Theme.of(context).textTheme.titleSmall),
              CustomTextFormField(hint: "Event Title"),
              Text(
                "Description",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              CustomTextFormField(hint: "Event Description....", lines: 5),
              DateOrTime(
                dateOrTimeIcon: Icons.date_range_outlined,
                title: "Event Date",
                buttonLabel: _formateDate == null
                    ? "Choose Date"
                    : _formateDate!,
                onpressed: onDateClick,
              ),
              DateOrTime(
                dateOrTimeIcon: Icons.timer_outlined,
                title: "Event Time",
                buttonLabel: _formateTime == null
                    ? "Choose time"
                    : _formateTime!,
                onpressed: onTimeClick,
              ),
              MyElevatedButton(label: "Add event", onpressed: () {}),
            ],
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
    setState(() {
      if (_timeOfDay != null) {
        _formateTime = _timeOfDay!.format(context);
      }
    });
  }
}
