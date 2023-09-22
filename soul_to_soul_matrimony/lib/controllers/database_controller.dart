import 'package:mysql_client/mysql_client.dart';

class DatabaseController {
  static late MySQLConnection conn;

  static Future<MySQLConnection> connectoToDatabase() async {
    conn = await MySQLConnection.createConnection(
      host: '127.0.0.1',
      port: 3306,
      userName: 'root',
      password: 'root@mac',
      databaseName: 's2sm_test',
    );
    await conn.connect();
    return conn;
  }

  static void closeConnectionToDatabase([MySQLConnection? con]) async {
    if (con != null && con.connected) {
      con.close();
    } else {
      conn.close();
    }
  }

  static Future<IResultSet> executeQueryOnDatabase(
      MySQLConnection? con, String query) async {
    if (con != null && con.connected && query.isNotEmpty) {
      return await con.execute(query);
    } else {
      return await conn.execute(query);
    }
  }
}
