import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final Map<String, Icon> _pages = {
      'Grade Horária': Icon(MdiIcons.calendarMonth, size: 50,),
      'Biblioteca': Icon(MdiIcons.bookshelf, size: 50,),
      'Histórico': Icon(Icons.school, size: 50,),
      'Disciplinas': Icon(MdiIcons.bookOpenVariant, size: 50,)
    };

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.none,
                alignment: Alignment(-0.8, -2),
                image: AssetImage('assets/blueCircle.png'),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(50),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 25),
                            child: Text(
                              'Oi, Gabriel',
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                          Text('Engenharia de Computação'),
                          Text(
                            'Registro Acadêmico: 1904981',
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        'https://avatars2.githubusercontent.com/u/34910470?s=400&u=522442f28ae28b8e12dd27f93291dbfbc6ca4e39&v=4',
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(50),
                  itemCount: _pages.length,
                  itemBuilder: (BuildContext context, int index) {
                    String _key = _pages.keys.elementAt(index);
                    return Container(
                      padding: EdgeInsets.all(10),
                      height: 100,
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorLight,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                _key,
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                            _pages[_key],
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
