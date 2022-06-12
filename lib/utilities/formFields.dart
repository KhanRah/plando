import 'package:flutter/material.dart';

class FormFields {
  static Widget getFormField({FormFieldValidator<String>? validator,Function? editingComplete,required BuildContext context,TextEditingController? formFieldController,String? hintText,
    required bool obscureText,int? maxLines,TextInputType? keyboardType,Function? onChanged,FocusNode? focus,required TextCapitalization textCapitalization}){
    return Container(
      child: TextFormField(
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: formFieldController,
        textCapitalization: textCapitalization,
        obscureText: obscureText,
        maxLines: maxLines,
        autocorrect: true,
        onEditingComplete: editingComplete as void Function()?,
        focusNode: focus,
        style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 14.0,color:const Color(0xff292929) ),
        decoration: new InputDecoration(
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.white,style: BorderStyle.solid,width: 1.0),),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.white,style: BorderStyle.solid,width: 1.0),),
          errorStyle: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w400,color: Colors.red),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.white,style: BorderStyle.solid,width: 1.0),),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.white,style: BorderStyle.solid,width: 1.0),),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Color(0xFFF2F3F7),style: BorderStyle.solid,width: 1.0),),
          border: OutlineInputBorder(
            borderRadius:BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.red,style: BorderStyle.none,),),
          contentPadding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
          filled: true,
          fillColor: Color(0xFFF2F3F7),
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 14.0,color:Colors.grey,fontFamily: 'Quicksand',fontWeight: FontWeight.w500),
        ),
        keyboardType: keyboardType,
        cursorColor: Colors.blue,
        onChanged: onChanged as void Function(String)?,
      ),
    );
  }
  static Widget getPasswordField({FormFieldValidator<String>? validator,Function? editComplete,required BuildContext context,TextEditingController? formFieldController,String? hintText,Function? onTap,
    required bool obscureText,int? maxLines,TextInputType? keyboardType,Function? onChanged,FocusNode? focus}){
    return Container(
      child: TextFormField(
        controller: formFieldController,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: obscureText,
        maxLines: maxLines,
        autocorrect: false,
        focusNode: focus,
        onEditingComplete: editComplete as void Function()?,
        style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 14.0,color:const Color(0xff292929) ),
        decoration: new InputDecoration(
          focusedErrorBorder: InputBorder.none,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.white,style: BorderStyle.solid,width: 1.0),),
          errorStyle: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w400,color: Colors.red),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.white,style: BorderStyle.solid,width: 1.0),),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Color(0xFFF2F3F7),style: BorderStyle.solid,width: 1.0),),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Color(0xFFF2F3F7),style: BorderStyle.solid,width: 1.0),),
          border: OutlineInputBorder(
            borderRadius:BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Color(0xFFF2F3F7) ,style: BorderStyle.none,),),
          contentPadding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
          filled: true ,
          suffixIcon: FlatButton(
              onPressed: onTap as void Function()?,
              child: Text('Forgot?', style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w500,fontSize: 12.0),)),
          fillColor: const Color(0xFFF2F3F7),
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 14.0,color:const Color(0xff94979B),fontFamily: 'Quicksand',fontWeight: FontWeight.w300 ),
        ),
        keyboardType: keyboardType,
        cursorColor:Colors.blue,
        onChanged: onChanged as void Function(String)?,
      ),
    );
  }

  static Widget getFormFieldWithIcon(
      {Widget? icon,
        Function? onTap,
        required bool readOnly,
        FormFieldValidator<String>? validator,
        Function? editingComplete,
        required BuildContext context,
        TextEditingController? formFieldController,
        String? hintText,
        required bool obscureText,
        int? maxLines,
        TextInputType? keyboardType,
        Function? onChanged,
        FocusNode? focus,
        TextCapitalization? textCapitalization}) {
    return Container(
      child: TextFormField(
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: formFieldController,
        obscureText: obscureText,
        maxLines: maxLines,
        autocorrect: true,
        readOnly: readOnly,
        onEditingComplete: editingComplete as void Function()?,
        focusNode: focus,
        onTap: onTap as void Function()?,
        // style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 14.0,color:const Color(0xff292929) ),
        decoration: new InputDecoration(
          suffixIcon: icon,
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(
                color: Colors.white, style: BorderStyle.solid, width: 1.0),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(
                color: Colors.white, style: BorderStyle.solid, width: 1.0),
          ),
          errorStyle: TextStyle(
              fontSize: 14.0, fontWeight: FontWeight.w400, color: Colors.red),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(
                color: Colors.white, style: BorderStyle.solid, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(
                color: Colors.white, style: BorderStyle.solid, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(
                color: Color(0xFFF2F3F7), style: BorderStyle.solid, width: 1.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(
              color: Colors.red,
              style: BorderStyle.none,
            ),
          ),
          contentPadding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
          filled: true,
          fillColor: const Color(0xFFF2F3F7),
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
              fontSize: 14.0,
              color: const Color(0xff94979B),
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.w300),
        ),
        keyboardType: keyboardType,
        cursorColor: Colors.blue,
        onChanged: onChanged as void Function(String)?,
      ),
    );
  }


}
