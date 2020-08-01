import 'package:flutter/material.dart';
import 'package:spacecraftflutter/ui_widget/appbar.dart';

class Screen_1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Screen_1_State();
}

class _Screen_1_State extends State<Screen_1> {
  int _selectedIndex = 0;

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  List<String> _list = List.generate(100, (i) => 'item $i');
  @override
  Widget build(BuildContext context) {
    Widget divider2 = Divider(thickness: 10, color: Colors.green);
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: Searchbar(),
      // appBar: AppBar(
      //   title: Text('Flutter Search'),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: Icon(Icons.search),
      //       onPressed: () async {
      //         String r = await showSearch<String>(
      //           context: context,
      //           delegate: ListSearchPage(_list),
      //         );
      //         Scaffold.of(context).showSnackBar(
      //           SnackBar(
      //             content: Text(r),
      //             action: SnackBarAction(
      //               label: 'CLOSE',
      //               onPressed: () {},
      //             ),
      //           ),
      //         );
      //       },
      //     )
      //   ],
      // ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.separated(
              itemCount: 4,
              // itemExtent: 150.0, //强制高度为50.0
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: _selectedIndex != null && _selectedIndex == index
                      ? Colors.red
                      : Colors.white,
                  child: ListTile(
                    title: Text(
                      "$index",
                    ),
                    onTap: () => _onSelected(index),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return divider2;
              },
            ),
          ),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Text(
          //       "商品列表",
          //       style: TextStyle(backgroundColor: Colors.tealAccent),
          //     ),
          //     Text(
          //       "商品列表",
          //       style: TextStyle(backgroundColor: Colors.tealAccent),
          //     ),
          //   ],
          // ),

          ListTile(
            trailing: Text("trailing"),
            leading: Text(
              "leading",
            ),
            subtitle: Text(
              "subtitle",
            ),
            title: Text(
              "商品列表",
              style: TextStyle(backgroundColor: Colors.tealAccent),
            ),
          ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height - 24 - 56 - 56,
          //   child: ListView.builder(
          //       itemCount: 3,
          //       itemBuilder: (BuildContext context, int index) {
          //         return ListTile(title: Text("$index"));
          //       }),
          // ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("screen 1 didChangeDependencies");
  }
}
