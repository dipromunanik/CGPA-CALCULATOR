
import 'package:cgpa_calculate/pages/home_page.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double score;
  ResultPage(this.score);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.deepOrange,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             const Text("CGPA IS: ",style:  TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 40.0)),
             const SizedBox(width: 5),
             Text(score.toStringAsFixed(score.truncateToDouble() == score ? 0 : 2),
                 style:const  TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 50.0)),
           ],
         ),
          const SizedBox(height: 15),
          InkWell(
            onTap: (){
              Navigator.of(context).pushAndRemoveUntil( MaterialPageRoute(builder:(BuildContext context)=>HomePage()), (Route route)=>route==null);
            },
            child: Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(19),
                boxShadow:const  [
                  BoxShadow(
                      blurRadius: 9,
                      color: Colors.grey,
                      spreadRadius: 1
                  ),
                ],
                gradient:const LinearGradient(colors: [Colors.pinkAccent,Colors.lightBlueAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight
                ),
              ),
              child:Center(
                child: Text(
                  'HomePage',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
