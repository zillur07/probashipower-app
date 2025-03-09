class News {
  final String id;
  final String newsTitle;
  final String newsImg;
  final String date;
  final String newsDetails;

  News({
    required this.id,
    required this.newsTitle,
    required this.newsImg,
    required this.date,
    required this.newsDetails,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['id'],
      newsTitle: json['news_title'],
      newsImg: json['news_img'],
      date: json['date'],
      newsDetails: json['news_details'],
    );
  }
}
