import 'package:flutter/material.dart';
import 'package:clone_whatsapp/home/models/ChatModels.dart';

class ChatViewRoom extends StatefulWidget {
  final ChatModels chatModels;

  ChatViewRoom(this.chatModels);

  @override
  _ChatViewRoomState createState() => _ChatViewRoomState();
}

class _ChatViewRoomState extends State<ChatViewRoom>
    with TickerProviderStateMixin {
  var isTyped = false;
  final _textFieldController = TextEditingController();
  final List<ChatMessage> _listMessage = <ChatMessage>[];

  Widget _buildTextComposer() => Container(
        child: Row(
          children: <Widget>[
            Flexible(
                child: TextField(
                textAlign: TextAlign.left,
              decoration: InputDecoration(
                hintText: "escribe un mensaje aqui",
                contentPadding: const EdgeInsets.only(left: 10)
              ),
              controller: _textFieldController,
                  onChanged: (text){
                  setState(() {
                    isTyped = text.length>0;
                  });
                  },
            )),
            Container(
              child: FloatingActionButton(
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    if (isTyped){
                      _handledSubmit(_textFieldController.text);
                      _textFieldController.clear();
                    }
                  }),
            )
          ],
        ),
      );

  void _handledSubmit(String text) {
    print(text.trim());


    var chatmsg = ChatMessage(
        "Ibrahim Estanga",
        AnimationController(duration: Duration(milliseconds: 700), vsync: this),
        text);

    setState(() {
      _listMessage.insert(0, chatmsg);
      isTyped = false;

      var data = messageData.firstWhere((t) => t.name==widget.chatModels.name);
      data.message = chatmsg._msg;

    });

    chatmsg._animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chatModels.name),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(widget.chatModels.imageUrl),
          minRadius: 10,
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
                child: ListView.builder(
                  reverse: true,
                    itemCount: _listMessage.length,
                    itemBuilder: (_, index) => _listMessage[index])),
            Container(child: _buildTextComposer())
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String _name;
  final AnimationController _animationController;
  final String _msg;

  ChatMessage(this._name, this._animationController, this._msg);

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor:
          CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 16),
                child: CircleAvatar(child: Text(_name[0]))
            ),
            Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                    child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(_name),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(_msg),
                )
              ],
            )))
          ],
        ),
      ),
    );
  }
}
