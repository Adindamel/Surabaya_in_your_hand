class Wisata {
  int? id;
  String? namawisata;
  String? jambuka;
  String? telpon;
  String? alamat;

  Wisata({this.id, this.namawisata, this.jambuka, this.telpon, this.alamat});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    if (id != null) {
      map['id'] = id;
    }
    map['namawisata'] = namawisata;
    map['jambuka'] = jambuka;
    map['telpon'] = telpon;
    map['alamat'] = alamat;
    return map;
  }

  Wisata.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.namawisata = map['namawisata'];
    this.jambuka = map['jambuka'];
    this.telpon = map['telpon'];
    this.alamat = map['alamat'];
  }
}
