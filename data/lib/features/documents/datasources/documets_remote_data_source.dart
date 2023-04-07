import 'package:data/features/documents/models/unsorted_model.dart';
import 'package:dio/dio.dart';

abstract class DocumentsRemoteDataSource {
  Future<List<UnsortedModel>> getUnsorted();
}

class DocumentsRemoteDataSourceImpl implements DocumentsRemoteDataSource {
  DocumentsRemoteDataSourceImpl({required this.client});

  final Dio client;

  @override
  Future<List<UnsortedModel>> getUnsorted() async {
    final response = await client.get('photos?albumId=1');

    return (response.data as List)
        .map((e) => UnsortedModel.fromJson(e))
        .toList();
  }
}
