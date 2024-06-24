part of '../registration_screen.dart';

class FormFooter extends StatelessWidget {
  const FormFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Spacer(),
        TextButton(onPressed: null, child: Text('Help')),
        TextButton(onPressed: null, child: Text('Privacy')),
        TextButton(onPressed: null, child: Text('*T&C Apply')),
      ],
    );
  }
}
