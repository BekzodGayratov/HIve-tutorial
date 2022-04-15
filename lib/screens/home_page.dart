import 'package:flutter/material.dart';
import 'package:youtube/service/hive_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("WORK WITH HIVE")),
      body: FutureBuilder(
        future: MyDB.getUserData(),
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("ERROR"),
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Text(
                    MyDB.myBox.getAt(index)!.address!.geo!.lng.toString());
              },
              itemCount: MyDB.myBox.length,
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await MyDB.getUserData();
        },
      ),
    );
  }
}
