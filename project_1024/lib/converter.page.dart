import 'package:flutter/material.dart';
import 'package:project_1024/widget/input.dart';

class ConverterPage extends StatefulWidget{ 
  const ConverterPage({super.key});
  @override
  State<StatefulWidget> createState() => _ConverterPageState();
}
class _ConverterPageState extends State<ConverterPage>{
  TextEditingController controller= TextEditingController();

    double result = 0;  //result store korar jonno
    final _formKey = GlobalKey<FormState>() ;         
  
  @override
  void dispose() {                        
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context){
    // throw UnimplementedError(); (1st)

    return Scaffold(
      appBar:AppBar(
        title: Text("Money Converter"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: SizedBox(
          height: 300,
          width: 300,
          child: Card(
            color: const Color.fromARGB(255, 192, 132, 160),
            child: Padding(                      
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text("USD"),
                    Icon(Icons.swap_horiz),
                    Text("BDT"),
                    ],
                    ),

                    SizedBox(            
                      height: 20,
                    ), 

                    Form(
                      key: _formKey,
                      child: Column(
                      children:  [
                      InputField(                        
                        controller: controller, 
                      keyboardTtpe: TextInputType.numberWithOptions(decimal: true), 
                      labelText:"Amount", 
                      hintText: "Enter Amount", 
                      prefixIcon: Icon(Icons.monetization_on), 
                      validator:(value){
                        if(value.isEmpty){
                          return "Field is empty!!!";
                        }
                        return null;
                      },
                      ),
                      SizedBox(height: 20,), 

                      ElevatedButton(         
                        onPressed: (){
                          if(_formKey.currentState!.validate())  {              
                          String input= controller.text;
                          result= double.parse(input)*124.34 ;
                          setState(() {});    

                          }         
                        },
                       child: Text("Convert",style: TextStyle(fontWeight: FontWeight.bold), selectionColor: Colors.black,),
                       ),

                       SizedBox(height: 20,),
                       Text("BDT: $result"), 
                      ],
                    ),
                    )
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}