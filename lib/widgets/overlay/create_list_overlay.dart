import 'package:flutter/material.dart';

class CreateListOverlay extends StatefulWidget {
  final VoidCallback onCancel;
  final VoidCallback onCreate;

  const CreateListOverlay({
    super.key,
    required this.onCancel,
    required this.onCreate,
  });

  @override
  _CreateListOverlayState createState() => _CreateListOverlayState();
}

class _CreateListOverlayState extends State<CreateListOverlay> {
  final TextEditingController _controller = TextEditingController();
  bool _isCreateButtonActive = false;
  bool _isCheckboxChecked = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_handleTextChange);
  }

  @override
  void dispose() {
    _controller.removeListener(_handleTextChange);
    _controller.dispose();
    super.dispose();
  }

  void _handleTextChange() {
    setState(() {
      _isCreateButtonActive = _controller.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    final shorterSide = MediaQuery.of(context).size.shortestSide;
    final padding = shorterSide * 0.04;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create a List',
              style: TextStyle(
                fontSize: shorterSide * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: padding / 2),
            Text(
              'Favorite lists help to keep saved ads organized.',
              style: TextStyle(
                fontSize: shorterSide * 0.035,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: padding),
            TextField(
              controller: _controller,
              maxLength: 50,
              decoration: const InputDecoration(
                hintText: 'Name',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: padding / 2),
            Text(
              '${_controller.text.length}/50 characters',
              style: TextStyle(
                fontSize: shorterSide * 0.03,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: padding / 2),
            Row(
              children: [
                Checkbox(
                  value: _isCheckboxChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isCheckboxChecked = value ?? false;
                    });
                  },
                ),
                Text(
                  'Email me with similar ads',
                  style: TextStyle(
                    fontSize: shorterSide * 0.035,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
            SizedBox(height: padding),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: widget.onCancel,
                  child: const Text('Cancel', style: TextStyle(color: Colors.black)),
                ),
                SizedBox(width: padding / 2),
                ElevatedButton(
                  onPressed: _isCreateButtonActive ? widget.onCreate : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isCreateButtonActive ? Colors.black : Colors.grey[300],
                    foregroundColor: _isCreateButtonActive ? Colors.white : Colors.grey[600],
                  ),
                  child: const Text('Create'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
