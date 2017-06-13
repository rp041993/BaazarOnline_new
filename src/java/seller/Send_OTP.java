package seller;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/Send_OTP"})
public class Send_OTP extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String username = "baazar";
            String password = "bol123456";

    // Set the attributes of the message to send
    
            String sendername = "BZRONL";
            String mobile       = request.getParameter("u_number");
            String Name         = request.getParameter("login_name");
            String Email        =  request.getParameter("u_email");
            
    // Random Number
                java.util.Random generator = new java.util.Random();
		generator.setSeed(System.currentTimeMillis());
		int i = generator.nextInt(1000000) % 1000000;
		
		java.text.DecimalFormat f = new java.text.DecimalFormat("000000");
              String  randomnum = (String)f.format(i);
              System.out.print(randomnum);
////////////////////
            String message="Your BaazarOnline Mobile Number Verification code is-"+randomnum;
            HttpSession session = request.getSession(true);
           
                session.setAttribute("mobile",mobile);
                session.setAttribute("Name",Name);
                session.setAttribute("Email",Email);
                session.setAttribute("Random",randomnum);
            
            try {

      // Build URL encoded query string
      String encoding = "UTF-8";
      String queryString = "username=" + URLEncoder.encode(username, encoding)
        + "&password=" + URLEncoder.encode(password, encoding)
        + "&mobile=" + URLEncoder.encode(mobile, encoding)
        + "&sendername=" + URLEncoder.encode(sendername, encoding)
        + "&message=" + URLEncoder.encode(message, encoding);

      // Send request to the API servers over HTTPS
      URL url = new URL("http://sms.dhlbharat.com/sms_api/sendsms.php?");
      URLConnection conn = url.openConnection();
      conn.setDoOutput(true);
      OutputStreamWriter wr = 
        new OutputStreamWriter(conn.getOutputStream());
      wr.write(queryString);
      wr.flush();

      // The response from the gateway is going to look like this:
      // id: a4c5ad77ad6faf5aa55f66a
      // 
      // In the event of an error, it will look like this:
      // err: invalid login credentials
      BufferedReader rd = new BufferedReader(
        new InputStreamReader(conn.getInputStream()));
      String result = rd.readLine();
      wr.close();
      rd.close();
      
      RequestDispatcher rs = request.getRequestDispatcher("Insert_OTP.jsp");
      rs.include(request, response);
    } 
    catch (Exception e) {
    }
        }
    }
}
