final String tableActivity = 'activities';

class ActivityFields {
  static final List<String> values = [
    /// Add all fields
    id, title, date
  ];

  static final String id = '_id';
  static final String title = 'title';
  static final String date = 'date';
}

class ActivityModel {
  final int? id;
  final String title;
  final String createdDate;

  const ActivityModel({
    this.id,
    required this.title,
    required this.createdDate,
  });

  ActivityModel copy({
    int? id,
    String? title,
    String? createdDate,
  }) =>
      ActivityModel(
        id: id ?? this.id,
        title: title ?? this.title,
        createdDate: createdDate ?? this.createdDate,
      );

  static ActivityModel fromJson(Map<String, Object?> json) => ActivityModel(
      id: json[ActivityFields.id] as int?,
      title: json[ActivityFields.title] as String,
      createdDate: json[ActivityFields.date] as String);

  Map<String, Object?> toJson() => {
        ActivityFields.id: id,
        ActivityFields.title: title,
        ActivityFields.date: createdDate,
      };
}


// class ActivityModel {
//   int? id;
//   String? name;
//   String? date;
//   ActivityModel({this.id, required this.name, required this.date});

//   ActivityModel.fromMap(Map<String, dynamic> res)
//       : id = res['id'],
//         name = res['name'],
//         date = res['date'];

//   Map<String, Object?> toMap() {
//     return {'id': id, 'name': name, 'date': date};
//   }
// }
