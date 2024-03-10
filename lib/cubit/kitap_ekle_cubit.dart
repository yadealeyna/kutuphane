import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanal_ev_kutuphanesi/repo/kitaplar_dao_repository.dart';

class KitapEkleCubit extends Cubit<void> {
  KitapEkleCubit() : super(0);

  var kitap_repo = KitaplarRepository();

  Future<void> kitapEkle(String kitap_adi, String yazar_adi, String cevirmen_adi, String tur,
     String baski_no, String alinma_tarihi, String okunma_tarihi, String yorum) async {
    await kitap_repo.kitapEkle(
        kitap_adi, yazar_adi, cevirmen_adi, tur, baski_no, alinma_tarihi, okunma_tarihi, yorum);
    print ("kitap eklendi");
  }
}