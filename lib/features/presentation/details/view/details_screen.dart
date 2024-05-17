import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/utils/colors.dart';
import 'package:test_app/core/utils/text_styles.dart';
import 'package:test_app/core/utils/utilities.dart';
import 'package:test_app/core/widgets/body.dart';
import 'package:test_app/core/widgets/network_image.dart';
import 'package:test_app/core/widgets/text.dart';
import 'package:test_app/features/domain/entities/flutter_repository_response.dart';
import 'package:test_app/features/presentation/details/bloc/details_bloc.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.details});

  final Item details;

  static Route<dynamic> route({required Item data}) =>
      MaterialPageRoute<dynamic>(builder: (_) => DetailsScreen(details: data));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsBloc()..add(GetDetails(itemData: details)),
      child: const DetailsView(),
    );
  }
}

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsBloc, DetailsState>(
      builder: (context, state) {
        return Body(
          child: state.itemDetails.owner != null
              ? ListView(
                  padding: const EdgeInsets.all(0),
                  children: [
                    const SizedBox(height: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 100,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.arrow_back,
                                  color: bBlack,
                                ),
                                TextB(
                                  text: "Back",
                                  textStyle: bHead6M,
                                  fontColor: bBlack,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const TextB(
                          text: "owner Picture: ",
                          textStyle: bBody1M,
                          fontColor: bGray700,
                        ),
                        SizedBox(
                          width: 100,
                          child: NetworkImageB(
                            imageUrl: state.itemDetails.owner!.avatarUrl!,
                            iconSize: 30,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const TextB(
                          text: "owner Name: ",
                          textStyle: bBody1M,
                          fontColor: bGray700,
                        ),
                        TextB(
                          text: state.itemDetails.owner!.login!,
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextB(
                          text: "Description: ",
                          textStyle: bBody1M,
                          fontColor: bGray700,
                        ),
                        TextB(
                          text: state.itemDetails.description!,
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const TextB(
                          text: "Updated Time: ",
                          textStyle: bBody1M,
                          fontColor: bGray700,
                        ),
                        TextB(
                          text: getDate(
                              value: "${state.itemDetails.updatedAt}",
                              formate: "dd-MMM-yyyy"),
                        ),
                      ],
                    ),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }
}
