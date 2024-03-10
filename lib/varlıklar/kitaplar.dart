class Kitaplar {
  int kitap_id;
  String kitap_adi;
  String yazar_adi;
  String cevirmen_adi;
  String tur;
  String baski_no;
  String alinan_tarih;
  String okunan_tarih;
  String yorum;


  Kitaplar(
      {required this.kitap_id, required this.kitap_adi, required this.yazar_adi, required this.cevirmen_adi, required this.tur, required this.baski_no,
        required this.alinan_tarih, required this.okunan_tarih, required this.yorum});

  factory Kitaplar.fromJson(Map<String, dynamic> json) {
    return Kitaplar(
      kitap_id: json['kitap_id'] ?? 0,
      kitap_adi: json['kitap_adi'] ?? '',
      yazar_adi: json['yazar_adi'] ?? '',
      cevirmen_adi: json['cevirmen_adi'] ?? '',
      tur: json['tur'] ?? '',
      baski_no: json['baski_no'] ?? '',
      alinan_tarih: json['alinan_tarih'] ?? '',
      okunan_tarih: json['okunan_tarih'] ?? '',
      yorum: json['yorum'] ?? '',
    );
  }
}