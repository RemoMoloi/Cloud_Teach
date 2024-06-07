import 'package:flutter/material.dart';
import 'package:flutter_application_3/widgets/subject_direction/maths_dir.dart';

import '../../widgets/subject_direction/business_dir.dart';
import '../../widgets/subject_direction/cat_dir.dart';
import '../../widgets/subject_direction/eng_dir.dart';
import '../../widgets/subject_direction/geography_dir.dart';
import '../../widgets/subject_direction/life_science_dir.dart';
import '../../widgets/subject_direction/maths_lit_dir.dart';
import '../../widgets/subject_direction/physcis_dir.dart';

class Default extends StatefulWidget {
  const Default({super.key});

  @override
  State<Default> createState() => _DefaultState();
}

Future<void> _refresh (){
  return Future.delayed( const Duration(seconds: 2));
}

class _DefaultState extends State<Default> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return RefreshIndicator(
      onRefresh: _refresh,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text('Subject Quiz'),
        ),
        body: ListView(
          children: [
             Padding(
              padding: const EdgeInsets.all(14.0),
              child: SizedBox(
                width: width,
                child: const Column(
                  children: [
                    Row(
                      children: [
                        MathsDir(),
                        SizedBox(width: 15,),
                        MathsLitDir(),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        EnglishDir(),
                        SizedBox(width: 15,),
                        BusinessDir(),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        GeoDir(),
                        SizedBox(width: 15,),
                        LifeSDir(),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        CatDir(),
                        SizedBox(width: 15,),
                        PhhysicsDir(),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
    
      ),
    );
  }
}

