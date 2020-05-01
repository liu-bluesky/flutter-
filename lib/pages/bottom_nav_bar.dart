import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

List<Widget> bottomNavBar(value) {
  return [
    Expanded(
        flex: 1,
        child: Container(
            alignment: Alignment.center,
            color: Colors.black12,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Badge(
                        badgeColor: Colors.red,
                        toAnimate: true,
                        shape: BadgeShape.square,
                        position: BadgePosition.topRight(top: -3.0, right: -12),
                        padding: EdgeInsets.only(left: 8, right: 8),
                        borderRadius: 20,
                        badgeContent:
                            Text('···', style: TextStyle(color: Colors.white)),
                        child: InkWell(
                          child: Container(
                              child: Column(
                            children: <Widget>[
                              Image.asset(
                                'images/tabbar/weixin.png',
                                width: ScreenUtil().setWidth(50),
                                height: ScreenUtil().setHeight(50),
                                fit: BoxFit.cover,
                              ),
                              Text('微信')
                            ],
                          )),
                          onTap: () {
                            value.getIndex(0);
                          },
                        )),
                  ],
                )
              ],
            ))),
    Expanded(
        flex: 1,
        child: Container(
            alignment: Alignment.center,
            color: Colors.black12,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Badge(
                        badgeColor: Colors.red,
                        toAnimate: true,
                        shape: BadgeShape.square,
                        position: BadgePosition.topRight(top: -3.0, right: -12),
                        padding: EdgeInsets.only(left: 8, right: 8),
                        borderRadius: 20,
                        badgeContent:
                            Text('···', style: TextStyle(color: Colors.white)),
                        child: InkWell(
                          child: Container(
                              child: Column(
                            children: <Widget>[
                              Image.asset(
                                'images/tabbar/weixin.png',
                                width: ScreenUtil().setWidth(50),
                                height: ScreenUtil().setHeight(50),
                                fit: BoxFit.cover,
                              ),
                              Text('微信')
                            ],
                          )),
                          onTap: () {
                            value.getIndex(1);
                          },
                        )),
                  ],
                )
              ],
            ))),
    Expanded(
        flex: 1,
        child: Container(
            alignment: Alignment.center,
            color: Colors.black12,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Badge(
                        badgeColor: Colors.red,
                        toAnimate: true,
                        shape: BadgeShape.square,
                        position: BadgePosition.topRight(top: -3.0, right: -12),
                        padding: EdgeInsets.only(left: 8, right: 8),
                        borderRadius: 20,
                        badgeContent:
                            Text('···', style: TextStyle(color: Colors.white)),
                        child: InkWell(
                          child: Container(
                              child: Column(
                            children: <Widget>[
                              Image.asset(
                                'images/tabbar/weixin.png',
                                width: ScreenUtil().setWidth(50),
                                height: ScreenUtil().setHeight(50),
                                fit: BoxFit.cover,
                              ),
                              Text('微信')
                            ],
                          )),
                          onTap: () {
                            value.getIndex(2);
                          },
                        )),
                  ],
                )
              ],
            ))),
    Expanded(
        flex: 1,
        child: Container(
            alignment: Alignment.center,
            color: Colors.black12,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Badge(
                        badgeColor: Colors.red,
                        toAnimate: true,
                        shape: BadgeShape.square,
                        position: BadgePosition.topRight(top: -3.0, right: -12),
                        padding: EdgeInsets.only(left: 8, right: 8),
                        borderRadius: 20,
                        badgeContent:
                            Text('···', style: TextStyle(color: Colors.white)),
                        child: InkWell(
                          child: Container(
                              child: Column(
                            children: <Widget>[
                              Image.asset(
                                'images/tabbar/weixin.png',
                                width: ScreenUtil().setWidth(50),
                                height: ScreenUtil().setHeight(50),
                                fit: BoxFit.cover,
                              ),
                              Text('微信')
                            ],
                          )),
                          onTap: () {
                            value.getIndex(3);
                          },
                        )),
                  ],
                )
              ],
            ))),
  ];
}
