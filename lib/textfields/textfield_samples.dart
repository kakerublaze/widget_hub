import 'package:flutter/material.dart';
import 'package:widget_helper/textfields/custom_textfield.dart';

class TextfieldSamples extends StatefulWidget {
  const TextfieldSamples({super.key});

  @override
  State<TextfieldSamples> createState() => _TextfieldSamplesState();
}

class _TextfieldSamplesState extends State<TextfieldSamples> {
  bool isSecure = false;
  final TextEditingController _controller = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController optionController = TextEditingController();
  TextEditingController displayController =
      TextEditingController(text: 'Hello World');
  final FocusNode _focusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Text(
          'Text Field Samples',
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  // Basic Textfield
                  CustomTextField(
                    hintText: "Basic Textfield",
                    showBorder: true,
                    filled: false,
                    controller: nameController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Obsecure Textfield
                  CustomTextField(
                    hintText: "Obsecure Textfield",
                    obscureText: isSecure,
                    showBorder: true,
                    filled: false,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        isSecure = !isSecure;
                        setState(() {});
                      },
                      child: isSecure
                          ? const Icon(
                              Icons.visibility_off,
                            )
                          : const Icon(
                              Icons.visibility,
                            ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Email Validator
                  CustomTextField(
                    hintText: "Email Validator",
                    keyboardType: TextInputType.emailAddress,
                    showBorder: true,
                    filled: false,
                    validator: (value) {
                      if (value == null || !value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Styled field
                  CustomTextField(
                    hintText: "Search",
                    prefixIcon: const Icon(Icons.search),
                    fillColor: Colors.grey[200],
                    filled: true,
                    borderRadius: BorderRadius.circular(30),
                    customBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Select Date
                  CustomTextField(
                    controller: dateController,
                    hintText: "Select Date",
                    readOnly: true, // Makes the field readonly
                    onTap: () {
                      // Show date picker dialog
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2025),
                      ).then((selectedDate) {
                        if (selectedDate != null) {
                          dateController.text = selectedDate.toString();
                        }
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // option Textfield
                  CustomTextField(
                    controller: optionController,
                    hintText: "Select an option",
                    readOnly: true,
                    suffixIcon: const Icon(Icons.arrow_drop_down),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Select Option"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                title: const Text("Option 1"),
                                onTap: () {
                                  optionController.text = "Option 1";
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                title: const Text("Option 2"),
                                onTap: () {
                                  optionController.text = "Option 2";
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Read Only
                  CustomTextField(
                    controller: displayController,
                    readOnly: true,
                    showCursor: false, // Hides the cursor
                    enableInteractiveSelection:
                        false, // Disables text selection
                    fillColor: Colors.grey[200],
                    filled: true,
                    showBorder: true,
                    customBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // No border
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const CustomTextField(
                      hintText: "No border field",
                      showBorder: false,
                      fillColor: Colors.transparent,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Default border with custom color and radius
                  CustomTextField(
                    hintText: "Custom border field",
                    showBorder: true,
                    borderColor: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                    borderWidth: 2.0,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Completely custom borders
                  CustomTextField(
                    hintText: "Special border field",
                    showBorder: true,
                    customBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.purple,
                        width: 2.0,
                      ),
                    ),
                    customFocusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.deepPurple,
                        width: 3.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Custom error borders
                  CustomTextField(
                    hintText: "Validation field",
                    showBorder: true,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "This field is required";
                      }
                      return null;
                    },
                    customErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Colors.red.shade300,
                        width: 2.0,
                      ),
                    ),
                    customFocusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Colors.red.shade500,
                        width: 2.5,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Underline border only
                  const CustomTextField(
                    hintText: "Underline only",
                    showBorder: true,
                    filled: false,
                    customBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    customFocusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Example 6: Gradient border
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.blue, Colors.purple],
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const CustomTextField(
                        hintText: "Gradient border field",
                        showBorder: false,
                        fillColor: Colors.transparent,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.only(
                      top: _focusNode.hasFocus || _controller.text.isNotEmpty
                          ? 30
                          : 15,
                      bottom: 15,
                    ),
                    child: CustomTextField(
                      focusNode: _focusNode,
                      labelText: "Description",
                      floatingLabelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                      minLines: 1,
                      maxLines: 5,
                      showBorder: false,
                      filled: false,
                      fillColor: Colors.transparent,
                      floatingLabelBehavior:
                          FloatingLabelBehavior.auto, // Changed to auto
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      labelStyle: TextStyle(
                        color: Colors.black87,
                        fontSize:
                            _focusNode.hasFocus || _controller.text.isNotEmpty
                                ? 12
                                : 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
