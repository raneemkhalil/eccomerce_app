import 'package:ecommerce/utils/colors_app.dart';
import 'package:flutter/material.dart';

class LoginSocialItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback ontap;
  final Color color;
  const LoginSocialItem({
    super.key,
    required this.icon,
    required this.title,
    required this.ontap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: AppColors.grey3,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: color,
              ),
              const SizedBox(
                width: 16.0,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.black, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
