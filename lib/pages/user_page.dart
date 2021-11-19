import 'package:api/pages/user_controller.dart';
import 'package:api/stores/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class UserPage extends StatefulWidget{
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final store = GetIt.I.get<UserStore>();
  final controller = GetIt.I.get<UserController>();

  @override
  void initState() {
    controller.getAllUser();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  Observer(builder: (_){
          return ListView.builder(
          itemCount: store.users.length,
          itemBuilder: (_,index){
            return Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              color: Colors.red[50],
             child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: NetworkImage(store.users[index].avatar))
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Nome: ", style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),),
                      Text(store.users[index].firstName +" "+ store.users[index].lastName ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Email: ", style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),),
                      Text(store.users[index].email),
                    ],
                  ),
              ],
              ),
            );
        });
        },)
    );
  }
}