import 'package:flutter/material.dart';

class CustomSwitcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switcher();
  }
}

class Switcher extends StatefulWidget {
  @override
  _SwitcherState createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {

  //Modificações a serem feitas
  //Externar essas Variáveis para o Dev personalizar da forma que pretender
  //Criar uma Função de Callback "onChanged"
  //Receber um Widget Text como parâmetro para o dev personalizar o texto como
  //quiser
  //Deixar o Duration para que seja passado como parâmetro,
  //

  final double height = 40.0;
  final double width = 25.0;
  final String text = 'Este é um Teste';
  final Color selectedColor = Colors.blue;
  final Color unselectedColor = Colors.grey;
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      height: height,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isSelected = !_isSelected;
          });
        },
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                  text,
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: selectedColor
                  )
              )
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              height: height,
              width: width * 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: _isSelected ? selectedColor.withAlpha(100) : unselectedColor.withAlpha(100)
              ),
              alignment: _isSelected ? Alignment.topRight : Alignment.topLeft,
              child: AnimatedContainer(
                width: width,
                duration: Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: _isSelected ? selectedColor : unselectedColor
                  )
              ),
            ),
          ],
        ),
      )
    );
  }
}

