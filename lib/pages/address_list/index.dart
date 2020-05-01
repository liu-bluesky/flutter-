import 'package:flutter/material.dart';

class AddressListPage extends StatefulWidget {
  AddressListPage({Key key}) : super(key: key);

  @override
  _AddressListPageState createState() => _AddressListPageState();
}

class _AddressListPageState extends State<AddressListPage> {
  final GlobalKey _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final Widget child = NotificationListener<ScrollStartNotification>(
      key: _key,
      child: NotificationListener<ScrollUpdateNotification>(
        child: NotificationListener<OverscrollNotification>(
          child: NotificationListener<ScrollEndNotification>(
            child:
             ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Text('data=$index');
                },
                itemCount: 100),
         
            // onNotification: (ScrollEndNotification notification) {
            //   return false;
            // },
          ),
          onNotification: (OverscrollNotification notification) {
            return false;
          },
        ),
        onNotification: (ScrollUpdateNotification notification) {
          return false;
        },
      ),
      onNotification: (ScrollStartNotification scrollUpdateNotification) {
        return false;
      },
    );

    return child;
  }
}
