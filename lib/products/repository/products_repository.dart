import 'dart:convert';

import '../database/product_db_provider.dart';
import '../models/product_info.dart';
import '../models/product_list_response.dart';

import 'package:http/http.dart' as http;

class ProductsRepository {

  Future<List<ProductInfo>> getProducts({String? keyword}) async {
    final ProductDBProvider dbProvider = ProductDBProvider.instance;
    final List<ProductInfo> query = await dbProvider.queryList(keyword: keyword);
    if (query.isEmpty) {
      final result = await _getAPIProducts();
      if (result != null) {
        if (result.data != null) {
          String fixedDataStr = result.data!.replaceAll("'", '"');
          final Iterable iterable = json.decode(fixedDataStr);
          final List<ProductInfo> items = iterable.map((e) => ProductInfo.fromJsonMap(e)!).toList();
          dbProvider.insertList(items);
          return items;
        } else {
          throw Exception("api response data property is null");
        }
      } else {
        throw Exception("api response is null");
      }
    } else {
      return query;
    }
  }

  Future<ProductListResponse?> _getAPIProducts() async {
    final url = "https://static-resrc.s3.amazonaws.com/app/test/marttest.json";

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return ProductListResponse.fromJsonMap(json.decode(response.body));
    } else {
      throw Exception("failed to get http response");
    }
  }
}