import 'package:floor/floor.dart';
import 'package:konfio_challenge/data/datasource/local/dog_local_dto.dart';

@dao
abstract class DogDao {
  @Query('SELECT * FROM dogs')
  Future<List<DogLocalDto>> getDogs();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertDogs(List<DogLocalDto> dogs);
}
