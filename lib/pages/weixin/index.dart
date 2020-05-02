import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:weixin/provide/configPage.dart';

class WeixinPage extends StatefulWidget {
  WeixinPage({Key key}) : super(key: key);

  @override
  _WeixinPageState createState() => _WeixinPageState();
}

class _WeixinPageState extends State<WeixinPage> with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animationHeight;
  CurvedAnimation _curvedAnimation; //曲线动画
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0; //距左边的偏移
  double _offset = 0.0; //当前盒子的偏移量
  ScrollController _scrollController = new ScrollController();
  bool showToTopBtn = false; //是否显示“返回到顶部”按钮
  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      print("小盒子${_scrollController.offset}"); //打印滚动位置

      if (_scrollController.offset <= 0.0) {
        // Provide.value<ConfigPageProvide>(context).getoffset(_scrollController.offset.abs());
        Provide.value<ConfigPageProvide>(context).getisScrollerTop(true);
        // 如果聊天列表滑动到顶部就 isScrollerTop设置为true
        //  _scrollController.animateTo(11,duration:Duration(seconds: 1),
        //           curve: Curves.easeInOut); if (_scrollController.offset >= 0.0 && _scrollController.offset<=10)
      } else {
        print("进来了小盒子false");
        //如果 isScrollerBottom 为true 就让里面的盒子 解除禁止滚动
        Provide.value<ConfigPageProvide>(context).getisScrollerTop(false);
      }
    });
    // _animationController = AnimationController(
    //     vsync: this, duration: Duration(milliseconds: 1000));

    // _curvedAnimation = CurvedAnimation(
    //     parent: _animationController,
    //     curve: Interval(0.0, 0.6, curve: Curves.easeIn));
    // _animationHeight =
    //     Tween<double>(begin: ScreenUtil().setHeight(0), end: -120)
    //         .animate(_curvedAnimation);
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Provide<ConfigPageProvide>(builder: (context, child, value) {
      return Scaffold(
          // appBar: AppBar(
          //   title: Text(
          //     '微信(23)',
          //     style: TextStyle(color: Colors.black87),
          //   ),
          //   backgroundColor: Color.fromRGBO(215, 215, 215, 1),
          //   elevation: 0.0,
          // ),
          body: GestureDetector(
              onTapUp: (back) {
                print("手指抬起${_offset}");
                //  Provide.value<ConfigPageProvide>(context).getisScrollerTop(false);
                // if (_offset==0.0) {
                //     Provide.value<ConfigPageProvide>(context).getisScrollerTop(false);
                // }else{
                //   Provide.value<ConfigPageProvide>(context).getisScrollerTop(true);
                // }
              },
              onVerticalDragStart: (e) {
                print("小盒子向上${e}");
              },
              onPanDown: (DragDownDetails e) {
                //打印手指按下的位置(相对于屏幕)
                // print("用户手指按下：${_offset}");
                // if (_offset==0){
                //    Provide.value<ConfigPageProvide>(context).getisScrollerTop(true);

                // }else{
                //     Provide.value<ConfigPageProvide>(context).getisScrollerTop(false);
                // }
              },
              //手指滑动时会触发此回调
              onPanUpdate: (DragUpdateDetails e) {
                //用户手指滑动时，更新偏移，重新构建

                setState(() {
                  _left += e.delta.dx;
                  _top += e.delta.dy;
                });
                print("left：${_left}");
                print("top${_top}");
              },
              child: Column(
                children: <Widget>[
                  Container(
                    color: Color.fromRGBO(215, 0, 215, 1),
                    padding: EdgeInsets.only(top:ScreenUtil.mediaQueryData.padding.top),
                    child: ConstrainedBox(
                      
                        constraints: BoxConstraints.expand(
                            height: ScreenUtil().setHeight(120)-ScreenUtil.mediaQueryData.padding.top), //大小限制 撑满可视屏幕

                        child: Row(
                          children: <Widget>[
                           Container(
                             margin: EdgeInsets.only(
                               left:ScreenUtil().setWidth(30)
                             ),
                             child:  Text(
                              '微信(23)',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: ScreenUtil().setSp(32)),
                            ),
                           )
                          ],
                        )),
                  ),
                  Container(
                    color: Color.fromRGBO(0, 25, 215, 1),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.expand(
                          height: ScreenUtil().setHeight(1334) -
                              ScreenUtil().setHeight(120 * 2)), //大小限制 撑满可视屏幕
                      child: ListView.builder(
                        padding: EdgeInsets.all(0.0),
                          itemCount: 100,
                          //如果大盒子不在底部就禁止滚动小盒子滚动体
                          physics: value.isScrollerBottom  && value.isNever
                              ? null
                              : NeverScrollableScrollPhysics(),
                          controller: _scrollController,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text("$index"),
                            );
                          }),
                    ),
                  )
                ],
              )));
    });
  }
  // bool isNever(value){
  //   if () {
  //     return false;
  //   }else if (!value.isScrollerTop  && !value.isNever) {
  //     return true;
  //   }
  // }
}
