package DAO;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class DBCPInitListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        try {
            ServletContext context = servletContextEvent.getServletContext();
            String drivers = context.getInitParameter("jdbcdriver");
            Class.forName(drivers);
        }catch (Exception e){}
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}
