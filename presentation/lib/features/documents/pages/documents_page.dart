import 'package:auto_route/auto_route.dart';
import 'package:core/assets/assets.dart';
import 'package:core/di/locator.dart';
import 'package:domain/features/documents/entities/folder.dart';
import 'package:domain/features/documents/entities/unsorted.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/features/documents/bloc/documents_cubit.dart';
import 'package:presentation/features/documents/widgets/folder_item.dart';
import 'package:presentation/features/documents/widgets/unsorted_item.dart';
import 'package:presentation/l10n/localization.dart';
import 'package:presentation/theme/app_theme.dart';
import 'package:sliver_tools/sliver_tools.dart';

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
    BlocProvider.of<DocumentsCubit>(
      context,
    ).getUnsorted();

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
            body: SafeArea(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(
                              width: 44,
                              height: 44,
                              image: AssetImage(Assets.avatar),
                            ),
                            SvgPicture.asset(Assets.moreBackgroundSVG)
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
                                  for (int i = 0;
                                      i < state.mainFolders.length;
                                      i++)
                                    FolderItem(
                                        folder: state.mainFolders[i],
                                        isLast:
                                            state.mainFolders.length == i + 1),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                  bottomDetailsSheet(state)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget bottomDetailsSheet(DocumentsState state) {
    return LayoutBuilder(builder: (context, constraints) {
      return DraggableScrollableSheet(
        initialChildSize: (constraints.maxHeight - 418) / constraints.maxHeight,
        minChildSize: (constraints.maxHeight - 418) / constraints.maxHeight,
        maxChildSize: (constraints.maxHeight - 73) / constraints.maxHeight,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: AppTheme.lightBackground,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                searchBar(),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Localization.texts.pinnedFolders(3),
                          style: AppTheme.normalTextStyle,
                        ),
                        Text(
                          Localization.texts.hide,
                          style: AppTheme.buttonTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                sliverPinnedFolders(state.pinnedFolders),
                SliverToBoxAdapter(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        Localization.texts.unsorted("23 JUL 2020"),
                        style: AppTheme.normalTextStyle,
                      )),
                ),
                if (state is UnsortedDocumentsState)
                  sliverUnsorted(state.unsorted)
              ],
            ),
          );
        },
      );
    });
  }

  Widget sliverUnsorted(List<Unsorted> unsorted) {
    return SliverPadding(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 26),
        sliver: SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return UnsortedItem(unsorted: unsorted[index]);
            },
            childCount: unsorted.length,
          ),
        ));
  }

  Widget sliverPinnedFolders(List<Folder> pinnedFolders) {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 26),
      sliver: SliverStack(
        children: [
          SliverPositioned.fill(
              child: Container(
                  decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: AppTheme.lightGrey,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                      )))),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return FolderItem(
                    folder: pinnedFolders[index],
                    isLast: pinnedFolders.length == index + 1);
              },
              childCount: pinnedFolders.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget searchBar() {
    return SliverAppBar(
      expandedHeight: 76,
      collapsedHeight: 76,
      shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16))),
      backgroundColor: AppTheme.lightBackground,
      flexibleSpace: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
        child: Row(
          children: [
            Expanded(
              child: Container(
                  height: 36,
                  decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: AppTheme.lightGrey,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                      )),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      SvgPicture.asset(Assets.searchSVG),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        Localization.texts.search,
                        style: AppTheme.normalTextStyle,
                      )
                    ],
                  )),
            ),
            SizedBox(
              width: 12,
            ),
            SvgPicture.asset(Assets.sortSVG),
            SizedBox(
              width: 12,
            ),
            SvgPicture.asset(Assets.filterSVG),
          ],
        ),
      ),
      pinned: true,
    );
  }
}
