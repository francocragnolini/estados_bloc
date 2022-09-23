/* los eventos son acciones que vamos a poder disparar, que va a recibir user_bloc y cambiar user_state*/

part of "user_bloc.dart";

@immutable
abstract class UserEvent {}

// cuando presionamos el boton establecer usuario
class ActivateUser extends UserEvent {
  final User user;

  ActivateUser(this.user);
}

class ChangeUserAge extends UserEvent {
  final int age;

  ChangeUserAge(this.age);
}

//tarea
class AddProfession extends UserEvent {
  final String profesion;

  AddProfession(this.profesion);
}

class DeleteUser extends UserEvent {}
