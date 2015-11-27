default["mysql"]["user"] = "root"
default["mysql"]["group"] = "root"

default["mysql"]["server_id_pre"] = 100000

default["mysql"]["timezone"] = "JST"
default["mysql"]["port"] = 3306
default["mysql"]["datadir"] = "/var/lib/mysql"
default["mysql"]["character-set-server"] = "utf8"
default["mysql"]["innodb_support_xa"] = 0
default["mysql"]["sync_binlog"] = 0
default["mysql"]["expire_logs_days"] = 14
default["mysql"]["max_connections"] = 600
default["mysql"]["long_query_time"] = 0.5

# server-id を private ip address から算出
# server_id_pre に加算
split_ip_addr = node["ipaddress"].split(".")
mysql_id = node["mysql"]["server_id_pre"] + (split_ip_addr[2].to_i * 256) + split_ip_addr[3].to_i
default["mysql"]["server-id"] = mysql_id

default["mysql"]["max_heap_table_size"] = "128M"
default["mysql"]["query_cache_size"] = "128M"
default["mysql"]["tmp_table_size"] = "64M"
default["mysql"]["key_buffer_size"] = "32M"
default["mysql"]["bulk_insert_buffer_size"] = "64M"
default["mysql"]["myisam_max_sort_file_size"] = "10M"

# innodb_buffer_pool_size のデフォルト値算出
# トータルメモリの72%
/(\d+)kB/ =~ node["memory"]["total"]
innodb_buffer_pool = (($1.to_i / 1024 / 1024) * 0.72).to_i
default["mysql"]["innodb_buffer_pool_size"] = innodb_buffer_pool.to_s + "G"

default["mysql"]["innodb_additional_mem_pool_size"] = "32M"
default["mysql"]["innodb_flush_log_at_trx_commit"] = '2'
default["mysql"]["innodb_log_buffer_size"] = "20M"
default["mysql"]["innodb_log_file_size"] = "1G"
default["mysql"]["innodb_thread_concurrency"] = 16
default["mysql"]["innodb_commit_concurrency"] = 8

default["mysql"]["dbmaster"] = "127.0.0.1"
default["mysql"]["dbslave"] = ["127.0.0.1", "127.0.0.1"]
default["mysql"]["dbstandby"] = "127.0.0.1"
default["mysql"]["dbbackup"] = "127.0.0.1"

default["mysql"]["options"] = [""]

default["mysql"]["data_dir"] = "/var/lib/mysql/innodb"
default["mysql"]["init_dir"] = "/var/www/lightgame/config/mysql"
