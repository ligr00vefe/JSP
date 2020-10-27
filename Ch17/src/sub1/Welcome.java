package sub1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.PortableServer.RequestProcessingPolicy;

/**
 * Servlet implementation class Welcome
 */
@WebServlet("/welcome.do")
public class Welcome extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		System.out.println("Welcome init!!!");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestProc(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestProc(request, response);
	}
	
	private void requestProc(HttpServletRequest request, HttpServletResponse response) throws IOException {
	
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>HelloServlet</title>");
		out.println("<meta charset='utf-8'>");
		out.println("</head>");		
		out.println("<body>");	
		out.println("<h1>Hello Servlet!!!</h1>");	
		out.println("<a href='#'>welcome</a>");			
		out.println("<a href='#'>greeting</a>");			
		out.println("</body>");		
		out.println("</html>");
	}

}
