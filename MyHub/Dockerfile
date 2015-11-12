FROM ronkorland/hub:2.48.2

ENV GRID_SERVLETS com.rk.selenium.servlets.AllProxiesJsonServlet,com.rk.selenium.servlets.ProxyStatusJsonServlet

COPY selenium-grid-contribs.jar /opt/selenium/selenium-grid-contribs.jar

USER root

RUN chown -R seluser /opt/selenium

USER seluser