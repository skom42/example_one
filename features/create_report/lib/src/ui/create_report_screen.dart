import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bloc/create_report_bloc.dart';
import '../bloc/create_report_event.dart';
import '../bloc/create_report_state.dart';

class CreateReportScreen extends StatefulWidget {
  const CreateReportScreen({Key? key}) : super(key: key);

  @override
  State<CreateReportScreen> createState() => _CreateReportScreenState();
}

class _CreateReportScreenState extends State<CreateReportScreen> {
  EventModel? activityModel;
  DateTime? date;
  DateTime? startTime;
  DateTime? endTime;

  @override
  Widget build(BuildContext context) {
    final double datePickerHeight = MediaQuery.of(context).size.height * 0.48;
    return Material(
      color: AppTheme.transparentColor,
      child: BlocBuilder<CreateReportBloc, CreateReportState>(
        builder: (BuildContext context, CreateReportState state) {
          if (state is CreateReportContent) {
            return Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: AppTheme.backgroundPrimaryColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(15),
                ),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 0,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    const SizedBox(height: 32),
                    Text(
                      FlutterI18n.translate(context, 'addActivity.title'),
                      style: AppTextTheme.manrope30SemiBold.copyWith(
                        color: AppTheme.primaryTextColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      FlutterI18n.translate(context, 'addActivity.description'),
                      style: AppTextTheme.manrope16Regular,
                    ),
                    const SizedBox(height: 32),
                    AppDropdownButton<EventModel>(
                      hintText: 'Select Activity',
                      value: state.selectedActivity,
                      items: state.activities.map(
                        (EventModel value) {
                          return DropdownMenuItem<EventModel>(
                            value: value,
                            child: Text(
                              value.title,
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (EventModel newValue) {
                        setState(() {
                          activityModel = newValue;
                        });
                        BlocProvider.of<CreateReportBloc>(context).add(
                          ValidateDateEvent(
                            date: date,
                            startTime: startTime,
                            endTime: endTime,
                            activityModel: activityModel,
                          ),
                        );
                      },
                    ),
                    if (activityModel != null) ...<Widget>{
                      const SizedBox(height: 12),
                      GestureDetector(
                        onTap: () {
                          _openDatePicker(
                            context,
                            mode: CupertinoDatePickerMode.date,
                            height: datePickerHeight,
                            onValueChanged: (DateTime value) {
                              setState(() {
                                date = value;
                              });
                              BlocProvider.of<CreateReportBloc>(context).add(
                                ValidateDateEvent(
                                  date: date,
                                  startTime: startTime,
                                  endTime: endTime,
                                  activityModel: activityModel,
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                            color: AppTheme.dropDownBgColor,
                          ),
                          child: Text(
                            state.selectedDate != null
                                ? DateTimeUtils.DD_MM_YY.format(state.selectedDate!)
                                : FlutterI18n.translate(context, 'addActivity.date'),
                            style: AppTextTheme.manrope16Regular.copyWith(
                              color: AppTheme.dropDownTextColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                _openDatePicker(
                                  context,
                                  mode: CupertinoDatePickerMode.time,
                                  height: datePickerHeight,
                                  onValueChanged: (DateTime value) {
                                    setState(() {
                                      startTime = value;
                                    });
                                    BlocProvider.of<CreateReportBloc>(context).add(
                                      ValidateDateEvent(
                                        date: date,
                                        startTime: startTime,
                                        endTime: endTime,
                                        activityModel: activityModel,
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 16,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                  color: AppTheme.dropDownBgColor,
                                ),
                                child: Text(
                                  state.selectedStartTime != null
                                      ? DateTimeUtils.HH_MM.format(state.selectedStartTime!)
                                      : FlutterI18n.translate(context, 'addActivity.startTime'),
                                  style: AppTextTheme.manrope16Regular.copyWith(
                                    color: AppTheme.dropDownTextColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                _openDatePicker(
                                  context,
                                  mode: CupertinoDatePickerMode.time,
                                  height: datePickerHeight,
                                  onValueChanged: (DateTime value) {
                                    setState(() {
                                      endTime = value;
                                    });
                                    BlocProvider.of<CreateReportBloc>(context).add(
                                      ValidateDateEvent(
                                        date: date,
                                        startTime: startTime,
                                        endTime: endTime,
                                        activityModel: activityModel,
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 16,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                  color: AppTheme.dropDownBgColor,
                                ),
                                child: Text(
                                  state.selectedEndTime != null
                                      ? DateTimeUtils.HH_MM.format(state.selectedEndTime!)
                                      : FlutterI18n.translate(context, 'addActivity.endTime'),
                                  style: AppTextTheme.manrope16Regular.copyWith(
                                    color: AppTheme.dropDownTextColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: MainAppButton(
                          height: 45,
                          isEnabled: state.isValidationsPassed,
                          backgroundColor: AppTheme.buttonBgColor,
                          disabledBackgroundColor: AppTheme.buttonDisabledBgColor,
                          text: 'addActivity.buttonText',
                          onPressed: () {
                            BlocProvider.of<CreateReportBloc>(context).add(
                              CreateReportUploadDataEvent(),
                            );
                          },
                        ),
                      )
                    }
                  ],
                ),
              ),
            );
          } else if (state is CreateReportErrorState) {
            return AppErrorWidget(
              onPageReload: () {
                BlocProvider.of<CreateReportBloc>(context).add(
                  CreateReportLoadData(),
                );
              },
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  void _openDatePicker(
    BuildContext context, {
    required double height,
    required CupertinoDatePickerMode mode,
    required Function(DateTime) onValueChanged,
  }) {
    showMaterialModalBottomSheet(
      expand: false,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) => DatePicker(
        pickerMode: mode,
        height: height,
        initialDate: DateTimeUtils.currentDate,
        onDateTimeChanged: (DateTime? newDate) {
          if (newDate != null) {
            onValueChanged(newDate);
          }
        },
      ),
    );
  }
}
