import 'package:sanal_ev_kutuphanesi/sqlite/veritabani_yardimcisi.dart';
import 'package:sanal_ev_kutuphanesi/varl%C4%B1klar/kitaplar.dart';

class KitaplarRepository {

  Future<void> kitapEkle(String kitap_adi, String yazar_adi, String cevirmen_adi, String tur,
      String baski_no,String alinma_tarihi, String okunma_tarihi, String yorum) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();


// kitap_ad sütunu zaten var mı kontrol et
    var tabloInfo = await db.rawQuery("PRAGMA table_info(kitaplar);");
    var kitapAdSutunuVarMi = tabloInfo.any((column) =>
    column["name"] == "kitap_adi");

    if (!kitapAdSutunuVarMi) {
      // kitap_ad sütunu yoksa ekle
      await db.execute('''
    ALTER TABLE kitaplar
    ADD COLUMN kitap_adi TEXT
  ''');
    }

// yazar_ad sütunu zaten var mı kontrol et
    tabloInfo = await db.rawQuery("PRAGMA table_info(kitaplar);");
    var yazarAdSutunuVarMi = tabloInfo.any((column) =>
    column["name"] == "yazar_adi");

    if (!yazarAdSutunuVarMi) {
      // yazar_ad sütunu yoksa ekle
      await db.execute('''
    ALTER TABLE kitaplar
    ADD COLUMN yazar_adi TEXT
  ''');
    }

// cevirmen_adi sütunu zaten var mı kontrol et
    tabloInfo = await db.rawQuery("PRAGMA table_info(kitaplar);");
    var cevirmenAdiSutunuVarMi = tabloInfo.any((column) =>
    column["name"] == "cevirmen_adi");

    if (!cevirmenAdiSutunuVarMi) {
      // cevirmen_adi sütunu yoksa ekle
      await db.execute('''
    ALTER TABLE kitaplar
    ADD COLUMN cevirmen_adi TEXT
  ''');
    }
// baski_no sütunu zaten var mı kontrol et
    tabloInfo = await db.rawQuery("PRAGMA table_info(kitaplar);");
    var baskiNoSutunuVarMi = tabloInfo.any((column) =>
    column["name"] == "baski_no");

    if (!baskiNoSutunuVarMi) {
      // baski_no sütunu yoksa ekle
      await db.execute('''
    ALTER TABLE kitaplar
    ADD COLUMN baski_no TEXT
  ''');
    }

    var bilgiler = Map<String, dynamic>();
    bilgiler["kitap_adi"] = kitap_adi;
    bilgiler["yazar_adi"] = yazar_adi;
    bilgiler["cevirmen_adi"] = cevirmen_adi;
    bilgiler["tur"] = tur;
    bilgiler["baski_no"] = baski_no;
    bilgiler["alinan_tarih"] = alinma_tarihi;
    bilgiler["okunan_tarih"] = okunma_tarihi;
    bilgiler["yorum"] = yorum;



    await db.insert("kitaplar", bilgiler);
  }


  Future<void> guncelle(int kitap_id, String kitap_adi, String yazar_adi,
      String cevirmen_adi, String tur, String baski_no, String alinma_tarihi,
      String okunma_tarihi, String yorum) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var bilgiler = Map<String, dynamic>();
    bilgiler["kitap_adi"] = kitap_adi;
    bilgiler["yazar_adi"] = yazar_adi;
    bilgiler["cevirmen_adi"] = cevirmen_adi;
    bilgiler["tur"] = tur;
    bilgiler["baski_no"] = baski_no;
    bilgiler["alinan_tarih"] = alinma_tarihi;
    bilgiler["okunan_tarih"] = okunma_tarihi;
    bilgiler["yorum"] = yorum;
    await db.update(
        "kitaplar", bilgiler, where: "kitap_id=?", whereArgs: [kitap_id]);
  }

  Future<List<Kitaplar>> kitaplariGoster() async {
    try {
      final db = await VeritabaniYardimcisi.veritabaniErisim();
      final result = await db.query('kitaplar');

      if (result != null) {
        return result.map((e) => Kitaplar.fromJson(e)).toList();
      } else {
        throw Exception("Veritabanından null sonuç alındı");
      }
    } catch (e) {
      throw e;
    }
  }


  Future<List<Kitaplar>> kitapAra(String aramaKelimesi) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    if (aramaKelimesi.trim().isEmpty) {
      // Arama kelimesi boşsa tüm kitapları getir
      return kitaplariGoster();
    }

    // Arama kelimesi varsa sorguyu gerçekleştir
    List<Map<String, dynamic>> maps = await db.rawQuery(
        "Select * FROM kitaplar WHERE kitap_adi LIKE '%$aramaKelimesi%'"
    );

    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Kitaplar(
        kitap_id: satir["kitap_id"],
        kitap_adi: satir["kitap_adi"],
        yazar_adi: satir["yazar_adi"],
        cevirmen_adi: satir["cevirmen_adi"],
        tur: satir["tur"],
        baski_no: satir["baski_no"],
        alinan_tarih: satir["alinan_tarih"],
        okunan_tarih: satir["okunan_tarih"],
        yorum: satir["yorum"],
      );
    });
  }


  Future<void> kitapSil(int kitap_id) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    await db.delete("kitaplar", where: "kitap_id=?", whereArgs: [kitap_id]);
  }
}