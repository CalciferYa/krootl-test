import 'package:data/features/documents/models/unsorted_model.dart';
import 'package:domain/features/documents/entities/unsorted.dart';

extension UnsortedMapper on UnsortedModel {
  Unsorted toEntity() =>
      Unsorted(id: id, title: title, url: url, thumbnailUrl: thumbnailUrl);
}
