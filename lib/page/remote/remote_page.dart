import 'package:farmbroapk/page/remote/remote_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemotePage extends StatelessWidget {
  const RemotePage({super.key});

  @override
  Widget build(BuildContext context) {
    final remoteBloc = context.read<RemoteBloc>();
    final screenSize = MediaQuery.sizeOf(context);
    final boxSize = screenSize.width / 2;

    return BlocBuilder<RemoteBloc, RemoteState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: boxSize,
              height: boxSize,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: (state.condition) ? Colors.green : Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  remoteBloc.add(RemoteOnPressed());
                },
                child: const Text(
                  'ON',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Divider(
              indent: boxSize / 2,
              endIndent: boxSize / 2,
              thickness: 1,
              color: Colors.black12,
            ),
            SizedBox(
              width: boxSize,
              height: boxSize,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: (!state.condition) ? Colors.red : Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  remoteBloc.add(RemoteOffPressed());
                },
                child: const Text(
                  'OFF',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
