
/*package filters;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import yesu.daos.CustomerDAO;
import yesu.models.CustomerUser;
import java.io.IOException;
import java.util.List;

@WebFilter("/userLogins")
@Component
public class AuthenticationFilter implements Filter {

    // Inject your DAO or Service here
    @Autowired
    private CustomerDAO customerDAO; 
    
    public AuthenticationFilter(CustomerDAO customerDAO) {
    	this. customerDAO=customerDAO;
    }
    
   
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization code, if needed
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        // Fetch the CustomerUser data from the DAO
       

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println(username+"in filter ");
        boolean validCredentials = false;
        List<CustomerUser> userList = customerDAO.getAllCustomerUsersDao();

        for (CustomerUser user : userList) {
            if (user.getUserName().equals(username) && user.getUserPassword().equals(password)) {
                validCredentials = true;
                break; // Credentials are valid, no need to continue the loop
            }
        }

        if (validCredentials) {
            // If credentials are valid, proceed with the request
            chain.doFilter(request, response);
        } else {
            // If credentials are not valid, you can redirect to an error page or login page
            request.getRequestDispatcher("/login").forward(request, response); // Change the URL as needed
        }
    }

    @Override
    public void destroy() {
        // Cleanup code, if needed
    }
}


*/