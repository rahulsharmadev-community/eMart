part of '../registration_screen.dart';

class FormHeader extends StatelessWidget {
  const FormHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    var title = 'Create Seller Account';
    var subtitle = 'Register as a seller on eMart and manage sales, inventory and your '
        'business operations on the Seller Central dashboard.';
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: theme.headlineLarge),
        8.gap,
        Text(
          subtitle,
          style: theme.titleMedium,
        ),
      ],
    );
  }
}
