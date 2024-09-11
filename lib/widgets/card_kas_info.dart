import 'package:flutter/material.dart';
import 'package:kas_personal/models/kas.dart';

class CardKasInfo extends StatelessWidget {
  const CardKasInfo({super.key, required this.items, required this.jenis});

  final List<Kas> items;
  final JenisKas jenis;

  double countTotal() {
    if (jenis == JenisKas.kasMasuk) {
      var masukList = items.where((e) => e.jenis == JenisKas.kasMasuk);
      var masuk = masukList.isNotEmpty
          ? masukList
              .map((e) => e.nominal)
              .reduce((value, element) => value + element)
          : 0.0;
      return masuk;
    } else if (jenis == JenisKas.kasKeluar) {
      var keluarList = items.where((e) => e.jenis == JenisKas.kasKeluar);
      var keluar = keluarList.isNotEmpty
          ? keluarList
              .map((e) => e.nominal)
              .reduce((value, element) => value + element)
          : 0.0;
      return keluar;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: 150,
              height: 150,
              padding: const EdgeInsets.all(25),
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Jumlah Transaksi',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${items.length}x',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              width: 150,
              height: 150,
              padding: const EdgeInsets.all(25),
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Builder(
                    builder: (context) {
                      var text = '';
                      if (jenis == JenisKas.kasMasuk) {
                        text = 'Total Semua Pemasukan';
                      } else if (jenis == JenisKas.kasKeluar) {
                        text = 'Total Semua Pengeluaran';
                      }
                      return Text(
                        text,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Rp ${countTotal().round()}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}