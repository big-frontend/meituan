import 'package:flutter/material.dart';

class Screen_2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Screen_2_State();
}

class _Screen_2_State extends State<Screen_2> {
  int _selectedIndex = 0;

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    Widget divider2 = Divider(thickness: 10, color: Colors.green);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
          ],
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("screen 2 didChangeDependencies");
  }
}
