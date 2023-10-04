import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.red,
    ),
    home: ChatApp(),
  ));
}

class Chats {
  String? text;
  DateTime? date;

  Chats(this.text, this.date);
}

class ChatApp extends StatefulWidget {
  const ChatApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChatAppState createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {

  List<Chats> chats = [
    Chats('Hello', DateTime.now()),
    Chats('How are you?', DateTime.now()),
    Chats('I am doing well.', DateTime.now())
  ];
  final List<String> messages = [
    'Hello!',
    'How are you?',
    'I am doing well.',
  ];

  void addNewItem() {
    chats.add(Chats('New item', DateTime.now()));
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey[50],
          elevation: 0.0,
          title: Padding(
            padding: EdgeInsets.all(15.0),
            child: Text('Conversations', style: TextStyle(color: Colors.black87,
                fontSize: 25,
                fontWeight: FontWeight.w900),),
          ),
          actions: <Widget>[Padding(
              padding: EdgeInsets.all(15.0),

              child: RawMaterialButton(
                //constraints: BoxConstraints.expand(width: 20.0, height: 40.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11)),


                onPressed: addNewItem,
                elevation: 2.0,

                fillColor: Color.fromARGB(255, 248, 227, 227),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, color: Colors.red[500],),
                    // SizedBox(width: 8),
                    Text('Add new', style: TextStyle(
                        color: const Color.fromARGB(255, 36, 30, 30),
                        fontSize: 15),),
                  ],),
              ))
          ]


      )
      ,


      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[100],
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.,
                    children: [
                      IconButton(
                        color: Colors.black87,
                        icon: Icon(Icons.search),
                        onPressed: () {},
                      ),
                      SizedBox(width: 31),
                      Text('search', style: TextStyle(color: Colors.grey)),

                    ]),
              ),
            ),
            const SizedBox(height: 11),

            SizedBox(
              height: 11,
            ),

            Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: chats.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://st4.depositphotos.com/2115371/20664/i/450/depositphotos_206643260-stock-photo-picturesque-landscape-upper-duden-waterfall.jpg'),
                              radius: 30),
                          title: Text('${chats[index].text}'),
                          subtitle: Text('${chats[index].text}'),
                          //trailing: Text('${DateFormat.MMMEd().format(chats[index].date)}'),
                          trailing: Text(
                              '${chats[index].date!.year}-${chats[index].date!
                                  .month}-${chats[index].date!.day}'),
                        ),
                        Divider(),
                      ],
                    );
                  },
                )
              ],),
          ]),),),
      bottomNavigationBar: MyHomePage(),


    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  // Define the list of icons and labels for the bottom navigation bar.
  final List<MapEntry<IconData, String>> _iconsAndLabels = [
    //MapEntry(Icons.favorite, 'Favorites'),
    MapEntry(Icons.chat_outlined, 'Chat'),
    MapEntry(Icons.change_circle_rounded, 'Channels'),
    MapEntry(Icons.person, 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 14.0,
      unselectedFontSize: 14.0,
      selectedItemColor: Colors.redAccent,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: _iconsAndLabels.map((entry) {
        return BottomNavigationBarItem(
          icon: Icon(entry.key),
          label: entry.value,
        );
      }).toList(),
    );
  }
}

