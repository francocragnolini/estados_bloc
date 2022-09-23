/*el state hace referencia al estado de la aplicacion, 
ej: si el usuario esta logeado, cual esel monto del carrito de compras */

part of "user_bloc.dart";

@immutable
// al marcarla como inmutable esto no puede cambiar
// al hacer una clase abstracta no se puede crear instancias de esta clase
abstract class userState {
  final bool existUser;
  final User? user;

  const userState({this.existUser = false, this.user});
}

// estado inicial
class UserInitialState extends userState {
  //con super llamo al constructor de la clase abstracta(userState)
  const UserInitialState() : super(existUser: false, user: null);
}

// crea un nuevo estado de la clase abstracta userState donde
// donde cambia los valores de las dos porpiedades.
class UserSetState extends userState {
  final User newUser;

  const UserSetState(this.newUser) : super(existUser: true, user: newUser);
}
