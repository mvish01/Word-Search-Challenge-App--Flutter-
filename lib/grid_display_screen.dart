import 'package:flutter/material.dart';
import 'package:word_search_app/grid_input_screen.dart';

class GridDisplayScreen extends StatefulWidget {
  final List<List<String>> grid;

  GridDisplayScreen({required this.grid});

  @override
  _GridDisplayScreenState createState() => _GridDisplayScreenState();
}

class _GridDisplayScreenState extends State<GridDisplayScreen> {
  final _searchController = TextEditingController();
  List<List<String>> _highlightedGrid = [];

  @override
  void initState() {
    super.initState();
    _highlightedGrid = widget.grid;
  }

  void _searchInGrid(String text) {
    // This is where you'll implement the search logic
    // Highlight cells that match the search text
    setState(() {
      _highlightedGrid = widget.grid; // Reset to default
      // Perform search and update _highlightedGrid
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Grid Display')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(labelText: 'Search Text'),
              onChanged: _searchInGrid,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: widget.grid[0].length,
                ),
                itemCount: widget.grid.length * widget.grid[0].length,
                itemBuilder: (context, index) {
                  int row = index ~/ widget.grid[0].length;
                  int col = index % widget.grid[0].length;
                  bool isHighlighted = false; // Add your highlight condition here

                  return Container(
                    decoration: BoxDecoration(
                      color: isHighlighted ? Colors.yellow : Colors.transparent,
                      border: Border.all(),
                    ),
                    child: Center(
                      child: Text(
                        widget.grid[row][col],
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => GridInputScreen()),
                );
              },
              child: Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}