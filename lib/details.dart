import 'package:flutter/material.dart';

class Details extends StatefulWidget {

  final String title;
  final String content;
  final String date;
  

  const Details({Key key, this.title, this.content, this.date,}) : super(key: key);@override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w600
                    )
                  ),
                   SizedBox(height:10.0),
              Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: [
                        Text('Date: ',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 18.0
                        )),
                        Text(
                          widget.date,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0
                          )
                        ),
                      ],),
                  ),
              ),
              SizedBox(height:20.0),
                  Padding(
                    padding: const EdgeInsets.only(left:10.0, right: 10.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                      Text('Description',
                         style: TextStyle(
                           color: Colors.black,
                           fontSize: 18.0,
                         ),
                      ),
                      Text('to be completed',
                         style: TextStyle(
                           color: Colors.red,
                           fontSize: 15.0,
                           fontWeight: FontWeight.bold
                         ),
                      )
                      ],),
                  ),
                  SizedBox(height: 10,),
                    // Expanded(
                    //   child: Scrollbar(
                    //     child: 
                        
                        Container(
                          height: MediaQuery.of(context).size.height / 2,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [BoxShadow(
                            color: Colors.grey[400].withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                          )]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                          widget.content,
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 18.0
                            )
                            ),
                        )
                      //   ),
                      // ),
                    ),

                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(4.0)
                              ),
                              height: 50,
                            width: 150,
                            child: Center(
                                      child: Text('SAVE',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0
                                      ),
                                      
                                      ),
                                    ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 110.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(4.0)
                              ),
                              height: 50,
                            width: 150,
                            child: Center(
                                      child: Icon(Icons.edit)
                                    ),
                          ),
                        ),
                      ],
                    ),
              
          ],
        ),
        ),
      
    );
  }
}