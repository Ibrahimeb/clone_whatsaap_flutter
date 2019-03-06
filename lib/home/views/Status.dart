import 'package:flutter/material.dart';
import 'package:clone_whatsapp/home/models/StatusModels.dart';


class StatusView extends StatefulWidget {
  @override
  _StatusViewState createState() => _StatusViewState();
}

class _StatusViewState extends State<StatusView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildListTile(statusList[0], true),
          Container(
            child:Text("Recientes",
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight:FontWeight.bold,
                  fontSize: 18
              ),
            ),
            padding: EdgeInsets.only(left: 5),
          ),
          Flexible(
//              child: SizedBox(height: 200,
                child: ListView.builder(
                  itemCount: statusList.length,
                  itemBuilder: (context,index){
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Divider(height: 10,color: Colors.grey),
                        _buildListTile(statusList[index], false)
                      ],
                    );
                  }

                ) ,
//              )
          )

        ],
      ) ,
    );
  }



  Widget _buildListTile(StatusModels model,bool type){
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
            type?
                "https://media.licdn.com/dms/image/C4D03AQHT_5K6Bv-7Og/profile-displayphoto-shrink_200_200/0?e=1557360000&v=beta&t=Q-NT-KkSz5nrWJ6ALB2u8SKg2FBuH9mkO_frstjzt24"
                :model.imageUrl
        ),
      ),
      title: Text(type?"Ibrahim Estanga":model.name,
        style: TextStyle(fontWeight: FontWeight.bold),),
      subtitle: Container(padding: const EdgeInsets.only(top: 5),
          child: Text(
              type?"Anadir un estado":model.time,
            style: TextStyle(fontSize: type?14:18),
          )
      ),
      onTap: (){
//              var route = MaterialPageRoute(builder: (context) => ChatViewRoom(messageData[index])) ; // this code can be in parameter without var route
//              Navigator.push(context,route);
      },
    );
  }

}
