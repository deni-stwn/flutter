import 'package:dio/dio.dart';
import 'package:e_letter/Model/content/content_model.dart';

class ContentApi {
  final dio = Dio();
  String url = "https://627b30c8b54fe6ee00839444.mockapi.io/content";

  Future<List<ContentModel>> getContent() async {
    try {
      Response<List<dynamic>> respons = await dio.get(url);
      //print('Data content: $respons');
      if (respons.statusCode == 200) {
        List<ContentModel>? content =
            respons.data?.map((e) => ContentModel.fromJson(e)).toList();
        return content ?? [];
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio Error!');
        print('Status : ${e.response?.statusCode}');
      } else {
        print('Erros sending request!');
        print(e.message);
      }
    }
    return [];
  }
}
