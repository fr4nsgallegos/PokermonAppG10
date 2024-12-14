import 'package:dio/dio.dart';
import 'package:pokemonappg10/models/task_model.dart';
import 'package:retrofit/retrofit.dart';

part 'pokemon_api.g.dart';

@RestApi(baseUrl: "https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/")
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @GET("/tasks")
  Future<List<TaskModel>> getTasks();

  @POST('/tasks')
  Future<TaskModel> createTask(@Body() TaskModel task);
}
