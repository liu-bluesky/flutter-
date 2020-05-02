import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:weixin/pages/address_list/index.dart';
import 'package:weixin/pages/find/index.dart';
import 'package:weixin/pages/me/index.dart';
import 'package:weixin/pages/weixin/index.dart';
import './bottom_nav_bar.dart';
import 'package:weixin/provide/configPage.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animationHeight;
  CurvedAnimation _curvedAnimation; //曲线动画
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0; //距左边的偏移
  double screenHeight = 0.0; //分辨率高度
  bool isUpDow = false;
  double _statusBarHeight = 0.0; //导航高度
  double offset = 0.0;
  ScrollController _scrollController = new ScrollController();
  @override
  void initState() {
    super.initState();
    // _animationController =
    //     AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    // _curvedAnimation = CurvedAnimation(
    //     parent: _animationController, curve: Curves.easeInOutBack);
    _scrollController.addListener(() {
      print(
          "大盒子距离底部位置${ScreenUtil().setHeight(_scrollController.offset.abs())}");

      if (_scrollController.offset <= 0.0) {
        Provide.value<ConfigPageProvide>(context).getisScrollerBottom(true);
        print('object2');
      } else if (ScreenUtil().setHeight(_scrollController.offset) >
          ScreenUtil().setHeight(200)) {
        print('object1');
        Provide.value<ConfigPageProvide>(context).getisScrollerBottom(false);
      }
    });
  }

  final List<Widget> tabBodies = [
    WeixinPage(),
    AddressListPage(),
    FindPage(),
    MePage()
  ];
  @override
  Widget build(BuildContext context) {
    _statusBarHeight = MediaQuery.of(context).padding.top;

    screenHeight = MediaQuery.of(context).size.height;
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
    _animationHeight =
        Tween<double>(begin: 120, end: 0).animate(_curvedAnimation);
    return Provide<ConfigPageProvide>(
      builder: (context, child, value) {
        return Scaffold(
            body: Listener(
                onPointerUp: (e) {
                  // print(value.isScrollerTop);
                  print("_top${_top}");
                  print("isUp${value.isUp}");
                  if (value.isScrollerTop && !value.isUp) {
                    //判断是否底部偏移量是否大于指定大小
                    if (ScreenUtil().setHeight(_top.floor()) >
                        ScreenUtil().setHeight(200)) {
                      // print(_top);
                      // 事放动画返回0
                      // 大盒子动画到最上面
                      print(screenHeight);

                      _scrollController.animateTo(screenHeight,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                      value.getisUp(true);
                      print("进来了1");
                    } else {
                      //  回复原状
                      print("进来了2");
                      _scrollController.animateTo(0.0,
                          duration: Duration(milliseconds: 100),
                          curve: Curves.easeIn);
                    }
                  } else if (value.isScrollerTop && value.isUp) {
                    if (ScreenUtil().setHeight(screenHeight) -
                            ScreenUtil().setHeight(_scrollController.offset) >=
                        ScreenUtil().setHeight(120)) {
                      print("进来了3");
                      print(ScreenUtil()
                          .setHeight(_scrollController.offset.abs()));
                      print(ScreenUtil().setHeight(screenHeight));
                      print(ScreenUtil().setHeight(380));
                      // print(_top);
                      // 事放动画返回0
                      // 大盒子动画到最下面
                      // print(_statusBarHeight);
                      _scrollController.animateTo(0.0,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                      value.getisUp(false);
                    } else {
                      print("进来了4");
                      //  回复原状
                      _scrollController.animateTo(screenHeight,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    }
                  }
                  setState(() {
                    _top = 0;
                  });
                },
                //移动
                onPointerMove: (e) {
                  // print("Listener E :${e.position}");
                  //如果在顶部 或者 大盒子的滚动位置不在底部就滚动大盒子滚动体

                  if (value.isScrollerTop && value.isScrollerBottom) {
                    print(value.isScrollerBottom);
                    setState(() {
                      _top += e.delta.dy;
                    });
                    _scrollController.jumpTo(_top <= 0.0 ? 0.0 : _top);
                  } else if (!value.isScrollerTop && !value.isScrollerBottom) {
                    print(value.isScrollerBottom);
                    setState(() {
                      _top -= e.delta.dy;
                    });
                    _scrollController.jumpTo(_top <= 0.0 ? 0.0 : _top);
                  }
                  //  else if (_top >= screenHeight) {
                  //   //其他情况过大或者国小都会充值
                  //   _top = screenHeight;
                  // }
                  // else if (_top <= 0) {
                  //   print("_top <= 0");
                  //   _top = 0;
                  // }
                },
                child:PageView(
                  scrollDirection: Axis.vertical,
                 reverse:false,
                   physics:null,
                  children: <Widget>[

                    Container(
                      color: Colors.red,
                     
                      child: Column(
                        children: <Widget>[
                       
                          Container(
                          color: Colors.black38,
                       height: ScreenUtil().setHeight(1334)-ScreenUtil().setHeight(120),
                          child:    ListView.builder(
                      
                        itemCount: 20,
                        //如果大盒子不在底部就禁止滚动小盒子滚动体
                    
                        // controller: _scrollController,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text("$index"),
                          );
                        })

                        )
                        ,

                        Container(
                          color: Colors.black38,
                          height: ScreenUtil().setHeight(120),
                          child: Text("底部切换导航"),

                        )
                        ],
                      )
                    ),
                      Container(
                          color: Colors.black87,
                      child: Text('1'),
                    )
                  ],
                )
                //  Center(
                //   child:
                // ),
                ));
      },
    );
  }
}
// #09bb07  060404
