import 'package:http/http.dart' as http;
import 'dart:convert';

import '../qModels/life_science_model.dart';

class DBconnectLife {
  //connecting to database
//database link
final url = Uri.parse('');

//adding new questions from fetched data in the database
Future<List<QuestionLS>> fetchQuestions() async{
     return http.get(url).then((response){
     var dataLS = json.decode(response.body) as Map<String, dynamic>;
     List<QuestionLS> newQuestions = [];
     dataLS.forEach((key, value) {
      var newQuestionLS = QuestionLS(
        id: key, 
        title: value['title'], 
        options: Map.castFrom(value['options']),
        );
        newQuestions.add(newQuestionLS);
     });
      return newQuestions;
    });
    }
}