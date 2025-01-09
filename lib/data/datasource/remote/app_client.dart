import 'package:dio/dio.dart';
import 'package:konfio_challenge/data/datasource/remote/dog_remote_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'app_client.g.dart';

@RestApi(baseUrl: "https://jsonblob.com/api/")
abstract class AppClient {
  factory AppClient(Dio dio) = _AppClient;

  @GET("1151549092634943488")
  Future<List<DogRemoteDto>> getDogs();
}
