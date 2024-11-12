part of '../index.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void getSession() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var username = pref.getString("username");
    if (username != null) {
      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushNamedAndRemoveUntil(context, homeScreen, (route) => false);
    } else {
      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushNamedAndRemoveUntil(context, loginScreen, (route) => false);
    }
  }

@override
void initState() {
  super.initState();
  getSession();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
