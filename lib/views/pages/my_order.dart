import 'package:flutter/material.dart';


class MyOrderPage extends StatefulWidget{
  const MyOrderPage({super.key});
  
  @override
  State<MyOrderPage> createState() =>  _MyOrderState();
}

class _MyOrderState extends State<MyOrderPage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("data")
      )
    );
  }
}