import 'package:dio/dio.dart';
import 'package:konfio_challenge/data/datasource/remote/dog_remote_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'dog_remote_client.g.dart';

@RestApi(baseUrl: "https://jsonblob.com/api/")
abstract class DogRemoteClient {
  factory DogRemoteClient(Dio dio) = _DogRemoteClient;

  @GET("1151549092634943488")
  Future<List<DogRemoteDto>> getDogs();
}
