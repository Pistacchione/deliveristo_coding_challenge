import 'package:flutter/material.dart';

import '../models/breed.dart';

class BreedDropdown extends StatefulWidget {
  final List<Breed> breeds;
  final void Function(Breed? selectedBreed, String? selectedSubBreed)? onPressed;
  final bool showSubBreed;
  const BreedDropdown({required this.breeds, this.onPressed, this.showSubBreed = false, super.key});

  @override
  State<BreedDropdown> createState() => _BreedDropdownState();
}

class _BreedDropdownState extends State<BreedDropdown> {
  Breed? selectedBreed;
  String? selectedSubBreed;
  List<String>? subBreeds;

  bool get shouldSubmit {
    var enableCondition = selectedBreed != null;
    if (widget.showSubBreed) {
      enableCondition = enableCondition && selectedSubBreed != null;
    }

    return enableCondition;
  }

  String get submitButtonText {
    var text = 'Get Dog';
    if (widget.showSubBreed) {
      if (selectedBreed != null && selectedSubBreed != null) {
        text += ' by $selectedSubBreed ${selectedBreed?.name}';
      }
    } else if (selectedBreed != null) {
      text += ' by ${selectedBreed?.name}';
    }

    return text;
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
                  subBreeds = value?.subBreeds;
                  selectedSubBreed = null;
                });
              },
            ),
          ],
        ),
        if (widget.showSubBreed)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Sub Breed'),
              DropdownButton(
                key: const ValueKey('subBreedDropDown'),
                items: subBreeds?.map((breed) {
                  return DropdownMenuItem(
                    value: breed,
                    child: Text(breed),
                  );
                }).toList(),
                value: selectedSubBreed,
                onChanged: (value) {
                  setState(() {
                    selectedSubBreed = value;
                  });
                },
              ),
            ],
          ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: shouldSubmit
                    ? () {
                        widget.onPressed?.call(selectedBreed, selectedSubBreed);
                      }
                    : null,
                child: Text(submitButtonText),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
