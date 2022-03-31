
import 'package:ecommerce/core/hive_database/entities/session/session_entity.dart';

abstract class ISessionService {
  SessionEntity? getSessionById(String id);
  SessionEntity? getRunningSession();
  List<SessionEntity> getAllSessions();
  Future<void> updateSession(SessionEntity session);
  Future<void> removeSession(String sessionId);
}
