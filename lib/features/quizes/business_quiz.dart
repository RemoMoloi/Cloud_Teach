
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/db_connection/db_connect_bus.dart';
import '../../models/qModels/business_model.dart';
import '../../widgets/next_button.dart';
import '../../widgets/option_card.dart';
import '../../widgets/question_widget.dart';
import '../../widgets/results_box.dart';

class BusinessQuiz extends StatefulWidget {
  const BusinessQuiz({super.key});

  @override
  State<BusinessQuiz> createState() => _BusinessQuizState();
}

class _BusinessQuizState extends State<BusinessQuiz> {
var db = DBconnectBusiness();
late Future _questionsBusiness;

//fetches data from the database
Future<List<QuestionBusiness>> getData() async {
  return db.fetchQuestions();
}

@override
  void initState() {
    _questionsBusiness = getData();
    super.initState();
  }
  
  int index = 0;

  int score =0;

  bool isPressed = false;

  bool isAlreadySelected = false;

  //goes to the next question in the database
  void nextQuestions(int questionLength){

    if (index == questionLength -1){
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) => ResultBox(
        result: score,
        questionLength: questionLength,
        onPressed: startOver,
      )
      );
    } else {
      if(isPressed){
      setState(() {
      index++;
      isPressed = false;
      isAlreadySelected = false;
    }); 
  }else{
    //error handling if no option is selected
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select any option'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20.0),
          ));
      }
    }
  }


  //checks if answer is true
  void checkAnswerAndUpdate(bool value){
    if(isAlreadySelected){
      return;
    }else{
      if(value == true){
      score++; 
    }
    setState(() {
      isPressed = true;
      isAlreadySelected = true;
    });
    }
    
    
  }
 
 //starts over the quiz and score 
 void startOver(){
  setState(() {
    index =0;
    score=0;
    isPressed = false;
    isAlreadySelected = false;
  });
  Navigator.pop(context);
 }

 void direction(){
  Navigator.push(
    context,
     MaterialPageRoute(builder:
     (context) => const BusinessQuiz()
      ));
 }
  @override
  Widget build(BuildContext context) {

    //displays data from database
    return FutureBuilder(
      future: _questionsBusiness as Future<List<QuestionBusiness>>,
      builder: (ctx, snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          if(snapshot.hasError){
            return Center(
              child: Text('${snapshot.error}'),
              );
          } else if (snapshot.hasData){
            var extractedData = snapshot.data as List<QuestionBusiness>;
            return  Scaffold(
            backgroundColor: background,
            appBar: AppBar(
              title: const Text('Cloud Teach'),
              backgroundColor: background,
              shadowColor: Colors.transparent,
              actions: [
                Padding(padding: const EdgeInsets.all(10.0),
                child: Text('Score: $score',
                style: const TextStyle(fontSize: 18.0),),
                ),
              ],
            ),
            body: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  QuestionWidget(
                    question: extractedData[index].title, 
                    indexAction: index, 
                    totalQuestion: extractedData.length,
                    ),
                    const Divider(color: Colors.white,),
        
                  const SizedBox(
                    height: 25,
                  ),
                  for(int i =0; i < extractedData[index].options.length; i++)
                  GestureDetector(
                    onTap: () => checkAnswerAndUpdate(
                    extractedData[index].options.values.toList()[i]),
                    child: OptionCard(option: extractedData[index].options.keys.toList()[i],
                    color: isPressed ? extractedData[index].options.values.toList()[i] == true
                    ? correct
                    : incorrect : Colors.white,
                    
                    ),
                  ),
                ],
              ),
            ),
    
        floatingActionButton: GestureDetector(
          onTap: ()=> nextQuestions(extractedData.length),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal:10.0),
            child: NextButton(
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        );
        }
      }
      else{
        return  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(
                height: 200,
              ),
              Text('Please wait a second...', style: TextStyle(
                color: Theme.of(context).primaryColor,
                decoration: TextDecoration.none,
                fontSize: 18
              ),)
            ],
          ),
        );
      }

      return const Center(
        child: Text('No Data'),
      );
      },
    );
  }
}