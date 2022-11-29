



package SQL;

import com.mysql.cj.jdbc.MysqlDataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class ConexionBD extends MysqlDataSource {

    private static final String URL = "jdbc:mysql://localhost/GIMNASIO";
    private static final String USUARIO = "root";
    private static final String CLAVE = "12345";


    private static ConexionBD instancia = null;

    private ConexionBD() throws SQLException {
        setURL(URL);
        setUser(USUARIO);
        setPassword(CLAVE);
        setUseSSL(false);
        setAllowPublicKeyRetrieval(true);
    }

    public static ConexionBD obtenerInstancia() throws SQLException {
        if (instancia == null) {
            instancia = new ConexionBD();
        }
        return instancia;
    }

   
    public Connection conectar() throws SQLException {
        return getConnection();
    }

}
