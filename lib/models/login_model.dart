// class LoginModel {
//   final String email;
//   final String password;

//   LoginModel(this.email, this.password);

//   LoginModel.fromJson(Map<String, dynamic> parsedJson)
//       : email = parsedJson['email'],
//         password = parsedJson['password'];
// }

class LoginModel {
  String response;
  int id;
  String email;
  List<String> following;
  List<String> followers;
  int followerCount;
  int followingCount;

  LoginModel(
      {this.response,
      this.id,
      this.email,
      this.following,
      this.followers,
      this.followerCount,
      this.followingCount});

  LoginModel.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    id = json['id'];
    email = json['email'];
    following = json['following'].cast<String>();
    followers = json['followers'].cast<String>();
    followerCount = json['follower_count'];
    followingCount = json['following_count'];
  }
}
