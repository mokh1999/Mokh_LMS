import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
class Api{
  Future<dynamic> get ({required String uri,@required String? token})async{
    Map<String,String> header={};
    if(token!=null){
      header.addAll({
        'Content-Type':'application/json',
        'Authorization': 'Bearer $token'
      });
    }
    Uri url=Uri.parse(uri);
    http.Response response=await http.get(url,headers: header);
    if(response.statusCode==200){
      return jsonDecode(response.body);
    }
    else{
      throw Exception('there problem in status code ${response.statusCode}');
    }
}



  Future<dynamic> post({required String uri,@required dynamic body,@required String? token})async{
    Map<String,String> header={};
    if(token!=null){
      header.addAll({
        'Content-Type':'application/json',
        'Authorization': 'Bearer $token',

      });
    }
    Uri url = Uri.parse(uri);
    http.Response response = await http.post(
        url,
        body:body,
      headers: {

      });
    if(response.statusCode==200){
      Map<String,dynamic> data =jsonDecode(response.body);

      return data;
    }else{
      throw Exception('there is a problem in statuscode  ${response.statusCode} and the error in body ${jsonDecode(response.body)}');

    }

  }


  Future<dynamic> put({required String uri,@required dynamic body,@required String? token})async{
    Map<String,String> header={};
    header.addAll({
      'Content-Type':'application/json'
    });
    if(token!=null){
      header.addAll({
        'Authorization': 'Bearer $token'
      });
    }
    Uri url = Uri.parse(uri);
    http.Response response = await http.post(
        url,
        body:body,
      headers: header
       );
    if(response.statusCode==200){
      Map<String,dynamic> data =jsonDecode(response.body);
      return data;
    }else{
      throw Exception('there is a problem in statuscode ${response.statusCode} and the error in body ${jsonDecode(response.body)}');
    }

  }
}