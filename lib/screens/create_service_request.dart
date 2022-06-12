// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:plando/utilities/formFields.dart';

class CreateServiceRequest extends StatefulWidget {
  const CreateServiceRequest({Key? key}) : super(key: key);

  @override
  _CreateServiceRequestState createState() => _CreateServiceRequestState();
}

class _CreateServiceRequestState extends State<CreateServiceRequest> {

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * 0.65;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Create Service Request"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Expanded(child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ListView(
                children:  [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 32.0),
                    child: Icon(Icons.settings,size: 78.0,color: Colors.grey,),
                  ),

                  Row(
                    children: [
                      const Icon(Icons.person,color: Colors.grey),
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
                      Expanded(child: FormFields.getFormField(hintText: "User Name",context: context, obscureText: false, textCapitalization: TextCapitalization.none))
                    ],
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
                  Row(
                    children: [
                      const Icon(Icons.phone,color: Colors.grey),
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
                      Expanded(child: FormFields.getFormField(hintText: "Mobile Number",context: context, obscureText: false, textCapitalization: TextCapitalization.none))
                    ],
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
                  Row(
                    children: [
                      const Icon(Icons.location_on_sharp,color: Colors.grey),
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
                      Expanded(child: FormFields.getFormField(hintText: "Address",context: context, obscureText: false, textCapitalization: TextCapitalization.none))
                    ],
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
                  Row(
                    children: [
                      const Icon(Icons.web_asset,color: Colors.grey),
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
                      Expanded(child: FormFields.getFormField(hintText: "Asset Name",context: context, obscureText: false, textCapitalization: TextCapitalization.none))
                    ],
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
                  Row(
                    children: [
                      const Icon(Icons.rocket,color: Colors.grey),
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
                      Expanded(child: FormFields.getFormField(hintText: "Problem Description",context: context, obscureText: false, textCapitalization: TextCapitalization.none))
                    ],
                  )

                ],
              ),
            ),
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 18.0),
            child: DecoratedBox(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
              child: ElevatedButton(onPressed: (){
              },child: const Text("SUBMIT"),style: ElevatedButton.styleFrom(primary: Colors.blueAccent,minimumSize: const Size(1000.0,48.0)),),
            ),
          )
        ],
      ),
    );
  }
}

class FormField extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  const FormField({Key? key,this.hintText,this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon!),
        Expanded(child: FormFields.getFormField(hintText:hintText,context: context, obscureText: false, textCapitalization: TextCapitalization.none))
      ],
    );
  }
}


