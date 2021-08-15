import 'package:farmers/DetailsPage.dart';
import 'package:farmers/weather.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'RGF',
     initialRoute: '/',
     home: Home(),
   );
 }
}

class Home extends StatefulWidget {
 @override
 State<StatefulWidget> createState() {
    return _HomeState();
  }
}
class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final _pageViewController = PageController();
  



 @override
  void dispose() {
    _pageViewController.dispose();
    
    super.dispose();
  }


 @override
 Widget build(BuildContext context) {
   return Scaffold(
     
     // body: _children[_currentIndex], // new
       body: PageView(
        controller: _pageViewController,
        children: <Widget>[
           ListPage(),
          PlaceholderWidget(Colors.deepOrange),
         WeatherDetails()
        ],
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
     bottomNavigationBar: BottomNavigationBar(
       onTap: onTabTapped, // new
       currentIndex: _currentIndex, // new
       items: [
         BottomNavigationBarItem(
           icon: new Icon(Icons.home),
           label:('Home'),
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.mail),
            label:('Social'),
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.cloud),
          label:('Weather'),
         )
       ],
       
     ),
   );
 }
 void onTabTapped(int index) {
   _pageViewController.animateToPage(index, duration: Duration(milliseconds: 100), curve: Curves.bounceOut);
   setState(() {
     _currentIndex = index;
   });
 }
}


 class PlaceholderWidget extends StatelessWidget {
 final Color color;

 PlaceholderWidget(this.color);

 @override
 Widget build(BuildContext context) {
   return Container(
     color: color,
   );
 }
}

class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  bool _showAppbar = true; //this is to show app bar
ScrollController _scrollBottomBarController = new ScrollController(); // set controller on scrolling
bool isScrollingDown = false;
bool _show = true;
@override
void initState() {
  super.initState();
  myScroll();
}


 @override
  void dispose() {
   
     _scrollBottomBarController.removeListener(() {});
    super.dispose();
  }
void myScroll() async {
  _scrollBottomBarController.addListener(() {
    if (_scrollBottomBarController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (!isScrollingDown) {
        isScrollingDown = true;
        _showAppbar = false;
       
      }
    }
    if (_scrollBottomBarController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (isScrollingDown) {
        isScrollingDown = false;
        _showAppbar = true;
       
      }
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: _showAppbar
        ? topAppBar :  PreferredSize(
      child: Container(),
      preferredSize: Size(0.0, 0.0),
    ),
      body: makeBody(context),
    
    );
  }
  
}

 final topAppBar = AppBar(
   
      elevation: 8.0,
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      title: Text(
          "RGF",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.list),
          onPressed: () {},
        )
      ],
    );

     makeBody(context) => Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(context);
        },
      ),
    );

      makeCard(context) => Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: makeListTile(context),
      ),
    );


      makeListTile(context) => ListTile(
       
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: new BoxDecoration(
              border: new Border(
                  right: new BorderSide(width: 1.0, color: Colors.white24))),
          child: CircleAvatar( 
                  radius: 20.0,
                   backgroundImage:
                    NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                    backgroundColor: Colors.transparent,
                  
                  )
        ),
        title: Text(
          "Post Heading",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

        subtitle: Row(
          children: <Widget>[
           
            Text("Details about post", style: TextStyle(color: Colors.white))
          ],
          
        ),
      
       dense: true,
       onTap: (){
          
      
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage()));},
        trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0));






            