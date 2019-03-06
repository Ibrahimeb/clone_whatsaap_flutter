import 'package:clone_whatsapp/home/views/ChatViewRoom.dart';
import 'package:flutter/material.dart';
import 'package:clone_whatsapp/home/models/ChatModels.dart';

class ContactView extends StatefulWidget {
  @override
  _ContactViewState createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Seleccione un contacto"),
      ),
      body: ListView.builder(
          itemCount: messageData.length,
          itemBuilder: (context, index) =>
              Column(
                children: <Widget>[
                  Divider(height: 10),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          messageData[index].imageUrl
                      ),
                    ),
                    title: Text(messageData[index].name,
                      style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Container(padding: const EdgeInsets.only(top: 5),
                        child: Text(
                            messageData[index].message
                        )
                    ),
                    trailing: Text("Mobile",
                      style: TextStyle(color: Theme
                          .of(context)
                          .accentColor, fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    onTap: () {
                      var route = MaterialPageRoute(builder: (context) =>
                          ChatViewRoom(
                              messageData[index])); // this code can be in parameter without var route
                      Navigator.push(context, route);
                    },
                  )
                ],
              )
      ),
    );
  }
}
