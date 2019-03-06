class ChatModels{
  final String name;
  String message;
  final String time;
  final String imageUrl;

  ChatModels(this.name, this.message, this.time, this.imageUrl);
}

List<ChatModels> messageData = [
   ChatModels(
       "Martin Fowler",
       "Hola como estas?",
       "15:30",
       "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Martin_Fowler_%282008%29.jpg/1200px-Martin_Fowler_%282008%29.jpg"),
   ChatModels(
       "Linux tolvar",
       "Me encanta flutter!",
       "17:30",
      "https://avatars0.githubusercontent.com/u/1024025?s=460&v=4"),
   ChatModels(
       "Steve Wozniak",
       "Wassup !",
       "5:00",
       "https://www.nbforum.com/app/uploads/Steve-Wozniak-fix-600x722.jpg"),
   ChatModels(
      "Robert martin",
      "bye!",
      "10:30",
       "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ee/Robert_Cecil_Martin.png/220px-Robert_Cecil_Martin.png"),
   ChatModels(
       "Dennis Ritchie",
       "Nos vemos más tarde",
       "12:30",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Dennis_Ritchie_2011.jpg/220px-Dennis_Ritchie_2011.jpg"
  ),
   ChatModels(
       "Paul hudson",
       "buenos días",
       "15:30",
      "https://pbs.twimg.com/profile_images/959170433110237186/h-6Whguj_400x400.jpg"
  ),
];