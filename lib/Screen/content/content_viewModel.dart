import 'package:e_letter/Api/content_api.dart';
import 'package:e_letter/Model/content/content_model.dart';
import 'package:flutter/cupertino.dart';

enum ContentViewState { loading, succes, error }

class ContentViewModel with ChangeNotifier {
  List<ContentModel> _content = [];
  List<ContentModel> get content => _content;
  ContentViewState _stateType = ContentViewState.loading;
  ContentViewState get stateType => _stateType;

  void changeState(ContentViewState s) {
    _stateType = s;
    notifyListeners();
  }

  void getContentFromApi() async {
    changeState(ContentViewState.loading);
    try {
      List<ContentModel> contentList = await ContentApi().getContent();
      _content = contentList;
      notifyListeners();
      changeState(ContentViewState.succes);
    } catch (e) {
      changeState(ContentViewState.error);
    }
    //return foods;
  }
}
