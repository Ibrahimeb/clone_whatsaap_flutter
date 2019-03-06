import 'package:flutter/material.dart';
import 'package:clone_whatsapp/home/models/ChatModels.dart';
import 'package:clone_whatsapp/home/views/ChatViewRoom.dart';

class ChatViewList extends StatefulWidget {
  @override
  _ChatViewListState createState() => _ChatViewListState();
}

class _ChatViewListState extends State<ChatViewList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: messageData.length,
        itemBuilder: (context,index)=>Column(
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
            trailing: Text(messageData[index].time,
              style: TextStyle(color: Colors.grey, fontSize: 14
              ),
            ),
            onTap: (){
              var route = MaterialPageRoute(builder: (context) => ChatViewRoom(messageData[index])) ; // this code can be in parameter without var route
              Navigator.push(context,route);
              },
          )
        ],
        )
    );
  }
}

