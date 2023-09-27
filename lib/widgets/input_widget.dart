import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class InputWidget extends StatefulWidget {
  Widget labelText;
  TextEditingController controller;
  List<TextInputFormatter>? inputFormatters;
  String? Function(String?)? validator;
  bool obscureText;
  bool isVisible;

  InputWidget({
    required this.controller,
    required this.labelText,
    this.inputFormatters,
    this.validator,
    this.obscureText = false,
    this.isVisible = true,
    super.key,
  });

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.9,
        child: TextFormField(
          obscureText: widget.obscureText,
          validator: widget.validator,
          controller: widget.controller,
          inputFormatters: widget.inputFormatters,
          decoration: InputDecoration(
            suffix: widget.isVisible
                ? InkWell(
                    onTap: _passWordView,
                    child: widget.obscureText
                        ? const Icon(Icons.lock_outline)
                        : const Icon(Icons.lock_open),
                  )
                : null,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red)),
            label: widget.labelText,
          ),
        ),
      ),
    );
  }

  void _passWordView() {
    setState(() {
      widget.obscureText = !widget.obscureText;
    });
  }
}
