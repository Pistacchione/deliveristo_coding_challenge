import 'package:flutter/material.dart';

import '../models/breed.dart';

class BreedDropdown extends StatefulWidget {
  final List<Breed> breeds;
  final void Function(Breed? selectedBreed)? onPressed;
  const BreedDropdown({required this.breeds, this.onPressed, super.key});

  @override
  State<BreedDropdown> createState() => _BreedDropdownState();
}

class _BreedDropdownState extends State<BreedDropdown> {
  Breed? selectedBreed;

  String get submitButtonText {
    if (selectedBreed != null) {
      return 'Get Dog by ${selectedBreed?.name}';
    }

    return 'Get Dog';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Breed'),
            DropdownButton(
              key: const ValueKey('breedDropDown'),
              items: widget.breeds.map((breed) {
                return DropdownMenuItem(
                  value: breed,
                  child: Text(breed.name),
                );
              }).toList(),
              value: selectedBreed,
              onChanged: (value) {
                setState(() {
                  selectedBreed = value;
                });
              },
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: selectedBreed != null ? () {
                  widget.onPressed?.call(selectedBreed);
                } : null,
                child: Text(submitButtonText),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
