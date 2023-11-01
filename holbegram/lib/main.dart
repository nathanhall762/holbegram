import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

class SegmentedButton extends StatefulWidget {
  final List<Widget> children;
  final ValueChanged<int>? onPressed;

  SegmentedButton({required this.children, this.onPressed});

  @override
  _SegmentedButtonState createState() => _SegmentedButtonState();
}

class _SegmentedButtonState extends State<SegmentedButton> {
  List<bool> isSelected = [true, false]; // Maintain the selected state

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      children: widget.children,
      isSelected: isSelected,
      onPressed: (int newIndex) {
        setState(() {
          for (int index = 0; index < isSelected.length; index++) {
            isSelected[index] = index == newIndex;
          }
        });

        if (widget.onPressed != null) {
          widget.onPressed!(newIndex);
        }
      },
    );
  }
}


void main() async {
  // Initialize Firebase within the main function.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(MaterialApp(
    home: SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Holbegram')),
          backgroundColor: Colors.white,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              // begin: Alignment.topLeft,
              // end: Alignment.bottomRight,
              colors: [Colors.greenAccent[200]!, Colors.deepPurpleAccent[200]!],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.amber,
                width: 150.0,
                height: 150.0,
                margin: EdgeInsets.all(20.0),
                padding: EdgeInsets.all(20.0),
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage('images/logo.webp'),
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  print('You clicked me!');
                },
                child: const Icon(Icons.add),
                backgroundColor: Colors.greenAccent,
              ),
              SegmentedButton(
                children: [
                  Text('First'),
                  Text('Second'),
                ],
                onPressed: (int index) {
                  print('You clicked button at index: $index');
                },
              ),
            ],
          ),
        ),
        backgroundColor: Colors.deepPurpleAccent[200],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Account',
            ),
          ],
          selectedItemColor: Colors.deepPurpleAccent[200],
          unselectedItemColor: Colors.deepPurpleAccent[100],
          showUnselectedLabels: true,
          type: BottomNavigationBarType.shifting, // Change to fixed if needed
        ),
      ),
    ),
  ));
}
