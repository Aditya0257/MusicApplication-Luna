import 'package:luna/app/data/model/albums_model.dart';

import '../../../utils/error_handler/exception_handler.dart';
import '../network/network_requestor.dart';
import '../repo_response/response.dart';

class Repository{
  Future<RepoResponse<Albums>> getAlbumDetails(String id) async {
    final response = 
        await NetworkRequester.shared.get(path: 'https://api.spotify.com/v1/albums/$id/tracks',);
    if (response is APIException) {
      return RepoResponse(error: response);
    } else {
      return RepoResponse(data: Albums.fromJson(response));
    }
  }
}