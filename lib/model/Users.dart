/*import 'dart:convert';
import 'package:http/http.dart' as http;
class Users{
  final int Mat_Pers;
  final String nom_PERS;
  final String pren_PERS;
  final String numerodetelephone;
  final String email;

  const Users({
    required this.Mat_Pers,
    required this.nom_PERS,
    required this.pren_PERS,
    required this.numerodetelephone,
    required this.email,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      Mat_Pers: json['Mat_Pers'],
      nom_PERS: json['nom_PERS'],
      pren_PERS: json['pren_PERS'],
      numerodetelephone: json['numerodetelephone'],
      email: json['email'],
    );
  }

}

Future<List<Users>> fetchData() async {
  final response = await http.get(Uri.parse('http://10.0.2.2:9090/users'));

  if (response.statusCode == 200) {
    final List<dynamic> jsonData = jsonDecode(response.body);

    return jsonData.map((data) => Users.fromJson(data)).toList();

  } else {
    throw Exception('Failed to fetch data');
  }
}
*/
