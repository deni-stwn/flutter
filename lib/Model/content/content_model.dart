class ContentModel {
  String? id;
  String? gambar;
  String? header;
  String? body;
  String? paragraf1;
  String? paragraf2;
  String? paragraf3;

  ContentModel(
      {required this.id,
      required this.gambar,
      required this.header,
      required this.body,
      required this.paragraf1,
      required this.paragraf2,
      required this.paragraf3});

  factory ContentModel.fromJson(Map<String, dynamic> json) => ContentModel(
      id: json['id'] as String?,
      gambar: json['gambar'] as String?,
      header: json['header'] as String?,
      body: json['body'] as String?,
      paragraf1: json['paragraf1'] as String?,
      paragraf2: json['paragraf2'] as String?,
      paragraf3: json['paragraf3'] as String?);
}
