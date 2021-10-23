import 'package:flutter/material.dart';
import 'package:modelos/pages/home_pages.dart';
import 'package:modelos/pages/login_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BoasVindas extends StatefulWidget {
  const BoasVindas({Key? key}) : super(key: key);

  @override
  _BoasVindasState createState() => _BoasVindasState();
}

class _BoasVindasState extends State<BoasVindas> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    verificarToken().then((value) => {
          if(value){
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder:(context) => HomePages(),
                ),
            ),
        } else{
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder:(context) => LoginPages(),
          ),
        ),
        }
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Future<bool> verificarToken() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString('token') != null){
      return true;c

      }else{
      return false;
    }

  }
}
