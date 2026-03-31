import 'package:flutter/material.dart';
import 'package:job_board/core/widgets/large_appbar.dart';

class JobPage extends StatelessWidget {
  const JobPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          LargeAppbar(),
          Center(child: Text("Job Dashboard")),
        ],
      ),
    );
  }
}
