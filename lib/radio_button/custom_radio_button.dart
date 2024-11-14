import 'package:flutter/material.dart';

class RadioButtonWidget extends StatefulWidget {
  final String question;
  final Color? activeColor;
  final List<String> options;
  final ValueChanged<String?> onOptionSelected;

  const RadioButtonWidget({
    super.key,
    required this.question,
    this.activeColor,
    required this.options,
    required this.onOptionSelected,
  });

  @override
  RadioButtonWidgetState createState() => RadioButtonWidgetState();
}

class RadioButtonWidgetState extends State<RadioButtonWidget> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Text(
          'Radio Button Samples',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            weight: 700,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 30,
          bottom: 30,
          left: 10,
          right: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.question,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: widget.options.map((option) {
                return RadioListTile<String>(
                  title: Text(option),
                  value: option,
                  contentPadding: EdgeInsets.zero,
                  activeColor: widget.activeColor,
                  groupValue: _selectedOption,
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value;
                    });
                    widget.onOptionSelected(value);
                  },
                );
              }).toList(),
            ),
            const SizedBox(
              height: 10,
            ),
            // Horizontal
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: widget.options.map((option) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Radio<String>(
                        value: option,
                        groupValue: _selectedOption,
                        activeColor: widget.activeColor,
                        onChanged: (value) {
                          setState(() {
                            _selectedOption = value;
                          });
                          widget.onOptionSelected(value);
                        },
                      ),
                      Text(option),
                      const SizedBox(width: 20), // Add space between options
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
