import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../commons/widgets/all_dogs_gridview.dart';
import '../../../commons/widgets/breed_dropdown.dart';
import '../bloc/all_dogs_by_breed_cubit.dart';

class AllDogsByBreedPage extends StatelessWidget {
  const AllDogsByBreedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Images list by breed')),
      body: BlocBuilder<AllDogsByBreedCubit, AllDogsByBreedState>(
        builder: (context, state) {
          switch (state) {
            case AllDogsByBreedStateInitial() || AllDogsByBreedStateLoading():
              return const Center(child: CircularProgressIndicator());
            case AllDogsByBreedStateError():
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(child: Text(state.message)),
              );
            case AllDogsByBreedStateListOfBreed() || AllDogsByBreedStateDogs():
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BreedDropdown(
                      breeds: state.breeds,
                      onPressed: (selectedBreed, _) {
                        context
                            .read<AllDogsByBreedCubit>()
                            .getAllDogsByBreed(breed: selectedBreed?.name);
                      },
                    ),
                    if (state is AllDogsByBreedStateDogs) AllDogsGridView(dogs: state.dogs),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
