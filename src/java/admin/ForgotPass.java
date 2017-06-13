package admin;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/ForgotPass"})
public class ForgotPass extends HttpServlet {

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String to=request.getParameter("forgot_email");
            String ip = getServletContext().getInitParameter("ip"); 
            if(Validate.checkStatus(to))
               {
                try
                {
                   if(Validate.checkEmail(to))
                   {
                    String host="smtp.gmail.com";
                    String user="baazaronline4@gmail.com";
                    String pass="BaazarT2";
                    String from="baazaronline4@gmail.com";
                    String subject="YOUR BAAZARONLINE PASSWORD";
                    String messageText="your password is+"+ Validate.st;
                    boolean sessionDebug=false;
                    
                    
                    Properties props=System.getProperties();
                    
                    props.put("mail.smtp.starttls.enable","true");
                    props.put("mail.smtp.host",host);
                    props.put("mail.smtp.port","587");
                    props.put("mail.smtp.auth","true");
                    props.put("mail.smtp.starttls.required","true");
                    
                    java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
                    Session mailSession=Session.getDefaultInstance(props, null);
                    mailSession.setDebug(sessionDebug);
                    MimeMessage msg = new MimeMessage(mailSession);
                    msg.setFrom(new InternetAddress(from));
                    InternetAddress address=(new InternetAddress(to));
                    msg.setRecipient(Message.RecipientType.TO, address);
                    msg.setSubject(subject);
                    msg.setSentDate(new Date());
                    msg.setText(messageText);
                    
                    Transport transport = mailSession.getTransport("smtp");
                    transport.connect(host,user,pass);
                    transport.sendMessage(msg, msg.getAllRecipients());
                    transport.close();
                    RequestDispatcher rs = request.getRequestDispatcher("login.jsp");
                    rs.include(request, response); 
                    out.print("<script>alert('Mesage Send Successfully');</script>");
                }
                   else
                   {
                       RequestDispatcher rs = request.getRequestDispatcher("login.jsp");
                       rs.include(request, response); 
                       out.print("<script>alert('Invalid Email');</script>");
                   }
            }
                catch(MessagingException e)
                {
                    out.println(e);
                }
           }
          else
              {
                  RequestDispatcher rs = request.getRequestDispatcher("login.jsp");
                  rs.include(request, response);
                  out.print("<script>alert('Your account is not Active please contact to Admin');</script>");
              }
        }
        }
    }

