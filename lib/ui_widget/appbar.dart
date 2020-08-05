import 'package:flutter/material.dart';
import 'package:meituan/color.dart';

class ListSearchPage extends SearchDelegate<String> {
  List<String> list;
  String select;

  ListSearchPage(this.list);

  @override
  appBarTheme(BuildContext context) {
    return Theme.of(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text('data1');
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  /// 用户从搜索页面提交搜索后显示的结果
  @override
  Widget buildResults(BuildContext context) {
    var filterList = list.where((String s) => s.contains(query.trim()));
    return ListView(
      children: <Widget>[
        for (String item in filterList)
          ListTile(
            leading: Icon(
              Icons.message,
              color: Colors.blue,
            ),
            title: Text(
              item,
              style: Theme.of(context).textTheme.title,
            ),
            onTap: () {
              close(context, item);
            },
          ),
      ],
    );
  }
}

class Searchbar extends StatefulWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final PreferredSizeWidget bottom;

  Searchbar({
    Key key,
    this.bottom,
  })  : preferredSize = Size.fromHeight(
            kToolbarHeight + (bottom?.preferredSize?.height ?? 0.0)),
        super(key: key);
  @override
  State<StatefulWidget> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double screenHeight = MediaQuery.of(context).size.height;
    double appbarHeight = widget?.preferredSize?.height ?? 0.0;
    print(statusBarHeight + appbarHeight);

    return SizedBox(
        height: statusBarHeight + appbarHeight,
        child: Container(
          padding: EdgeInsets.only(top: statusBarHeight, left: 8),
          // color: Color(0xff06C1AE),
          color: HexColor.fromHex('#06C1AE'),
          child: Row(
            children: <Widget>[
              Text(
                '泉州',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Container(
                  // color: Colors.white,
                  margin: EdgeInsets.only(left: 18),
                  // width: 230,
                  child: FlatButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.search, size: 19),
                        Container(
                            margin: EdgeInsets.only(left: 4), child: Text("搜索"))
                      ],
                    ),
                    color: Colors.white,
                    onPressed: () => print('cjf'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.settings_voice, size: 19),
                color: Colors.black,
                onPressed: () => print('cjf'),
              ),
              IconButton(
                icon: Icon(Icons.add, size: 19),
                color: Colors.black,
                onPressed: () => print('cjf'),
              ),
            ],
          ),
        ));
  }
}
