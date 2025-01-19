import 'package:flutter/material.dart';
import 'package:word_search_app/grid_display_screen.dart';

class GridInputScreen extends StatefulWidget {
  @override
  _GridInputScreenState createState() => _GridInputScreenState();
}

class _GridInputScreenState extends State<GridInputScreen> {
  final _mController = TextEditingController();
  final _nController = TextEditingController();
  List<List<String>> _grid = [];
  int _rows = 0;
  int _cols = 0;

  void _generateGrid() {
    setState(() {
      _rows = int.parse(_mController.text);
      _cols = int.parse(_nController.text);
      _grid = List.generate(
        _rows,
            (i) => List.generate(_cols, (j) => ''),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Grid Input')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _mController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Number of rows (m)'),
            ),
            TextField(
              controller: _nController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Number of columns (n)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generateGrid,
              child: Text('Create Grid'),
            ),
            // Grid Display and Alphabet Entry
            if (_grid.isNotEmpty)
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _cols,
                  ),
                  itemCount: _rows * _cols,
                  itemBuilder: (context, index) {
                    int row = index ~/ _cols;
                    int col = index % _cols;
                    return TextField(
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      onChanged: (value) {
                        setState(() {
                          _grid[row][col] = value.toUpperCase();
                        });
                      },
                    );
                  },
                ),
              ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GridDisplayScreen(grid: _grid),
                  ),
                );
              },
              child: Text('Display Grid'),
            ),
          ],
        ),
      ),
    );
  }
}