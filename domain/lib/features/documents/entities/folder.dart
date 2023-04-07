class Folder {
  Folder(
      {required this.name,
      this.image,
      required this.filesCount,
      required this.hoursCount,
      this.isCustomFolder = false});

  final String name;
  final String? image;
  final int filesCount;
  final int hoursCount;
  final bool isCustomFolder;
}
