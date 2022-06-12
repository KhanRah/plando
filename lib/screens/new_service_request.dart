import 'package:flutter/material.dart';
import 'package:plando/utilities/route_names.dart';

class NewServiceRequest extends StatefulWidget {
  const NewServiceRequest({Key? key}) : super(key: key);

  @override
  _NewServiceRequestState createState() => _NewServiceRequestState();
}

class _NewServiceRequestState extends State<NewServiceRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("New Service Request"),backgroundColor: Colors.blueAccent,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const CustomButton(),
              Container(
                child: Column(
                  children: [
                    FloatingActionButton(onPressed: (){
                      Navigator.pushNamed(context, PathName.createServiceRequest);
                    },child: const Icon(Icons.add,color: Colors.white,),backgroundColor: Colors.blueAccent),
                    const Padding(padding:  EdgeInsets.symmetric(vertical: 8.0)),
                    const Text("Create SR Manually",style: TextStyle(fontWeight: FontWeight.w700))
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/QR_Code_Example.svg/368px-QR_Code_Example.svg.png",height: 150,width: 150,),
        const Text("Scan Asset Code",style: TextStyle(fontWeight: FontWeight.w700),)
      ],
    );
  }
}


