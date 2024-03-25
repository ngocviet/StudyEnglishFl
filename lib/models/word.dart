class Word {
  late String img;
  late int wordCount;
  late int wordTotalCount;
  late String nameEn;
  late String nameVn;
  late bool isShowText;

  Word({required this.nameEn,required this.nameVn, this.wordCount = 0, this.wordTotalCount = 0,required this.isShowText});
}