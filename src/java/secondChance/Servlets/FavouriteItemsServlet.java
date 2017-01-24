package secondChance.Servlets;

import java.io.IOException;
import java.util.Enumeration;
import java.util.List;
import java.util.StringTokenizer;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import secondChance.Entities.ITEMS;

/**
 *
 * @author jose_
 */

@WebServlet(name = "FavouriteItemsServlet", urlPatterns = {"/FavouriteItems/*"})
public class FavouriteItemsServlet extends HttpServlet 
{
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
     * @throws java.io.IOException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        Enumeration<String> params = request.getParameterNames();
        TypedQuery<ITEMS> query;
        RequestDispatcher rd;
        List<ITEMS> li;
        Query q;
        
        if(params.hasMoreElements())   // Request has parameters.
        {
            if(filtersParamsAreCorrect(request))   // Parameters are correct.
            {
                String cat = request.getParameter(params.nextElement());
                String price = request.getParameter(params.nextElement());
                String zipCode = request.getParameter(params.nextElement());

                if("ALL".equals(cat) && "ALL".equals(price) && "".equals(zipCode))   // No filter.
                {
                    query = em.createNamedQuery("ITEMS.findAll", ITEMS.class);
                    li = query.getResultList();
                    request.setAttribute("items", li);
                    rd = request.getRequestDispatcher("/WEB-INF/ItemsTable.jsp");
                    rd.forward(request, response);
                }

                else if(!"ALL".equals(cat) && "ALL".equals(price) && "".equals(zipCode))   // Filter by category.
                {
                    query = em.createNamedQuery("ITEMS.findByCategory", ITEMS.class).setParameter("category", cat);
                    li = query.getResultList();
                    request.setAttribute("items", li);
                    rd = request.getRequestDispatcher("/WEB-INF/ItemsTable.jsp");
                    rd.forward(request, response);
                }

                else if("ALL".equals(cat) && !"ALL".equals(price) && "".equals(zipCode))   // Filter by price.
                {
                    StringTokenizer priceToken = new StringTokenizer(price, "-");
                    double priceLow = Double.parseDouble(priceToken.nextToken());
                    double priceHigh = Double.parseDouble(priceToken.nextToken());

                    query = em.createNamedQuery("ITEMS.findByPrice", ITEMS.class).setParameter("priceLow", priceLow);
                    query.setParameter("priceHigh", priceHigh);
                    li = query.getResultList();
                    request.setAttribute("items", li);
                    rd = request.getRequestDispatcher("/WEB-INF/ItemsTable.jsp");
                    rd.forward(request, response);
                }

                else if("ALL".equals(cat) && "ALL".equals(price) && !"".equals(zipCode))   // Filter by zip code.
                {
                    query = em.createNamedQuery("ITEMS.findByZC", ITEMS.class).setParameter("ZC", Integer.parseInt(zipCode));
                    li = query.getResultList();
                    request.setAttribute("items", li);
                    rd = request.getRequestDispatcher("/WEB-INF/ItemsTable.jsp");
                    rd.forward(request, response);
                }

                else if(!"ALL".equals(cat) && !"ALL".equals(price) && !"".equals(zipCode))   // Filter by all.
                {
                    StringTokenizer priceToken = new StringTokenizer(price, "-");
                    double priceLow = Double.parseDouble(priceToken.nextToken());
                    double priceHigh = Double.parseDouble(priceToken.nextToken());

                    query = em.createNamedQuery("ITEMS.findByAll", ITEMS.class).setParameter("ZC", Integer.parseInt(zipCode));
                    query.setParameter("category", cat);
                    query.setParameter("priceLow", priceLow);
                    query.setParameter("priceHigh", priceHigh);
                    li = query.getResultList();
                    request.setAttribute("items", li);
                    rd = request.getRequestDispatcher("/WEB-INF/ItemsTable.jsp");
                    rd.forward(request, response);
                }

                else if(!"ALL".equals(cat) && !"ALL".equals(price) && "".equals(zipCode))   // Filter by category and price.
                {
                    StringTokenizer priceToken = new StringTokenizer(price, "-");
                    double priceLow = Double.parseDouble(priceToken.nextToken());
                    double priceHigh = Double.parseDouble(priceToken.nextToken());

                    String queryString = "SELECT i FROM ITEMS i WHERE i.category = :category";
                    queryString += " AND :priceLow <= i.price AND i.price <= :priceHigh";
                    q = em.createQuery(queryString);
                    q.setParameter("category", cat);
                    q.setParameter("priceLow", priceLow);
                    q.setParameter("priceHigh", priceHigh);
                    li = q.getResultList();
                    request.setAttribute("items", li);
                    rd = request.getRequestDispatcher("/WEB-INF/ItemsTable.jsp");
                    rd.forward(request, response);
                }

                else if(!"ALL".equals(cat) && "ALL".equals(price) && !"".equals(zipCode))   // Filter by category and zip code.
                {
                    String queryString = "SELECT i FROM ITEMS i WHERE i.category = :category";
                    queryString += " AND i.ZC = :ZC";
                    q = em.createQuery(queryString);
                    q.setParameter("category", cat);
                    q.setParameter("ZC", Integer.parseInt(zipCode));
                    li = q.getResultList();
                    request.setAttribute("items", li);
                    rd = request.getRequestDispatcher("/WEB-INF/ItemsTable.jsp");
                    rd.forward(request, response);
                }

                else if("ALL".equals(cat) && !"ALL".equals(price) && !"".equals(zipCode))   // Filter by price and zip code.
                {
                    StringTokenizer priceToken = new StringTokenizer(price, "-");
                    double priceLow = Double.parseDouble(priceToken.nextToken());
                    double priceHigh = Double.parseDouble(priceToken.nextToken());

                    String queryString = "SELECT i FROM ITEMS i WHERE i.ZC = :ZC";
                    queryString += " AND :priceLow <= i.price AND i.price <= :priceHigh";
                    q = em.createQuery(queryString);
                    q.setParameter("priceLow", priceLow);
                    q.setParameter("priceHigh", priceHigh);
                    q.setParameter("ZC", Integer.parseInt(zipCode));
                    li = q.getResultList();
                    request.setAttribute("items", li);
                    rd = request.getRequestDispatcher("/WEB-INF/ItemsTable.jsp");
                    rd.forward(request, response);
                }
            }
            
            else   // There was errors in parameters.
            {
                rd = request.getRequestDispatcher("/index.jsp");
                rd.forward(request, response);
            }
        }
        
        else
        {
            query = em.createNamedQuery("ITEMS.findAll", ITEMS.class);
            li = query.getResultList();
            request.setAttribute("items", li);
            rd = request.getRequestDispatcher("/ViewItems.jsp");
            rd.forward(request, response);
        }
    }
    
    boolean filtersParamsAreCorrect(HttpServletRequest request)
    {
        return request.getParameter("isAJAX").equals("TRUE");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws java.io.IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws java.io.IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() 
    {
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
