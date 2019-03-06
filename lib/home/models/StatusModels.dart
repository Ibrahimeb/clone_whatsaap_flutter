import 'package:clone_whatsapp/home/models/ChatModels.dart';

class StatusModels{
  String imageUrl;
  final String name;
  final String time;

  StatusModels(this.name, this.time, this.imageUrl);
}

List<StatusModels> statusList = [
  new StatusModels(
       messageData[0].name,
       "Hoy, 3:00AM",
       messageData[0].imageUrl
  ),
  new StatusModels(
       messageData[1].name,
      "Hoy, 4:23AM",
       messageData[1].imageUrl
  ),
  new StatusModels(
      messageData[2].name,
      "Hoy, 5:23PM",
      messageData[2].imageUrl
  ),
  new StatusModels(
      messageData[3].name,
      "Hoy, 4:43PM",
      messageData[3].imageUrl
  ),
];