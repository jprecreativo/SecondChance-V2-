/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package secondChance.Servlets;

import java.io.IOException;
import java.util.List;
import java.util.Objects;
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

/**
 *
 * @author jose_
 */
@WebServlet(name = "FavouritesManagingServlet", urlPatterns = {"/Favourites/Add", "/Favourites/Remove"})
public class FavouriteItemsServlet extends HttpServlet {

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
        
        if("GET".equals(request.getMethod()))
        {
            String path = request.getServletPath();
            
            if(path.contains("Add"))
            {
                HttpSession session = request.getSession();
                List<ITEMS> favourites = (List<ITEMS>) session.getAttribute("favourites");
                Long itemID = Long.parseLong(request.getParameter("id"));
                String idQuery = "SELECT i FROM ITEMS i WHERE i.id = " + itemID;
                Query query = em.createQuery(idQuery);
                
                favourites.addAll(query.getResultList());
            }
            
            else if(path.contains("Remove"))
            {
                HttpSession session = request.getSession();
                List<ITEMS> favourites = (List<ITEMS>) session.getAttribute("favourites");
                Long itemID = Long.parseLong(request.getParameter("id"));
                int i = 0, n = favourites.size();
                
                while(i < n && !Objects.equals(favourites.get(i).getId(), itemID))
                    i++;
                
                if(i < n)
                    favourites.remove(i);
            }
        }
        
        RequestDispatcher rd = request.getRequestDispatcher("/FavouriteItems.jsp");
        rd.forward(request, response);
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
        processRequest(request, response);
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
        // processRequest(request, response);
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

    /* public void persist(Object object) {
        try {
            utx.begin();
            em.persist(object);
            utx.commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            throw new RuntimeException(e);
        }
    } */

}
