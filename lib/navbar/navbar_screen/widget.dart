import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavMenuWidget extends StatelessWidget {
  const NavMenuWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        color: Colors.black.withOpacity(0.5),
        alignment: Alignment.bottomCenter,
        child: Wrap(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(width: 60),
                    Expanded(
                      child: _buildItems(context),
                    ),
                    _buildHideButton(context),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHideButton(context) {
    return SizedBox(
      width: 60,
      child: IconButton(
        icon: Image.asset('assets/ic_drop_down.png', width: 20),
        onPressed: () {
          Navigator.popUntil(context, (route) => false);
        },
      ),
    );
  }

  Column _buildItems(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            GestureDetector(
                onTap: () {
                  print('1');
                },
                child: const Icon(
                  Icons.add,
                  size: 30,
                )),
            GestureDetector(
                onTap: () {
                  print('2');
                },
                child: const Icon(
                  Icons.add,
                  size: 30,
                )),
            GestureDetector(
                onTap: () {
                  print('3');
                },
                child: const Icon(
                  Icons.add,
                  size: 30,
                )),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            GestureDetector(
                onTap: () {
                  print('1');
                },
                child: const Icon(
                  Icons.add,
                  size: 30,
                )),
            GestureDetector(
                onTap: () {
                  print('2');
                },
                child: const Icon(
                  Icons.add,
                  size: 30,
                )),
            GestureDetector(
                onTap: () {
                  print('3');
                },
                child: const Icon(
                  Icons.add,
                  size: 30,
                )),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            GestureDetector(
                onTap: () {
                  print('1');
                },
                child: const Icon(
                  Icons.add,
                  size: 30,
                )),
            GestureDetector(
                onTap: () {
                  print('2');
                },
                child: const Icon(
                  Icons.add,
                  size: 30,
                )),
            GestureDetector(
                onTap: () {
                  print('3');
                },
                child: const Icon(
                  Icons.add,
                  size: 30,
                )),
          ],
        ),
        const SizedBox(height: 20),
        _buildDivider(),
        const SizedBox(height: 20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              Icons.add,
              size: 30,
            ),
            Icon(
              Icons.add,
              size: 30,
            ),
            Icon(
              Icons.add,
              size: 30,
            ),
          ],
        ),
        const SizedBox(height: 20),
        _buildDivider(),
        const SizedBox(height: 20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              Icons.add,
              size: 30,
            ),
            Icon(
              Icons.add,
              size: 30,
            ),
            SizedBox(width: 75),
          ],
        ),
        const SizedBox(height: 20),
        _buildDivider(),
        const SizedBox(height: 20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              Icons.add,
              size: 30,
            ),
            Icon(
              Icons.add,
              size: 30,
            ),
            Icon(
              Icons.add,
              size: 30,
            ),
          ],
        ),
      ],
    );
  }

  Divider _buildDivider() {
    return const Divider(
      height: 1,
      color: Colors.green,
      thickness: 0.3,
    );
  }
}
