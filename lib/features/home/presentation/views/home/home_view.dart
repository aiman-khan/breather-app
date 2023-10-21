import 'package:breather_app/features/auth/presentation/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (context, ref, _) {
        final user = ref.read(userProvider);

        return Center(
          child: Text('${user?.email} ${user?.name}'),
        );
      }),
    );
  }
}
