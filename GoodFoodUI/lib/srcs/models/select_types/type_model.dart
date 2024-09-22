class Type {
  final String typeName;
  final int id;

  Type({required this.typeName, required this.id});
  static Type fromJson(json) {
    Type t = Type(typeName: json["tenTheLoai"], id: json['id']);
    return t;
  }
}

class ListTypes {
  final Iterable<Type> types;

  const ListTypes({
    required this.types,
  });

  factory ListTypes.fromJson(List json) {
    return ListTypes(
      types: json.map((theLoai) => Type.fromJson(theLoai)),
    );
  }
}
