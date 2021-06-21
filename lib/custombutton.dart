import 'package:flutter/material.dart';

class HeroImage extends StatelessWidget {

  final double imgHeight;
  HeroImage({this.imgHeight});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('assets/bellie2.jpg') ,
      width: MediaQuery.of(context).size.width,
      height: imgHeight,
    );
  }
}

class CustomButton extends StatelessWidget {
  final String btnText;
  final Function onBtnPressed;
  CustomButton({this.btnText, this.onBtnPressed});
  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(btnText,style: Theme.of(context).textTheme.bodyText1,),
            SizedBox(
              width: 10,),
            Icon(Icons.arrow_forward)
          ],
        ),
      ),
      onPressed:onBtnPressed,
      color: Theme.of(context).primaryColor,
    );
  }
}
