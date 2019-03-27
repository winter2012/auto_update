<?php
//主机地址
defined('DB_URL') or define('DB_URL', '127.0.0.1');

//主机端口,默认mysql为3306
defined('DB_PORT') or define('DB_PORT', '3306');

//连接数据库的用户名
defined('DB_USER') or define('DB_USER', 'root');

//连接数据库的密码，推荐使用随机生成的字符串
defined('DB_PASSWORD') or define('DB_PASSWORD', '123456');

//数据库名
defined('DB_NAME') or define('DB_NAME', 'api_doc');

//是否允许新用户注册
defined('ALLOW_REGISTER') or define('ALLOW_REGISTER', TRUE);

//是否允许更新项目，如果设置为FALSE，那么自动更新和手动更新都将失效
defined('ALLOW_UPDATE') or define('ALLOW_UPDATE', TRUE);

//网站名称
defined('WEBSITE_NAME') or define('WEBSITE_NAME', '接口文档');

//数据表前缀
defined('DB_TABLE_PREFIXION') or define('DB_TABLE_PRIFIXION', 'eo');

//语言
defined('LANGUAGE') or define('LANGUAGE', 'zh-cn')
?>