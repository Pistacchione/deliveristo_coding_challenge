import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/splash_cubit.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.7],
            colors: [
              Colors.blueAccent,
              Colors.blue,
            ],
          ),
        ),
        child: BlocBuilder<SplashCubit, SplashState>(
          builder: (context, state) {
            switch (state) {
              case SplashStateInitial() || SplashStateLoading() || SplashStateError():
                return const SizedBox();
              case SplashStateDog():
                return Center(
                  child: CachedNetworkImage(
                    imageUrl: state.dog.url,
                    imageBuilder: (context, imageProvider) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.height / 2,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(image: imageProvider, fit: BoxFit.contain),
                          ),
                        ),
                        const Text(
                          'Amazing Random Dog',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    placeholder: (context, url) => const CircularProgressIndicator(),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
