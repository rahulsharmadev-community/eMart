part of 'keywords_repository.dart';

class KeywordsApi {
  Future<Keywords> search(String word) async {
    logs.i("Keywords:search($word) initiating");
    word = word.removeAllSpace.toLowerCase();
    if (word.isEmpty) return [];

    final skdb = SKDB.get(word);
    final http = HttpService('${skdb.ref}/PRODUCT-KEYWORDS/.json', auth: skdb.token);

    var response = await http.get(orderBy: '\$key', startAt: word, endAt: "$word\uf8ff", limitToFirst: 10);
    return (json.decode(response!.body) as JSON).values.map((e) => Keyword.fromJson(e as JSON)).toList();
  }

  Future<void> set(Keyword keyword) async {
    logs.i("Keywords:set($keyword) initiating");
    var word = keyword.label.removeAllSpace.toLowerCase();
    if (keyword.image != null && !Uri.parse(keyword.image!).isAbsolute) return;

    final skdb = SKDB.get(word);
    final http = HttpService('${skdb.ref}/PRODUCT-KEYWORDS/.json', auth: skdb.token);
    await http.patch({word: keyword});
  }
}
