import 'package:intranet/model/user.dart';

class Reclamation {
  String email;
  String sujet;
  String description;
  String departement;
  User user;

  Reclamation(this.email, this.sujet,this.description,this.departement,this.user);
}