import 'package:flutter/material.dart';
import 'package:kas_personal/models/kas.dart';
class KasProvider extends ChangeNotifier {
  final List<Kas> _items = [];

  List<Kas> get items => _items;
  List<Kas> get MasukItems => _items.where((e) => e.jenis == JenisKas.kasMasuk).toList();
  List<Kas> get KeluarItems => _items.where((e) => e.jenis == JenisKas.kasKeluar).toList();
  
  void tambah(Kas kas) {
    _items.add(kas);
    notifyListeners();
  }

  void hapus(Kas kas) {
    _items.remove(kas);
    notifyListeners();
  }
}
