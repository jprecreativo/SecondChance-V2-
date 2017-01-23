/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package secondChance.Servlets;

import java.io.IOException;
import java.util.List;
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
import secondChance.Entities.ITEMS;
import secondChance.Entities.USER_DATA;

/**
 *
 * @author jose_
 */
@WebServlet(name = "NewItemServlet", urlPatterns = {"/NewItem"})
public class NewItemServlet extends HttpServlet {

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
       
        if("POST".equals(request.getMethod()))
        {
            ITEMS newItem = new ITEMS();
            
            newItem.setCategory(request.getParameter("categorySelect"));
            newItem.setName(request.getParameter("name"));
            newItem.setPrice(Float.parseFloat(request.getParameter("price")));
            
            if(!request.getParameter("stateSelect").equals("NO SPECIFIED"))
                newItem.setStatus(request.getParameter("stateSelect"));
            
            if(!"".equals(request.getParameter("description")))
                newItem.setDescription(request.getParameter("description"));
            
            if(!"".equals(request.getParameter("ZC")))
                newItem.setZC(Integer.parseInt(request.getParameter("ZC")));
            
            if(!"".equals(request.getParameter("age")))
                newItem.setAge(Integer.parseInt(request.getParameter("age")));
            
            newItem.setOwner(this.getSessionUser(request.getSession()));
            
            this.persist(newItem);
            
            RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
            rd.forward(request, response);
        }
        
        RequestDispatcher rd = request.getRequestDispatcher("NewItem.jsp");
        rd.forward(request, response);
    }

    private USER_DATA getSessionUser(HttpSession session)
    {
        String emailQuery = "SELECT u FROM USER_DATA u WHERE u.email = :fullEmail";
        String fullEmail = session.getAttribute("fullEmail").toString();
        Query q = em.createQuery(emailQuery).setParameter("fullEmail", fullEmail);
        List<USER_DATA> theUser = q.getResultList();
        
        return theUser.get(0);
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
