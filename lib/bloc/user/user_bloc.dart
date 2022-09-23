/*user_bloc es quien tiene la informacion del estado actual y procesa los eventos*/
/*el bloc esta conformado por dos partes, actua como el administrador */

// es un paquete mas ligero que el de material
import 'package:meta/meta.dart';

// bloc para configurar el UserBloc
import 'package:bloc/bloc.dart';

import 'package:estados/models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

// Bloc : necesita saber que tipo de eventos esperar y los tipos de estado
// UserBloc(userState initialState) : super(initialState) = es para inicializar el bloc
// UserInitialState(): estado inicial en user_state.dart

class UserBloc extends Bloc<UserEvent, userState> {
  //inicializa el bloc
  UserBloc() : super(const UserInitialState()) {
    // crear usuario - manejador de evento
    on<ActivateUser>((event, emit) {
      print("Active User called");
      emit(UserSetState(event.user));
    });

    // delete user
    on<DeleteUser>((event, emit) {
      emit(const UserInitialState());
    });

    //cambiar edad manejador de evento
    on<ChangeUserAge>((event, emit) {
      print("ChangeUserAge called");
      // tengo acceso al state gracias al bloc
      if (!state.existUser) {
        return;
      }
      emit(UserSetState(state.user!.copyWith(edad: event.age)));
      print("Se emitira un nuevo estado");
    });

    // agregar profesiones - manejador de eventos
    on<AddProfession>((event, emit) {
      // si no existe usuario
      if (!state.existUser) {
        return;
      }
      final professions = [...state.user!.profesiones, event.profesion];
      emit(UserSetState(state.user!.copyWith(profesiones: professions)));
    });
  }
}
