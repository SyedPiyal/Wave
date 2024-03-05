
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class OrderStatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Status'),
      ),
      body:  Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //order Status Text
            const Text("PickUp",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),

            Card(
              elevation:1,
              margin:  const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('45624AFB22',style: TextStyle(fontWeight: FontWeight.w300),),
                        Icon(Icons.keyboard_arrow_down)
                      ],
                    ),
                    const Text('Adidas Shoe',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    SizedBox(
                      height: 200.0,
                      child: Column(
                        children: [

                          //==============================
                          // timeline for order status
                          //==============================


                          //for pickup
                          TimelineTile(
                            oppositeContents: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text('31,Jan,24',style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text('10.20 AM',style: TextStyle(fontWeight: FontWeight.w300),),
                                ],
                              ),
                            ),
                            contents: Card(
                              color: Colors.white,
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                child:  const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Pick-Up',style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text('Dhaka,Bangladesh',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 10),),
                                  ],
                                ),
                              ),
                            ),
                            node: const TimelineNode(
                              indicator: DotIndicator(),
                              endConnector: SolidLineConnector(),
                            ),
                          ),

                          //for dispatched timeline
                          TimelineTile(
                            oppositeContents: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text('01,Jan,24',style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text('10.40 AM',style: TextStyle(fontWeight: FontWeight.w300),),
                                ],
                              ),
                            ),
                            contents: Card(
                              color: Colors.white,
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                child:  const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Dispatched',style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text('khulna,Bangladesh',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 10),),
                                  ],
                                ),
                              ),
                            ),
                            node: const TimelineNode(
                              indicator: DotIndicator(),
                              startConnector:SolidLineConnector(),
                              endConnector: SolidLineConnector(),
                            ),
                          ),


                          //for arrived timeline
                          TimelineTile(
                            oppositeContents: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text('01,Jan,24',style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text('10.20 AM',style: TextStyle(fontWeight: FontWeight.w300),),
                                ],
                              ),
                            ),
                            contents: Card(
                              color: Colors.white,
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                child:  const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Arrived To Bangladesh',style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text('Dhaka,Bangladesh',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 10),),
                                  ],
                                ),
                              ),
                            ),
                            node: const TimelineNode(
                              indicator: DotIndicator(),
                              startConnector:SolidLineConnector(),

                            ),
                          ),
                        ],
                      )
                    ),
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