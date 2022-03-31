
import 'package:ecommerce/core/hive_database/entities/session/session_entity.dart';
import 'package:ecommerce/core/utils/list_extension.dart';


import 'base_dao.dart';

class SessionDao extends BaseDao<SessionEntity> {
  SessionEntity? findSessionNotEnded() {
    return box.values.firstOrDefault((x) => x.endSessionOn != null);
  }

  List<SessionEntity> getPushedEndOfDaySessions() {
    return box.values.where((x) => (x.pushedEndOfDay)).toList();
  }

}
