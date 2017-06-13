package seller;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSONSerializer;
import org.json.simple.JSONObject;


@WebServlet(urlPatterns = {"/PincodeAjax"})
public class PincodeAjax extends HttpServlet {
      static String Country=" ";
      static String State=" ";
      static String City=" ";
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String Pincode=request.getParameter("val");
            JSONObject json_message = new JSONObject();
            JSONObject json_message1 = new JSONObject();
            json_message1.clear();
       URL url = new URL("http://maps.googleapis.com/maps/api/geocode/json?address="+Pincode );
//                	  			String input ="<?xml version=\"1.0\" encoding=\"UTF-8\"?><SingleServiceInteface><Header><VERSION>1.0</VERSION><CALLID>39de507e01e40051ad44000825a05f30</CALLID><APPLICATION>DTV_CVP</APPLICATION><CLIENT>DIRECTV</CLIENT></Header><State><STATE_NAME>GETDTVCALLDATA</STATE_NAME><DIALED_NUMBER>193995</DIALED_NUMBER></State><ActionLog/></SingleServiceInteface>";
                	  			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                                conn.setDoOutput(true);
//                                conn.setRequestMethod("POST");
//                                conn.setRequestProperty("Content-Type", "text/json");
                                
                                OutputStream os = conn.getOutputStream();
//                                os.write(input.getBytes());
                                os.flush();
                               
                                System.out.println("HTTP code : "+ conn.getResponseCode());
               
 
                                BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
                               
                                String output;
//                                StringBuilder sb=new StringBuilder();
                                String sb="";
                                while ((output = br.readLine()) != null) {
                                    sb+=output;
                                                System.out.println(output);
                                }
                        net.sf.json.JSONObject json = (net.sf.json.JSONObject) JSONSerializer.toJSON(sb);
                        String status=(String)json.get("status");
                        if(status.equals("OK"))
                        {
			net.sf.json.JSONArray results=json.getJSONArray("results");
			net.sf.json.JSONObject rec = results.getJSONObject(0);
//                   ###################################################################
			net.sf.json.JSONArray address_components=rec.getJSONArray("address_components");
			for(int i=0;i<address_components.size();i++)
                        {
                            net.sf.json.JSONObject rec1 = address_components.getJSONObject(i);
                            //trace(rec1.getString("long_name"));
                            net.sf.json.JSONArray types=rec1.getJSONArray("types");
                            String comp=types.getString(0);
                            if(comp.equals("country"))
                                {
                                    Country=rec1.getString("long_name");
                                }
                            if(comp.equals("administrative_area_level_1"))
                                {
                                    State=rec1.getString("long_name");
                                }
                            if(comp.equals("administrative_area_level_2"))
                                {
                                    City=rec1.getString("long_name");
                                }
			}
                      if(Country.equals("India"))
                      {
                           if(!State.equals(" "))
                           {
                               if(!City.equals(" "))
                               {
                                json_message1.put("State",State);
                                json_message1.put("City", City);
                                out.print(json_message1);
                               }
                               else
                               {
                                   json_message.put("Message","Please Enter a valid Pincode");
                                   out.print(json_message);
                               }
                           }
                           else
                           {
                               json_message.put("Message","Please Enter a valid Pincode");
                               out.print(json_message);
                           }
                      }
                      else
                      {
                          json_message.put("Message","Please Enter a valid Pincode");
                          out.print(json_message);
                      }  
               }         
               else
               {
                   json_message.put("Message","Please Enter a valid Pincode");
                   out.print(json_message);
               }
                        Country=" ";
                        City=" ";
                        State=" ";
            System.out.println(json_message);
               conn.disconnect(); }
        }
    }

