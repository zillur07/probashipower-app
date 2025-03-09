class Video {
  final String id;
  final String videoTitle;
  final String videoLink;
  final String date;

  Video({
    required this.id,
    required this.videoTitle,
    required this.videoLink,
    required this.date,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['id'],
      videoTitle: json['video_title'],
      videoLink: json['video_link'],
      date: json['date'],
    );
  }
}
