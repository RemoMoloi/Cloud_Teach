import 'package:http/http.dart' as http;
import 'dart:convert';

import '../qModels/physics_model.dart';

class DBconnectPS {
//connecting to database
//database link
final url = Uri.parse('');

//adding new questions from fetched data in the database
Future<List<QuestionPS>> fetchQuestions() async{
     return http.get(url).then((response){
     var data = json.decode(response.body) as Map<String, dynamic>;
     List<QuestionPS> newQuestions = [];
     data.forEach((key, value) {
      var newQuestion = QuestionPS(
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