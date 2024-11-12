part of '../index.dart';

class PickDateScreen extends StatefulWidget {
  const PickDateScreen({super.key});

  @override
  State<PickDateScreen> createState() => _PickDateScreenState();
}

class _PickDateScreenState extends State<PickDateScreen> {
  String? selectedDate;
  void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null ) {
      setState(() {
        final formattedTime = DateFormat('dd MMMM yyyy').format(
          DateTime(picked.year, picked.month, picked.day, picked.hour, picked.minute),
        );
        selectedDate = formattedTime;
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
            if (selectedDate != null) Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Hari ini Tanggal : ", style: TextStyle(fontSize: 16)),
                Text(selectedDate.toString(), style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 12),
            ElevatedButton(
                onPressed: () {
                  selectDate(context);
                },
                child: Text("Pilih Tanggal")),
          ],
        ),
      ),
    );
  }
}
