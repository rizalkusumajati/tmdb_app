class Genre {
  int id;
  String name;
  Genre(this.id, this.name);

  @override
  String toString() {
    return 'Genre{id: $id, name: $name}';
  }
}
