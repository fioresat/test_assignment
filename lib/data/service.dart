import 'fetch_helper.dart';
import 'dart:async';

class StoreService {
  Future<dynamic> getStore() async {
    FetchHelper fetchData = FetchHelper();
    var decodedBaseData = await fetchData.getBaseData();
    return decodedBaseData;
  }

  Future<dynamic> getPhone() async {
    FetchHelper fetchData = FetchHelper();
    var decodedPhoneData = await fetchData.getPhoneData();
    return decodedPhoneData;
  }

  Future<dynamic> getBasket() async {
    FetchHelper fetchData = FetchHelper();
    var decodedBasketData = await fetchData.getBasketData();
    return decodedBasketData;
  }
}
