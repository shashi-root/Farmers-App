import 'package:farmers/main.dart';
import 'package:flutter/material.dart';

import 'Model/Post.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8.0,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text(
          "POST",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Hero(
        tag: DetailPage,
        child: body(context),
      ),
      floatingActionButton: sharePostButton(context),
    );
  }

  body(BuildContext context) => Column(
        children: <Widget>[headingCard(context), postDeatildCard(context)],
      );

  headingCard(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        color: Color.fromRGBO(58, 66, 86, 1.0),
        child: Card(
            margin: EdgeInsets.all(10),
            color: Colors.white24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: Container(
                        padding: EdgeInsets.only(right: 8.0),
                        decoration: new BoxDecoration(
                            border: new Border(
                                right: new BorderSide(
                                    width: 1.0, color: Colors.white24))),
                        child: CircleAvatar(
                          radius: 20.0,
                          backgroundImage: NetworkImage(
                              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                          backgroundColor: Colors.transparent,
                        )),
                    title: Text(
                      "Shashikant Khetmalis",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.10,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          'डिफ़ॉल्ट रूप से, टेक्स्ट फ़ॉन्ट द्वारा परिभाषित लाइन ऊंचाई के साथ लेआउट करेगा। फ़ॉन्ट-मैट्रिक्स परिभाषित लाइन की ऊंचाई फ़ॉन्ट आकार से लंबी या छोटी हो सकती है',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )),
              ],
            )),
      );

  postDeatildCard(BuildContext context) => Expanded(
        child: Container(
        color: Color.fromRGBO(58, 66, 86, 1.0),
        child: Card(
            margin: EdgeInsets.all(10),
            color: Colors.white24,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'डिफ़ॉल्ट रूप से, टेक्स्ट फ़ॉन्ट द्वारा परिभाषित लाइन ऊंचाई के साथ लेआउट करेगा। फ़ॉन्ट-मैट्रिक्स परिभाषित लाइन की ऊंचाई फ़ॉन्ट आकार से लंबी या छोटी हो सकती है। ऊंचाई संपत्ति फ़ॉन्ट आकार के गुणक के रूप में लाइन की ऊंचाई के मैन्युअल समायोजन की अनुमति देती है। अधिकांश फोंट के लिए, ऊंचाई को 1.0 पर सेट करना ऊंचाई को शून्य पर सेट करने या सेट करने जैसा नहीं है। निम्नलिखित आरेख फ़ॉन्ट-मेट्रिक्स-परिभाषित लाइन ऊंचाई और ऊंचाई के साथ उत्पन्न लाइन ऊंचाई के बीच के अंतर को दिखाता है:',
                style: TextStyle(color: Colors.white),
              ),
            )),
      ));

  sharePostButton(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
            elevation: 10,
            child: Icon(
              Icons.share,
            ),
            splashColor: Colors.grey,
          ),
        ),
      ],
    );
  }
}
