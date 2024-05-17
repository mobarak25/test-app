import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_app/core/utils/colors.dart';
import 'package:test_app/core/utils/text_styles.dart';
import 'package:test_app/core/widgets/network_image.dart';
import 'package:test_app/core/widgets/text.dart';
import 'package:test_app/features/domain/entities/flutter_repository_response.dart';

class RepositoryCard extends StatelessWidget {
  const RepositoryCard({super.key, required this.item, required this.press});

  final Item item;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        press();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: bGray300,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Row(
              children: [
                const TextB(
                  text: "Owner Name: ",
                  textStyle: bBody1M,
                  fontColor: bGray700,
                ),
                Flexible(
                  child: TextB(
                    text: item.owner!.login!,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const TextB(
                  text: "Name: ",
                  textStyle: bBody1M,
                  fontColor: bGray700,
                ),
                Flexible(
                  child: TextB(
                    text: item.name!,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const TextB(
                  text: "Number Of Star: ",
                  textStyle: bBody1M,
                  fontColor: bGray700,
                ),
                TextB(
                  text: "${item.stargazersCount!}",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
