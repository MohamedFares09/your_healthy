import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:your_health/core/model/avalible_time_model.dart';
import 'package:your_health/core/model/doctor_model.dart';
import 'package:your_health/core/theming/color.dart';
import 'package:your_health/core/widgets/custom_button.dart';
import 'package:your_health/features/confarm/screens/confarm_screen.dart';

class AvailableTimesWidget extends StatefulWidget {
  final List<AvalibleTimeModel> listTime;
  final int doctorId;
  final int serviceId;
  const AvailableTimesWidget({super.key, required this.listTime, required this.doctorId, required this.serviceId});

  @override
  State<AvailableTimesWidget> createState() => _AvailableTimesWidgetState();
}

class _AvailableTimesWidgetState extends State<AvailableTimesWidget> {
  int? selectedIndex;

  // تحويل الوقت من 24 إلى 12 ساعة مع ص/م
  String formatTo12Hour(String time24) {
    final date = DateFormat("HH:mm").parse(time24);
    final formatted = DateFormat("h:mm a").format(date);
    return formatted.replaceAll("AM", "ص").replaceAll("PM", "م");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Center(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: List.generate(widget.listTime.length, (index) {
                    final time = widget.listTime[index];
                    final isSelected = selectedIndex == index;

                    return SizedBox(
                      width: 180,
                      height: 45,
                      child: ChoiceChip(
                        label: Center(
                          child: Text(
                            "${formatTo12Hour(time.start)} - ${formatTo12Hour(time.end)}",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        selected: isSelected,
                        selectedColor: ColorManegaer.kprimarycolor,
                        backgroundColor: Colors.grey[200],
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color: isSelected
                                ? ColorManegaer.kprimarycolor
                                : Colors.grey.shade400,
                          ),
                        ),
                        onSelected: (_) {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                      ),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              namebutton: "تاكيد الحجز",
              onPressed: () {
                if (selectedIndex == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("يرجى اختيار وقت الحجز أولًا"),
                    ),
                  );
                  return;
                }
                final selectedTime = widget.listTime[selectedIndex!];
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ConfarmScreen(
                    doctorId: widget.doctorId,
                    serviceId: widget.serviceId,
                    start: selectedTime.start,
                    end: selectedTime.end,
                  );
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
