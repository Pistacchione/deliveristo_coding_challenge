import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../commons/widgets/all_dogs_gridview.dart';
import '../../../commons/widgets/breed_dropdown.dart';
import '../bloc/all_dogs_by_breed_subbreed_cubit.dart';

class AllDogsByBreedSubBreedPage extends StatelessWidget {
  const AllDogsByBreedSubBreedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Images list by breed')),
      body: BlocBuilder<AllDogsByBreedSubBreedCubit, AllDogsByBreedSubBreedState>(
        builder: (context, state) {
          switch (state) {
            case AllDogsByBreedSubBreedStateInitial() || AllDogsByBreedSubBreedStateLoading():
              return const Center(child: CircularProgressIndicator());
            case AllDogsByBreedSubBreedStateError():
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(child: Text(state.message)),
              );
            case AllDogsByBreedSubBreedStateListOfBreed() || AllDogsByBreedSubBreedStateDogs():
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BreedDropdown(
                      showSubBreed: true,
                      breeds: state.breeds,
                      onPressed: (selectedBreed, selectedSubBreed) {
                        context.read<AllDogsByBreedSubBreedCubit>().getAllDogsByBreed(
                              breed: selectedBreed?.name,
                              subBreed: selectedSubBreed,
                            );
                      },
                    ),
                    if (state is AllDogsByBreedSubBreedStateDogs) AllDogsGridView(dogs: state.dogs),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
