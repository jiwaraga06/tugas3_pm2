part of '../index.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool showPassword = true;
  void togglePassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  void login() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (formkey.currentState!.validate()) {
      pref.setString("username", controllerUsername.text);
      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushNamedAndRemoveUntil(context, homeScreen, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.only(left: 18, right: 18),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Silahkan Login", style: TextStyle(fontSize: 28, color: Colors.blue[600])),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: controllerUsername,
                    decoration: InputDecoration(
                      hintText: "Masukan Username",
                      errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red.withOpacity(0.5)), borderRadius: BorderRadius.circular(8)),
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black.withOpacity(0.5)), borderRadius: BorderRadius.circular(8)),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black.withOpacity(0.5)), borderRadius: BorderRadius.circular(8)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black.withOpacity(0.5)), borderRadius: BorderRadius.circular(8)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Kolom username tidak boleh kosong";
                      }
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: controllerPassword,
                    obscureText: showPassword,
                    decoration: InputDecoration(
                      hintText: "Masukan Password",
                      suffixIcon: InkWell(onTap: togglePassword, child: showPassword ? Icon(Icons.visibility) : Icon(Icons.visibility_off)),
                      errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red.withOpacity(0.5)), borderRadius: BorderRadius.circular(8)),
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black.withOpacity(0.5)), borderRadius: BorderRadius.circular(8)),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black.withOpacity(0.5)), borderRadius: BorderRadius.circular(8)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black.withOpacity(0.5)), borderRadius: BorderRadius.circular(8)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Kolom password tidak boleh kosong";
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: login,
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                      child: Text("LOGIN", style: TextStyle(color: Colors.white)),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
