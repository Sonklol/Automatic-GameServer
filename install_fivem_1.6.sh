#!/bin/bash
        #####################################################################################################################################
        #                   SCRIPT DISEÑADO PARA LA AUTOMATIZACIÓN DE LA INSTALACIÓN DE FIVEM EN UN SERVIDOR LINUX                          #
        #                 SI SE REINCIA EL SERVIDOR SE INICIARÁ TXADMIN AUTOMÁTICAMENTE (PARA COMPROBAR CON "screen -r")                    #
        #                                      SE RECOMIENDA REINICIAR DESPUÉS DE LA INSTALACIÓN                                            #
        #                               SCRIPT HECHO POR - DISCORD: Sonk#2333 - TWITTER: @Sonk_lol                                          #
        #####################################################################################################################################

if [ $(id -u) = 0 ]; then
        clear
        option=0
        while [ $option -ne 3 ]; do
                echo "                                                                       "
                echo "                                                                       "
                /bin/echo -e "\e[1;31m                                          / \------------------------------, \e[0m"
                /bin/echo -e "\e[1;31m                                        \_,  /                             / \e[0m"
                /bin/echo -e "\e[1;31m                                            /    AUTOMATIC FIVEM SERVER   / \e[0m"
                /bin/echo -e "\e[1;31m                                           /  ,----------------------------\e[0m"
                /bin/echo -e "\e[1;31m                                          /_/___________________________/ \e[0m"
                echo "                                                                       "

                /bin/echo -e "\e[1;34m                          Este script automatiza casi toda la instalación de un Servidor de FiveM.\e[0m"
                /bin/echo -e "\e[1;34m                          Además solo tienes apagar y encender el servidor para tener TXADMIN on.\e[0m"
                /bin/echo -e "\e[1;34m                               El comando para comprobar que FiveM Server vaya bien es [screen -r]\e[0m"
                echo "                                                                       "
                echo "                                                                       "
                /bin/echo -e "\e[1;33m                             -- SCRIPT HECHO POR - DISCORD: Sonk#2333 - TWITTER: @Sonk_lol --\e[0m"
                echo "                                                                       "
                echo "                                                                       "
                echo "          1. Instalar FiveM Server Automáticamente (Base de Datos PhpMyAdmin + Servicio FiveM + Archivos Básicos FiveM + Apache2 + HTTPS (opcional))"
                echo "                  2. Instalar SOLO Servidor Web (apache2)"
                echo "                  3. Instalar SOLO Servidor Web con HTTPS (apache2 + HTTPS)"
                echo "                  4. Instalar SOLO Base de Datos PhpMyAdmin (Base de Datos MYSQL-phpMyAdmin + apache2 + HTTPS (opcional))"
                echo "          5. Instalar Contafuegos (iptables) + Anti-DDoS (iptables + ipset)"
                echo "          6. Crear nuevo usuario MYSQL"
                echo "          7. Importar archivo SQL"
                echo "          8. Automatizar SQL Backups (00:00 cada día)"
                echo "          9. Salir"
                echo "                                                                       "
                echo -n "    Introduce una opción: "
                read option

                case $option in      
                        1)      clear
                                echo "                                                                       "
                                echo "                                                                       "
                                echo "                / \------------------------------, "
                                echo "              \_,  /                             / "
                                echo "                  /    AUTOMATIC FIVEM SERVER   / "
                                echo "                 /  ,----------------------------"
                                echo "                /_/___________________________/ "
                                echo "                                                                       "

                                echo "Este script automatiza casi toda la instalación de un Servidor de FiveM."
                                echo "Además solo tienes apagar y encender el servidor para tener TXADMIN on."
                                echo "     El comando para comprobar que todo vaya bien es [screen -r]"
                                echo "                                                                       "
                                echo "                                                                       "
                                echo "   -- SCRIPT HECHO POR - DISCORD: Sonk#2333 - TWITTER: @Sonk_lol --"

                                echo "                                                                       "
                                echo "                                                                       "
                                echo "Actualizando repositorios y paquetes"
                                echo "                                                                       "
                                echo "                                                                       "
                                apt update -y
                                apt upgrade -y
                                clear

                                # DESCARGA DE PAQUETES PRECONFIGURADOS PARA LA INSTALACIÓN. ALTERNATIVA https://www.mediafire.com/file/4ulatiyyv84e8so/files.zip/file
                                apt install -y wget zip git screen
                                clear

                                wget https://github.com/Sonklol/files-preconfigured-phpmyadmin/archive/main.zip
                                unzip main.zip
                                rm main.zip
                                mv files-preconfigured-phpmyadmin-main/files.zip /
                                rm -r files-preconfigured-phpmyadmin-main
                                cd /
                                mkdir -p /etc/apache2/conf-enabled
                                mkdir -p /lib/systemd/system
                                mkdir -p /usr/bin
                                mkdir -p /usr/share/phpmyadmin
                                unzip -o files.zip
                                rm /files.zip
                                chmod +x /usr/bin/fivem_start.sh
                                mkdir -p /home/FXServer/

                                clear

                                echo "                                                                       "
                                echo "                                                                       "
                                echo "Instalando PHP"
                                echo "                                                                       "
                                echo "                                                                       "
                                apt -y update
                                apt -y install php php-cgi php-pear php-mbstring libapache2-mod-php php-common php-phpseclib php-mysql
                                clear

                                echo "                                                                       "
                                echo "                                                                       "
                                echo "Instalando Servidor de Base de Datos MYSQL/MariaDB"
                                echo "                                                                       "
                                echo "                                                                       "
                                # INSTALACIÓN DE LA BASE DE DATOS MYSQL/MariaDB
                                apt -y update
                                clear

                                echo -e "$Yellow \n ¿Qué base de datos quieres? (mysql/mariadb) $Color_Off"
                                read mariadbomysql
                                if [ $mariadbomysql = "mysql" -o $mariadbomysql = "MYSQL" ]; then
                                        apt -y install xz-utils apache2 mysql-server
                                        apt -y install phpmyadmin php-mbstring php-zip php-gd php-json php-curl
                                        apt -y install libapache2-mod-php
                                        a2enmod php7.4
                                        
                                        systemctl restart apache2
                                else
                                        apt -y install xz-utils apache2 mariadb-server
                                        mysql_secure_installation
                                        apt -y install phpmyadmin php-mbstring php-zip php-gd php-json php-curl
                                        apt -y install libapache2-mod-php
                                        a2enmod php7.4
                                        
                                        systemctl restart apache2
                                fi

                                clear

                                echo -e "$Yellow \n ¿Quieres crear un nuevo usuario MYSQL? (S/n) $Color_Off"
                                read bdlectura
                                if [ $bdlectura = "S" -o $bdlectura = "s" ]; then
                                        # Crear un nuevo usuario con privilegios y contraseña para MYSQL
                                        DB_ROOT=""
                                        DB_ROOT_PASS=""
                                        DB_NAME="phpmyadmin"
                                        DB_USER=""
                                        DB_PASS=""

                                        # Recogemos el input del usuario
                                        read -e -p " + Usuario root del servidor mysql: " DB_ROOT
                                        read -e -s -p " + Contraseña root para el servidor mysql: " DB_ROOT_PASS; echo
                                        #read -e -p " + Nombre de la base de datos (sin espacios ni caracteres especiales): " DB_NAME
                                        read -e -p " + Nombre del nuevo usuario mysql (o uno ya existente): " DB_USER
                                        read -e -s -p " + Contraseña del nuevo usuario: " DB_PASS;
                                        echo 
                                        echo
                                        # Creamos el nuevo usuario con privilegios
                                        mysql -u ${DB_ROOT} -p${DB_ROOT_PASS} -e "CREATE USER '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASS}'; GRANT ALL PRIVILEGES ON * . * TO '${DB_USER}'@'localhost' WITH GRANT OPTION;"

                                        # Comprobamos errores
                                        if [ $? == 0 ]; then
                                                echo " El usuario ${DB_USER} se ha creado con éxito."

                                                # Creamos la nueva base de datos
                                                mysql -u ${DB_ROOT} -p${DB_ROOT_PASS} -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME} DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci; GRANT ALL PRIVILEGES ON ${DB_NAME} . * TO '${DB_USER}'@'localhost';"

                                                # Comprobamos errores
                                                if [ $? == 0 ]; then
                                                        echo " La base de datos ${DB_NAME} se ha creado con éxito."
                                                        echo " El usuario ${DB_USER} tiene permisos sobre la base de datos ${DB_NAME}."
                                                else
                                                        mysql -u ${DB_ROOT} -p${DB_ROOT_PASS} -e "DROP USER '${DB_USER}'@'localhost';"
                                                        exit
                                                fi

                                        else
                                                echo " Si mysql devuelve ERROR 1396 probablemente signifique que el usuario que intentas crear ya existe."
                                                echo " Prueba otro nombre de usuario."
                                                exit
                                        fi

                                        # Borrar usuario root
                                        echo -e "$Yellow \n ¿Quieres borrar el usuario root? (S/n) $Color_Off"
                                        read lectura
                                        if [ $lectura = "S" -o $lectura = "s" ]; then
                                                mysql -u ${DB_USER} -p${DB_PASS} -e "DROP USER '${DB_ROOT}'@localhost;"
                                        fi
                                fi

                                clear

                                echo "                                                                       "
                                echo "                                                                       "
                                echo "¡IMPORTANTE! EL PROCESO DE INSTALACIÓN DE HTTPS [SIN CERTIFICADO SSL]    (NO RECOMENDADO) NO ES NECESARIO Y ADEMÁS"
                                echo "          ES BASTANTE TEDIOSO Y HAY QUE MODIFICAR ALGUNOS ARCHIVOS"
                                echo "     SI DECIDE NO INSTALARLO NO AFECTARÁ PARA NADA EN SU SERVIDOR DE FIVEM"
                                echo "                                                                       "
                                echo "                                                                       "
                                read -p "¿Quieres instalar HTTPS [SIN CERTIFICADO SSL]    (NO RECOMENDADO)?    [S/n]     "  respuesta
                                if [ $respuesta = "s" ]
                                then
                                        echo "                                                                       "
                                        echo "                                                                       "
                                        echo "Instalando Certificado HTTPS [SIN CERTIFICADO SSL]    (NO RECOMENDADO)"
                                        echo "                                                                       "
                                        echo "                                                                       "
                                        a2enmod ssl
                                        systemctl restart apache2
                                        mkdir -p /etc/apache2/ssl
                                        openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/apache2/ssl/apache.key -out /etc/apache2/ssl/apache.crt
                                
                                        echo "                                                                       "
                                        echo "                                                                       "
                                        echo "Instalando Certificado HTTPS [SIN CERTIFICADO SSL]    (NO RECOMENDADO)"
                                        echo "                                                                       "
                                        echo "                                                                       "
                                        a2enmod ssl
                                        systemctl restart apache2
                                        mkdir -p /etc/apache2/ssl
                                        openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/apache2/ssl/apache.key -out /etc/apache2/ssl/apache.crt

                                        mkdir -p /etc/apache2/sites-available
                                        git clone https://github.com/Sonklol/ssl.git
                                        mv ssl/ssl.zip /
                                        rm -r ssl
                                        cd /
                                        unzip -o ssl.zip
                                        rm /ssl.zip
                                        #echo "Redirect / https://192.168.8.23/" >> /etc/apache2/sites-available/default-ssl.conf
                                        a2ensite default-ssl.conf
                                        a2ensite default-ssl
                                        a2enmod ssl
                                        systemctl apache2 restart
                                fi

                                clear

                                echo "                                                                       "
                                echo "                                                                       "
                                echo "----------------------------------"
                                echo "- INSTALACIÓN FIVEM EN LINUX SERVER -"
                                echo "----------------------------------"
                                echo "                                                                       "
                                echo "                                                                       "
                                # INSTALACIÓN DE LOS ARCHIVOS BÁSICOS DE FIVEM + AUTOMATIZACIÓN DEL SERVICIO "FIVEM" (systemctl status fivem) PARA EL INICIO AUTOMÁTICO
                                mkdir -p /home/FXServer/fivem_server
                                mkdir -p /home/FXServer/fivem_resources
                                cd /home/FXServer/fivem_server
                                wget https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/3539-86d8fe5891dbdc38d43976e6a8afec97215530e8/fx.tar.xz
                                tar -xvf fx.tar.xz
                                rm fx.tar.xz
                                mv alpine /home/FXServer/fivem_server
                                mv run.sh /home/FXServer/fivem_server
                                git clone https://github.com/citizenfx/cfx-server-data /home/FXServer/fivem_resources
                                #touch /home/FXServer/fivem_resources/server.cfg # https://www.mediafire.com/file/pp7mpfxx6islzzp/server.cfg/file
                                git clone https://github.com/Sonklol/server.cfg-default.git
                                mv server.cfg-default/server.cfg /home/FXServer/fivem_resources/
                                rm -r server.cfg-default

                                systemctl daemon-reload
                                systemctl start fivem
                                systemctl enable fivem

                                systemctl restart apache2

                                rm -r /home/FXServer/fivem_server/alpine/opt/cfx-server/citizen/system_resources/webadmin
                                
                                ln -s /home/FXServer/fivem_resources/server.cfg /root
                                ln -s /usr/bin/cortafuegos.sh /root
                                ln -s /usr/bin/fivem_start.sh /root

                                clear

                                echo "                                                                       "
                                echo "                                                                       "
                                echo "AHORA ENTRA EN TU NAVEGADOR Y ESCRIBE http.//IP_DE_TU_SERVER:40120"
                                echo "          MUY IMPORTANTE - PARA COMPROBAR EL NÚMERO ESCRIBA EL COMANDO screen -r"
                                echo "SI NO ENTRA EN ESA PÁGINA O NO RESPONDE, POR FAVOR ESCRIBE EL COMANDO systemctl restart fivem"
                                echo "                                                                       "
                                echo "                                                                       "
                                ;;

                        2)      clear
                                apt install -y apache2
                                ;;

                        3)      clear
                                echo "                                                                       "
                                echo "                                                                       "
                                echo "Instalando Servidor Web Apache"
                                echo "                                                                       "
                                echo "                                                                       "
                                apt -y install apache2
                                clear

                                # INSTALACIÓN DE HTTPS [SIN CERTIFICADO SSL]    (NO RECOMENDADO)
                                echo "                                                                       "
                                echo "                                                                       "
                                echo "¡IMPORTANTE! EL PROCESO DE INSTALACIÓN DE HTTPS [SIN CERTIFICADO SSL]    (NO RECOMENDADO) NO ES NECESARIO Y ADEMÁS"
                                echo "          ES BASTANTE TEDIOSO Y HAY QUE MODIFICAR ALGUNOS ARCHIVOS"
                                echo "     SI DECIDE NO INSTALARLO NO AFECTARÁ PARA NADA EN SU SERVIDOR DE FIVEM"
                                echo "                                                                       "
                                echo "                                                                       "
                                echo "                                                                       "
                                echo "                                                                       "
                                echo "Instalando Certificado HTTPS [SIN CERTIFICADO SSL]    (NO RECOMENDADO)"
                                echo "                                                                       "
                                echo "                                                                       "
                                a2enmod ssl
                                systemctl restart apache2
                                mkdir -p /etc/apache2/ssl
                                openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/apache2/ssl/apache.key -out /etc/apache2/ssl/apache.crt

                                #echo "Redirect / https://IP_DE_TU_SERVIDOR/"

                                mkdir -p /etc/apache2/sites-available
                                git clone https://github.com/Sonklol/ssl.git
                                mv ssl/ssl.zip /
                                rm -r ssl
                                cd /
                                unzip -o ssl.zip
                                rm /ssl.zip
                                #echo "Redirect / https://192.168.8.23/" >> /etc/apache2/sites-available/default-ssl.conf
                                a2ensite default-ssl.conf
                                a2ensite default-ssl
                                a2enmod ssl
                                systemctl apache2 restart
                                ;;

                        4)      clear
                                echo "                                                                       "
                                echo "                                                                       "
                                echo "                / \------------------------------, "
                                echo "              \_,  /                             / "
                                echo "                  /    AUTOMATIC FIVEM SERVER   / "
                                echo "                 /  ,----------------------------"
                                echo "                /_/___________________________/ "
                                echo "                                                                       "

                                echo "Este script automatiza casi toda la instalación de un Servidor de FiveM."
                                echo "Además solo tienes apagar y encender el servidor para tener TXADMIN on."
                                echo "     El comando para comprobar que todo vaya bien es [screen -r]"
                                echo "                                                                       "
                                echo "                                                                       "
                                echo "   -- SCRIPT HECHO POR - DISCORD: Sonk#2333 - TWITTER: @Sonk_lol --"

                                echo "                                                                       "
                                echo "                                                                       "
                                echo "Actualizando repositorios y paquetes"
                                echo "                                                                       "
                                echo "                                                                       "

                                # ACTUALIZA REPOSITORIOS Y PAQUETES
                                apt update -y
                                apt upgrade -y
                                apt install -y wget zip git

                                clear

                                echo "                                                                       "
                                echo "                                                                       "
                                echo "Instalando PHP"
                                echo "                                                                       "
                                echo "                                                                       "
                                # INSTALACIÓN DE PHP
                                apt -y update
                                apt -y install php php-cgi php-pear php-mbstring libapache2-mod-php php-common php-phpseclib php-mysql

                                clear

                                echo "                                                                       "
                                echo "                                                                       "
                                echo "Instalando Servidor de Base de Datos MYSQL/MariaDB"
                                echo "                                                                       "
                                echo "                                                                       "
                                # INSTALACIÓN DE LA BASE DE DATOS MYSQL/MariaDB
                                apt -y update
                                clear

                                echo -e "$Yellow \n ¿Qué base de datos quieres? (mysql/mariadb) $Color_Off"
                                read mariadbomysql
                                if [ $mariadbomysql = "mysql" -o $mariadbomysql = "MYSQL" ]; then
                                        apt -y install xz-utils apache2 mysql-server
                                        apt -y install phpmyadmin php-mbstring php-zip php-gd php-json php-curl
                                        apt -y install libapache2-mod-php
                                        a2enmod php7.4
                                        
                                        systemctl restart apache2
                                else
                                        apt -y install xz-utils apache2 mariadb-server
                                        mysql_secure_installation
                                        apt -y install phpmyadmin php-mbstring php-zip php-gd php-json php-curl
                                        apt -y install libapache2-mod-php
                                        a2enmod php7.4
                                        
                                        systemctl restart apache2
                                fi

                                clear

                                echo -e "$Yellow \n ¿Quieres crear un nuevo usuario MYSQL? (S/n) $Color_Off"
                                read bdlectura
                                if [ $bdlectura = "S" -o $bdlectura = "s" ]; then
                                        # Crear un nuevo usuario con privilegios y contraseña para MYSQL
                                        DB_ROOT=""
                                        DB_ROOT_PASS=""
                                        DB_NAME="phpmyadmin"
                                        DB_USER=""
                                        DB_PASS=""

                                        # Recogemos el input del usuario
                                        read -e -p " + Usuario root del servidor mysql: " DB_ROOT
                                        read -e -s -p " + Contraseña root para el servidor mysql: " DB_ROOT_PASS; echo
                                        #read -e -p " + Nombre de la base de datos (sin espacios ni caracteres especiales): " DB_NAME
                                        read -e -p " + Nombre del nuevo usuario mysql (o uno ya existente): " DB_USER
                                        read -e -s -p " + Contraseña del nuevo usuario: " DB_PASS;
                                        echo 
                                        echo
                                        # Creamos el nuevo usuario con privilegios
                                        mysql -u ${DB_ROOT} -p${DB_ROOT_PASS} -e "CREATE USER '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASS}'; GRANT ALL PRIVILEGES ON * . * TO '${DB_USER}'@'localhost' WITH GRANT OPTION;"

                                        # Comprobamos errores
                                        if [ $? == 0 ]; then
                                                echo " El usuario ${DB_USER} se ha creado con éxito."

                                                # Creamos la nueva base de datos
                                                mysql -u ${DB_ROOT} -p${DB_ROOT_PASS} -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME} DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci; GRANT ALL PRIVILEGES ON ${DB_NAME} . * TO '${DB_USER}'@'localhost';"

                                                # Comprobamos errores
                                                if [ $? == 0 ]; then
                                                        echo " La base de datos ${DB_NAME} se ha creado con éxito."
                                                        echo " El usuario ${DB_USER} tiene permisos sobre la base de datos ${DB_NAME}."
                                                else
                                                        mysql -u ${DB_ROOT} -p${DB_ROOT_PASS} -e "DROP USER '${DB_USER}'@'localhost';"
                                                        exit
                                                fi

                                        else
                                                echo " Si mysql devuelve ERROR 1396 probablemente signifique que el usuario que intentas crear ya existe."
                                                echo " Prueba otro nombre de usuario."
                                                exit
                                        fi

                                        # Borrar usuario root
                                        echo -e "$Yellow \n ¿Quieres borrar el usuario root? (S/n) $Color_Off"
                                        read lectura
                                        if [ $lectura = "S" -o $lectura = "s" ]; then
                                                mysql -u ${DB_USER} -p${DB_PASS} -e "DROP USER '${DB_ROOT}'@localhost;"
                                        fi
                                fi

                                clear

                                # INSTALACIÓN DE HTTPS [SIN CERTIFICADO SSL]    (NO RECOMENDADO)
                                echo "                                                                       "
                                echo "                                                                       "
                                echo "¡IMPORTANTE! EL PROCESO DE INSTALACIÓN DE HTTPS [SIN CERTIFICADO SSL]    (NO RECOMENDADO) NO ES NECESARIO Y ADEMÁS"
                                echo "          ES BASTANTE TEDIOSO Y HAY QUE MODIFICAR ALGUNOS ARCHIVOS"
                                echo "     SI DECIDE NO INSTALARLO NO AFECTARÁ PARA NADA EN SU SERVIDOR DE FIVEM"
                                echo "                                                                       "
                                echo "                                                                       "
                                read -p "¿Quieres instalar HTTPS [SIN CERTIFICADO SSL]    (NO RECOMENDADO)?    [S/n]     "  respuesta
                                if [ $respuesta = "s" ]
                                then
                                        echo "                                                                       "
                                        echo "                                                                       "
                                        echo "Instalando Certificado HTTPS [SIN CERTIFICADO SSL]    (NO RECOMENDADO)"
                                        echo "                                                                       "
                                        echo "                                                                       "
                                        a2enmod ssl
                                        systemctl restart apache2
                                        mkdir -p /etc/apache2/ssl
                                        openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/apache2/ssl/apache.key -out /etc/apache2/ssl/apache.crt
                                
                                        echo "                                                                       "
                                        echo "                                                                       "
                                        echo "Instalando Certificado HTTPS [SIN CERTIFICADO SSL]    (NO RECOMENDADO)"
                                        echo "                                                                       "
                                        echo "                                                                       "
                                        a2enmod ssl
                                        systemctl restart apache2
                                        mkdir -p /etc/apache2/ssl
                                        openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/apache2/ssl/apache.key -out /etc/apache2/ssl/apache.crt

                                        mkdir -p /etc/apache2/sites-available
                                        git clone https://github.com/Sonklol/ssl.git
                                        mv ssl/ssl.zip /
                                        rm -r ssl
                                        cd /
                                        unzip -o ssl.zip
                                        rm /ssl.zip
                                        #echo "Redirect / https://192.168.8.23/" >> /etc/apache2/sites-available/default-ssl.conf
                                        a2ensite default-ssl.conf
                                        a2ensite default-ssl
                                        a2enmod ssl
                                        systemctl apache2 restart
                                fi

                                clear
                                ;;

                        5)      echo "                                                                       "
                                echo "                                                                       "
                                echo "Instalando Cortafuegos (para FiveM)"
                                echo "                                                                       "
                                echo "                                                                       "
                                # INSTALACIÓN IPTABLES + IPSET

                                #echo 'echo 40000 > /proc/sys/net/ipv4/tcp_max_syn_backlog' > /etc/rc.local
                                #echo 'echo 1 > /proc/sys/net/ipv4/tcp_synack_retries' >> /etc/rc.local
                                #echo 'echo 30 > /proc/sys/net/ipv4/tcp_fin_timeout' >> /etc/rc.local
                                #echo 'echo 5 > /proc/sys/net/ipv4/tcp_keepalive_probes' >> /etc/rc.local
                                #echo 'echo 15 > /proc/sys/net/ipv4/tcp_keepalive_intvl' >> /etc/rc.local
                                #echo 'echo 20000 > /proc/sys/net/core/netdev_max_backlog' >> /etc/rc.local
                                #echo 'echo 20000 > /proc/sys/net/core/somaxconn' >> /etc/rc.local
                                #echo 'echo 1 > /proc/sys/net/ipv4/tcp_syncookies' >> /etc/rc.local
                                #echo "exit 0" >> /etc/rc.local

                                apt install -y git zip ipset
                                git clone https://github.com/Sonklol/cortafuegos-script.git
                                mv cortafuegos-script/cortafuegos.zip /
                                rm -r cortafuegos-script
                                cd /
                                unzip -o cortafuegos.zip
                                rm /cortafuegos.zip
                                
                                chmod +x /usr/bin/cortafuegos.sh

                                systemctl daemon-reload
                                systemctl start cortafuegos
                                systemctl enable cortafuegos

                                systemctl restart cortafuegos

                                ipset -N dos iphash
                                ;;

                        6)      # Crear un nuevo usuario con privilegios y contraseña para MYSQL
                                DB_ROOT=""
                                DB_ROOT_PASS=""
                                DB_NAME="phpmyadmin"
                                DB_USER=""
                                DB_PASS=""

                                # Recogemos el input del usuario
                                read -e -p " + Usuario root del servidor mysql: " DB_ROOT
                                read -e -s -p " + Contraseña root para el servidor mysql: " DB_ROOT_PASS; echo
                                #read -e -p " + Nombre de la base de datos (sin espacios ni caracteres especiales): " DB_NAME
                                read -e -p " + Nombre del nuevo usuario mysql (o uno ya existente): " DB_USER
                                read -e -s -p " + Contraseña del nuevo usuario: " DB_PASS;
                                echo 
                                echo
                                # Creamos el nuevo usuario con privilegios
                                mysql -u ${DB_ROOT} -p${DB_ROOT_PASS} -e "CREATE USER '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASS}'; GRANT ALL PRIVILEGES ON * . * TO '${DB_USER}'@'localhost' WITH GRANT OPTION;"

                                # Comprobamos errores
                                if [ $? == 0 ]; then
                                        echo " El usuario ${DB_USER} se ha creado con éxito."

                                        # Creamos la nueva base de datos
                                        mysql -u ${DB_ROOT} -p${DB_ROOT_PASS} -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME} DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci; GRANT ALL PRIVILEGES ON ${DB_NAME} . * TO '${DB_USER}'@'localhost';"

                                        # Comprobamos errores
                                        if [ $? == 0 ]; then
                                                echo " La base de datos ${DB_NAME} se ha creado con éxito."
                                                echo " El usuario ${DB_USER} tiene permisos sobre la base de datos ${DB_NAME}."
                                        else
                                                mysql -u ${DB_ROOT} -p${DB_ROOT_PASS} -e "DROP USER '${DB_USER}'@'localhost';"
                                                exit
                                        fi

                                else
                                        echo " Si mysql devuelve ERROR 1396 probablemente signifique que el usuario que intentas crear ya existe."
                                        echo " Prueba otro nombre de usuario."
                                        exit
                                fi

                                # Borrar usuario root
                                echo -e "$Yellow \n ¿Quieres borrar el usuario root? (S/n) $Color_Off"
                                read lectura
                                if [ $lectura = "S" -o $lectura = "s" ]; then
                                        mysql -u ${DB_USER} -p${DB_PASS} -e "DROP USER '${DB_ROOT}'@localhost;"
                                fi     
                                ;;

                        7)      clear
                                
                                DB_USER=""
                                DB_PASS=""
                                DB_NAME=""
                                DB_SOURCE=""

                                # Recogemos el input del usuario
                                read -e -p " + Nombre de usuario mysql (req. privilegios): " DB_USER
                                read -e -s -p " + Contraseña del usuario: " DB_PASS;
                                read -e -p " + Nombre de la base de datos (sin espacios ni caracteres especiales): " DB_NAME
                                read -e -p " + Ruta del archivo SQL a importar [ej. /home/mario/es_extended.sql]: " DB_SOURCE;
                                echo 
                                echo
                                mysql -u ${DB_USER} -p${DB_PASS} -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME} DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci; GRANT ALL PRIVILEGES ON ${DB_NAME} . * TO '${DB_USER}'@'localhost';"
                                mysql -u ${DB_USER} -p${DB_PASS} -e "USE ${DB_NAME}; SOURCE ${DB_SOURCE};"
                                ;;
                                
                        8)      # Database credentials
                                user=""
                                password=""
                                host="127.0.0.1"
                                db_name=""

                                # Other options
                                backup_path=""
                                date=$(date +"%d-%b-%Y")
                                
                                # Pido datos al usuario
                                read -e -p " + Nombre de la base de datos (sin espacios ni caracteres especiales): " db_name
                                read -e -p " + Escribe la ruta para guardar tus Backups [ej: /home/FXServer/SQL_Backups]: " backup_path
                                read -e -p " + Nombre del nuevo usuario mysql (req. privilegios): " user
                                read -e -s -p " + Contraseña del nuevo usuario: " password;

                                # Creación de archivos
                                mkdir -p /etc/sql-backups
                                mkdir -p $backup_path
                                rm -r /etc/sql-backups/config.sh
                                touch /etc/sql-backups/config.sh
                                ln -s /etc/sql-backups/config.sh /root
                                echo > /etc/sql-backups/config.sh "mysqldump --user=$user --password=$password --host=$host $db_name > $backup_path/$db_name-$date.sql"

                                # Todos los días a las 00:00 se iniciará el script
                                echo >> /etc/crontab "0 0 * * * root bash /etc/sql-backups/config.sh"

                                # Reinicio cron
                                systemctl restart cron
                                ;;
                                
                        9)      clear
                                break
                                ;;

                        *)      clear
                                echo "                                                                       "
                                echo "Número inválido, vuelva a teclear un número."
                                echo "                                                                       "
                                option=0
                                ;;
                esac
                echo "                                                                       "
                echo "Pulsa para continuar ..."
                read p
                clear
        done
else 
        echo "Tienes que tener permisos de superusuario (root) para acceder a este script"; 
        exit 1; 
fi