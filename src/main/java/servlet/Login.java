package servlet;

import dao.AlumnowebJpaController;
import dto.Alumnoweb;
import java.io.IOException;
import java.io.PrintWriter;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.BcryptJava;
import utils.JwtUtil;

/**
 *
 * @author HATSUMY
 */
@WebServlet(name = "Login", urlPatterns = {"/login"})
public class Login extends HttpServlet {

    AlumnowebJpaController aluDAO = new AlumnowebJpaController();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        JsonReader jsonReader = Json.createReader(request.getReader());
        JsonObject jsonObject = jsonReader.readObject();
        jsonReader.close();

        String dni = jsonObject.getString("ndni");
        String password = jsonObject.getString("password");
        
        //Encontramos al usuario por el DNI
        Alumnoweb alumno = aluDAO.findAlumnoByDNI(dni);               
        
        if (alumno == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }
        
        System.out.println(password);
        System.out.println(alumno.getPassEstd());
        boolean flag = BcryptJava.checkPassword(password, alumno.getPassEstd());
        System.out.println(flag);
        
        if (!flag) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        //Para mandar respuesta
        JsonObject jsonResponse;
        String token = JwtUtil.generarToken(alumno.getLogiEstd());

        jsonResponse = Json.createObjectBuilder()
                .add("success", true)
                .add("username", alumno.getLogiEstd())
                .add("token", token)
                .build();
        out.print(jsonResponse.toString());
        out.flush();
    }
}
