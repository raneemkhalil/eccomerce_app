import 'package:ecommerce/utils/colors_app.dart';
import 'package:flutter/material.dart';

class ForgetPasswordMoadlSheetWidget extends StatelessWidget {
  final String email;
  const ForgetPasswordMoadlSheetWidget({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24,
            ),
            Text(
              'Forget Password',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              'Enter your mail',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: AppColors.grey),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Email',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 16.0,
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: AppColors.grey3, width: 1),
                borderRadius: BorderRadius.circular(15),
              ),
              leading: const Icon(
                Icons.mail_outline,
                color: AppColors.primaryColor,
                size: 30,
              ),
              title: Text(email),
              trailing: const Icon(
                Icons.done,
                color: Colors.green,
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: AppColors.white,
                ),
                child: Text(
                  'Send Code',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}