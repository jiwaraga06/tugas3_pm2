part of '../index.dart';

class PickTimeScreen extends StatefulWidget {
  const PickTimeScreen({super.key});

  @override
  State<PickTimeScreen> createState() => _PickTimeScreenState();
}

class _PickTimeScreenState extends State<PickTimeScreen> {
  String? selectedTime;
  Future<void> selectTime(BuildContext context) async {
    final now = DateTime.now();
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null ) {
      setState(() {
        final formattedTime = DateFormat('HH:mm').format(
          DateTime(now.year, now.month, now.day, picked.hour, picked.minute),
        );
        selectedTime = formattedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (selectedTime != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Hari ini Jam : ", style: TextStyle(fontSize: 16)),
                  Text(selectedTime.toString(), style: TextStyle(fontSize: 16)),
                ],
              ),
            const SizedBox(height: 12),
            ElevatedButton(
                onPressed: () {
                  selectTime(context);
                },
                child: Text("Pilih Jam")),
          ],
        ),
      ),
    );
  }
}
