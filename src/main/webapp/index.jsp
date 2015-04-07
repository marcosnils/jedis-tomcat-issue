<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="redis.clients.jedis.JedisPool"%>
<%@page import="redis.clients.jedis.Jedis"%>
<html>
<body>
	<%
		JedisPool pool = (JedisPool) getServletContext().getAttribute(
				"pool");
		if (pool != null) {
			for (int i = 0; i < 10000; i++) {
				Jedis jedis = pool.getResource();
				try {
					jedis.set("clave" + i, String.valueOf(i));
				} finally {
					jedis.close();
				}

			}
		}
	%>
	<h2>Hello World!</h2>
</body>
</html>
