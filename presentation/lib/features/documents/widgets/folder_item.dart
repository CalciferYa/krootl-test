import 'package:core/assets/assets.dart';
import 'package:domain/features/documents/entities/folder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/l10n/localization.dart';
import 'package:presentation/theme/app_theme.dart';

class FolderItem extends StatelessWidget {
  const FolderItem({Key? key, required this.folder, required this.isLast})
      : super(key: key);

  final Folder folder;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                SvgPicture.asset(
                    folder.image != null ? folder.image! : Assets.folderSVG),
                SizedBox(width: 4),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        folder.name,
                        style: AppTheme.boldTextStyle,
                      ),
                      Text(
                        Localization.texts.categoryStatus(
                            folder.filesCount, folder.hoursCount),
                        style: AppTheme.normalTextStyle,
                      )
                    ],
                  ),
                ),
                if (folder.isCustomFolder) SvgPicture.asset(Assets.moreSVG)
              ],
            ),
          ),
          if (!isLast)
            Divider(
              color: AppTheme.lightGrey,
              height: 1,
            )
        ],
      ),
    );
  }
}
