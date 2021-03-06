/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package secondChance.Servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import secondChance.Bcrypt.BCrypt;
import secondChance.Entities.ITEMS;
import secondChance.Entities.USER_DATA;

/**
 *
 * @author jose_
 */
@WebServlet(name = "SignUpServlet", urlPatterns = {"/SignUp/*"})
public class SignUpServlet extends HttpServlet {

    @PersistenceContext(unitName = "SecondChancePU")
    private EntityManager em;
    @Resource
    private javax.transaction.UserTransaction utx;

    
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if("POST".equals(request.getMethod()) && this.validate(request.getParameter("email")))
        {
            USER_DATA newUser = new USER_DATA();

            newUser.setEmail(request.getParameter("email"));
            newUser.setPass(this.encrypt(request.getParameter("pass")));
            
            if(!"".equals(request.getParameter("fullName")))
                newUser.setName(request.getParameter("fullName"));
            
            if(!"".equals(request.getParameter("address")))
                newUser.setAddress(request.getParameter("address"));
            
            if(!"".equals(request.getParameter("ZC")))
                newUser.setZC(Integer.valueOf(request.getParameter("ZC")));
            
            if(!"".equals(request.getParameter("phoneNumber")))
                newUser.setPhoneNumber(Integer.valueOf(request.getParameter("phoneNumber")));

            this.persist(newUser);
            
            StringTokenizer userName = new StringTokenizer(request.getParameter("email"), "@");
            HttpSession session = request.getSession();
            session.setAttribute("fullEmail", request.getParameter("email"));
            session.setAttribute("email", userName.nextToken());
            List<ITEMS> favourites = new ArrayList();
            session.setAttribute("favourites", favourites);
        }
        
        RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
        rd.forward(request, response);
    }
    
    private boolean validate(String email)
    {
        String queryEmail = "SELECT u FROM USER_DATA u WHERE u.email = :email";
        Query q = em.createQuery(queryEmail).setParameter("email", email);
        List<USER_DATA> theUser = q.getResultList();
        
        return theUser.isEmpty();
    }
    
    private String encrypt(String pass)
    {
        return BCrypt.hashpw(pass, BCrypt.gensalt(12));
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public void persist(Object object) {
        try {
            utx.begin();
            em.persist(object);
            utx.commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            throw new RuntimeException(e);
        }
    }

}
