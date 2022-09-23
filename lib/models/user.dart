class User {
  final String nombre;
  final int edad;
  final List<String> profesiones;

  User({required this.nombre, required this.edad, required this.profesiones});

  // metodo para copiar usuario
  User copyWith({String? nombre, int? edad, List<String>? profesiones}) {
    return User(
        edad: edad ?? this.edad,
        nombre: nombre ?? this.nombre,
        profesiones: profesiones ?? this.profesiones);
  }
}
