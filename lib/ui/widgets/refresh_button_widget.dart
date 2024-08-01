import 'package:flutter/material.dart';

class RefreshButtonWidget extends StatelessWidget {
  const RefreshButtonWidget({super.key, required this.tittle, required this.onPressed});
  final String tittle;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: (){
          onPressed();
        },
        child: Text(tittle),
      ),
    );
  }
}
