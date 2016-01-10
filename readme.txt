
第7章  与web集成(不与spring集成的方式)

web3.0 Servlet 采用Annotation @WebServlet(name = "loginServlet", urlPatterns = "/login2")

使用maven tomcat7 plugin可运行项目 ，jetty运行时报500错误

用shiro-example-chapter7 web.xml的头部替换掉 maven项目web.xml的头信息(使用web3.0) 原来的不支持 <context-param>配置

***************************************************
<?xml version="1.0" encoding="UTF-8"?>
<web-app
        xmlns="http://java.sun.com/xml/ns/javaee"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://java.sun.com/xml/ns/javaee http://java.sun.com/xml/ns/javaee/web-app_3_0.xsd"
        version="3.0"
        metadata-complete="false">
*****************************************************

在web.xml配置 listener
	<listener>
		<listener-class>org.apache.shiro.web.env.EnvironmentLoaderListener</listener-class>
	</listener>
	此listener IniWebEnvironment会初始化web环境(默认读取WEB-INF/shiro.inx文件 如没有则找classpath:shiro.ini配置文件)
配置shiro的url拦截器和匹配方式
	<filter>
		<filter-name>ShiroFilter</filter-name>
		<filter-class>org.apache.shiro.web.servlet.ShiroFilter</filter-class>
	</filter>

	<filter-mapping>
		<filter-name>ShiroFilter</filter-name>
		<url-pattern>/*</url-pattern>
		<dispatcher>REQUEST</dispatcher>
		<dispatcher>FORWARD</dispatcher>
		<dispatcher>INCLUDE</dispatcher>
		<dispatcher>ERROR</dispatcher>
	</filter-mapping>
