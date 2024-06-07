import 'package:http/http.dart' as http;
import 'dart:convert';

import '../qModels/cat_model.dart';

class DBconnectCat {
//connecting to database
//database link
final url = Uri.parse('');

//adding new questions from fetched data in the database
Future<List<QuestionCAT>> fetchQuestions() async{
     return http.get(url).then((response){
     var data = json.decode(response.body) as Map<String, dynamic>;
     List<QuestionCAT> newQuestions = [];
     data.forEach((key, value) {
      var newQuestion = QuestionCAT(
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