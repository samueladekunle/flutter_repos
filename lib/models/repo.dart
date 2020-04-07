class Repo {
  final int id;
  final String name;
  final String owner;

  Repo({
    this.id,
    this.name,
    this.owner,
  });

  factory Repo.fromMap(Map<String, dynamic> map) {
    return Repo(
      id: map['id'],
      name: map['name'],
      owner: map['owner']['login'],
    );
  }
}