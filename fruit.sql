SET NAMES UTF8;
DROP DATABASE IF EXISTS fruit;
CREATE DATABASE fruit CHARSET=UTF8;
USE fruit;

#用户表
CREATE TABLE fruit_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),
  upwd VARCHAR(32),
  avatar VARCHAR(128),        #头像图片路径
  gender INT                  #性别  0-女  1-男
);
#插入数据
INSERT INTO fruit_user VALUES
(NULL, 'dingding', '123456','img/avatar/default.png','1'),
(NULL, 'dangdang', '123456','img/avatar/default.png','0');
#首页商品
CREATE TABLE fruit_index1(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  fid INT,
  img VARCHAR(128),
  title VARCHAR(128),
  price DECIMAL(10,2)
);
#插入数据
INSERT INTO fruit_index1 VALUES
(NULL, 1,'img/index/1.jpg','红提葡萄整箱红提子新鲜水果美国红地球红提甜提子脆提子坏果包赔',24.90),
(NULL, 1,'img/index/2.jpg','正宗鞍山南果梨2斤半5斤酒香水果梨东北特产顺丰包邮',7.50),
(NULL, 1,'img/index/3.jpg','无花果新鲜 现摘威海青皮无花果孕妇新鲜水果非红皮无花果',16.00),
(NULL, 1,'img/index/4.jpg','现货新疆新鲜大西梅酸甜孕妇水果宝宝辅食应季时令整箱脆李子包邮',9.80),
(NULL, 1,'img/index/5.jpg','四川会理石榴 突尼斯软籽石榴水果新鲜无籽石榴 青皮甜石榴潘石榴',11.90),
(NULL, 1,'img/index/6.jpg','橘子新鲜甜孕妇水果薄皮一箱批发现摘云南蜜桔青桔丑橘沃柑当应季',9.55),
(NULL, 1,'img/index/7.jpg','陕西大荔冬枣脆甜枣子新鲜青枣红枣当季孕妇新鲜水果带箱3/6斤【9月20日发完】',13.90),
(NULL, 1,'img/index/8.jpg','新疆哈密瓜当季新鲜水果一箱2.5/10斤整箱吐鲁番沙漠火焰西州蜜瓜',38.82),


(NULL, 2,'img/index/9.jpg','降火水果杨桃水果杨桃新鲜甜杨桃去火的水果下火水果清火水果',5.90),
(NULL, 2,'img/index/10.jpg','黄金百香果当季孕妇新鲜水果1/2/3/5斤中大果香甜黄皮鸡蛋果批发',13.30),
(NULL, 2,'img/index/11.jpg','广西百香果水果特价批发5斤2/3斤12个新鲜包邮蜂蜜柠檬百香果大果',6.60),
(NULL, 2,'img/index/12.jpg','【精选】甘蔗新鲜水果孕妇现摘农家应季时令特产青皮绿皮非黑皮广',18.18),
(NULL, 2,'img/index/13.jpg','黑皮甘蔗5斤/10斤当季水果甘甜多汁下单现发广西甘蔗新鲜整箱批发',15.80),
(NULL, 2,'img/index/14.jpg','越南白心火龙果新鲜包邮3/10/5斤热带进口水果非红心火龙果白色肉',15.80),
(NULL, 2,'img/index/15.jpg','【超甜特价】红心牛奶木瓜9斤/5斤/3斤/新鲜水果冰糖红心木瓜批发',6.18),
(NULL, 2,'img/index/16.jpg','云南天山雪莲果10斤/3斤装新鲜水果黄水连红泥沙大果红心',6.42),
-- CREATE TABLE fruit_index2(
--   pid INT PRIMARY KEY AUTO_INCREMENT,
--   fid INT,
--   img VARCHAR(128),
--   title VARCHAR(128),
--   price DECIMAL(10,2)
-- );
-- #插入数据
-- INSERT INTO fruit_index2 VALUES

(NULL, 3,'img/index/17.jpg','新货夏威夷果奶油味坚果休闲零食散装批发500g/250g/80g袋装/罐装',8.20),
(NULL, 3,'img/index/18.jpg','冻干榴莲干连罐重500g~100g泰国金枕头榴莲肉好吃的零食品榴莲条',14.85),
(NULL, 3,'img/index/19.jpg','【多口味】奶油核桃新货薄壳新疆特产孕妇零食补脑纸皮大核桃新鲜',10.42),
(NULL, 3,'img/index/20.jpg','新货纸皮巴旦木坚果含罐坚果零食巴坦木1000g50g干果散装巴达木',5.80);

#水果分类
CREATE TABLE fruit_family(
  fid INT PRIMARY KEY,
  fruit VARCHAR(64),
  fimg VARCHAR(128)
);
#插入数据
INSERT INTO fruit_family VALUES
(1,'新鲜水果','img/index/1.1.jpg'),
(2,'热带水果','img/index/1.2.jpg'),
(3,'干果','img/index/1.3.jpg');
#水果详情
CREATE TABLE fruit_details(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  fid INT,
  lunbo1 VARCHAR(64),
  lunbo2 VARCHAR(64),
  lunbo3 VARCHAR(64),
  title VARCHAR(64),
  details VARCHAR(128),
  price DECIMAL(10,2),
  imag1 VARCHAR(128),  
  imag2 VARCHAR(128),
  imag3 VARCHAR(128)
);
#插入数据
INSERT INTO fruit_details VALUES
(NULL,1,'img/details/1_1.jpg','img/details/1_2.jpg','img/details/1_3.jpg','红提葡萄整箱红提子新鲜水果美国红地球红提甜提子脆提子坏果包赔','红提葡萄整箱红提子新鲜水果美国红地球红提甜提子脆提子坏果包赔',24.90,'img/details/1_1.jpg','img/details/1_2.jpg','img/details/1_3.jpg'),
(NULL,1,'img/details/2_1.jpg','img/details/2_2.jpg','img/details/2_3.jpg','正宗鞍山南果梨2斤半5斤酒香水果梨东北特产顺丰包邮','正宗鞍山南果梨2斤半5斤酒香水果梨东北特产顺丰包邮',7.50,'img/details/2_1.jpg','img/details/2_2.jpg','img/details/2_3.jpg'),
(NULL,1,'img/details/3_1.jpg','img/details/3_2.jpg','img/details/3_3.jpg','无花果新鲜 现摘威海青皮无花果孕妇新鲜水果非红皮无花果','无花果新鲜 现摘威海青皮无花果孕妇新鲜水果非红皮无花果',16.00,'img/details/3_1.jpg','img/details/3_2.jpg','img/details/3_3.jpg'),
(NULL,1,'img/details/4_1.jpg','img/details/4_2.jpg','img/details/4_3.jpg','现货新疆新鲜大西梅酸甜孕妇水果宝宝辅食应季时令整箱脆李子包邮','现货新疆新鲜大西梅酸甜孕妇水果宝宝辅食应季时令整箱脆李子包邮',9.80,'img/details/4_1.jpg','img/details/4_2.jpg','img/details/4_3.jpg'),
(NULL,1,'img/details/5_1.jpg','img/details/5_2.jpg','img/details/5_3.jpg','四川会理石榴 突尼斯软籽石榴水果新鲜无籽石榴 青皮甜石榴潘石榴','四川会理石榴 突尼斯软籽石榴水果新鲜无籽石榴 青皮甜石榴潘石榴',11.90,'img/details/5_1.jpg','img/details/5_2.jpg','img/details/5_3.jpg'),
(NULL,1,'img/details/6_1.jpg','img/details/6_2.jpg','img/details/6_3.jpg','橘子新鲜甜孕妇水果薄皮一箱批发现摘云南蜜桔青桔丑橘沃柑当应季','橘子新鲜甜孕妇水果薄皮一箱批发现摘云南蜜桔青桔丑橘沃柑当应季',9.55,'img/details/6_1.jpg','img/details/6_2.jpg','img/details/6_3.jpg'),
(NULL,1,'img/details/7_1.jpg','img/details/7_2.jpg','img/details/7_3.jpg','陕西大荔冬枣脆甜枣子新鲜青枣红枣当季孕妇新鲜水果带箱3/6斤【9月20日发完】','陕西大荔冬枣脆甜枣子新鲜青枣红枣当季孕妇新鲜水果带箱3/6斤【9月20日发完】',13.90,'img/details/7_1.jpg','img/details/7_2.jpg','img/details/7_3.jpg'),
(NULL,1,'img/details/8_1.jpg','img/details/8_2.jpg','img/details/8_3.jpg','新疆哈密瓜当季新鲜水果一箱2.5/10斤整箱吐鲁番沙漠火焰西州蜜瓜','新疆哈密瓜当季新鲜水果一箱2.5/10斤整箱吐鲁番沙漠火焰西州蜜瓜',38.82,'img/details/8_1.jpg','img/details/8_2.jpg','img/details/8_3.jpg'),
(NULL,2,'img/details/9_1.jpg','img/details/9_2.jpg','img/details/9_3.jpg','降火水果杨桃水果杨桃新鲜甜杨桃去火的水果下火水果清火水果','降火水果杨桃水果杨桃新鲜甜杨桃去火的水果下火水果清火水果',5.90,'img/details/9_1.jpg','img/details/9_2.jpg','img/details/9_3.jpg'),
(NULL,2,'img/details/10_1.jpg','img/details/10_2.jpg','img/details/10_3.jpg','黄金百香果当季孕妇新鲜水果1/2/3/5斤中大果香甜黄皮鸡蛋果批发','黄金百香果当季孕妇新鲜水果1/2/3/5斤中大果香甜黄皮鸡蛋果批发',13.30,'img/details/10_1.jpg','img/details/10_2.jpg','img/details/10_3.jpg'),
(NULL,2,'img/details/11_1.jpg','img/details/11_2.jpg','img/details/11_3.jpg','广西百香果水果特价批发5斤2/3斤12个新鲜包邮蜂蜜柠檬百香果大果','广西百香果水果特价批发5斤2/3斤12个新鲜包邮蜂蜜柠檬百香果大果',6.60,'img/details/11_1.jpg','img/details/11_2.jpg','img/details/11_3.jpg'),
(NULL,2,'img/details/12_1.jpg','img/details/12_2.jpg','img/details/12_3.jpg','【精选】甘蔗新鲜水果孕妇现摘农家应季时令特产青皮绿皮非黑皮广','【精选】甘蔗新鲜水果孕妇现摘农家应季时令特产青皮绿皮非黑皮广',18.18,'img/details/12_1.jpg','img/details/12_2.jpg','img/details/12_3.jpg'),
(NULL,2,'img/details/13_1.jpg','img/details/13_2.jpg','img/details/13_3.jpg','黑皮甘蔗5斤/10斤当季水果甘甜多汁下单现发广西甘蔗新鲜整箱批发','黑皮甘蔗5斤/10斤当季水果甘甜多汁下单现发广西甘蔗新鲜整箱批发',15.80,'img/details/13_1.jpg','img/details/13_2.jpg','img/details/13_3.jpg'),
(NULL,2,'img/details/14_1.jpg','img/details/14_2.jpg','img/details/14_3.jpg','越南白心火龙果新鲜包邮3/10/5斤热带进口水果非红心火龙果白色肉','越南白心火龙果新鲜包邮3/10/5斤热带进口水果非红心火龙果白色肉',15.80,'img/details/14_1.jpg','img/details/14_2.jpg','img/details/14_3.jpg'),
(NULL,2,'img/details/15_1.jpg','img/details/15_2.jpg','img/details/15_3.jpg','【超甜特价】红心牛奶木瓜9斤/5斤/3斤/新鲜水果冰糖红心木瓜批发','【超甜特价】红心牛奶木瓜9斤/5斤/3斤/新鲜水果冰糖红心木瓜批发',6.18,'img/details/15_1.jpg','img/details/15_2.jpg','img/details/15_3.jpg'),
(NULL,2,'img/details/16_1.jpg','img/details/16_2.jpg','img/details/16_3.jpg','云南天山雪莲果10斤/3斤装新鲜水果黄水连红泥沙大果红心','云南天山雪莲果10斤/3斤装新鲜水果黄水连红泥沙大果红心',6.42,'img/details/16_1.jpg','img/details/16_2.jpg','img/details/16_3.jpg'),
(NULL,3,'img/details/17_1.jpg','img/details/17_2.jpg','img/details/17_3.jpg','新货夏威夷果奶油味坚果休闲零食散装批发500g/250g/80g袋装/罐装','新货夏威夷果奶油味坚果休闲零食散装批发500g/250g/80g袋装/罐装',6.60,'img/details/17_1.jpg','img/details/17_2.jpg','img/details/17_3.jpg'),
(NULL,3,'img/details/18_1.jpg','img/details/18_2.jpg','img/details/18_3.jpg','冻干榴莲干连罐重500g~100g泰国金枕头榴莲肉好吃的零食品榴莲条','冻干榴莲干连罐重500g~100g泰国金枕头榴莲肉好吃的零食品榴莲条',14.85,'img/details/18_1.jpg','img/details/18_2.jpg','img/details/18_3.jpg'),
(NULL,3,'img/details/19_1.jpg','img/details/19_2.jpg','img/details/19_3.jpg','【多口味】奶油核桃新货薄壳新疆特产孕妇零食补脑纸皮大核桃新鲜','【多口味】奶油核桃新货薄壳新疆特产孕妇零食补脑纸皮大核桃新鲜',10.42,'img/details/19_1.jpg','img/details/19_2.jpg','img/details/19_3.jpg'),
(NULL,3,'img/details/20_1.jpg','img/details/20_2.jpg','img/details/20_3.jpg','新货纸皮巴旦木坚果含罐坚果零食巴坦木1000g50g干果散装巴达木','新货纸皮巴旦木坚果含罐坚果零食巴坦木1000g50g干果散装巴达木',5.80,'img/details/20_1.jpg','img/details/20_2.jpg','img/details/20_3.jpg');