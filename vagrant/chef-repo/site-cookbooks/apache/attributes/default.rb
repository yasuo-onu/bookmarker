default["apache"]["domain_name"] = ""

default["apache"]["Timeout"] = 120
default["apache"]["KeepAlive"] = "On"
default["apache"]["KeepAliveTimeout"] = 120
default["apache"]["mpm_prefork_module"]["StartServers"] = 8
default["apache"]["mpm_prefork_module"]["MinSpareServers"] = 8
default["apache"]["mpm_prefork_module"]["MaxSpareServers"] = 64
default["apache"]["mpm_prefork_module"]["MaxClients"] = 256
default["apache"]["mpm_prefork_module"]["MaxRequestsPerChild"] = 5000
default["apache"]["ServerAdmin"] = "admin@nu.jp"
default["apache"]["ServerName"] = "localhost"
default["apache"]["ImgServerName"] = "localhost"
default["apache"]["DocumentRoot"] = "/var/www/bookmarker"
default["apache"]["Include"] = ["conf.d/virtualhost.conf"]

default["apache"]["APPLICATION_ENV"] = "development" #本番環境ではコメントアウトする
#default["apache"]["APPLICATION_ENV"] = "production" #本番環境ではコメントアウトを外す
default["apache"]["LogFormat"] = '%{%s}t\t%{%Y%m%d}t\t%{%H%M%S}t\t%{X-Forwarded-For}i\t%B\t%D\t%T\t%>s\t%X\t%A\t%{Host}i\t%r\t%{X-DCMGUID}i\t%{x-up-subno}i\t%{x-jphone-uid}i\t%{Cookie}i\t%{User-Agent}i\t%{Referer}i\t%{X_NU_LOGS_LOGIN_USER_ID}e\t%{X_NU_LOGS_LOGIN_TYPE}e\t%{X_NU_LOGS_APPLICATION_USER_ID}e\t%{X_NU_LOGS_CONTROLLER_NAME}e\t%{X_NU_LOGS_ACTION_NAME}e\t%{X_NU_LOGS_EXT_PARAMETERS}e'
