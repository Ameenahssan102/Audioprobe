import 'package:audio_probe/Custom/base_widget.dart';
import 'package:audio_probe/Values/values.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Tab3 extends StatefulWidget {
  const Tab3({super.key});

  @override
  State<Tab3> createState() => _Tab3State();
}

class _Tab3State extends State<Tab3> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BaseWidget(
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
                "Appointments",
                style: GoogleFonts.lato(
                  color: AppColors.black,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              )
            ],
          ),
          SizedBox(height: 25),
          ToggleSwitch(
            minWidth: size.width,
            customTextStyles: [
              TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
              TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600)
            ],
            cornerRadius: 8.0,
            inactiveFgColor: Colors.white,
            initialLabelIndex: 0,
            changeOnTap: true,
            totalSwitches: 2,
            activeBgColor: [AppColors.primaryDarkColor, AppColors.primaryColor],
            labels: const ['Monthly', 'Weekly'],
            onToggle: (index) {
              print('switched to: $index');
            },
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.width + 56,
              child: SfCalendar(
                // key: ValueKey(calendarView),
                allowedViews: const [CalendarView.month, CalendarView.week],
                showDatePickerButton: true,
                allowAppointmentResize: true,
                showCurrentTimeIndicator: true,
                showNavigationArrow: true,
                // showTodayButton: true,
                headerHeight: 56.0,

                monthViewSettings: const MonthViewSettings(
                  appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
                  showAgenda: false,
                  agendaItemHeight: 40.0,
                  agendaViewHeight: 56.0,
                ),
                view: CalendarView.workWeek,
                backgroundColor: Colors.white,
                todayHighlightColor: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
