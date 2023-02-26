import 'package:flutter/material.dart';


class TextFieldCustom extends StatefulWidget {
  const TextFieldCustom({this.icon, this.obscureText, required this.hintText,
    this.validator, required this.controller, Key? key}) : super(key: key);
  final TextEditingController controller;
  final String hintText;
  final Icon? icon;
  final bool? obscureText;
  final String? Function(String? value)? validator;

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: DecoratedBox(
        decoration: BoxDecoration(color: const Color(0xff42404C), borderRadius: BorderRadius.circular(20)),
        child: SizedBox(
          height: 80,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 4,
                    child: Text('${widget.hintText}:', style: const TextStyle(color: Colors.grey),)),
                Expanded(
                  flex: 6,
                  child: Row(
                    children: [
                      (widget.icon != null ? Expanded(
                        flex: 1,
                        child: Padding(
                            padding: const EdgeInsets.only(right: 10, bottom: 5),
                            child:  widget.icon),
                      ) : const SizedBox()),
                      Expanded(
                          flex: 9,
                          child: SizedBox(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                reverse: true,
                                child: TextFormField(
                                  key: widget.key,
                                  validator: widget.validator,
                                  obscureText: widget.obscureText ?? false,
                                  controller: widget.controller,
                                  toolbarOptions: const ToolbarOptions(
                                      cut: true,
                                      copy: true,
                                      paste: true,
                                    selectAll: true
                                  ),
                                  style: const TextStyle(color: Colors.grey),
                                  cursorColor: Colors.white,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      errorStyle: TextStyle(color: Colors.blue)
                                  ),
                                ),
                              )
                          )
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}