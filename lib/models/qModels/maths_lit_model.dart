
class QuestionML{

  //initializing data in the database
  final String id;

  final String title;

  final Map<String, bool> options;

  QuestionML ({
    required this.id,
    required this.title,
    required this.options
  });

  @override
  String toString(){
    return 'Question(id: $id, title: $title, options: $options)';
  }

}