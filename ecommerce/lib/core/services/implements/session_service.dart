import 'package:ecommerce/core/hive_database/daos/session_dao.dart';
import 'package:ecommerce/core/hive_database/entities/session/session_entity.dart';
import 'package:ecommerce/core/services/interfaces/isession_service.dart';
import 'package:ecommerce/core/utils/list_extension.dart';
import 'package:ecommerce/global/locator.dart';

class SessionService implements ISessionService {
  final _sessionDao = locator<SessionDao>();

  @override
  SessionEntity? getSessionById(String id) {
    return _sessionDao.getAll().firstOrDefault((x) => x.id == id);
  }

  @override
  List<SessionEntity> getAllSessions() {
    return _sessionDao.getAll();
  }

  @override
  Future updateSession(SessionEntity session) async {
    return await _sessionDao.update(session.id, session);
  }

  @override
  SessionEntity? getRunningSession() {
    return _sessionDao.getAll().firstOrDefault((x) => (x.isNeedReview ||
        (x.startSessionOn != null && x.endSessionOn == null)));
  }

  @override
  Future<void> removeSession(String sessionId) {
    // TODO: implement removeSession
    throw UnimplementedError();
  }
}
