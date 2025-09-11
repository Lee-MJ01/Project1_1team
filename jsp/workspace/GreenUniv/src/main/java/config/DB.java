package config;

import java.sql.Connection;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public final class DB {
  private DB() {}
  public static Connection getConnection() {
    try {
      Context env = (Context) new InitialContext().lookup("java:comp/env");
      DataSource ds = (DataSource) env.lookup("jdbc/greendae1");
      return ds.getConnection();
    } catch (Exception e) {
      throw new RuntimeException("JNDI DataSource lookup failed: jdbc/greendae1", e);
    }
  }
}
