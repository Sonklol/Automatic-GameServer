#!/bin/bash
        #####################################################################################################################################
        #                   SCRIPT DISEÑADO PARA LA AUTOMATIZACIÓN DE LA INSTALACIÓN DE FIVEM EN UN SERVIDOR LINUX                          #
        #                 SI SE REINCIA EL SERVIDOR SE INICIARÁ TXADMIN AUTOMÁTICAMENTE (PARA COMPROBAR CON "screen -r")                    #
        #                                      SE RECOMIENDA REINICIAR DESPUÉS DE LA INSTALACIÓN                                            #
        #                               SCRIPT HECHO POR - DISCORD: Sonk#2333 - TWITTER: @Sonk_lol                                          #
        #####################################################################################################################################

#               echo "          1. Instalar FiveM Server Automáticamente (Base de Datos PhpMyAdmin + Servicio FiveM + Archivos Básicos FiveM + Apache2 + HTTPS (opcional))"
#               echo "                  2. Instalar SOLO Servidor Web (apache2)"
#               echo "                  3. Instalar SOLO Servidor Web con HTTPS (apache2 + HTTPS)"
#               echo "                  4. Instalar SOLO Base de Datos PhpMyAdmin (Base de Datos MYSQL-phpMyAdmin + apache2 + HTTPS (opcional))"
#               echo "          5. Instalar Contafuegos (iptables) + Anti-DDoS (iptables + ipset)"
#               echo "          6. Crear nuevo usuario MYSQL"
#               echo "          7. Importar archivo SQL"
#               echo "          8. Automatizar SQL Backups (00:00 cada día)"
#               echo "          9. Salir"





if [ $(id -u) = 0 ]; then
        clear
        option=0
        while [ $option -ne 3 ]; do
                echo "                                                                       "
                echo "                                                                       "
                /bin/echo -e "\e[1;31m                                          / \------------------------------, \e[0m"
                /bin/echo -e "\e[1;31m                                        \_,  /                             / \e[0m"
                /bin/echo -e "\e[1;31m                                            /   AUTOMATIC VPS GAME-SERVER / \e[0m"
                /bin/echo -e "\e[1;31m                                           /  ,----------------------------\e[0m"
                /bin/echo -e "\e[1;31m                                          /_/___________________________/ \e[0m"
                echo "                                                                       "

                /bin/echo -e "\e[1;34m                          Este script automatiza la instalación de un Servidor de Minecraft, FiveM y otras utilidades.\e[0m"
                /bin/echo -e "\e[1;34m                          Además solo tienes que apagar y encender el servidor para tener TXADMIN on.\e[0m"
                /bin/echo -e "\e[1;34m                               El comando para comprobar que FiveM Server vaya bien es [screen -r]\e[0m"
                echo "                                                                       "
                echo "                                                                       "
                /bin/echo -e "\e[1;33m                             -- SCRIPT HECHO POR - DISCORD: Sonk#2333 - TWITTER: @Sonk_lol --\e[0m"
                echo "                                                                       "
                echo "                                                                       "
                echo "          1. Instalar Servidor de FiveM"
                echo "          2. Instalar Servidor de Minecraft"
                echo "          3. Crear nuevo usuario MYSQL"
                echo "          4. Importar archivo SQL"
                echo "          5. Automatizar SQL Backups (00:00 cada día)"
                echo "          6. Salir"
                echo "                                                                       "
                echo -n "    Introduce una opción: "
                read option2

                case $option2 in     
                        1)      clear
                                option3=0
                                while [ $option3 -ne 3 ]; do
                                        echo "                                                                       "
                                        echo "                                                                       "
                                        /bin/echo -e "\e[1;31m                                          / \------------------------------, \e[0m"
                                        /bin/echo -e "\e[1;31m                                        \_,  /                             / \e[0m"
                                        /bin/echo -e "\e[1;31m                                            /   AUTOMATIC VPS GAME-SERVER / \e[0m"
                                        /bin/echo -e "\e[1;31m                                           /  ,----------------------------\e[0m"
                                        /bin/echo -e "\e[1;31m                                          /_/___________________________/ \e[0m"
                                        echo "                                                                       "

                                        /bin/echo -e "\e[1;34m                          Este script automatiza la instalación de un Servidor de Minecraft, FiveM y otras utilidades.\e[0m"
                                        /bin/echo -e "\e[1;34m                          Además solo tienes que apagar y encender el servidor para tener TXADMIN on.\e[0m"
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
                                        echo "          6. Salir"
                                        echo "                                                                       "
                                        echo -n "    Introduce una opción: "
                                        read option3
                                        case $option3 in
                                                1)      clear
                                                        echo "                                                                       "
                                                        echo "                                                                       "
                                                        echo "                / \------------------------------, "
                                                        echo "              \_,  /                             / "
                                                        echo "                  /   AUTOMATIC VPS GAME-SERVER /"
                                                        echo "                 /  ,----------------------------"
                                                        echo "                /_/___________________________/ "
                                                        echo "                                                                       "

                                                        echo "Este script automatiza la instalación de un Servidor de Minecraft, FiveM y otras utilidades."
                                                        echo "Además solo tienes que apagar y encender el servidor para tener TXADMIN on."
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

                                                        apt install -y wget zip git screen
                                                        clear

                                                        mv files.zip /
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
                                                                DB_ROOT="root"
                                                                DB_ROOT_PASS=""
                                                                DB_NAME="phpmyadmin"
                                                                DB_USER=""
                                                                DB_PASS=""

                                                                # Recogemos el input del usuario
                                                                #read -e -p " + Usuario root del servidor mysql: " DB_ROOT
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

                                                                mv ssl.zip /
                                                                cd /
                                                                unzip -o ssl.zip
                                                                rm /ssl.zip

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
                                                        wget https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/5181-9eba8dcc91ee4c6ab009fcf7a47837edf81efd1a/fx.tar.xz
                                                        tar -xvf fx.tar.xz
                                                        rm fx.tar.xz
                                                        mv alpine /home/FXServer/fivem_server
                                                        mv run.sh /home/FXServer/fivem_server
                                                        git clone https://github.com/citizenfx/cfx-server-data /home/FXServer/fivem_resources

                                                        mv server.cfg /home/FXServer/fivem_resources/

                                                        systemctl daemon-reload
                                                        systemctl start fivem
                                                        systemctl enable fivem

                                                        systemctl restart apache2

                                                        #rm -r /home/FXServer/fivem_server/alpine/opt/cfx-server/citizen/system_resources/webadmin
                                                        
                                                        ln -s /home/FXServer/fivem_resources/server.cfg /root
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

                                                        mkdir -p /etc/apache2/sites-available

                                                        mv ssl.zip /
                                                        cd /
                                                        unzip -o ssl.zip
                                                        rm /ssl.zip

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
                                                        echo "                  /   AUTOMATIC VPS GAME-SERVER / "
                                                        echo "                 /  ,----------------------------"
                                                        echo "                /_/___________________________/ "
                                                        echo "                                                                       "

                                                        echo "Este script automatiza la instalación de un Servidor de Minecraft, FiveM y otras utilidades."
                                                        echo "Además solo tienes que apagar y encender el servidor para tener TXADMIN on."
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
                                                        apt install -y wget zip git

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
                                                                DB_ROOT="root"
                                                                DB_ROOT_PASS=""
                                                                DB_NAME="phpmyadmin"
                                                                DB_USER=""
                                                                DB_PASS=""

                                                                # Recogemos el input del usuario
                                                                #read -e -p " + Usuario root del servidor mysql: " DB_ROOT
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

                                                                mv ssl.zip /
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

                                                        ln -s /usr/bin/cortafuegos.sh /root

                                                        apt install -y git zip ipset

                                                        mv cortafuegos.zip /
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

                                                6)      clear
                                                        break
                                                        ;;

                                                *)      clear
                                                        echo "                                                                       "
                                                        echo "Número inválido, vuelva a teclear un número."
                                                        echo "                                                                       "
                                                        option3=0
                                                        ;;
                                        esac
                                        clear
                                done
                                ;; 

                        2)      clear
                                option4=0
                                while [ $option4 -ne 3 ]; do
                                        echo "                                                                       "
                                        echo "                                                                       "
                                        /bin/echo -e "\e[1;31m                                          / \------------------------------, \e[0m"
                                        /bin/echo -e "\e[1;31m                                        \_,  /                             / \e[0m"
                                        /bin/echo -e "\e[1;31m                                            /   AUTOMATIC VPS GAME-SERVER / \e[0m"
                                        /bin/echo -e "\e[1;31m                                           /  ,----------------------------\e[0m"
                                        /bin/echo -e "\e[1;31m                                          /_/___________________________/ \e[0m"
                                        echo "                                                                       "

                                        /bin/echo -e "\e[1;34m                          Este script automatiza la instalación de un Servidor de Minecraft, FiveM y otras utilidades.\e[0m"
                                        /bin/echo -e "\e[1;34m                          Además solo tienes que apagar y encender el servidor para tener TXADMIN on.\e[0m"
                                        /bin/echo -e "\e[1;34m                               El comando para comprobar que FiveM Server vaya bien es [screen -r]\e[0m"
                                        echo "                                                                       "
                                        echo "                                                                       "
                                        /bin/echo -e "\e[1;33m                             -- SCRIPT HECHO POR - DISCORD: Sonk#2333 - TWITTER: @Sonk_lol --\e[0m"
                                        echo "                                                                       "
                                        echo "                                                                       "
                                        echo "          1. Instalar la última versión de Minecraft"
                                        echo "          2. Versiones"
                                        echo "          3. Salir"
                                        echo "                                                                       "
                                        echo -n "    Introduce una opción: "
                                        read option4
                                        case $option4 in
                                                1)      #MIN_GB=""
                                                        #MAX_GB=""
                                                                        
                                                        clear

                                                        apt -y update
                                                        apt -y upgrade
                                                        apt -y install openjdk-8-jre-headless screen openjdk-17-jdk zip wget
                                                        #ufw allow 25565
                                                        
                                                        mkdir -p /home/MServer
                                                        ln -s /home/MServer/server.properties /root
                                                        #ln -s /usr/bin/minecraft_start.sh /root
                                                        cd /home/MServer
                                                        wget https://launcher.mojang.com/v1/objects/a16d67e5807f57fc4e550299cf20226194497dc2/server.jar
                                                        mv server.jar /home/MServer/minecraft_server.1.17.1.jar

                                                        #read -e -p " + Asigna los GB de RAM mínimos para tu servidor (1): " MIN_GB
                                                        #read -e -p " + Asigna los GB de RAM máximos para tu servidor: " MAX_GB
                                                        
                                                        echo > /home/MServer/eula.txt "eula=true"
                                                        
                                                        # Service
                                                        #wget https://github.com/Sonklol/files-preconfigured-minecraftserver/archive/main.zip
                                                        #unzip main.zip
                                                        #rm main.zip
                                                        #mv files-preconfigured-minecraftserver-main/files.zip /
                                                        #rm -r files-preconfigured-minecraftserver-main
                                                        #cd /
                                                        #mkdir -p /lib/systemd/system
                                                        #mkdir -p /usr/bin
                                                        #unzip -o files.zip
                                                        #rm /files.zip

                                                        #chmod +x /usr/bin/minecraft_start.sh
                                                        #systemctl daemon-reload
                                                        #systemctl start minecraft
                                                        #systemctl enable minecraft

                                                        #screen -dm bash -c "screen -s 'Minecraft Server'  java -Xms${MIN_GB}G -Xmx${MAX_GB}G -jar /home/MServer/minecraft_server.1.17.1.jar nogui"
                                                        #java -Xms${MIN_GB}G -Xmx${MAX_GB}G -jar /home/MServer/minecraft_server.1.17.1.jar nogui

                                                        ## Helpful info @ https://docs.pufferpanel.com/en/1.x/i...

                                                        ## Install for ubuntu 18.04

                                                        ## If you currently have apache2 installed you will not be able to use nginx as well.
                                                        apt install -y software-properties-common
                                                        add-apt-repository ppa:ondrej/php
                                                        apt update
                                                        apt install -y openssl curl nginx mysql-client mysql-server php-fpm php-cli php-curl php-mysql

                                                        ## Make sure to set the MySQL root password when running this
                                                        mysql_secure_installation

                                                        ## Please run these with either in front of them
                                                        mkdir -p /srv && cd /srv
                                                        curl -L -o pufferpanel.tar.gz https://git.io/fNZYg
                                                        tar -xf pufferpanel.tar.gz
                                                        cd pufferpanel
                                                        chmod +x pufferpanel
                                                        # Crear un nuevo usuario con privilegios y contraseña para MYSQL
                                                        DB_ROOT="root"
                                                        DB_ROOT_PASS=""
                                                        DB_NAME="phpmyadmin"
                                                        DB_USER=""
                                                        DB_PASS=""

                                                        # Recogemos el input del usuario
                                                        #read -e -p " + Usuario root del servidor mysql: " DB_ROOT
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
                                                        ./pufferpanel install

                                                        ##Install Java for games like Minecraft
                                                        apt install -y git build-essential
                                                        apt install -y openjdk-8-jre-headless
                                                        java -version

                                                        ## Install SteamCMD for games like CSGO and other Steam Games
                                                        #apt update && apt upgrade
                                                        #apt install -y software-properties-common
                                                        #add-apt-repository multiverse
                                                        #dpkg --add-architecture i386
                                                        #apt update
                                                        #apt install -y lib32gcc1 steamcmd
                                                        #ln -s /usr/games/steamcmd steamcmd
                                                        ;;
                                                                        
                                                        2)      clear
                                                                echo "Incompleto"
                                                                read vvv
                                                                ;;
                                                        3)      clear
                                                                break
                                                                ;;

                                                        *)      clear
                                                                echo "                                                                       "
                                                                echo "Número inválido, vuelva a teclear un número."
                                                                echo "                                                                       "
                                                                option5=0
                                                        ;;
                                                
                                                2)      clear
                                                        echo "Incompleto"
                                                        read vvv
                                                        break
                                                        option5=0
                                                        while [ $option5 -ne 3 ]; do
                                                                echo "                                                                       "
                                                                echo "                                                                       "
                                                                /bin/echo -e "\e[1;31m                                          / \------------------------------, \e[0m"
                                                                /bin/echo -e "\e[1;31m                                        \_,  /                             / \e[0m"
                                                                /bin/echo -e "\e[1;31m                                            /   AUTOMATIC VPS GAME-SERVER / \e[0m"
                                                                /bin/echo -e "\e[1;31m                                           /  ,----------------------------\e[0m"
                                                                /bin/echo -e "\e[1;31m                                          /_/___________________________/ \e[0m"
                                                                echo "                                                                       "

                                                                /bin/echo -e "\e[1;34m                          Este script automatiza la instalación de un Servidor de Minecraft, FiveM y otras utilidades.\e[0m"
                                                                /bin/echo -e "\e[1;34m                          Además solo tienes que apagar y encender el servidor para tener TXADMIN on.\e[0m"
                                                                /bin/echo -e "\e[1;34m                               El comando para comprobar que FiveM Server vaya bien es [screen -r]\e[0m"
                                                                echo "                                                                       "
                                                                echo "                                                                       "
                                                                /bin/echo -e "\e[1;33m                             -- SCRIPT HECHO POR - DISCORD: Sonk#2333 - TWITTER: @Sonk_lol --\e[0m"
                                                                echo "                                                                       "
                                                                echo "                                                                       "
                                                                echo "          1. Instalar la última versión de Minecraft"
                                                                echo "          2. Versiones"
                                                                echo "          3. Salir"
                                                                echo "                                                                       "
                                                                echo -n "    Introduce una opción: "
                                                                read option5
                                                                case $option5 in
                                                                        *)      clear
                                                                                echo "                                                                       "
                                                                                echo "Número inválido, vuelva a teclear un número."
                                                                                echo "                                                                       "
                                                                                option5=0
                                                                                ;;
                                                                esac
                                                                clear
                                                        done
                                                        ;;
                                                3)      clear
                                                        break
                                                        ;;

                                                *)      clear
                                                        echo "                                                                       "
                                                        echo "Número inválido, vuelva a teclear un número."
                                                        echo "                                                                       "
                                                        option4=0
                                                        ;;
                                        esac
                                        clear
                                done
                                ;;

                        3)      # Crear un nuevo usuario con privilegios y contraseña para MYSQL
                                DB_ROOT="root"
                                DB_ROOT_PASS=""
                                DB_NAME="phpmyadmin"
                                DB_USER=""
                                DB_PASS=""

                                # Recogemos el input del usuario
                                #read -e -p " + Usuario root del servidor mysql: " DB_ROOT
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

                        4)      clear
                                
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
                                
                        5)      # Database credentials
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
                                
                        6)      clear
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
