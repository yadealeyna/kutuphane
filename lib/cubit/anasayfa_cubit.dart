import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanal_ev_kutuphanesi/repo/kitaplar_dao_repository.dart';
import 'package:sanal_ev_kutuphanesi/varl%C4%B1klar/kitaplar.dart';

class AnasayfaCubit extends Cubit<List<Kitaplar>> {

  AnasayfaCubit() : super (<Kitaplar>[]);

  var kitap_repo = KitaplarRepository();

  Future<void> kitaplariGetir() async {
    var liste = await kitap_repo.kitaplariGoster();
    emit(liste);
  }

  Future<void> ara(String aramaKelimesi) async {
    var liste = await kitap_repo.kitapAra(aramaKelimesi);
    emit(liste);
  }
  Future<void> sil(int kitap_id) async {
  await kitap_repo.kitapSil(kitap_id);
  await kitaplariGetir();
  }
}