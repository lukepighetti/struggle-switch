enum Assets {
  twemojiPleadingFace('pleading-face_1f97a.png'),
  twemojiSlightlySmilingFace('slightly-smiling-face_1f642.png'),
  twemojiRedHeart('red-heart_2764-fe0f.png'),
  ;

  final String filename;

  String get assetPath => "assets/$filename";

  const Assets(this.filename);
}
