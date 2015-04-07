package web;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import redis.clients.jedis.JedisPool;

public class TestListener implements ServletContextListener {

	public void contextDestroyed(ServletContextEvent sce) {
		JedisPool pool = (JedisPool) sce.getServletContext().getAttribute("pool");
		pool.destroy();
		System.out.println("Destroyed");

	}

	public void contextInitialized(ServletContextEvent sce) {
		JedisPool jp = new JedisPool();
		sce.getServletContext().setAttribute("pool", jp);

	}

}
