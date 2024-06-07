import 'package:flutter_application_3/models/qModels/business_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DBconnectBusiness {
//connecting to database
//database link
final url = Uri.parse('');

//adding new questions from fetched data in the database
Future<List<QuestionBusiness>> fetchQuestions() async{
     return http.get(url).then((response){
     var data = json.decode(response.body) as Map<String, dynamic>;
     List<QuestionBusiness> newQuestions = [];
     data.forEach((key, value) {
      var newQuestion = QuestionBusiness(
        id: key, 
        title: value['title'], 
        options: Map.castFrom(value['options']),
        );
        newQuestions.add(newQuestion);
     });
      return newQuestions;
    });
    }
}