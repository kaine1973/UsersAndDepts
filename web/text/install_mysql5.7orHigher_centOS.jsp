<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<title>centos7 安装mysql5.7:</title>
<body>
<strong>centos7 安装mysql5.7:</strong><br/>

1. 下载mysql的 yum repo  http://dev.mysql.com/downloads/repo/yum/<br/>
	wget https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm<br/>
2. 本地安装 yum 仓库<br/>
	sudo yum localinstall mysql57-community-release-el7-11.noarch.rpm<br/>
3. 查看repolist里mysql项，其中启用的mysql版本<br/>
	yum repolist all | grep mysql<br/>
	使用命令激活需要版本（5.7默认激活的）<br/>
	sudo yum-config-manager --disable mysql57-community<br/>
	sudo yum-config-manager --enable mysql56-community<br/>
	再次查看已经激活的mysql版本<br/>
	yum repolist enabled | grep mysql<br/>
4. 安装mysql<br/>
	sudo yum install mysql-community-server<br/>
5. 启动mysql服务<br/>
	sudo service mysqld start<br/>
	sudo service mysqld status<br/>
<br/>
6. 更改初始密码<br/>
	1）查看 sudo grep 'temporary password' /var/log/mysqld.log<br/>
	2）登陆 mysql -uroot -p<br/>
	3）输入1）步骤的密码<br/>
	4）更改初始密码<br/>
		ALTER USER 'root'@'localhost' IDENTIFIED BY 'MyNewPass4!';<br/>
7. 版本要求密码复杂化，如果需要简单（测试）密码：<br/>
	1）查看要求<br/>
		show variables like 'validate_password%';<br/>
		+--------------------------------------+-------+<br/>
		| Variable_name                        | Value |<br/>
		+--------------------------------------+-------+<br/>
		| validate_password_check_user_name    | OFF   |<br/>
		| validate_password_dictionary_file    |       |<br/>
		| validate_password_length             | 4     |<br/>
		| validate_password_mixed_case_count   | 1     |<br/>
		| validate_password_number_count       | 1     |<br/>
		| validate_password_policy             | LOW   |<br/>
		| validate_password_special_char_count | 1     |<br/>
		+--------------------------------------+-------+<br/>
		这是我更改过的<br/>
	2）使用以下命令<br/>
		set global validate_password_policy=0;<br/>
		set global validate_password_length=4;<br/>
	3）再次更改root密码<br/>
		ALTER USER 'root'@'localhost' IDENTIFIED BY 'admin';<br/>
</body></html>