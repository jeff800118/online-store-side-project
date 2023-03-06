-- TABLE goods
CREATE TABLE `goods` (
    `goods_num` Int KEY AUTO_INCREMENT,
    `goods_name` VARCHAR(255) NOT NULL,
    `goods_price` VARCHAR(255) NOT NULL,
    `goods_stock` VARCHAR(255) not null,
    `goods_style` VARCHAR(255) not null
)CHARSET UTF8;

INSERT INTO `goods` (goods_name,goods_price,goods_stock,goods_style)
VALUES
('iphone13 mini 256GB (白)',36690,15,'3C'),
('MSI GE66 Raider 10UE-243 TW 筆電',62900,25,'3C'),
('ASUS GA401IV-0152E4901HS 14吋(白)',49900,19,'3C'),
('富士通 Fujitsu E549-PB521 筆電',36800,20,'3C'),
('MSI GP66 Leopard 11UG-007 TW 筆電',61900,49,'3C'),
('聯想 lenovo TAB M8 (2G/32G) 平板電腦',3990,58,'3C'),
('MSI Prestige 15 A11 SCS-05 15.5吋',48900,23,'3C'),
('MSI GP67 Leopard 11UG-007 TW 筆電',51290,15,'3C'),
('MSI Summit E13 Flip Evo-第11帶(白)',53900,8,'3C'),
('ASUS GA401IV-0152E4900HS 14吋(灰)',49900,11,'3C'),
('器材踏板老人踏步機 NMS名購新品',1999,71,'outfit'),
('男士防滑健身墊 女士瑜珈墊加重至2.5公斤 【自由角落】',1799,211,'outfit'),
('台灣製10mm瑜珈墊運動墊防滑加強款 附背袋 POE環保材質 WELLCOME好吉康',1480,231,'outfit'),
('環形夾腿按摩器滾輪小腿部按摩器經絡疏通肌肉放松非瘦腿',385,321,'soutfit'),
('健身大師—毀滅者運動健身跑機',7680,73,'outfit'),
('smart1跑步機家用款小型電動室內健身宿舍摺疊迷你走步機超靜音 1995生活雜貨',15990,17,'outfit'),
('腹肌健身器健腹器懶人收腹機運動健身器材家用女卷腹機腹部美腰機 快速出貨',3499,52,'outfit'),
('智能計數兩用跳繩 記數負重跳繩 運動跳繩 瘦身 健身 智能記數 靜音 無繩跳繩 燃脂專用 減肥 爆汗',249,511,'outfit'),
('攝彩@Aolikes加強髕骨帶 1入 可調節 減震運動護膝 登山健行路跑慢跑 膝束帶跳躍膝髕加壓帶護具',240,1084,'outfit'),
('跑步機 華為DFH生態款佑美U3H跑步機家用款走靜音折疊小型室內健身房專用',40186,75,'outfit'),
('Panasonic 580公升雙門鋼板電冰箱 晶漾銀',30490,18,'furniture'),
('LG MD171QSK3 17L變頻除濕機晶鑽銀/5.3公升',18900,87,'furniture'),
('Panasonic F-P50HH nanoe X 清淨機',7880,46,'furniture'),
('VAGO TVD1輕巧微型真空收納機(白)+收納袋(M)x1',1980,32,'furniture'),
('VAGO TVD1輕巧微型真空收納機(黑)+收納袋(M)x1',1980,66,'furniture'),
('Concern康生CON-FE806 i小漾-捶捶肌肉按摩槍',2980,116,'furniture'),
('KINYO JR-191 隨行杯果汁機 雙杯組',990,254,'furniture'),
('高島 貴族按摩椅(君爵版英倫咖)',58800,23,'furniture'),
('市場最殺↓ 禾聯16吋智能DC風扇 HDF-16AH510',1790,408,'furniture'),
('ECOVACS-DEEBOT T8 AIVI+掃地機器人',23790,146,'furniture'),
('超值買15送2 - 日本ARIEL超濃縮抗菌洗衣組900G瓶',2520,524,'daily'),
('寶貝沐浴精靈髮膚舒緩泡泡400ml（香草+鳳梨）',1280,546,'daily'),
('【It】兒童酵素牙膏40g（草莓）',150,345,'daily'),
('【超神奇】萬用酵素潔淨粉 (1.5kg/盒-2盒)',1180,184,'daily'),
('【台酒生技】易洗樂洗潔精(720ML)',80,395,'daily'),
('【Mobii x 中華航空】台灣當代藝術家口罩系列 32入',299,1089,'daily'),
('升級上市【台酒生技】易洗樂洗潔精超值大包裝(5000ML)',450,288,'daily'),
('【蘭諾LENOR】女神衣物清新洗衣組',1126,166,'daily'),
('【ARIEL】4D抗菌洗衣膠囊5顆袋裝',100,128,'daily'),
('【阿貝家】台灣製造-天然抗菌消臭劑 4000ml',1150,267,'daily'),
('雅詩蘭黛 絕對慾望修護精華唇霜兩支裝特惠組',1840,146,'cosmetic'),
('植村秀 武士刀眉筆三支特惠組',1890,284,'cosmetic'),
('雅詩蘭黛 無瑕妍彩持久纖長睫毛膏三件妝特惠組',3000,149,'cosmetic'),
('芭比波朗 金緻美肌粉特惠組',1870,208,'cosmetic'),
('【夢想公主_迷霧不沾杯系列】不沾杯唇膏 雙色組(任選2支)',850,268,'cosmetic'),
('【FACE PAI 夢想公主】抗暈眼線液筆 咖啡+黑 雙色組',850,646,'cosmetic'),
('【FACE PAI 夢想公主】抗暈眼線液筆 咖啡色',509,346,'cosmetic'),
('【夢想公主_迷霧不沾杯系列】301暖陽大地',509,646,'cosmetic'),
('【夢想公主_迷霧不沾杯系列】306沉香石榴',509,778,'cosmetic'),
('【FACE PAI 夢想公主】抗暈眼線液筆 咖啡色',509,187,'cosmetic');


--TABLE discountPercent
CREATE TABLE `discountPercent` ( 
    `goods_style` VARCHAR(255) NOT NULL,
    `goods_discountPercent` VARCHAR(255) NOT NULL,
)CHARSET UTF8;

INSERT INTO `discountPercent` (goods_style,goods_discountPercent)
VALUES
('3C',0.95);
('outfit',0.85);
('furniture',0.9);
('daily',0.6);
('cosmetic',0.8);

--login、Register
-- TABLE account
CREATE TABLE `account` (
    `account_num` Int KEY AUTO_INCREMENT,
    `account_name` VARCHAR(255) NOT NULL,
    `account_password` VARCHAR(255) NOT NULL,
    `account_permission` VARCHAR(255) not null
)CHARSET UTF8;

INSERT INTO `account` (account_name,account_password,account_permission)
VALUES
('Ac01','a123456',1),
('Ac02','a567890',0);


-- TABLE user
CREATE TABLE `user1` ( 
    `user_num` Int KEY AUTO_INCREMENT,
    `user_name` VARCHAR(255) NOT NULL,
    `user_sex` VARCHAR(255) NOT NULL,
    `user_mail` VARCHAR(255) not null,
    `user_phone` VARCHAR(255) not null,
    `user_address` VARCHAR(255)
)CHARSET UTF8;

INSERT INTO `user1` (user_name,user_sex,user_mail,user_phone,user_address)
VALUES
('大漂亮',0,'aaa@gmail.com',0988686886,'台北市中正區忠孝西路一段999號1樓'),
('卡了米',1,'bbb@gmail.com',0987487987,"");


-- TABLE permission
CREATE TABLE `permission` ( 
    `permission_num` VARCHAR(20) NOT NULL,
    `permission_name` VARCHAR(255) NOT NULL
)CHARSET UTF8;

INSERT INTO `permission` (permission_num,permission_name)
VALUES
(0,'管理員'),
(1,'一級會員');


-- TABLE sex
CREATE TABLE `sex` ( 
    `sex_num` VARCHAR(20) NOT NULL,
    `sex_name` VARCHAR(255) NOT NULL
)CHARSET UTF8;

INSERT INTO `sex` (sex_num,sex_name)
VALUES
(0,'女'),
(1,'男');

-- INNER JOIN
SELECT user1.*,A.account_num FROM user1
INNER JOIN account AS A
ON user1.user_num = A.account_num;
