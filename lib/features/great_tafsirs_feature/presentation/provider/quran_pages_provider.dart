import 'package:flutter/cupertino.dart';

class QuranPagesProvider with ChangeNotifier{
  List<int> _bookmarkIndexesList = [];

  void addBookMark(int pageIndex){
    if(!_bookmarkIndexesList.contains(pageIndex))
      _bookmarkIndexesList.add(pageIndex);

    notifyListeners();
  }

  void removeBookmark(int pageIndex){
    _bookmarkIndexesList.remove(pageIndex);
    notifyListeners();
  }

  void removeAllBookmarks(){
    _bookmarkIndexesList.clear();
    notifyListeners();
  }

  List<int> getListOfBookmarks(){
    notifyListeners();
    return _bookmarkIndexesList;
  }
}