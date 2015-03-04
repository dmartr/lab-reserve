package es.upm.dit.isst.labreserve;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

import es.upm.dit.isst.labreserve.dao.ResourceDAO;
import es.upm.dit.isst.labreserve.dao.ResourceDAOImpl;

public class CreateResourceServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		System.out.println("Creating new resource ");
		User user = (User) req.getAttribute("user");
		if (user == null) {
			UserService userService = UserServiceFactory.getUserService();
			user = userService.getCurrentUser();
		}

		String name = checkNull(req.getParameter("name"));
		String state = checkNull(req.getParameter("state"));

		ResourceDAO dao = ResourceDAOImpl.getInstance();
		dao.add(name, state);

		resp.sendRedirect("/");
	}

	private String checkNull(String s) {
		if (s == null) {
			return "";
		}
		return s;
	}
} 