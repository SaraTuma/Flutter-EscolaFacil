import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchDialog extends StatelessWidget {
  const SearchDialog({super.key, required this.iniatialText});

  final String iniatialText;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 2,
          left: 4,
          right: 4,
          child: Card(
            child: TextFormField(
              initialValue: iniatialText,
              textInputAction: TextInputAction.search,
              autofocus: true,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.grey[700],
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )),
              onFieldSubmitted: (text) {
                Navigator.of(context).pop(text);
              },
            ),
          ),
        )
      ],
    );
  }
}
