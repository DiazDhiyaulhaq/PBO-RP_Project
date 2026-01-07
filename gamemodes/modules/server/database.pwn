#define DB_HOST "172.17.0.1"
#define DB_USER "u1_xdPFj6W9FK"
#define DB_PASSWORD "VL!hk457KXB.2O0rDty!0swd"
#define DB_DATABASE "s1_vrp_db"

MySqlStartConnection()
{
    new MySQLOpt: option_id = mysql_init_options();

//	mysql_set_option(option_id, AUTO_RECONNECT, true);
	mysql_set_option(option_id, POOL_SIZE, 10);
    
    g_iHandle = mysql_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_DATABASE, option_id);

    mysql_log(ERROR | WARNING);
 
    if(g_iHandle == MYSQL_INVALID_HANDLE || mysql_errno(g_iHandle) != 0) {
        SendRconCommand("password *)");
        SendRconCommand("hostname Occurred error connection to database ...");
 
        printf("[Database] Connection to failed!");
    }
    else printf("[Database] Connection to succes!");
    return 1;
}

MySqlCloseConnection()
{
    mysql_close(g_iHandle);
    return 1;
}
