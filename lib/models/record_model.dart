class RecordModel {
  const RecordModel({
    required this.id,
    required this.title,
    required this.shortDescription,
    required this.collectedValue,
    required this.totalValue,
    required this.startDate,
    required this.endDate,
    required this.mainImageUrl,
  });

  final int id;
  final String title;
  final String shortDescription;
  final int collectedValue;
  final int totalValue;
  final String startDate;
  final String endDate;
  final String mainImageUrl;

  factory RecordModel.fromJson(Map<String, dynamic> json) {
    return RecordModel(
      id: json['Id'],
      title: json['title'],
      shortDescription: json['shortDescription'],
      collectedValue: json['collectedValue'],
      totalValue: json['totalValue'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      mainImageUrl: json['mainImageURL'],
    );
  }
}
