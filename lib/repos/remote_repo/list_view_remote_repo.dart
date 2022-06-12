import 'package:plando/repos/base_repo/base_repository.dart';

abstract class ListViewRemoteRepo implements BaseRepository{

  Future getServiceRequests();

}