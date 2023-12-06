import 'dart:convert';

import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:toonflix/models/webtoon.dart';
import 'package:toonflix/models/webtoon_detail_model.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';

class Apiservice {
  static final logger = Logger();
  static const String baseUrl =
      'https://webtoon-crawler.nomadcoders.workers.dev';
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonIstances = [];
    final url = Uri.parse("$baseUrl/$today");
    final response = await get(url);
    if (response.statusCode == 200) {
      final List webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        final instance = WebtoonModel.fromJson(webtoon);
        webtoonIstances.add(instance);
      }
      return webtoonIstances;
    }
    throw Error();
  }

  static Future<WebtoondetailMobel> getToonbyId(String id) async {
    final url = Uri.parse("$baseUrl/$id");
    final response = await get(url);
    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebtoondetailMobel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(
      String id) async {
    List<WebtoonEpisodeModel> episodesInstances = [];
    final url = Uri.parse("$baseUrl/$id/episodes");
    final response = await get(url);
    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      // logger.t(episodes);
      for (var episode in episodes) {
        episodesInstances.add(WebtoonEpisodeModel(
          id: episode["id"],
          date: episode["date"],
          rating: episode["rating"],
          title: episode["title"],
        ));
      }
      // logger.t(episodesInstances);
      return episodesInstances;
    }
    throw Error();
  }
}
