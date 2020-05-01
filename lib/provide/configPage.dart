import 'package:flutter/material.dart';

class ConfigPageProvide  with ChangeNotifier{
   /**
   * 监测聊天列表是否滚动到顶部
   */
  int currentIndex = 0;
  getIndex(int newIndex){
    currentIndex = newIndex;
    notifyListeners();
  }
   bool isClose = true;
  getisClose(bool newisClose){
    isClose = newisClose;
    notifyListeners();
  }
  /**
   * 聊天列表监测聊天列表是否滚动到顶部
   */
  bool isScrollerTop = true;//true 在顶部  
  getisScrollerTop(bool newisScrollerTop){
    isScrollerTop = newisScrollerTop;
    notifyListeners();
  }
    /**
   * 外层最大列表监测是否滚动到底部
   * SingleChildScrollView
   */
  bool isScrollerBottom = true;//true 在底部  反之
  getisScrollerBottom(bool newisScrollerBottom){
    isScrollerBottom = newisScrollerBottom;
    notifyListeners();
  }
  // 小盒子
    ScrollController scrollController = new ScrollController();
     getscrollController(bool newval){
    isScrollerBottom = newval;
    notifyListeners();
  }
  //微信页盒子偏移量
  double offset=0.0;
     getoffset(double newval){
    offset = newval;
    notifyListeners();
  }
}