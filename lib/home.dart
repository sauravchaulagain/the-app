import 'package:flutter/material.dart';

import 'package:testing/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Future<List<UserDetails>> getData() async {
  //   final response = await http.get(
  //     Uri.parse(
  //       'https://jsonplaceholder.typicode.com/users',
  //     ),
  //   );
  //   var data = jsonDecode(response.body);
  //   if (response.statusCode == 200) {
  //     for (Map<String, dynamic> i in data) {
  //       rampost.add(UserDetails.fromJson(i));
  //     }
  //     return rampost;
  //   } else {
  //     Get.snackbar('Tect',
  //         'Server Respond ${response.statusCode}:${response.reasonPhrase}');
  //   }
  //   return rampost;
  // }
  //https://raw.githubusercontent.com/sauravchaulagain/the-app/main/assets/all_data.json

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: RemoteServices().getData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Text('loading');
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Text(snapshot.data![index].email.toString());
            },
          );
        }
      },
    ));
  }
}
