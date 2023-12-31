import 'package:ecommerce/utils/colors_app.dart';
import 'package:flutter/material.dart';

class ClickableBoxWidget extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  const ClickableBoxWidget({super.key, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity, 
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: onTap,
            child: Container(
              width: size.width/1.102,
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Center(child: Text(label)),
            ),
          )
        ]
      ),
    );
  }
}