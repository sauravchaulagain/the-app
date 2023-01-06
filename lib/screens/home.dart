import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../user.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() async {
    var json =
        await rootBundle.loadString("assets/MOCK_DATA_FLUTTER_TEST.json");
    print(json);
    var decodedData = jsonDecode(json);
    var userData = decodedData["user"];
    UserModel.users =
        List.from(userData).map<User>((user) => User.fromMap(user)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Interview'),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: UserModel.users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${UserModel.users[index].first_name}' +
                      ' ${UserModel.users[index].last_name}'),
                  trailing: Text('${UserModel.users[index].gender}'),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/Male Avatar.jpg'),
                  ),
                  subtitle: Text('${UserModel.users[index].email}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // void searchBook(String query) {final name =UserModel.users[].first_name.toLowerCase();
  //   final
  // }
}
