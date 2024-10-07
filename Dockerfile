FROM maven as build
WORKDIR /webapp
COPY . .
RUN mvn clean install
FROM tomcat
WORKDIR /usr/local/tomcat/webapps/
COPY --from=build /webapp/target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh","run"]
