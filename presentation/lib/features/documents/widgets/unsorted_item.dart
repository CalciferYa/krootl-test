import 'package:domain/features/documents/entities/unsorted.dart';
import 'package:flutter/material.dart';
import 'package:presentation/theme/app_theme.dart';

class UnsortedItem extends StatelessWidget {
  const UnsortedItem({Key? key, required this.unsorted}) : super(key: key);

  final Unsorted unsorted;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.zero,
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: AppTheme.lightGrey,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            children: [
              SizedBox(
                height: constraints.maxHeight * 0.60,
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(unsorted.url.toString()),
                        fit: BoxFit.cover),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(8)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      unsorted.title.toString(),
                      style: AppTheme.boldTextStyle
                          .copyWith(overflow: TextOverflow.ellipsis),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "23 Jul 2020",
                      style: AppTheme.normalTextStyle,
                    )
                  ],
                ),
              ),
            ],
          );
        }));
  }
}
