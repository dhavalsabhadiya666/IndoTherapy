import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StripeApiProvider {
  final baseUrl = "https://api.stripe.com/v1/";
  final tokens = 'tokens';
  final customers = 'customers';
  final charges = 'charges';
  final sources = 'sources';
  var stripekey =
      "sk_test_51L4JlvHuxSmkCiOP10EDg6x4GgXBBOayiUPhlipDuM3GDQXR9pbD8PI6MpC1MJIGzjAy3MxmcpivelQktoQ9mGbY00wCi54yQP";
  String cID = '';

  Future<ApiresponseModel?> creartSecondCard({
    required String expireDate,
    required String cardNumber,
    required String cvcNumber,
    required BuildContext context,
    required String? email,
    // String customerID,
    // String cardToken,
    required double amount,
    required String address,
  }) async {
    // if (cardToken == null || cardToken == '') {
    var month = expireDate.split("/")[0];
    var year = expireDate.split("/")[1];
    var url = "${baseUrl + tokens}";
    print('uellllllll  ${url.toString()}');
    var body = {
      "card[number]": cardNumber,
      "card[exp_month]": month,
      "card[exp_year]": year,
      "card[cvc]": cvcNumber,
    };
    var client = http.Client();
    var request = http.Request('POST', Uri.parse(url));
    request.headers['Content-Type'] =
        'application/x-www-form-urlencoded; charset=utf-8';
    request.headers['Authorization'] = 'Bearer $stripekey';
    request.bodyFields = body;
    final response1 = await client.send(request);
    print('response1 -- > ${response1.request}');
    final response2 = await response1.stream.bytesToString();
    print('response2 -- > $response2');
    if (response1.statusCode == 200) {
      // print(response2);
      var test = json.decode(response2);
      var token = test['id'];
      var tokenCard = test['card']['id'];
      return createCustomer(
          token, tokenCard, email.toString(), amount, address);
    } else {
      print("something Wrong!  creartSecondCard");
      return ApiresponseModel(
          "No Data found", false, json.decode(response2), response1.statusCode);
    }
  }

  Future<ApiresponseModel?> createCustomer(String token, String tokenCard,
      String email, double amount, String address) async {
    var url = baseUrl + customers;

    var body = {
      "description": "Customerdetail",
      "source": token,
      "email": email,
      "name": 'name',
      "address": address
      // "default_source": token
    };
    var client = http.Client();
    var request = http.Request('POST', Uri.parse(url));
    request.headers['Content-Type'] =
        'application/x-www-form-urlencoded; charset=utf-8';
    request.headers['Authorization'] = 'Bearer $stripekey';
    request.bodyFields = body;
    final response1 = await client.send(request);
    final response2 = await response1.stream.bytesToString();
    print('createCustomer --> $response2');
    print('createCustomer statusCode--->  ${response1.statusCode}');
    if (response1.statusCode == 200) {
      // print(response2);
      var test = await json.decode(response2);
      String custId = test['id'];
      cID = custId;
      print('CstomerId: $custId');
      return await payWithCard(tokenCard, custId, amount);
      //return await pay(custId, amount);
    } else {
      print("something Wrong! createCustomer ");
      return ApiresponseModel(
          "No Data found", false, json.decode(response2), response1.statusCode);
    }
  }

  Future<ApiresponseModel> payWithCard(
      // String token,
      String tokenCard,
      String customerID,
      double amount) async {
    var url = baseUrl + charges;
    var body = {
      "amount": "${(amount * 100).toInt()}",
      "currency": "usd",
      "source": tokenCard,
      "description": "description",
      "customer": customerID
    };
    print('payWithCard  body  --> ${body.toString()}');
    var client = http.Client();
    var request = http.Request('POST', Uri.parse(url));

    request.headers['Content-Type'] =
        'application/x-www-form-urlencoded; charset=utf-8';
    request.headers['Authorization'] = 'Bearer $stripekey';
    request.bodyFields = body;
    final response1 = await client.send(request);
    final response2 = await response1.stream.bytesToString();

    var test = json.decode(response2);
    print('payWithCard statusCode--->  ${response1.statusCode}');
    print('payWithCard response1 --> ${response2}');
    if (response1.statusCode == 200) {
      print('payWithCard --> ${response2.toString()}');
      return ApiresponseModel(
          "Data found", true, json.decode(response2), response1.statusCode);
    } else {
      print("something Wrong! payWithCard");
      return ApiresponseModel(
          "No Data found", false, json.decode(response2), response1.statusCode);
    }
  }
}

final secondStripeApiprovider = StripeApiProvider();

class ApiresponseModel {
  final String? message;
  final bool? status;
  final dynamic data;
  final int? statusCode;

  ApiresponseModel(this.message, this.status, this.data, this.statusCode);
}
