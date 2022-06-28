import 'package:cgpa_calculate/pages/result_page.dart';
import 'package:flutter/material.dart';


class CGPACount extends StatefulWidget {
  final int n;
  CGPACount(this.n);

  @override
  _CGPACountState createState() => _CGPACountState();
}

class _CGPACountState extends State<CGPACount> {
  late List _sgpaController;
  late List _creditController;
  late List list;

  @override
  void initState() {
    super.initState();

    _sgpaController = <dynamic>[]..length = widget.n;
    _creditController = <dynamic>[]..length = widget.n;

    list = List<int>.generate(widget.n, (i) => i);
  }
  @override
  Widget build(BuildContext context) {
    double sumOfCreditMulSGPA = 0, sumOfCredit = 0;
    double cgpa = 0.0;
    var fields = <Widget>[];
    bool insertedValue = true;

    list.forEach((i) {
      fields.add(
        Row(
            children: [
              //subject er text
              Text(
                "Semester ${i+1}:",
                style:const  TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.bold),
              ),
              const Padding(
                padding:  EdgeInsets.all(10.0),
              ),

              //sgpa er textField
              SizedBox(
                width: 60.0,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration:const InputDecoration(hintText: "CGPA"),
                  onChanged: (value) {
                    setState(() {
                      _sgpaController[i] = value;
                    });
                  },
                ),
              ),
              Padding(
                padding:  EdgeInsets.all(35.0),
              ),

              //credit er textField
              SizedBox(
                width: 60.0,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration:const InputDecoration(hintText: "CREDIT"),
                  onChanged: (s) {
                    setState(() {
                      _creditController[i] = s;
                    });
                  },
                ),
              ),
            ]),
      );
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title:const Text("CGPA Calculator",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding:const EdgeInsets.only(top: 50),
              child: Row(
                  children:const [
                    Padding(
                      padding: EdgeInsets.only(left: 120.0,top: 20.0),
                    ),
                    Text(
                      "CGPA",
                      overflow: TextOverflow.ellipsis,
                      style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 80.0),
                    ),
                    Text(
                      "CREDITS",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom:5.0),
                    ),
                  ]
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border:  Border.all(color: Colors.transparent, width: 30.0)),
              child: Column(
                children: fields,
              ),
            ),
            InkWell(
              onTap: (){
                for (int i = 0; i < widget.n; i++) {
                  if(_creditController[i]==null){
                    insertedValue = false;
                    continue;
                  }
                  if(_sgpaController[i]==null){
                    insertedValue = false;
                    continue;
                  }

                  double sgpa = double.parse(_sgpaController[i]);
                  int credit = int.parse(_creditController[i]);

                  double creditMulSGPA = credit * sgpa;
                  sumOfCreditMulSGPA += creditMulSGPA; //sumOfCreditMulSGPA = sumOfCreditMulSGPA+creditMulSGPA
                  sumOfCredit += credit; //sumOfCredit = sumOfCredit+credit
                }
                cgpa = sumOfCreditMulSGPA / sumOfCredit;

                if(insertedValue==true)
                 {
                   Navigator.of(context).push(
                     MaterialPageRoute(
                       builder: (BuildContext context) =>  ResultPage(cgpa),
                     ),
                   );
                 }
                else{
                  showAlertBox();
                }
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
                child:const Center(
                  child: Text(
                      'Calculate',
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
      ),
    );
  }
  showAlertBox() {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return  AlertDialog(
          title:  Text('Please enter some value to calculate'),
          actions: <Widget>[
            FlatButton(
              child: Icon(Icons.clear),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
