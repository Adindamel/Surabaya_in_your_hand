import 'package:flutter/material.dart';
import 'package:surabaya_in_your_hand/db/db_helper.dart';
import 'package:surabaya_in_your_hand/model/wisata.dart';
import 'package:surabaya_in_your_hand/ui/detail_wisata.dart';
import 'package:surabaya_in_your_hand/ui/form_wisata.dart';

class ListWisataPage extends StatefulWidget {
  const ListWisataPage({Key? key}) : super(key: key);

  @override
  _ListWisataPageState createState() => _ListWisataPageState();
}

class _ListWisataPageState extends State<ListWisataPage> {
  List<Wisata> listWisata = [];
  DBHelper db = DBHelper();

  @override
  void initState() {
    _getAllWisata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ui tampilan awal
    return Scaffold(
      appBar: AppBar(
        title: Text('SURABAYA IN YOUR HAND'),
        backgroundColor: Color.fromARGB(255, 229, 148, 243),
      ),
      body: ListView.builder(
        itemCount: listWisata.length,
        itemBuilder: (context, index) {
          Wisata wisata = listWisata[index];
          return Container(
              child: Column(children: [
            ListTile(
              onTap: () {
                //edit
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailWisataPage(wisata),
                    ));
              },
              contentPadding: EdgeInsets.all(16),
              title: Text(
                "${wisata.namawisata}",
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(255, 96, 2, 112),
                ),
              ),
              //overflow: TextOverflow.ellipsis(pada text…)
              subtitle: Text(
                '${wisata.jambuka}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: IconButton(
                onPressed: () {
                  _deleteWisata(wisata, index);
                },
                icon: Icon(Icons.delete),
                color: Color.fromARGB(255, 227, 78, 253),
              ),
              leading: IconButton(
                onPressed: () {
                  _openFormEdit(wisata);
                },
                icon: Icon(Icons.edit),
              ),
            )
          ]));
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 229, 148, 243),
        onPressed: () {
          //add
          _openFormCreate();
        },
      ),
    );
  }

  Future<void> _getAllWisata() async {
    var list = await db.getAllWisata();
    setState(() {
      listWisata.clear();
      list!.forEach((wisata) {
        listWisata.add(Wisata.fromMap(wisata));
      });
    });
  }

  //form create
  Future<void> _openFormCreate() async {
    var result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => FormWisata()));
    if (result == 'save') {
      await _getAllWisata();
    }
  }

  Future<void> _deleteWisata(Wisata wisata, int position) async {
    await db.deleteWisata(wisata.id!);

    setState(() {
      listWisata.removeAt(position);
    });
  }

  //form edit
  Future<void> _openFormEdit(Wisata wisata) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => FormWisata(wisata: wisata)));

    if (result == 'update') {
      await _getAllWisata();
    }
  }
}
