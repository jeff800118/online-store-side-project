-- TABLE goods
CREATE TABLE `goods` (
    `goods_num` Int KEY AUTO_INCREMENT,
    `goods_pid` Int,
    `goods_name` VARCHAR(255) NOT NULL,
    `goods_price` VARCHAR(255) NOT NULL,
    `goods_stock` VARCHAR(255) NOT NULL,
    `goods_style` VARCHAR(255) NOT NULL,
    `goods_img` VARCHAR(255) NOT NULL
)CHARSET UTF8;

INSERT INTO `goods` (goods_pid,goods_name,goods_price,goods_stock,goods_style,goods_img)
VALUES
(1,'iphone13 mini 256GB (白)',36690,15,'3C','../assets/3C產品/3C1.jpg'),
(1,'MSI GE66 Raider 10UE-243 TW 筆電',62900,25,'3C','../assets/3C產品/3C2.png'),
(1,'ASUS GA401IV-0152E4901HS 14吋(白)',49900,19,'3C','../assets/3C產品/3C3.jpg'),
(1,'富士通 Fujitsu E549-PB521 筆電',36800,20,'3C','../assets/3C產品/3C4.jpg'),
(1,'MSI GP66 Leopard 11UG-007 TW 筆電',61900,49,'3C','../assets/3C產品/3C5.jpg'),
(1,'聯想 lenovo TAB M8 (2G/32G) 平板電腦',3990,58,'3C','../assets/3C產品/3C6.jpg'),
(1,'MSI Prestige 15 A11 SCS-05 15.5吋',48900,23,'3C','../assets/3C產品/3C7.jpg'),
(1,'MSI GP67 Leopard 11UG-007 TW 筆電',51290,15,'3C','../assets/3C產品/3C8.jpg'),
(1,'MSI Summit E13 Flip Evo-第11帶(白)',53900,8,'3C','../assets/3C產品/3C9.jpg'),
(1,'ASUS GA401IV-0152E4900HS 14吋(灰)',49900,11,'3C','../assets/3C產品/3C10.jpg'),
(2,'器材踏板老人踏步機 NMS名購新品',1999,71,'outfit','../assets/健身戶外/outfit1.jpg'),
(2,'男士防滑健身墊 女士瑜珈墊加重至2.5公斤 【自由角落】',1799,211,'outfit','../assets/健身戶外/outfit2.jpg'),
(2,'台灣製10mm瑜珈墊運動墊防滑加強款 附背袋 POE環保材質 WELLCOME好吉康',1480,231,'outfit','../assets/健身戶外/outfit3.jpg'),
(2,'環形夾腿按摩器滾輪小腿部按摩器經絡疏通肌肉放松非瘦腿',385,321,'soutfit','../assets/健身戶外/outfit4.jpg'),
(2,'健身大師—毀滅者運動健身跑機',7680,73,'outfit','../assets/健身戶外/outfit5.jpg'),
(2,'smart1跑步機家用款小型電動室內健身宿舍摺疊迷你走步機超靜音 1995生活雜貨',15990,17,'outfit','../assets/健身戶外/outfit6.jpg'),
(2,'腹肌健身器健腹器懶人收腹機運動健身器材家用女卷腹機腹部美腰機 快速出貨',3499,52,'outfit','../assets/健身戶外/outfit7.jpg'),
(2,'智能計數兩用跳繩 記數負重跳繩 運動跳繩 瘦身 健身 智能記數 靜音 無繩跳繩 燃脂專用 減肥 爆汗',249,511,'outfit','../assets/健身戶外/outfit8.jpg'),
(2,'攝彩@Aolikes加強髕骨帶 1入 可調節 減震運動護膝 登山健行路跑慢跑 膝束帶跳躍膝髕加壓帶護具',240,1084,'outfit','../assets/健身戶外/outfit9.jpg'),
(2,'跑步機 華為DFH生態款佑美U3H跑步機家用款走靜音折疊小型室內健身房專用',40186,75,'outfit','../assets/健身戶外/outfit10.jpg'),
(3,'Panasonic 580公升雙門鋼板電冰箱 晶漾銀',30490,18,'furniture','../assets/家具/furniture1.jpg'),
(3,'LG MD171QSK3 17L變頻除濕機晶鑽銀/5.3公升',18900,87,'furniture','../assets/家具/furniture2.jpg'),
(3,'Panasonic F-P50HH nanoe X 清淨機',7880,46,'furniture','../assets/家具/furniture3.jpg'),
(3,'VAGO TVD1輕巧微型真空收納機(白)+收納袋(M)x1',1980,32,'furniture','../assets/家具/furniture4.jpg'),
(3,'VAGO TVD1輕巧微型真空收納機(黑)+收納袋(M)x1',1980,66,'furniture','../assets/家具/furniture5.jpg'),
(3,'Concern康生CON-FE806 i小漾-捶捶肌肉按摩槍',2980,116,'furniture','../assets/家具/furniture6.jpg'),
(3,'KINYO JR-191 隨行杯果汁機 雙杯組',990,254,'furniture','../assets/家具/furniture7.jpg'),
(3,'高島 貴族按摩椅(君爵版英倫咖)',58800,23,'furniture','../assets/家具/furniture8.jpg'),
(3,'市場最殺↓ 禾聯16吋智能DC風扇 HDF-16AH510',1790,408,'furniture','../assets/家具/furniture9.jpg'),
(3,'ECOVACS-DEEBOT T8 AIVI+掃地機器人',23790,146,'furniture','../assets/家具/furniture10.jpg'),
(4,'超值買15送2 - 日本ARIEL超濃縮抗菌洗衣組900G瓶',2520,524,'daily','../assets/生活用品/daily1.jpg'),
(4,'寶貝沐浴精靈髮膚舒緩泡泡400ml（香草+鳳梨）',1280,546,'daily','../assets/生活用品/daily2.jpg'),
(4,'【It】兒童酵素牙膏40g（草莓）',150,345,'daily','../assets/生活用品/daily3.jpg'),
(4,'【超神奇】萬用酵素潔淨粉 (1.5kg/盒-2盒)',1180,184,'daily','../assets/生活用品/daily4.jpg'),
(4,'【台酒生技】易洗樂洗潔精(720ML)',80,395,'daily','../assets/生活用品/daily5.jpg'),
(4,'【Mobii x 中華航空】台灣當代藝術家口罩系列 32入',299,1089,'daily','../assets/生活用品/daily6.jpg'),
(4,'升級上市【台酒生技】易洗樂洗潔精超值大包裝(5000ML)',450,288,'daily','../assets/生活用品/daily7.jpg'),
(4,'【蘭諾LENOR】女神衣物清新洗衣組',1126,166,'daily','../assets/生活用品/daily8.jpg'),
(4,'【ARIEL】4D抗菌洗衣膠囊5顆袋裝',100,128,'daily','../assets/生活用品/daily9.jpg'),
(4,'【阿貝家】台灣製造-天然抗菌消臭劑 4000ml',1150,267,'daily','../assets/生活用品/daily10.jpg'),
(5,'雅詩蘭黛 絕對慾望修護精華唇霜兩支裝特惠組',1840,146,'cosmetic','../assets/美妝保養/cosmetic1.jpg'),
(5,'植村秀 武士刀眉筆三支特惠組',1890,284,'cosmetic','../assets/美妝保養/cosmetic2.jpg'),
(5,'雅詩蘭黛 無瑕妍彩持久纖長睫毛膏三件妝特惠組',3000,149,'cosmetic','../assets/美妝保養/cosmetic3.jpg'),
(5,'芭比波朗 金緻美肌粉特惠組',1870,208,'cosmetic','../assets/美妝保養/cosmetic4.jpg'),
(5,'【夢想公主_迷霧不沾杯系列】不沾杯唇膏 雙色組(任選2支)',850,268,'cosmetic','../assets/美妝保養/cosmetic5.jpg'),
(5,'【FACE PAI 夢想公主】抗暈眼線液筆 咖啡+黑 雙色組',850,646,'cosmetic','../assets/美妝保養/cosmetic6.jpg'),
(5,'【FACE PAI 夢想公主】抗暈眼線液筆 咖啡色',509,346,'cosmetic','../assets/美妝保養/cosmetic7.jpg'),
(5,'【夢想公主_迷霧不沾杯系列】301暖陽大地',509,646,'cosmetic','../assets/美妝保養/cosmetic8.jpg'),
(5,'【夢想公主_迷霧不沾杯系列】306沉香石榴',509,778,'cosmetic','../assets/美妝保養/cosmetic9.jpg'),
(5,'【FACE PAI 夢想公主】抗暈眼線液筆 咖啡色',509,187,'cosmetic','../assets/美妝保養/cosmetic10.jpg');

-- TABLE own cart
CREATE TABLE `cart` ( 
    `goods_num` Int KEY AUTO_INCREMENT,
    `goods_name` VARCHAR(255) NOT NULL
    `goods_price` VARCHAR(255) NOT NULL
    `goods_count` VARCHAR(255) NOT NULL
    `goods_pid` VARCHAR(255) NOT NULL
)CHARSET UTF8;

INSERT INTO `cart` (sex_num,sex_name)
VALUES
(''),
('男');


--TABLE discountPercent
CREATE TABLE `discountPercent` ( 
    `goods_pid` KEY Int AUTO_INCREMENT,
    `goods_style` VARCHAR(255) NOT NULL,
    `goods_discountPercent` VARCHAR(255) NOT NULL,
    `goods_count` VARCHAR(255) NOT NULL
)CHARSET UTF8;

INSERT INTO `discountPercent` (goods_pid,goods_style,goods_discountPercent,goods_count)
VALUES
('3C',0.95,0),
('健身戶外',0.85,0),
('家具電器',0.9,0),
('生活用品',0.6,0),
('美妝保養',0.8,0);

-- TABLE topSell
CREATE TABLE `topSell` (
    `goods_num` Int KEY AUTO_INCREMENT,
    `goods_count` VARCHAR(255) NOT NULL,
)CHARSET UTF8;

INSERT INTO `topSell` (goods_count)
VALUES
(0);
(0);
(0);
(0);
(0);
(0);
(0);
(0);
(0);
(0);





