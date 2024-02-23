import 'package:flutter/material.dart';
import 'package:flutter_resume_builder/core/data/constants.dart';
import 'package:flutter_resume_builder/models/resume.dart';

class ResumeTileWidget extends StatelessWidget {
  final Resume? model;
  final void Function() onDelete;
  final void Function() onEdit;
  const ResumeTileWidget({
    super.key,
    required this.model,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(defaultPaddingValue),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(defaultRadiusValue),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(model?.jobTitle ?? nullValue),
              const Spacer(),
              GestureDetector(
                onTap: onEdit,
                child: const Icon(Icons.edit),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: onDelete,
                child: const Icon(Icons.delete),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(model?.name ?? nullValue),
              const Spacer(),
              Text(model?.experience ?? nullValue),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
