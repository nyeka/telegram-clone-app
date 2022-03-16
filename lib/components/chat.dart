import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  var faker = new Faker();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.grey, brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              Flexible(
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  height: 130,
                  color: Colors.purple,
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Menu",
                    style: TextStyle(fontSize: 23, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text(
                  "Message",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Log Out"))
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Telegram Clone"),
          actions: [
            Icon(
              Icons.search,
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
          ],
        ),
        body: ListView.builder(
            padding: EdgeInsets.all(2),
            itemCount: 200,
            itemBuilder: (context, index) {
              return Dismissible(
                confirmDismiss: (direction) {
                  return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Confirm"),
                          content: Text("Are you sure want to delete ?"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                                child: Text("No")),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                                child: Text("Yes"))
                          ],
                        );
                      });
                },
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  child: Icon(
                    Icons.delete,
                    size: 25,
                  ),
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 10),
                ),
                key: Key(index.toString()),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage('https://picsum.photos/id/$index/200/300'),
                  ),
                  title: Text(faker.person.name()),
                  subtitle: Text(faker.lorem.sentence()),
                  trailing: Text("10.00 PM"),
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.message),
        ),
      ),
    );
  }
}
