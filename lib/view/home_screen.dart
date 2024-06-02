import 'package:flutter/material.dart';
import 'package:mvvm/res/colors.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/userviewviewmodel.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    final user = UserViewViewModel();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          InkWell(
            child: const Icon(Icons.logout_outlined),
            onTap: () {
              user.removeUser().then((value) {
                
                Navigator.pushNamed(context, RoutesName.login);
              }).onError((error, stackTrace) {
                Utils.flushbarErrorMessage(error.toString(), context);
              });
            },
          ),
        ],
      ),
      body: const Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Hi, I Am Home",
            style: TextStyle(
                color: ColorsApp.whiteColor, fontWeight: FontWeight.bold),
          ),
        ]),
      ),
    );
  }
}
