import 'package:cgpa_calculate/pages/cgpa_count.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController textController =TextEditingController();
  late int n;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title:const Text('CGPA Calculator',style: TextStyle(color: Colors.black,fontSize: 22)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100,right: 20,left: 20),
        child: ListView(
          children: [
            TextField(
              onChanged: (String number){
                setState(() {
                  if(textController.text==""){
                    n=0;
                  }else{
                    n =int.parse(textController.text);
                  }
                });
              },
              controller: textController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Semeter Number',
                hintStyle:const TextStyle(color: Colors.black,fontSize: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),

                )
              )
            ),
            const SizedBox(height: 15),
            InkWell(
              onTap: (){
                if(n is int && n > 0 ){
                  int pass=n;
                  n=0;
                  textController.text="";
                  Navigator.of(context).push(MaterialPageRoute(builder:(BuildContext context)=> CGPACount(pass)));
                }
                else{
                  textController.text="";
                }
              },
              child: Container(
                height: 50,
                width: 10,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(15),
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
                child:Center(child: Text('ENTER',style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
