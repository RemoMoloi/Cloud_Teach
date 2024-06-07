import 'package:http/http.dart' as http;
import '../qModels/maths_model.dart';
import 'dart:convert';

class DBconnect {
//connecting to database
//database link
final url = Uri.parse('');

//adding new questions from fetched data in the database
Future<List<QuestionM>> fetchQuestions() async{
     return http.get(url).then((response){
     var data = json.decode(response.body) as Map<String, dynamic>;
     List<QuestionM> newQuestions = [];
     data.forEach((key, value) {
      var newQuestion = QuestionM(
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