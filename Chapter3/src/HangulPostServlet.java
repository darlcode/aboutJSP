

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HangulPostServlet
 */
@WebServlet("/hangul")
public class HangulPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HangulPostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

//  protected void doGet(HttpServletRequest request,
//  HttpServletResponse
//	 response) throws ServletException, 
//  IOException {
//  	// TODO Auto-generated method stub 
//  	String name = request.getParameter("name");
//  	response.setContentType("text/html;charset=UTF-8"); 
//  	PrintWriter out = response.getWriter();
//  	out.println("hagul Process = " + name);
//  }
    
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();
		out.println("hagul Process = " + name);
	}

}

