import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    return Scaffold(
      body: MainPage(rpx: rpx,),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.rpx});
  final double rpx;
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  double extraPichHeight = 0;   // 图片变化的高度
  double prevdy;                 // 初始点击位置
  BoxFit fitType;               // 图片的适应方式

  AnimationController animationcontroller;        // 动画控制器
  Animation<double> animation;                    // 动画

  @override
  void initState() {
    super.initState();
    prevdy = 0;
    fitType = BoxFit.fitWidth;
    animationcontroller = AnimationController(vsync: this, duration: Duration(milliseconds: 300));   // 动画时间
    animation = Tween(begin: 0.0, end: 0.0).animate(animationcontroller);       // 效果绑定动画时间
  
  }

  // 手饰点击的时候执行
  updatePicHeight(changed){
    print('prevdy：$prevdy');
    print('changed:$changed');
    // 如果初始点击位置为0，那么记录传入进来的点击的值
    // 如果之前没有点过，那么首次点击的位置就是手饰按下去的位置
    if(prevdy == 0){
      prevdy = changed;
    }
    //计算图片应该变化的高度
    // 图片容器增长的高度 += 改变的高度坐标 - 鼠标上一个点的坐标（也就代表一直增长）
    extraPichHeight += changed - prevdy;
    // 如果下拉过了200后，就修改图片的适应格式
    if(extraPichHeight >= 200 * widget.rpx){
      fitType = BoxFit.fitHeight;
    }else{
      fitType = BoxFit.fitWidth;
    }
    setState(() {
      prevdy = changed;
      extraPichHeight = extraPichHeight;
      fitType = fitType;
    });
  }
  // 手饰抬起的时候执行
  runAnimate(){
    setState(() {
      animation = Tween(begin: extraPichHeight, end: 0.0).animate(animationcontroller)..addListener((){
        if(extraPichHeight >= 200 * widget.rpx){
          fitType = BoxFit.fitHeight;
        }else{
          fitType = BoxFit.fitWidth;
        }
        setState(() {
          extraPichHeight = animation.value;
          fitType = fitType;
        });
      });
      // 执行完回弹之后，初始点击变化值 再次初始化为0（保证移动-鼠标位置 = 增长的高度）
      //（避免保留着上一次的鼠标点击值，造成下一次点击的时候，移动的高度比点击的位置小）
      prevdy = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    return Listener(
      onPointerMove: (result){
        updatePicHeight(result.position.dy);
      },
      onPointerUp: (_){
        runAnimate();
        animationcontroller.forward(from: 0);     //
      },
      child: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            floating: true,
            leading: IconButton(
              icon: Icon(Icons.search),
              onPressed: (){},
            ),
            expandedHeight: 500 * rpx + extraPichHeight,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('用户中心'),
              centerTitle: true,
              background: SliverTopBar(extraPicHeight: extraPichHeight, fitType: fitType,),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index){
              return Container(height: 30, color: Colors.blue,);
            }, childCount: 20)
          )
        ],
      ),
    );
  }
}

class SliverTopBar extends StatelessWidget {
  const SliverTopBar({Key key, @required this.extraPicHeight, @required this.fitType});
  final double extraPicHeight;
  final BoxFit fitType;
  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Image.asset(
              'static/timg.jpg',
              width: 750 * rpx,
              height: 300 * rpx + extraPicHeight,
              fit: fitType,
            ),
            Container(
              height: 100 * rpx ,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:10.0),
              child: Divider(
                color: Colors.grey[700],
              ),
            ),
            Container(
              height: 100 * rpx,
            ),
          ],
        ),
        Positioned(
          top:250 * rpx + extraPicHeight,
          left: 35 * rpx,
          child: Container(
            width: 130 * rpx,
            height: 130 * rpx,
            child: CircleAvatar(
              backgroundImage: NetworkImage('http://b-ssl.duitang.com/uploads/item/201410/09/20141009224754_AswrQ.jpeg'),
            ),
          ),
        )
      ],
    );
  }
}
