class RadioModel {
  final String name;
  final bool isPlaying;
  final bool isMuted;

  RadioModel({
    required this.name,
    this.isPlaying = false,
    this.isMuted = false,
  });

  static List<RadioModel> radioList = [
    RadioModel(name: 'Radio Ibrahim Al-Akdar'),
    RadioModel(name: 'Radio Al-Qaria Yassen', isPlaying: true, isMuted: true),
    RadioModel(name: 'Radio Ahmed Al-trabulsi'),
    RadioModel(name: 'Radio Addokali Mohammad Alalim'),
  ];
}
