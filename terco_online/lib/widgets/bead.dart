import 'package:flutter/material.dart';

class Bead extends StatefulWidget {
  final double size;
  final Color color;

  const Bead({Key? key, required this.size, required this.color})
      : super(key: key);

  @override
  _BeadState createState() => _BeadState();
}

class _BeadState extends State<Bead> {
  Color _currentColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentColor =
              _currentColor == Colors.blue ? Colors.green : Colors.blue;
        });
      },
      child: Container(
        width: widget.size,
        height: widget.size,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _currentColor,
        ),
      ),
    );
  }
}

List<Widget> buildRosary() {
  return [
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 50, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 50, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 50, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 50, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    SizedBox(height: 20),
    Image.asset('assets/santinho.png', height: 100),
    SizedBox(height: 20),
    Bead(size: 50, color: Colors.blue),
    Bead(size: 30, color: const Color.fromARGB(255, 33, 54, 243)),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 30, color: Colors.blue),
    Bead(size: 50, color: Colors.blue),
  ];
}
