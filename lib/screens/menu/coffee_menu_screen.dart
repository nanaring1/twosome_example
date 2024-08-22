import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

const String SERVERIP = "http://a9b8c7d6e5f4g3h2i1j0klmnopqrst.ap-northeast-2.elasticbeanstalk.com/cafe/menu"; // 서버 주소 입력

TextEditingController searchTextEditController = TextEditingController();

Future<dynamic> _getSearchData() async {
  Dio dio = Dio();

  try {
    // API 요청
    Response res = await dio.get(
      SERVERIP ,
      queryParameters: {
        'search_text': searchTextEditController.text, // 검색어 전달
      },
    );
    print(res);
    return res.data; // 서버로부터 받은 데이터 반환
  } on DioError catch (e) {
    print("API 요청 중 오류 발생: ${e.response?.statusCode} - ${e.message}");
    return null; // 오류 발생 시 null 반환
  }
}


class Coffee {
  final String id;
  final String title;
  final String price;
  final String imageUrl;
  final String imageUrl2;


  Coffee({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.imageUrl2,
  });
}


List<Coffee> parseCoffees(List<dynamic> data) {
  _getSearchData();
  return data.map((item) => Coffee(
    id: item['id'],
    title: item['title'],
    price: item['price'],
    imageUrl: item['imageUrl'],
    imageUrl2: item['imageUrl2'],
  )).toList();
}

List<Coffee> coffees = [
  Coffee(
    id: "01",
    title: "(1호점)신촌커피",
    price: "6100",
    imageUrl: "assets/images/coffee01.jpg",
    imageUrl2: "assets/images/coffee01_ice.jpg",
  ),
  Coffee(
    id: "02",
    title: "아메리카노",
    price: "4500",
    imageUrl: "assets/images/coffee02.jpg",
    imageUrl2: "assets/images/coffee02_ice.png",
  ),
  Coffee(
    id: "03",
    title: "카페라떼",
    price: "5000",
    imageUrl: "assets/images/coffee03.jpg",
    imageUrl2: "assets/images/coffee03_ice.png",
  ),
  Coffee(
    id: "04",
    title: "바닐라카페라떼",
    price: "5500",
    imageUrl: "assets/images/coffee04.png",
    imageUrl2: "assets/images/coffee04_ice.png",
  ),
];
