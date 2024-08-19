void main() {
  // Daftar barang dengan stok
  List<Map<String, dynamic>> inventaris = [
    {'barang': 'Pensil', 'stok': 50, 'harga': 1.2},
    {'barang': 'Buku Catatan', 'stok': 20, 'harga': 3.5},
    {'barang': 'Penghapus', 'stok': 15, 'harga': 0.8},
    {'barang': 'Penggaris', 'stok': 5, 'harga': 1.5},
  ];

  // Menampilkan daftar barang
  print("Daftar Barang:");
  for (var item in inventaris) {
    print("${item['barang']} - Stok: ${item['stok']}, Harga: \$${item['harga']}");
  }

  // Aritmatika: Menghitung total nilai stok
  print("\nTotal Nilai Stok:");
  double totalNilai = 0.0;
  for (var item in inventaris) {
    totalNilai += item['stok'] * item['harga'];
  }
  print("Total Nilai: \$${totalNilai.toStringAsFixed(2)}");

  // Percabangan: Menampilkan barang dengan stok rendah
  print("\nBarang dengan Stok Rendah (stok <= 10):");
  for (var item in inventaris) {
    if (item['stok'] <= 10) {
      print(item['barang']);
    }
  }

  // Perulangan: Menampilkan harga barang dengan diskon
  print("\nHarga Barang dengan Diskon 10%:");
  var penerapanDiskon = buatPenerapanDiskon(0.10); // Diskon 10%
  for (var item in inventaris) {
    double hargaDiskon = penerapanDiskon(item['harga']);
    print("${item['barang']}: \$${hargaDiskon.toStringAsFixed(2)}");
  }

  // Fungsi Rekursif: Menghitung jumlah total stok barang
  int totalStok = hitungTotalStok(inventaris);
  print("\nJumlah Total Stok Barang: $totalStok");
}

// Closure: Fungsi untuk menerapkan diskon pada harga barang
Function buatPenerapanDiskon(double diskon) {
  return (double harga) => harga * (1 - diskon);
}

// Fungsi Rekursif: Menghitung jumlah total stok barang
int hitungTotalStok(List<Map<String, dynamic>> inventaris) {
  if (inventaris.isEmpty) {
    return 0;
  } else {
    return inventaris.first['stok'] + hitungTotalStok(inventaris.sublist(1));
  }
}
