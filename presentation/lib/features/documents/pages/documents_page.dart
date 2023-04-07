import 'package:auto_route/auto_route.dart';
import 'package:core/assets/assets.dart';
import 'package:core/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/features/documents/bloc/documents_cubit.dart';
import 'package:presentation/features/documents/widgets/category_item.dart';
import 'package:presentation/theme/app_theme.dart';

class DocumentsPage extends StatelessWidget implements AutoRouteWrapper {
  const DocumentsPage({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<DocumentsCubit>(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DocumentsCubit, DocumentsState>(
      builder: (_, state) {
        return Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                AppTheme.startBackgroundGradient,
                AppTheme.endBackgroundGradient
              ])),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 44),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                        width: 44,
                        height: 44,
                        image: AssetImage(Assets.avatar),
                      ),
                      SvgPicture.asset(Assets.moreSVG)
                    ],
                  ),
                  const SizedBox(height: 16),
                  Card(
                      margin: EdgeInsets.zero,
                      elevation: 0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: AppTheme.lightGrey,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Column(
                          children: [
                            for (int i = 0; i < state.categories.length; i++)
                              CategoryItem(
                                  category: state.categories[i],
                                  isLast: state.categories.length == i + 1),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
