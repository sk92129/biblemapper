
import 'package:flutter/material.dart';

class SkipToContent extends StatefulWidget {
  const SkipToContent({super.key});

  @override
  State<SkipToContent> createState() => _SkipToContentState();
}

class _SkipToContentState extends State<SkipToContent> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        if (hasFocus) {
          setState(() {
            _isVisible = true;
          });
        }
      },
      child: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 200),
        child: _isVisible
            ? Positioned(
                top: 0,
                left: 0,
                child: Material(
                  color: Theme.of(context).colorScheme.primary,
                  child: InkWell(
                    onTap: () {
                      // Find the main content and focus it
                      FocusScope.of(context).requestFocus(FocusNode());
                      setState(() {
                        _isVisible = false;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      child: Text(
                        'Skip to main content',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}