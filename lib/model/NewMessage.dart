
class NewMessage{
  final String idUser;
  final String urlAvatar;
  final String username;
  final String message;
  final DateTime createdAt;

  const NewMessage({
    required this.idUser,
    required this.urlAvatar,
    required this.username,
    required this.message,
    required this.createdAt,   
  });

  static NewMessage fromJson(Map<String,dynamic> json)=>NewMessage(
    idUser: json['idUser'],
     urlAvatar:json[' urlAvatar'],
    username: json['username'],
     message: json['message'], 
     createdAt: json['createdAt'],
     );

     Map<String,dynamic> toJson()=>{
      'idUser':idUser,
      'urlAvatar':urlAvatar,
      'username':username,
      'message':message,
      'createdAt':createdAt
     };
}