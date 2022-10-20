import 'package:flutter/material.dart';
import 'package:surabaya_in_your_hand/model/wisata.dart';

class DetailWisataPage extends StatelessWidget {
  final Wisata? wisata;

  DetailWisataPage(this.wisata);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SURABAYA IN YOUR HAND'),
          backgroundColor: Color.fromARGB(255, 229, 148, 243),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(children: [
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 235, 162, 248),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Nama Wisata',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  Text('${wisata!.namawisata}'),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Jam Buka',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  Text('${wisata!.jambuka}'),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Telpon',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  Text('${wisata!.telpon}'),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Alamat',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  Text('${wisata!.alamat}'),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ]),
        ));
  }
}
