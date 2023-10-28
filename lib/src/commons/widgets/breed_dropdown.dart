import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../application/extensions/buildcontext_extension.dart';
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
    if (widget.showSubBreed && selectedBreed != null && selectedSubBreed != null) {
      return context.translate.submitBreedSubBreedSelection(selectedBreed!.name, selectedSubBreed!);
    }

    if (selectedBreed != null) {
      return context.translate.submitBreedSelection(selectedBreed!.name);
    }

    return context.translate.disableSubmit;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(context.translate.breed),
            DropdownButton(
              key: const ValueKey('breedDropDown'),
              items: widget.breeds.map((breed) {
                return DropdownMenuItem(
                  value: breed,
                  child: Text(toBeginningOfSentenceCase(breed.name) ?? breed.name),
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
              Text(context.translate.subBreed),
              DropdownButton(
                key: const ValueKey('subBreedDropDown'),
                items: subBreeds?.map((subBreed) {
                  return DropdownMenuItem(
                    value: subBreed,
                    child: Text(toBeginningOfSentenceCase(subBreed) ?? subBreed),
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
