import 'package:flutter/material.dart';
import 'package:test_app/core/utils/colors.dart';
import 'package:test_app/core/widgets/text.dart';
import 'package:test_app/features/domain/entities/flutter_repository_response.dart';

class RepositoryCard extends StatelessWidget {
  const RepositoryCard({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: bGray300,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextB(
        text: item.description!,
      ),
    );
  }
}
