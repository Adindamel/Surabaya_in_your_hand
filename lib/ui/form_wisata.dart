import 'package:flutter/material.dart';
import 'package:surabaya_in_your_hand/db/db_helper.dart';
import 'package:surabaya_in_your_hand/model/wisata.dart';

class FormWisata extends StatefulWidget {
  final Wisata? wisata;

  FormWisata({this.wisata});

  @override
  _FormWisataState createState() => _FormWisataState();
}

class _FormWisataState extends State<FormWisata> {
  DBHelper db = DBHelper();

  TextEditingController? namawisata;
  TextEditingController? jambuka;
  TextEditingController? telpon;
  TextEditingController? alamat;

  @override
  void initState() {
    namawisata = TextEditingController(
        text: widget.wisata == null ? '' : widget.wisata!.namawisata);
    jambuka = TextEditingController(
        text: widget.wisata == null ? '' : widget.wisata!.jambuka);
    telpon = TextEditingController(
        text: widget.wisata == null ? '' : widget.wisata!.telpon);
    alamat = TextEditingController(
        text: widget.wisata == null ? '' : widget.wisata!.alamat);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SURABAYA IN YOUR HAND'),
        actions: [
          IconButton(
            onPressed: () {
              upsertWisata();
            },
            icon: Icon(Icons.save),
          ),
        ],
        backgroundColor: Color.fromARGB(255, 229, 148, 243),
      ),
      body: Padding(
          padding: EdgeInsets.only(top: 10, left: 20, right: 20),
          child: ListView(
            children: [
              Container(
                child: Column(children: [
                  TextFormField(
                    controller: namawisata,
                    decoration: InputDecoration(hintText: 'Nama Wisata'),
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                      color: Color.fromARGB(255, 96, 2, 112),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: jambuka,
                    decoration: InputDecoration(hintText: 'Jam Buka'),
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                      color: Color.fromARGB(255, 96, 2, 112),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: telpon,
                    decoration: InputDecoration(hintText: 'Telpon'),
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                      color: Color.fromARGB(255, 96, 2, 112),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: alamat,
                    decoration: InputDecoration(hintText: 'Alamat'),
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                      color: Color.fromARGB(255, 96, 2, 112),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ]),
              ),
            ],
          )),
    );
  }

  //update insert wisata
  Future<void> upsertWisata() async {
    if (widget.wisata != null) {
      //insert
      await db.updateWisata(Wisata.fromMap({
        'id': widget.wisata!.id,
        'namawisata': namawisata!.text,
        'jambuka': jambuka!.text,
        'telpon': telpon!.text,
        'alamat': alamat!.text,
      }));
      Navigator.pop(context, 'update');
    } else {
      //update
      await db.saveWisata(Wisata(
        namawisata: namawisata!.text,
        jambuka: jambuka!.text,
        telpon: telpon!.text,
        alamat: alamat!.text,
      ));
      Navigator.pop(context, 'save');
    }
  }
}
