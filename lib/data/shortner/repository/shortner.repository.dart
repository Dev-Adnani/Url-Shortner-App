import 'dart:convert';
import 'package:urlshortner/data/shortner/network/shortner.network.dart';

class ShortnerRepository {
  final ShortnerNetwork shortnerNetwork;
  const ShortnerRepository({
    required this.shortnerNetwork,
  });

  Future<dynamic> customUrl(
      {required String destination, required String customText}) async {
    var response = await shortnerNetwork.customUrl(
        destination: destination, customText: customText);
    final Map<String, dynamic> parsedData = jsonDecode(response.toString());
    return parsedData;
  }

  Future<dynamic> randomUrl({
    required String destination,
  }) async {
    var response = await shortnerNetwork.randomUrl(destination: destination);
    final Map<String, dynamic> parsedData = jsonDecode(response.toString());
    return parsedData;
  }
}
