--------------------------------------------------------
--  File created - E3T5
--------------------------------------------------------
ALTER SESSION SET CONTAINER = XEPDB1;
CREATE USER E3T5 IDENTIFIED BY ikasle123;
GRANT ALL PRIVILEGES TO E3T5;
--------------------------------------------------------
--  DDL for Table BEZERO
--------------------------------------------------------

  CREATE TABLE "E3T5"."BEZERO" 
   (	"ID" NUMBER(5,0), 
	"IZENA" VARCHAR2(50 BYTE), 
	"ABIZENA" VARCHAR2(100 BYTE), 
	"HELBIDEA" VARCHAR2(255 BYTE), 
	"EMAILA" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table BILTEGI
--------------------------------------------------------

  CREATE TABLE "E3T5"."BILTEGI" 
   (	"ID" NUMBER(3,0), 
	"IZENA" VARCHAR2(255 BYTE), 
	"ID_KOKALEKU" NUMBER(4,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table BULEGARI
--------------------------------------------------------

  CREATE TABLE "E3T5"."BULEGARI" 
   (	"ID" NUMBER(4,0), 
	"ID_LANPOSTU" NUMBER(2,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ERABILTZAILEAK
--------------------------------------------------------

  CREATE TABLE "E3T5"."ERABILTZAILEAK" 
   (	"ID" NUMBER(4,0), 
	"ERABILTZAILEA" VARCHAR2(25 BYTE), 
	"PASAHITZA" VARCHAR2(25 BYTE), 
	"MOTA" CHAR(1 BYTE) DEFAULT 'B'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ESKARI
--------------------------------------------------------

  CREATE TABLE "E3T5"."ESKARI" 
   (	"ID" NUMBER(5,0), 
	"ID_BEZERO" NUMBER(5,0), 
	"ID_EGOERA" NUMBER(1,0), 
	"ID_SALTZAILE" NUMBER(4,0), 
	"ESKAERA_DATA" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ESKARI_EGOERA
--------------------------------------------------------

  CREATE TABLE "E3T5"."ESKARI_EGOERA" 
   (	"ID" NUMBER(1,0), 
	"DESKRIBAPENA" VARCHAR2(10 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ESKARI_HORNITZAILE
--------------------------------------------------------

  CREATE TABLE "E3T5"."ESKARI_HORNITZAILE" 
   (	"ID" NUMBER(5,0), 
	"ESKAERA_DATA" DATE, 
	"EGOERA" VARCHAR2(11 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ESKARI_LERRO
--------------------------------------------------------

  CREATE TABLE "E3T5"."ESKARI_LERRO" 
   (	"ID_ESKARI" NUMBER(5,0), 
	"ID_LERRO" NUMBER(5,0), 
	"ID_PRODUKTU" NUMBER(4,0), 
	"KOPURUA" NUMBER(5,0), 
	"SALNEURRIA" NUMBER(9,2)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ESKARI_LERRO_HORNITZAILE
--------------------------------------------------------

  CREATE TABLE "E3T5"."ESKARI_LERRO_HORNITZAILE" 
   (	"ID_ESKARI" NUMBER(5,0), 
	"ID_LERRO" NUMBER(5,0), 
	"ID_PRODUKTU" NUMBER(4,0), 
	"KOPURUA" NUMBER(5,0), 
	"BALIOA" NUMBER(9,2)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table HERRIALDE
--------------------------------------------------------

  CREATE TABLE "E3T5"."HERRIALDE" 
   (	"ID" CHAR(2 BYTE), 
	"IZENA" VARCHAR2(40 BYTE), 
	"ID_KONTINENTE" NUMBER(1,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table INBENTARIO
--------------------------------------------------------

  CREATE TABLE "E3T5"."INBENTARIO" 
   (	"ID_PRODUKTU" NUMBER(4,0), 
	"ID_BILTEGI" NUMBER(3,0), 
	"KOPURUA" NUMBER(8,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table KATEGORIA
--------------------------------------------------------

  CREATE TABLE "E3T5"."KATEGORIA" 
   (	"ID" NUMBER(2,0), 
	"IZENA" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table KOKALEKU
--------------------------------------------------------

  CREATE TABLE "E3T5"."KOKALEKU" 
   (	"ID" NUMBER(4,0), 
	"HELBIDEA" VARCHAR2(255 BYTE), 
	"POSTAKODEA" VARCHAR2(20 BYTE), 
	"UDALERRIA" VARCHAR2(50 BYTE), 
	"PROBINTZIA" VARCHAR2(50 BYTE), 
	"ID_HERRIALDE" CHAR(2 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table KONTINENTE
--------------------------------------------------------

  CREATE TABLE "E3T5"."KONTINENTE" 
   (	"ID" NUMBER(1,0), 
	"IZENA" VARCHAR2(25 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table LANGILE
--------------------------------------------------------

  CREATE TABLE "E3T5"."LANGILE" 
   (	"ID" NUMBER(4,0), 
	"IZENA" VARCHAR2(50 BYTE), 
	"ABIZENA" VARCHAR2(50 BYTE), 
	"EMAILA" VARCHAR2(50 BYTE), 
	"TELEFONOA" VARCHAR2(50 BYTE), 
	"KONTRATAZIO_DATA" DATE, 
	"ID_NAGUSI" NUMBER(4,0), 
	"SOLDATA" NUMBER(5,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PRODUKTU
--------------------------------------------------------

  CREATE TABLE "E3T5"."PRODUKTU" 
   (	"ID" NUMBER(4,0), 
	"IZENA" VARCHAR2(255 BYTE), 
	"DESKRIBAPENA" VARCHAR2(2000 BYTE), 
	"BALIOA" NUMBER(9,2), 
	"SALNEURRIA" NUMBER(9,2), 
	"ID_KATEGORIA" NUMBER(2,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into E3T5.BEZERO
SET DEFINE OFF;
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('118','CARLYN','CALDERON','3376 Perrysville Ave, Pittsburgh, PA','carlyn.calderon@citigroup.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('119','OLGA','WILKINS','220 Penn Ave # 300, Scranton, PA','olga.wilkins@phillips66.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('120','DELPHA','GOLDEN','135 S 18Th St # 1, Philadelphia, PA','delpha.golden@stryker.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('121','SHARELL','BRANCH','522 Swede St, Norristown, PA','sharell.branch@ibm.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('122','ELEANOR','FARLEY','7708 City Ave, Philadelphia, PA','eleanor.farley@valero.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('123','JUSTINA','HAYES','1801 Lititz Pike, Lancaster, PA','justina.hayes@antheminc.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('124','OMER','MACDONALD','101 E Olney Ave, Philadelphia, PA','omer.macdonald@pg.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('125','ROSELINE','HILL','612 Jefferson Ave, Scranton, PA','roseline.hill@airproducts.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('126','JANEEN','HOLT','223 4Th Ave # 1100, Pittsburgh, PA','janeen.holt@statefarm.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('127','TORY','AVILA','36 W 34Th St, Erie, PA','tory.avila@google.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('128','KEILA','SLATER','1007 Mount Royal Blvd, Pittsburgh, PA','keila.slater@comcastcorporation.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('129','JAZMIN','BURCH','601 Market St, Philadelphia, PA','jazmin.burch@target.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('130','TANDY','RAMSEY','5565 Baynton St, Philadelphia, PA','tandy.ramsey@wnr.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('131','DEBRA','HERRING','5640 Fishers Ln, Rockville, MD','debra.herring@jnj.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('132','MONNIE','WALKER','5122 Sinclair Ln, Baltimore, MD','monnie.walker@metlife.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('133','ALVARO','HOOPER','680 Bel Air Rd, Bel Air, MD','alvaro.hooper@adm.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('134','LEANDRO','WEST','4301 Ashland Ave, Baltimore, MD','leandro.west@marathonpetroleum.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('135','LURLINE','DENNIS','8004 Stansbury Rd, Baltimore, MD','lurline.dennis@freddiemac.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('136','AUREA','SANDERS','10209 Yearling Dr, Rockville, MD','aurea.sanders@pepsico.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('137','STACIA','RUTLEDGE','3000 Greenmount Ave, Baltimore, MD','stacia.rutledge@utc.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('138','PHILOMENA','ELLIOTT','200 E Fort Ave, Baltimore, MD','philomena.elliott@aetna.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('139','GONZALO','STONE','1262 Vocke Rd, Cumberland, MD','gonzalo.stone@lowes.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('140','SO','HARDIN','3314 Eastern Ave, Baltimore, MD','so.hardin@ups.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('141','LAUREN','RODRIQUEZ','12817 Coastal Hwy, Ocean City, MD','lauren.rodriquez@aig.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('142','LOAN','PATTON','11200 Scaggsville Rd, Laurel, MD','loan.patton@prudential.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('143','HA','LOWE','9435 Washington Blvd N # M, Laurel, MD','ha.lowe@intel.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('144','ALEXANDRA','MCGOWAN','2300 Harford Rd, Baltimore, MD','alexandra.mcgowan@humana.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('145','MELISSA','NICHOLS','2 2Nd St # A, Ocean City, MD','melissa.nichols@disney.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('146','KEESHA','COHEN','6917 W Oklahoma Ave, Milwaukee, WI','keesha.cohen@cisco.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('147','ELVERA','BENSON','206 S Broadway # 707, Rochester, MN','elvera.benson@pfizer.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('148','LANORA','RAY','160 Glenwood Ave, Minneapolis, MN','lanora.ray@dow.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('149','JIMMY','WEBER','6915 Grand Ave, Hammond, IN','jimmy.weber@sysco.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('150','MAE','WILKINSON','2215 Oak Industrial Dr Ne, Grand Rapids, MI','mae.wilkinson@fedex.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('151','LINO','NOBLE','65 Cadillac Sq # 2701, Detroit, MI','lino.noble@caterpillar.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('152','KATHIE','JORDAN','3435 Tuscany Dr Se, Grand Rapids, MI','kathie.jordan@lockheedmartin.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('153','HEIKE','EMERSON','215 4Th Ave Se, Cedar Rapids, IA','heike.emerson@newyorklife.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('154','PRINCESS','JONES','1751 Madison Ave, Council Bluffs, IA','princess.jones@uhsinc.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('155','DORETHA','TYLER','810 1St Ave, Council Bluffs, IA','doretha.tyler@coca-colacompany.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('156','EMILIO','DUNCAN','500 W Oklahoma Ave, Milwaukee, WI','emilio.duncan@hcahealthcare.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('157','GLINDA','LAMBERT','4811 S 76Th St # 205, Milwaukee, WI','glinda.lambert@ingrammicro.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('158','EMERY','SCHNEIDER','310 Broadway St, Alexandria, MN','emery.schneider@owens-minor.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('159','AMADO','JEFFERSON','1721 E Lake St, Minneapolis, MN','amado.jefferson@energytransfer.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('160','HISAKO','HERRERA','255 Great Arrow Ave, Buffalo, NY','hisako.herrera@tysonfoods.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('161','JAMEE','MCLAUGHLIN','800 Carter St, Rochester, NY','jamee.mclaughlin@aa.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('162','AUDRIE','CANNON','6640 Campbell Blvd, Lockport, NY','audrie.cannon@delta.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('163','LACEY','WALTERS','802 North Ave, Pittsburgh, PA','lacey.walters@charter.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('164','WELDON','ROBINSON','1136 Arch St, Philadelphia, PA','weldon.robinson@nationwide.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('165','SOLANGE','GATES','6Th And Master St, Philadelphia, PA','solange.gates@johnsoncontrols.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('166','JAME','CALHOUN','Rt 6 E, Warren, PA','jame.calhoun@bestbuy.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('167','STEFAN','WALTERS','1924 Bedford St, Cumberland, MD','stefan.walters@merck.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('168','ARLENE','ELLIOTT','2674 Collingwood St, Detroit, MI','arlene.elliott@advanceautoparts.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('169','SOFIA','BURNETT','2713 N Bendix Dr, South Bend, IN','sofia.burnett@libertymutual.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('170','CHRISTAL','GRANT','23985 Bedford Rd N, Battle Creek, MI','christal.grant@gs.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('171','VIOLETA','STOKES','752 W Huron St, Pontiac, MI','violeta.stokes@honeywell.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('172','JACKELINE','FINLEY','660 Woodward Ave # 2290, Detroit, MI','jackeline.finley@mastercard.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('173','HEIDY','MASSEY','1330 N Memorial Dr, Racine, WI','heidy.massey@massmutual.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('174','YOLANDO','WILKERSON','701 Seneca St, Buffalo, NY','yolando.wilkerson@oracle.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('175','LUCINDA','HURLEY','8 Automation Ln, Albany, NY','lucinda.hurley@morganstanley.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('176','GITA','LOGAN','811 N Brandywine Ave, Schenectady, NY','gita.logan@cigna.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('177','FELICITA','ALSTON','2904 S Salina St, Syracuse, NY','felicita.alston@unitedcontinentalholdings.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('178','LELA','EWING','3025 Sussex Ave, Pittsburgh, PA','lela.ewing@allstate.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('179','GABRIEL','POLLARD','932 High St, Lancaster, PA','gabriel.pollard@tiaa.org');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('180','VINCENZA','WALTON','5344 Haverford Ave, Philadelphia, PA','vincenza.walton@intlfcstone.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('181','SHANDRA','HIGGINS','6959 Tulip St, Philadelphia, PA','shandra.higgins@chsinc.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('182','THOMASENA','PICKETT','511 S Central Ave # A, Baltimore, MD','thomasena.pickett@americanexpress.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('183','AARON','HOLDER','400 E Joppa Rd, Baltimore, MD','aaron.holder@gilead.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('184','CARLOS','MOODY','1795 Wu Meng, Muang Chonburi, ','carlos.moody@publix.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('185','JAVIER','KIM','1796 Tsing Tao, Muang Nonthaburi, ','javier.kim@generaldynamics.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('186','FRAN','BATTLE','1810 Tucker Crt, Mumbai, ','fran.battle@tjx.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('187','SHELIA','BREWER','Walpurgisstr 69, Munich, ','shelia.brewer@conocophillips.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('188','JERI','RANDALL','Sendlinger Tor 4, Munich, ','jeri.randall@nike.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('189','JERMAINE','COTE','Theresienstr 15, Munich, ','jermaine.cote@wfscorp.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('190','KENNETH','SIMMONS','Via Frenzy 6903, Roma, ','kenneth.simmons@3m.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('191','DULCE','MATTHEWS','1822 Ironweed St, Toronto, ONT','dulce.matthews@mondelezinternational.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('192','KRISTLE','CAIN','Via Luminosa 162, Firenze, ','kristle.cain@exeloncorp.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('193','ERIKA','MURRAY','Via Notoriosa 1932 Rd, Firenze, ','erika.murray@21cf.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('194','MAUD','COHEN','Via Notoriosa 1941, Firenze, ','maud.cohen@johndeere.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('195','ROLANDA','VANG','Via Dolorosa 69, Tellaro, ','rolanda.vang@appliedmaterials.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('196','RENEA','CARNEY','Via Notoriosa 1943, Firenze, ','renea.carney@dupont.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('197','SYBIL','HARDING','Via Luminosa 162, Tellaro, ','sybil.harding@avnet.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('198','COLETTE','ESTRADA','2017 Convoy St, Tokyo, ','colette.estrada@eastman.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('199','MAXIMO','ORTEGA','Via Di Firenze 231, Tellaro, ','maximo.ortega@macysinc.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('200','KINA','LARSEN','Via Notoriosa 1949, Firenze, ','kina.larsen@enterpriseproducts.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('201','JARVIS','ALLISON','Via Frenzy 6903, Tellaro, ','jarvis.allison@travelers.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('202','COLLENE','NEWTON','Piazza Del Congresso 22, San Giminiano, ','collene.newton@sonicautomotive.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('203','VELLA','HANCOCK','Piazza Quattre Stagioni 4, San Giminiano, ','vella.hancock@pmi.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('204','RETTA','MARTINEZ','Piazza Cacchiatore 23, San Giminiano, ','retta.martinez@riteaid.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('205','ANNELLE','LAWRENCE','Via Notoriosa 1932, Tellaro, ','annelle.lawrence@techdata.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('61','CIARA','FLOWERS','300 Crooks St, Green Bay, WI','ciara.flowers@fcx.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('62','BIRGIT','STEPHENSON','122 E Dayton St, Madison, WI','birgit.stephenson@conagrafoods.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('63','SHAMEKA','SPENCER','633 S Hawley Rd, Milwaukee, WI','shameka.spencer@sempra.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('64','ALYSA','KANE','2122 Campbell Rd, La Crosse, WI','alysa.kane@gapinc.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('65','FRANSISCA','REEVES','3324 N Oakland Ave, Milwaukee, WI','fransisca.reeves@bakerhughes.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('66','JESSIKA','MERRITT','666 22Nd Ave Ne, Minneapolis, MN','jessika.merritt@bnymellon.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('67','AGUSTINA','CONNER','1501 Lowry Ave N, Minneapolis, MN','agustina.conner@dollartree.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('68','ROXANNA','WADE','113 N 1St St, Minneapolis, MN','roxanna.wade@autozone.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('69','VIRGIE','MAYS','4200 Yosemite Ave S, Minneapolis, MN','virgie.mays@wholefoodsmarket.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('70','TRANG','MCCONNELL','2800 Chicago Ave # 100, Minneapolis, MN','trang.mcconnell@ppg.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('71','NADA','WEST','200 1St St Sw, Rochester, MN','nada.west@genpt.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('72','CATHERINA','HANEY','314 W Superior St # 1015, Duluth, MN','catherina.haney@ielp.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('73','HARRIETTE','MELTON','1409 Willow St # 600, Minneapolis, MN','harriette.melton@navistar.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('74','WILLETTE','RODGERS','2720 Brewerton Rd, Syracuse, NY','willette.rodgers@pfgc.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('75','CALANDRA','WILLIAMSON','2134 W Genesee St, Syracuse, NY','calandra.williamson@omnicomgroup.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('76','TAMATHA','DELGADO','1522 Main St, Niagara Falls, NY','tamatha.delgado@dish.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('77','FELIX','FERGUSON','49 N Pine Ave, Albany, NY','felix.ferguson@firstenergycorp.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('78','ELWOOD','HAMPTON','726 Union St, Hudson, NY','elwood.hampton@precast.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('79','JOSH','ROACH','137 Lark St, Albany, NY','josh.roach@monsanto.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('80','LUANNA','SCOTT','33 Fulton St, Poughkeepsie, NY','luanna.scott@aes.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('81','MERYL','COLE','2360 Maxon Rd, Schenectady, NY','meryl.cole@carmax.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('82','JANNET','ELLIOTT','85 High St, Buffalo, NY','jannet.elliott@discoverfinancial.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('83','FAE','GLENN','1 Palisade Ave Fl 2, Yonkers, NY','fae.glenn@nov.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('84','FRANCISCO','CUMMINGS','500 S Salina St # 500, Syracuse, NY','francisco.cummings@nrgenergy.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('85','ERMELINDA','BENTON','33 Pine St, Lockport, NY','ermelinda.benton@westerndigital.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('86','LASONYA','BEARD','Po Box 2152, Buffalo, NY','lasonya.beard@marriott.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('87','RAYNA','TRAN','2979 Hamburg St, Schenectady, NY','rayna.tran@libertyinteractive.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('88','ANNICE','BOYER','1790 Grand Blvd, Schenectady, NY','annice.boyer@walmart.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('89','JA','WHITFIELD','7 Ingelside Ln, White Plains, NY','ja.whitfield@exxonmobil.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('90','JAIME','LESTER','18 Glenridge Rd, Schenectady, NY','jaime.lester@apple.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('91','CHARLSIE','LINDSEY','6432 Rising Sun Ave, Philadelphia, PA','charlsie.lindsey@berkshirehathaway.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('92','JANNETTE','HENRY','Rr 10, Reading, PA','jannette.henry@mckesson.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('93','MARGART','MCCALL','2455 Rose Garden Rd, Pittsburgh, PA','margart.mccall@unitedhealthgroup.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('94','TWANNA','CLEVELAND','1812 Timberline Rd, Altoona, PA','twanna.cleveland@cvshealth.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('95','BRONWYN','HORN','141 Schiller St, Reading, PA','bronwyn.horn@gm.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('96','JON','PETERSEN','1126 Pawlings Rd, Norristown, PA','jon.petersen@ford.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('97','DENNY','DANIEL','55 Church Hill Rd, Reading, PA','denny.daniel@att.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('98','AVIS','MOORE','354 N Prince St, Lancaster, PA','avis.moore@ge.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('99','EDEN','BURKE','115 Chestnut St, Philadelphia, PA','eden.burke@amerisourcebergen.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('100','ELISHA','LLOYD','2899 Grand Ave, Pittsburgh, PA','elisha.lloyd@verizon.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('101','SAMARA','BARNETT','Po Box 39, Indiana, PA','samara.barnett@chevron.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('102','NADIA','SAWYER','1604 Broadway Ave, Pittsburgh, PA','nadia.sawyer@costco.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('103','MELITA','HOLCOMB','4734 Liberty Ave, Pittsburgh, PA','melita.holcomb@fanniemae.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('104','EVITA','DICKERSON','21 Thornwood Rd, Harrisburg, PA','evita.dickerson@thekrogerco.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('105','AUNDREA','BARRY','3725 W Lake Rd, Erie, PA','aundrea.barry@amazon.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('106','IRVIN','LEACH','1808 4Th Ave, Altoona, PA','irvin.leach@walgreensbootsalliance.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('107','KELLEE','MOLINA','Station Sq, Pittsburgh, PA','kellee.molina@hp.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('108','RONNY','SYKES','4020 Garden Ave, Erie, PA','ronny.sykes@cardinal.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('109','OCIE','WALTON','100 N Peach St, Philadelphia, PA','ocie.walton@express-scripts.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('110','REVA','FULLER','835 Heister Ln, Reading, PA','reva.fuller@jpmorganchase.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('111','MARICA','HENDERSON','378 S Negley Ave, Pittsburgh, PA','marica.henderson@grainger.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('112','VANETTA','GROSS','5643 N 5Th St, Philadelphia, PA','vanetta.gross@boeing.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('113','AUDREA','HAYDEN','1401 W Warren Rd, Bradford, PA','audrea.hayden@microsoft.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('114','NEDA','MCFADDEN','815 Freeport Rd, Pittsburgh, PA','neda.mcfadden@bankofamerica.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('115','DELL','WILKINSON','327 N Washington Ave # 300, Scranton, PA','dell.wilkinson@wellsfargo.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('116','SHAREE','CARVER','810 Race St, Philadelphia, PA','sharee.carver@baxter.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('117','JOAQUINA','MCCONNELL','4901 Locust Ln, Harrisburg, PA','joaquina.mcconnell@homedepTIENDA.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('206','SHERRON','SIMON','Via Notoriosa 1949, Ventimiglia, ','sherron.simon@ally.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('207','CARITA','MCINTYRE','1831 No Wong, Peking, ','carita.mcintyre@northwesternmutual.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('208','STEPHAINE','BOOKER','Via Notoriosa 1942, Firenze, ','stephaine.booker@tsocorp.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('209','EMILIE','PARSONS','Via Delle Grazie 11, Tellaro, ','emilie.parsons@timewarner.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('210','JALEESA','BOWEN','2033 Spartacus St, Samutprakarn, ','jaleesa.bowen@cstbrands.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('211','JEANNIE','POOLE','2034 Sabrina Rd, Samutprakarn, ','jeannie.poole@aboutmcdonalds.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('212','ADRIENNE','LANG','Piazza Svizzera, Milano, ','adrienne.lang@qualcomm.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('213','JESS','NGUYEN','Ruella Delle Spiriti, Milano, ','jess.nguyen@searsholdings.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('214','TANDY','HOUSE','Via Del Disegno 194, Milano, ','tandy.house@ebay.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('215','HERMAN','STOKES','Via Delle Capeletti 52, San Giminiano, ','herman.stokes@capitalone.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('216','KEESHA','LAMBERT','Via Delle Grazie 11, San Giminiano, ','keesha.lambert@emc.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('217','LAUREN','WILLIAMSON','Via Delli Capelli 2, San Giminiano, ','lauren.williamson@usaa.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('218','LUCIUS','ABBOTT','1592 Silverado St, Bangalore, Kar','lucius.abbott@lennar.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('219','BEATRICE','FORD','1593 Silverado St, Bangalore, Kar','beatrice.ford@duke-energy.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('220','TAMISHA','VARGAS','1597 Legend St, Mysore, Kar','tamisha.vargas@twc.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('221','DICK','LAMB','1602 Sholay St, Chennai, Tam','dick.lamb@halliburton.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('222','YOLANDA','BALL','1605 Bazigar Crt, Pune, ','yolanda.ball@gamestopcorp.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('223','JERICA','BROOKS','1606 Sangam Blvd, New Delhi, ','jerica.brooks@northropgrumman.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('224','NICHOL','CARTER','1607 Sangam Blvd, New Delhi, ','nichol.carter@arrow.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('225','BOBBY','WILSON','1609 Pakija Rd, New Delhi, ','bobby.wilson@rsac.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('226','EVE','SAUNDERS','1612 Talaivar St, Chennai, Tam','eve.saunders@officedepTIENDA.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('227','GINGER','ATKINSON','1613 Victoria St, Calcutta, ','ginger.atkinson@nordstrom.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('228','KENTON','HARRELL','1614 Gitanjali Rd, Calcutta, ','kenton.harrell@kindermorgan.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('229','MISTI','VELAZQUEZ','1615 Crackers Crt, Chennai - India, ','misti.velazquez@aramark.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('230','BRANDIE','BUCHANAN','1616 Mr. India Ln, Bombay - India, Kar','brandie.buchanan@davita.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('231','KANDI','HOLDEN','1617 Crackers St, Bangalore - India, Kar','kandi.holden@molinahealthcare.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('232','LASHONDA','CUNNINGHAM','1618 Villains St, New Delhi - India, ','lashonda.cunningham@wellcare.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('233','ROXANNE','MICHALKOW','1619 Bowlers Rd, Chandigarh, Har','roxanne.michalkow@cbscorporation.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('234','PHUONG','SANDERS','1620 Sixers Crt, Bombay, Kar','phuong.sanders@visa.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('235','VIDA','KLINE','1622 Roja St, Chennai, Tam','vida.kline@lfg.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('236','MAYOLA','HOUSTON','1623 Hey Ram St, Chennai - India, ','mayola.houston@ecolab.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('237','CRISTINE','BELL','1627 Sowdagar St, New Delhi, ','cristine.bell@kelloggcompany.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('238','SHAMIKA','BAUER','1628 Pataudi St, New Delhi, ','shamika.bauer@chrobinson.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('239','REBBECA','DAY','1632 Splash St, Chandigarh, Har','rebbeca.day@textron.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('240','MARYROSE','CAIN','1636 Pretty Blvd, Bangalore, Kar','maryrose.cain@loews.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('241','JOHNIE','ROJAS','1646 Brazil Blvd, Chennai, Tam','johnie.rojas@itw.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('242','VERLA','CHRISTIAN','1647 Suspense St, Cochin, Ker','verla.christian@synnex.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('243','TERESSA','HEWITT','1648 Anamika St, Cochin, Ker','teressa.hewitt@hormelfoods.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('244','SHENNA','BLAIR','1650 Teesri Manjil Crt, Kashmir, ','shenna.blair@viacom.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('245','LATOYIA','BURT','1656 Veterans Rd, Chennai, Tam','latoyia.burt@hollyfrontier.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('246','SHAQUITA','NORMAN','1662 Talaivar St, Chennai, Tam','shaquita.norman@landolakesinc.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('247','MYRNA','ROMERO','1667 2010 St, Batavia, Ker','myrna.romero@celgene.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('248','BILL','STEIN','Piazza Del Congresso 22, Roma, ','bill.stein@devonenergy.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('249','OLIVIA','CONRAD','Piazza Quattre Stagioni 4, Roma, ','olivia.conrad@pbfenergy.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('250','MARIANNE','BRYANT','Piazza Svizzera, Roma, ','marianne.bryant@genworth.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('251','DUSTIN','PAUL','Ruella Delle Spiriti, Roma, ','dustin.paul@yum.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('252','ELROY','WOLF','Via Del Disegno 194, Roma, ','elroy.wolf@ti.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('253','JADWIGA','MORRISON','Via Delle Capeletti 52, Roma, ','jadwiga.morrison@cdw.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('254','ISABELLA','ORTEGA','Via Dello Croce 93, Roma, ','isabella.ortega@paypal.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('255','KATIA','CASE','Via Di Firenze 231, Roma, ','katia.case@wm.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('256','ENRIQUETA','ODOM','Via Dolorosa 69, Roma, ','enriqueta.odom@mmc.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('257','DON','HANSEN','Via Notoriosa 1942, Ventimiglia, ','don.hansen@chk.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('258','HERB','SLOAN','Via Notoriosa 1943, Ventimiglia, ','herb.sloan@pricelinegroup.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('259','BLANCHE','ROBBINS','Canale Grande 2, Roma, ','blanche.robbins@parker.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('260','GAYNELL','BURTON','Piazza Cacchiatore 23, Roma, ','gaynell.burton@oxy.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('261','MARHTA','BALDWIN','Via Del Disegno 194, San Giminiano, ','marhta.baldwin@guardianlife.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('262','PETER','GAMBLE','Piazza Svizzera, San Giminiano, ','peter.gamble@mgmresorts.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('263','NATHAN','CALLAHAN','Via Dello Croce 93, Tellaro, ','nathan.callahan@farmers.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('264','TEREASA','PADILLA','Via Dello Croce 93, San Giminiano, ','tereasa.padilla@jcpenney.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('265','MERRILEE','PHILLIPS','Ruella Delle Spiriti, San Giminiano, ','merrilee.phillips@conedison.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('266','TISHA','MCDONALD','Via Delle Capeletti 52, San Giminiano, ','tisha.mcdonald@autoliv.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('267','NAPOLEON','CRUZ','Via Delli Capelli 2, Tellaro, ','napoleon.cruz@cognizant.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('268','BASILIA','DOWNS','1971 Limelight Blvd, Samutprakarn, ','basilia.downs@vfc.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('269','ALESSANDRA','ESTRADA','Harmoniegasse 3, Baden-Daettwil, AG','alessandra.estrada@ameriprise.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('270','SHERRON','FLORES','Sonnenberg 4, Baden-Daettwil, AG','sherron.flores@fnf.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('271','ELICIA','TOWNSEND','Alfred E. Neumann-Weg 3, Baden-Daettwil, AG','elicia.townsend@csc.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('272','PERCY','HERNANDEZ','Dr. Herbert Bitto Str 23, Baden-Daettwil, AG','percy.hernandez@lb.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('273','SHELIA','CAIN','Taefernstr 4, Baden-Daettwil, AG','shelia.cain@jacobs.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('274','CHARLENE','BOOKER','Kreuzritterplatz 5, Baden-Daettwil, AG','charlene.booker@republicservices.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('275','MAC','MCKAY','Helebardenweg 5, Baden-Daettwil, AG','mac.mckay@principal.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('276','JAMISON','MERRITT','Zum Freundlichen Nachbarn 5, Baden-Daettwil, AG','jamison.merritt@rossstores.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('277','QUINTON','WOODS','Ziegenwiese 3, Baden-Daettwil, AG','quinton.woods@bedbathandbeyond.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('278','CATHEY','MCDOWELL','Am Waldrand 5, Baden-Daettwil, AG','cathey.mcdowell@csx.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('279','DENEEN','HAYS','Zur Kantine 9, Baden-Daettwil, AG','deneen.hays@toysrusinc.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('280','JACKSON','MORIN','Grosse Bahnhostrasse 3, Baden-Daettwil, AG','jackson.morin@sands.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('281','MARGO','HOFFMAN','Paradeplatz 4, Zuerich, ZH','margo.hoffman@leucadia.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('282','ADAH','MYERS','Badenerstr 1941, Zuerich, ZH','adah.myers@dom.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('283','FLORENE','CRAIG','Welschdoerfchen 1941, Chur, ZH','florene.craig@ussteel.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('284','JANEY','BURRIS','Le Reduit, Tschiertschen, GR','janey.burris@l-3com.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('285','EVELINA','CAMPBELL','Bendlehn, Trogen, SG','evelina.campbell@edisoninvestor.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('286','THI','MAXWELL','Spisertor 3, St. Gallen, SG','thi.maxwell@entergy.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('287','ALESHIA','REESE','Langstr 14, Zuerich, ZH','aleshia.reese@adp.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('288','DOROTHA','WONG','Roessligasse 4, Zurich, ZH','dorotha.wong@firstdata.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('289','ESTELA','DONOVAN','Zum Froehlichen Schweizer 3, Zurich, ZH','estela.donovan@blackrock.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('290','HASSAN','RIVERS','Chrottenweg, Bern, BE','hassan.rivers@westrock.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('291','JEN','MCMAHON','Bruppacher Str 3, Baden-Daettwil, AG','jen.mcmahon@voya.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('292','BARBIE','CARTER','Limmatquai, Zuerich, ZH','barbie.carter@sherwin.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('293','CLEO','ENGLISH','Dreikoenigsstr 3, Zurich, ZH','cleo.english@hiltonworldwide.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('294','LIANA','PENA','Pfannenstilstr 13, Egg, ZH','liana.pena@corning.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('295','FRANCINA','SLATER','Kreuzstr 32, Zurich, ZH','francina.slater@rrdonnelley.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('296','JOSIE','STEELE','1539 Stripes Rd, Baden-Daettwil, AG','josie.steele@stanleyblackanddecker.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('297','MARYROSE','ROBERSON','1540 Stripes Crt, Baden-Daettwil, AG','maryrose.roberson@xcelenergy.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('298','ELLY','SALINAS','1592 Silverado St, Bangalore, Kar','elly.salinas@kiewit.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('299','GINNY','CARLSON','1593 Silverado St, Bangalore, Kar','ginny.carlson@orate.murphyusa.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('300','MOZELLE','SCHNEIDER','1596 Commando Blvd, Bangalore, Kar','mozelle.schneider@cbre.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('301','ADAM','JACOBS','1598 Legend St, Bangalore, Kar','adam.jacobs@univar.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('302','VERNIA','HAYES','1599 Legend Rd, Bangalore, Kar','vernia.hayes@drhorton.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('303','ISMAEL','SOLOMON','1600 Target Crt, Bangalore, Kar','ismael.solomon@elcompanies.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('304','IVEY','RUTLEDGE','1603 Rebel St, Bangalore, Kar','ivey.rutledge@praxair.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('305','JAME','TERRELL','1604 Volunteers Rd, Bangalore, Kar','jame.terrell@biogen.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('306','DAINA','COMBS','1606 Volunteers Blvd, Bangalore, Kar','daina.combs@mosaicco.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('307','LASHUNDA','DAVIDSON','1607 Abwdrts St, Bangalore, Kar','lashunda.davidson@statestreet.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('308','ARLETTE','THORNTON','1608 Amadeus St, Bangalore, Kar','arlette.thornton@unum.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('309','DARRON','ROBERTSON','1610 Betrayal Crt, Bangalore, Kar','darron.robertson@reynoldsamerican.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('310','MAPLE','BARNETT','1611 Carmen Blvd, Bangalore, Kar','maple.barnett@core-mark.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('311','CHARLSIE','CAREY','1614 Crackers Rd, Bangalore - India, Kar','charlsie.carey@group1auto.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('312','FRANK','SHANNON','1615 Crackers Crt, Bangalore - India, Kar','frank.shannon@henryschein.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('313','JOSIAH','BEASLEY','1616 Crackers Blvd, Bangalore - India, Kar','josiah.beasley@hertz.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('314','ANNABELLE','BUTLER','1617 Crackers St, Bangalore - India, Kar','annabelle.butler@thrivent.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('315','ED','MUELLER','1618 Footloose St, Bangalore - India, Kar','ed.mueller@nscorp.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('316','COLLEEN','ESTRADA','1619 Footloose Rd, Bangalore - India, Kar','colleen.estrada@rgare.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('317','NIKIA','KENT','1621 Gargon! Blvd, Bangalore - India, Kar','nikia.kent@pseg.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('318','AMBER','BRADY','1667 2010 St, Batavia, IL','amber.brady@c-a-m.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('319','WENDELL','MASSEY','1668 Chong Tao, Beijing, ','wendell.massey@bbt.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('1','FLOR','STONE','514 W Superior St, Kokomo, IN','flor.stone@raytheon.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('2','LAVERA','EMERSON','2515 Bloyd Ave, Indianapolis, IN','lavera.emerson@plainsallamerican.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('3','FERN','HEAD','8768 N State Rd 37, Bloomington, IN','fern.head@usfoods.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('4','SHYLA','ORTIZ','6445 Bay Harbor Ln, Indianapolis, IN','shyla.ortiz@abbvie.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('5','JENI','LEVY','4019 W 3Rd St, Bloomington, IN','jeni.levy@centene.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('6','MATTHIAS','HANNAH','1608 Portage Ave, South Bend, IN','matthias.hannah@chs.net');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('7','MATTHIAS','CRUISE','23943 Us Highway 33, Elkhart, IN','matthias.cruise@alcoa.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('8','MEENAKSHI','MASON','136 E Market St # 800, Indianapolis, IN','meenakshi.mason@internationalpaper.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('9','CHRISTIAN','CAGE','1905 College St, South Bend, IN','christian.cage@emerson.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('10','CHARLIE','SUTHERLAND','3512 Rockville Rd # 137C, Indianapolis, IN','charlie.sutherland@up.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('11','CHARLIE','PACINO','1303 E University St, Bloomington, IN','charlie.pacino@amgen.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('12','GUILLAUME','JACKSON','115 N Weinbach Ave, Evansville, IN','guillaume.jackson@usbank.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('13','DANIEL','COSTNER','2067 Rollett Ln, Evansville, IN','daniel.costner@staples.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('14','DIANNE','DEREK','1105 E Allendale Dr, Bloomington, IN','dianne.derek@danaher.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('15','GERALDINE','SCHNEIDER','18305 Van Dyke St, Detroit, MI','geraldine.schneider@whirlpoolcorp.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('16','GERALDINE','MARTIN','Lucas Dr Bldg 348, Detroit, MI','geraldine.martin@aflac.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('17','GUILLAUME','EDWARDS','1801 Monroe Ave Nw, Grand Rapids, MI','guillaume.edwards@autonation.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('18','MAURICE','MAHONEY','4925 Kendrick St Se, Grand Rapids, MI','maurice.mahoney@progressive.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('19','MAURICE','HASAN','3310 Dixie Ct, Saginaw, MI','maurice.hasan@abbott.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('20','DIANE','HIGGINS','113 Washington Sq N, Lansing, MI','diane.higgins@dollargeneral.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('21','DIANNE','SEN','2500 S Pennsylvania Ave, Lansing, MI','dianne.sen@tenethealth.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('22','MAURICE','DALTREY','3213 S Cedar St, Lansing, MI','maurice.daltrey@lilly.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('23','TESS','ROTH','8110 Jackson Rd, Ann Arbor, MI','tess.roth@dteenergy.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('24','KA','KAUFMAN','6654 W Lafayette St, Detroit, MI','ka.kaufman@southwest.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('25','SHARYL','MONTOYA','27 Benton Rd, Saginaw, MI','sharyl.montoya@penskeautomotive.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('26','DANIEL','GLASS','8201 Livernois Ave, Detroit, MI','daniel.glass@manpowergroup.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('27','RENA','ARNOLD','101 N Falahee Rd, Jackson, MI','rena.arnold@assurant.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('28','ARLYNE','INGRAM','3100 E Eisenhower Pky # 100, Ann Arbor, MI','arlyne.ingram@kohlscorporation.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('29','WILLIE','BARRERA','952 Vassar Dr, Kalamazoo, MI','willie.barrera@starbucks.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('30','MIREYA','COCHRAN','150 W Jefferson Ave # 2500, Detroit, MI','mireya.cochran@paccar.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('31','MARLENE','ODOM','40 Pearl St Nw # 1020, Grand Rapids, MI','marlene.odom@cummins.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('32','JACLYN','ATKINSON','1135 Catherine St, Ann Arbor, MI','jaclyn.atkinson@globalp.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('33','AL','SCHULTZ','301 E Genesee Ave, Saginaw, MI','al.schultz@altria.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('34','FELICITAS','RILEY','9936 Dexter Ave, Detroit, MI','felicitas.riley@xerox.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('35','CORA','CALHOUN','1660 University Ter, Ann Arbor, MI','cora.calhoun@kimberly-clark.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('36','TRULA','BUCKLEY','15713 N East St, Lansing, MI','trula.buckley@thehartford.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('37','SASHA','WALLACE','555 John F Kennedy Rd, Dubuque, IA','sasha.wallace@huntsman.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('38','CAITLIN','HILL','10315 Hickman Rd, Des Moines, IA','caitlin.hill@kraftheinzcompany.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('39','GINO','PICKETT','2115 N Towne Ln Ne, Cedar Rapids, IA','gino.pickett@lear.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('40','AMIRA','MACDONALD','1928 Sherwood Dr, Council Bluffs, IA','amira.macdonald@fluor.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('41','MACK','MORSE','2102 E Kimberly Rd, Davenport, IA','mack.morse@aecom.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('42','EBONI','JARVIS','1691 Asbury Rd, Dubuque, IA','eboni.jarvis@bd.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('43','GABRIELLE','DENNIS','5112 Sw 9Th St, Des Moines, IA','gabrielle.dennis@facebook.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('44','CLASSIE','NORRIS','221 3Rd Ave Se # 300, Cedar Rapids, IA','classie.norris@jabil.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('45','KHALILAH','HOLMAN','2120 Heights Dr, Eau Claire, WI','khalilah.holman@centurylink.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('46','ISREAL','ROSE','8989 N Port Washington Rd, Milwaukee, WI','isreal.rose@supervalu.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('47','VERENA','HOPPER','6555 W Good Hope Rd, Milwaukee, WI','verena.hopper@generalmills.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('48','AUDIE','FLORES','1314 N Stoughton Rd, Madison, WI','audie.flores@southerncompany.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('49','GERTRUDE','COOKE','4715 Sprecher Rd, Madison, WI','gertrude.cooke@nexteraenergy.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('50','PRINCESS','KANE','6161 N 64Th St, Milwaukee, WI','princess.kane@thermofisher.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('51','JACINTA','FAULKNER','11016 W Lincoln Ave, Milwaukee, WI','jacinta.faulkner@aep.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('52','LASHON','WALL','8600 W National Ave, Milwaukee, WI','lashon.wall@pge.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('53','CORLISS','MCNEIL','615 N Sherman Ave, Madison, WI','corliss.mcneil@nglenergypartners.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('54','BROCK','WEBB','512 E Grand Ave, Beloit, WI','brock.webb@bms.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('55','MELANY','MCMAHON','600 N Broadway Fl 1, Milwaukee, WI','melany.mcmahon@goodyear.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('56','ROGELIO','KIRBY','5235 N Ironwood Ln, Milwaukee, WI','rogelio.kirby@nucor.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('57','WALLACE','DILLARD','322 E Michigan St, Milwaukee, WI','wallace.dillard@pnc.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('58','GIA','BOYLE','1400 Bellinger St Fl 4, Eau Claire, WI','gia.boyle@healthnet.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('59','TENNIE','GAY','411 E Wisconsin Ave # 2550, Milwaukee, WI','tennie.gay@micron.com');
Insert into E3T5.BEZERO (ID,IZENA,ABIZENA,HELBIDEA,EMAILA) values ('60','OPHELIA','HURST','808 3Rd St # 100, Wausau, WI','ophelia.hurst@colgatepalmolive.com');
REM INSERTING into E3T5.BILTEGI
SET DEFINE OFF;
Insert into E3T5.BILTEGI (ID,IZENA,ID_KOKALEKU) values ('1','Southlake, Texas','5');
Insert into E3T5.BILTEGI (ID,IZENA,ID_KOKALEKU) values ('2','San Francisco','6');
Insert into E3T5.BILTEGI (ID,IZENA,ID_KOKALEKU) values ('3','New Jersey','7');
Insert into E3T5.BILTEGI (ID,IZENA,ID_KOKALEKU) values ('4','Seattle, Washington','8');
Insert into E3T5.BILTEGI (ID,IZENA,ID_KOKALEKU) values ('5','Toronto','9');
Insert into E3T5.BILTEGI (ID,IZENA,ID_KOKALEKU) values ('6','Sydney','13');
Insert into E3T5.BILTEGI (ID,IZENA,ID_KOKALEKU) values ('7','Mexico City','23');
Insert into E3T5.BILTEGI (ID,IZENA,ID_KOKALEKU) values ('8','Beijing','11');
Insert into E3T5.BILTEGI (ID,IZENA,ID_KOKALEKU) values ('9','Bombay','12');
Insert into E3T5.BILTEGI (ID,IZENA,ID_KOKALEKU) values ('10','Santurtzi','24');
REM INSERTING into E3T5.BULEGARI
SET DEFINE OFF;
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('107','1');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('106','2');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('101','3');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('1','4');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('3','5');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('2','5');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('11','6');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('10','6');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('14','6');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('12','6');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('13','6');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('9','7');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('104','8');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('4','9');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('5','9');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('8','9');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('7','9');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('6','9');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('102','10');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('103','11');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('105','12');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('17','13');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('16','13');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('18','13');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('19','13');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('20','13');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('15','14');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('49','15');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('48','15');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('47','15');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('46','15');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('50','15');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('85','17');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('86','17');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('87','17');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('88','17');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('89','17');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('90','17');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('91','17');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('92','17');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('93','17');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('94','17');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('95','17');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('96','17');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('97','13');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('98','17');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('99','17');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('100','17');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('81','17');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('82','17');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('83','17');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('84','17');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('33','18');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('44','18');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('43','18');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('42','18');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('41','18');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('26','18');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('27','18');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('28','18');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('29','18');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('30','18');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('31','18');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('32','18');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('45','18');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('34','18');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('35','18');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('36','18');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('37','18');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('38','18');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('39','18');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('40','18');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('25','19');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('24','19');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('23','19');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('22','19');
Insert into E3T5.BULEGARI (ID,ID_LANPOSTU) values ('21','19');
REM INSERTING into E3T5.ERABILTZAILEAK
SET DEFINE OFF;
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('39','gpickett','gpickett','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('40','amacdonald','amacdonald','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('41','mmorse','mmorse','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('42','ejarvis','ejarvis','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('43','gdennis','gdennis','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('44','cnorris','cnorris','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('45','kholman','kholman','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('46','irose','irose','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('47','vhopper','vhopper','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('48','aflores','aflores','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('49','gcooke','gcooke','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('50','pkane','pkane','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('51','jfaulkner','jfaulkner','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('52','lwall','lwall','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('53','cmcneil','cmcneil','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('54','bwebb','bwebb','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('55','mmcmahon','mmcmahon','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('56','rkirby','rkirby','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('57','wdillard','wdillard','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('58','gboyle','gboyle','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('59','tgay','tgay','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('60','ohurst','ohurst','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('61','cflowers','cflowers','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('62','bstephenson','bstephenson','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('63','sspencer','sspencer','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('64','akane','akane','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('65','freeves','freeves','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('66','jmerritt','jmerritt','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('67','aconner','aconner','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('68','rwade','rwade','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('69','vmays','vmays','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('70','tmcconnell','tmcconnell','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('71','nwest','nwest','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('72','chaney','chaney','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('73','hmelton','hmelton','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('74','wrodgers','wrodgers','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('75','cwilliamson','cwilliamson','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('76','tdelgado','tdelgado','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('77','fferguson','fferguson','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('78','ehampton','ehampton','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('79','jroach','jroach','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('80','lscott','lscott','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('81','mcole','mcole','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('82','jelliott','jelliott','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('83','fglenn','fglenn','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('84','fcummings','fcummings','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('85','ebenton','ebenton','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('86','lbeard','lbeard','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('87','rtran','rtran','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('88','aboyer','aboyer','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('89','jwhitfield','jwhitfield','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('90','jlester','jlester','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('91','clindsey','clindsey','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('92','jhenry','jhenry','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('93','mmccall','mmccall','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('94','tcleveland','tcleveland','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('95','bhorn','bhorn','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('96','jpetersen','jpetersen','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('97','ddaniel','ddaniel','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('98','amoore','amoore','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('99','eburke','eburke','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('100','elloyd','elloyd','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('101','sbarnett','sbarnett','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('102','nsawyer','nsawyer','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('103','mholcomb','mholcomb','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('104','edickerson','edickerson','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('105','abarry','abarry','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('106','ileach','ileach','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('107','kmolina','kmolina','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('109','owalton','owalton','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('110','rfuller','rfuller','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('111','mhenderson','mhenderson','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('112','vgross','vgross','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('113','ahayden','ahayden','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('114','nmcfadden','nmcfadden','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('115','dwilkinson','dwilkinson','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('116','scarver','scarver','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('117','jmcconnell','jmcconnell','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('107','spayne','spayne','S');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('56','eharrison','eharrison','S');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('57','sgibson','sgibson','S');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('58','rmcdonald','rmcdonald','S');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('59','ccruz','ccruz','S');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('60','imarshall','imarshall','S');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('61','dortiz','dortiz','S');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('62','fgomez','fgomez','S');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('80','edixon','edixon','S');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('64','ffreeman','ffreeman','S');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('65','awells','awells','S');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('66','cwebb','cwebb','S');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('67','ssimpson','ssimpson','S');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('68','mstevens','mstevens','S');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('69','etucker','etucker','S');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('70','eporter','eporter','S');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('71','mhunter','mhunter','S');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('72','shicks','shicks','S');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('74','ehenry','ehenry','S');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('75','iboyd','iboyd','S');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('76','lmason','lmason','S');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('77','rmorales','rmorales','S');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('78','mkennedy','mkennedy','S');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('79','ewarren','ewarren','S');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('54','lfisher','lfisher','S');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('53','sreynolds','sreynolds','S');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('52','sowens','sowens','S');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('51','pjordan','pjordan','S');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('63','pmurray','pmurray','S');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('118','ccalderon','ccalderon','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('119','owilkins','owilkins','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('120','dgolden','dgolden','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('121','sbranch','sbranch','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('122','efarley','efarley','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('123','jhayes','jhayes','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('124','omacdonald','omacdonald','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('125','rhill','rhill','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('126','jholt','jholt','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('127','tavila','tavila','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('128','kslater','kslater','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('129','jburch','jburch','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('130','tramsey','tramsey','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('131','dherring','dherring','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('132','mwalker','mwalker','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('133','ahooper','ahooper','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('134','lwest','lwest','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('135','ldennis','ldennis','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('136','asanders','asanders','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('137','srutledge','srutledge','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('138','pelliott','pelliott','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('139','gstone','gstone','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('140','shardin','shardin','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('141','lrodriquez','lrodriquez','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('142','lpatton','lpatton','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('143','hlowe','hlowe','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('144','amcgowan','amcgowan','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('145','mnichols','mnichols','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('146','kcohen','kcohen','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('147','ebenson','ebenson','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('148','lray','lray','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('149','jweber','jweber','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('150','mwilkinson','mwilkinson','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('151','lnoble','lnoble','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('152','kjordan','kjordan','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('153','hemerson','hemerson','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('154','pjones','pjones','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('155','dtyler','dtyler','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('156','eduncan','eduncan','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('157','glambert','glambert','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('158','eschneider','eschneider','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('159','ajefferson','ajefferson','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('160','hherrera','hherrera','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('161','jmclaughlin','jmclaughlin','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('162','acannon','acannon','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('163','lwalters','lwalters','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('164','wrobinson','wrobinson','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('165','sgates','sgates','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('166','jcalhoun','jcalhoun','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('167','swalters','swalters','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('168','aelliott','aelliott','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('169','sburnett','sburnett','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('170','cgrant','cgrant','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('171','vstokes','vstokes','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('172','jfinley','jfinley','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('173','hmassey','hmassey','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('174','ywilkerson','ywilkerson','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('175','lhurley','lhurley','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('176','glogan','glogan','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('177','falston','falston','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('178','lewing','lewing','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('179','gpollard','gpollard','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('180','vwalton','vwalton','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('181','shiggins','shiggins','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('182','tpickett','tpickett','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('183','aholder','aholder','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('184','cmoody','cmoody','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('185','jkim','jkim','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('186','fbattle','fbattle','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('187','sbrewer','sbrewer','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('188','jrandall','jrandall','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('189','jcote','jcote','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('190','ksimmons','ksimmons','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('191','dmatthews','dmatthews','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('192','kcain','kcain','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('193','emurray','emurray','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('194','mcohen','mcohen','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('195','rvang','rvang','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('196','rcarney','rcarney','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('197','sharding','sharding','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('198','cestrada','cestrada','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('199','mortega','mortega','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('200','klarsen','klarsen','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('201','jallison','jallison','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('202','cnewton','cnewton','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('203','vhancock','vhancock','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('204','rmartinez','rmartinez','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('205','alawrence','alawrence','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('206','ssimon','ssimon','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('207','cmcintyre','cmcintyre','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('208','sbooker','sbooker','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('209','eparsons','eparsons','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('210','jbowen','jbowen','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('211','jpoole','jpoole','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('212','alang','alang','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('213','jnguyen','jnguyen','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('214','thouse','thouse','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('215','hstokes','hstokes','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('216','klambert','klambert','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('217','lwilliamson','lwilliamson','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('218','labbott','labbott','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('219','bford','bford','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('220','tvargas','tvargas','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('221','dlamb','dlamb','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('222','yball','yball','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('223','jbrooks','jbrooks','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('224','ncarter','ncarter','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('225','bwilson','bwilson','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('226','esaunders','esaunders','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('227','gatkinson','gatkinson','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('228','kharrell','kharrell','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('229','mvelazquez','mvelazquez','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('230','bbuchanan','bbuchanan','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('231','kholden','kholden','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('232','lcunningham','lcunningham','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('233','rmichalkow','rmichalkow','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('234','psanders','psanders','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('235','vkline','vkline','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('236','mhouston','mhouston','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('237','cbell','cbell','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('238','sbauer','sbauer','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('239','rday','rday','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('240','mcain','mcain','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('241','jrojas','jrojas','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('242','vchristian','vchristian','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('243','thewitt','thewitt','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('244','sblair','sblair','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('245','lburt','lburt','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('246','snorman','snorman','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('247','mromero','mromero','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('248','bstein','bstein','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('249','oconrad','oconrad','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('250','mbryant','mbryant','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('251','dpaul','dpaul','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('252','ewolf','ewolf','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('253','jmorrison','jmorrison','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('254','iortega','iortega','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('255','kcase','kcase','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('256','eodom','eodom','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('257','dhansen','dhansen','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('258','hsloan','hsloan','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('259','brobbins','brobbins','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('260','gburton','gburton','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('261','mbaldwin','mbaldwin','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('262','pgamble','pgamble','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('263','ncallahan','ncallahan','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('264','tpadilla','tpadilla','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('265','mphillips','mphillips','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('266','tmcdonald','tmcdonald','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('267','ncruz','ncruz','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('268','bdowns','bdowns','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('269','aestrada','aestrada','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('270','sflores','sflores','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('271','etownsend','etownsend','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('272','phernandez','phernandez','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('273','scain','scain','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('274','cbooker','cbooker','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('275','mmckay','mmckay','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('276','jmerritt','jmerritt','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('277','qwoods','qwoods','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('278','cmcdowell','cmcdowell','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('279','dhays','dhays','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('280','jmorin','jmorin','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('281','mhoffman','mhoffman','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('282','amyers','amyers','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('283','fcraig','fcraig','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('284','jburris','jburris','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('285','ecampbell','ecampbell','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('286','tmaxwell','tmaxwell','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('287','areese','areese','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('288','dwong','dwong','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('289','edonovan','edonovan','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('290','hrivers','hrivers','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('291','jmcmahon','jmcmahon','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('292','bcarter','bcarter','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('293','cenglish','cenglish','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('294','lpena','lpena','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('295','fslater','fslater','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('296','jsteele','jsteele','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('297','mroberson','mroberson','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('298','esalinas','esalinas','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('299','gcarlson','gcarlson','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('300','mschneider','mschneider','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('301','ajacobs','ajacobs','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('302','vhayes','vhayes','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('303','isolomon','isolomon','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('304','irutledge','irutledge','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('305','jterrell','jterrell','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('306','dcombs','dcombs','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('307','ldavidson','ldavidson','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('308','athornton','athornton','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('309','drobertson','drobertson','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('310','mbarnett','mbarnett','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('311','ccarey','ccarey','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('312','fshannon','fshannon','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('313','jbeasley','jbeasley','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('314','abutler','abutler','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('315','emueller','emueller','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('316','cestrada','cestrada','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('317','nkent','nkent','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('318','abrady','abrady','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('319','wmassey','wmassey','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('1','fstone','fstone','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('2','lemerson','lemerson','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('3','fhead','fhead','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('4','sortiz','sortiz','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('5','jlevy','jlevy','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('6','mhannah','mhannah','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('7','mcruise','mcruise','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('8','mmason','mmason','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('9','ccage','ccage','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('10','csutherland','csutherland','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('11','cpacino','cpacino','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('12','gjackson','gjackson','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('13','dcostner','dcostner','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('14','dderek','dderek','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('15','gschneider','gschneider','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('16','gmartin','gmartin','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('17','gedwards','gedwards','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('18','mmahoney','mmahoney','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('19','mhasan','mhasan','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('20','dhiggins','dhiggins','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('21','dsen','dsen','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('22','mdaltrey','mdaltrey','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('23','troth','troth','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('24','kkaufman','kkaufman','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('25','smontoya','smontoya','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('26','dglass','dglass','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('27','rarnold','rarnold','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('28','aingram','aingram','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('29','wbarrera','wbarrera','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('30','mcochran','mcochran','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('31','modom','modom','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('32','jatkinson','jatkinson','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('33','aschultz','aschultz','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('34','friley','friley','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('35','ccalhoun','ccalhoun','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('36','tbuckley','tbuckley','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('37','swallace','swallace','B');
Insert into E3T5.ERABILTZAILEAK (ID,ERABILTZAILEA,PASAHITZA,MOTA) values ('38','chill','chill','B');
REM INSERTING into E3T5.ESKARI
SET DEFINE OFF;
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('105','1','1','54',to_date('17/11/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('44','2','1',null,to_date('20/02/17','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('101','3','1',null,to_date('03/01/17','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('1','4','1','56',to_date('15/10/17','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('28','6','2','57',to_date('15/08/17','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('87','7','2','57',to_date('01/12/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('4','8','3','59',to_date('09/04/15','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('41','9','3','59',to_date('11/05/17','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('82','44','3','60',to_date('03/12/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('102','45','3','61',to_date('10/12/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('26','46','3','62',to_date('16/08/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('43','47','3','62',to_date('02/05/15','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('53','48','3','62',to_date('29/09/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('81','49','3','62',to_date('13/12/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('83','16','3','62',to_date('02/12/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('93','17','3','62',to_date('27/10/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('94','1','3','62',to_date('27/10/17','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('79','2','3','64',to_date('14/12/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('80','3','3','64',to_date('13/12/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('2','4','3',null,to_date('26/04/15','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('3','5','3',null,to_date('26/04/17','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('6','6','3',null,to_date('09/04/15','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('7','7','3',null,to_date('15/02/17','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('8','8','3',null,to_date('14/02/17','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('9','9','3',null,to_date('14/02/17','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('10','44','1',null,to_date('24/01/17','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('11','45','3',null,to_date('29/11/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('12','46','3',null,to_date('29/11/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('13','47','3',null,to_date('29/11/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('14','48','3',null,to_date('28/09/17','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('15','49','3',null,to_date('27/09/17','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('16','16','1',null,to_date('27/09/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('17','17','3',null,to_date('27/09/17','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('18','18','3',null,to_date('16/08/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('19','19','3',null,to_date('27/05/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('20','20','3',null,to_date('27/05/17','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('21','21','1',null,to_date('27/05/17','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('22','22','2',null,to_date('26/05/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('23','23','3',null,to_date('07/09/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('24','41','3',null,to_date('07/09/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('25','42','3',null,to_date('24/08/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('27','43','2',null,to_date('16/08/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('29','44','3',null,to_date('14/08/17','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('30','45','3',null,to_date('12/08/17','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('31','46','2',null,to_date('12/08/17','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('32','47','3',null,to_date('09/03/17','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('33','48','3',null,to_date('07/03/17','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('34','49','3',null,to_date('12/06/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('35','50','3',null,to_date('05/09/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('36','51','3',null,to_date('05/09/17','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('37','52','3',null,to_date('19/02/17','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('38','53','2','57',to_date('31/05/15','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('39','54','3','62',to_date('22/10/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('40','55','3','62',to_date('11/05/17','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('42','56','2','64',to_date('03/05/15','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('45','57','3','64',to_date('20/02/17','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('46','58','1','62',to_date('20/02/17','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('47','59','2','62',to_date('10/10/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('48','60','2','64',to_date('10/10/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('49','61','3',null,to_date('02/10/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('50','62','1',null,to_date('02/10/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('51','63','3','59',to_date('02/10/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('52','64','3','60',to_date('02/10/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('54','65','3','56',to_date('29/09/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('55','66','1','59',to_date('29/09/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('56','67','2',null,to_date('29/09/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('57','68','3','57',to_date('24/08/17','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('58','69','3','57',to_date('24/08/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('59','70','3','59',to_date('29/06/15','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('60','1','3','62',to_date('30/06/17','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('61','2','3','54',to_date('30/06/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('62','3','3','62',to_date('30/06/15','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('63','4','3','61',to_date('30/06/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('64','5','3','64',to_date('21/06/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('65','6','3','64',to_date('21/06/13','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('66','7','2','61',to_date('21/06/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('67','8','2','61',to_date('14/06/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('68','9','1',null,to_date('13/06/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('69','44','2','54',to_date('17/03/17','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('70','45','2','61',to_date('21/02/17','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('71','46','3','54',to_date('21/02/17','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('72','47','3','64',to_date('17/02/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('73','48','3',null,to_date('17/02/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('74','49','3','64',to_date('10/02/17','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('75','16','3',null,to_date('10/02/17','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('76','17','3',null,to_date('10/02/17','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('77','1','3','60',to_date('02/01/17','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('78','2','1','64',to_date('14/12/15','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('84','3','3','64',to_date('01/12/15','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('85','4','1',null,to_date('01/12/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('86','5','1','60',to_date('30/11/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('88','6','3','61',to_date('01/11/17','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('89','7','3',null,to_date('27/10/15','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('90','8','1',null,to_date('28/10/15','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('91','9','1','56',to_date('28/10/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('92','44','3','59',to_date('28/10/15','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('95','45','3','59',to_date('19/09/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('96','46','3','56',to_date('14/09/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('97','47','2','60',to_date('12/07/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('98','48','3',null,to_date('18/03/17','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('99','49','3','60',to_date('07/01/17','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('100','16','1','54',to_date('05/01/17','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('103','17','1','64',to_date('08/02/16','DD/MM/RR'));
Insert into E3T5.ESKARI (ID,ID_BEZERO,ID_EGOERA,ID_SALTZAILE,ESKAERA_DATA) values ('104','18','3','60',to_date('01/02/17','DD/MM/RR'));
REM INSERTING into E3T5.ESKARI_EGOERA
SET DEFINE OFF;
Insert into E3T5.ESKARI_EGOERA (ID,DESKRIBAPENA) values ('1','Pending');
Insert into E3T5.ESKARI_EGOERA (ID,DESKRIBAPENA) values ('2','Canceled');
Insert into E3T5.ESKARI_EGOERA (ID,DESKRIBAPENA) values ('3','Shipped');
REM INSERTING into E3T5.ESKARI_HORNITZAILE
SET DEFINE OFF;
Insert into E3T5.ESKARI_HORNITZAILE (ID,ESKAERA_DATA,EGOERA) values ('2',to_date('28/04/25','DD/MM/RR'),'Bidaltzeko');
Insert into E3T5.ESKARI_HORNITZAILE (ID,ESKAERA_DATA,EGOERA) values ('3',to_date('28/04/25','DD/MM/RR'),'Bidaltzeko');
Insert into E3T5.ESKARI_HORNITZAILE (ID,ESKAERA_DATA,EGOERA) values ('4',to_date('28/04/25','DD/MM/RR'),'Bidaltzeko');
Insert into E3T5.ESKARI_HORNITZAILE (ID,ESKAERA_DATA,EGOERA) values ('1',to_date('27/04/25','DD/MM/RR'),'Entregatuta');
REM INSERTING into E3T5.ESKARI_LERRO
SET DEFINE OFF;
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('9','8','93','132','2116,72');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('10','9','119','107','899,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('14','8','238','64','741,78');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('16','9','135','76','127,88');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('18','8','136','32','826,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('19','10','200','93','620,95');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('22','13','281','73','864,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('25','8','2','65','2554,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('27','13','111','102','827,37');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('28','8','40','105','299,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('29','11','115','52','699,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('31','6','171','103','382,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('32','6','102','147','2042,69');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('33','8','13','75','704,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('34','6','101','62','635,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('35','5','186','41','1449,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('36','8','141','144','419,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('39','9','144','125','289,79');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('40','11','184','88','999,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('41','9','55','61','150,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('42','7','139','149','65,92');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('46','11','89','119','749,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('51','2','7','64','680,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('53','4','177','96','1759,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('58','12','62','148','789,79');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('59','9','154','82','1204,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('64','2','126','52','640,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('65','6','262','118','1449,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('66','9','279','90','1318,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('67','10','239','45','739,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('68','9','177','84','1759,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('69','9','261','55','1504,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('70','7','32','132','469,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('73','5','192','124','519,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('74','7','27','92','800,74');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('75','11','6','128','849,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('76','10','95','106','109,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('77','5','271','148','549,59');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('81','7','79','127','659,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('82','9','284','138','54,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('83','8','174','117','798,26');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('84','6','131','34','279,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('87','11','271','58','549,59');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('90','8','92','49','2200');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('91','11','226','77','309,85');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('93','5','121','141','721,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('94','9','12','33','824,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('99','9','17','144','699,01');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('102','3','247','149','339,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('104','7','178','145','1999,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('105','6','183','79','899,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('2','9','200','75','620,95');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('4','8','18','116','799');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('6','7','7','119','680,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('8','9','268','148','47,88');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('2','1','43','111','298,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('3','1','24','111','66,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('4','1','280','47','149,88');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('6','1','199','67','647,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('7','1','227','74','305');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('8','1','87','92','759,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('9','1','108','139','849,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('10','1','145','118','287');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('11','1','96','113','141,56');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('12','1','191','41','573,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('13','1','84','46','440,3');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('14','1','129','98','734,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('1','1','137','116','469,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('15','1','287','60','329,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('16','1','166','70','1638,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('17','1','149','51','282,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('18','1','213','105','1469,96');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('19','1','38','53','1199,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('20','1','126','105','640,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('21','1','36','79','1299,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('22','1','83','44','829,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('23','1','202','104','713,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('24','1','121','129','721,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('25','1','43','109','298,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('26','1','200','114','620,95');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('27','1','71','38','660');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('28','1','31','61','443,72');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('29','1','7','38','680,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('30','1','235','70','41,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('31','1','101','68','635,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('32','1','251','83','337,81');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('33','1','55','93','150,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('34','1','185','141','873,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('35','1','174','133','798,26');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('36','1','204','45','686,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('37','1','35','150','1314,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('38','1','71','90','660');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('39','1','186','116','1449,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('40','1','141','106','419,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('41','1','268','80','47,88');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('42','1','34','45','417,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('43','1','67','74','863,05');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('44','1','220','118','759,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('45','1','74','43','701,95');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('46','1','120','51','892');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('47','1','178','73','1999,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('48','1','165','46','1666,61');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('49','1','172','104','358,49');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('50','1','215','49','829,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('51','1','21','34','749,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('52','1','235','123','41,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('53','1','100','130','97,88');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('54','1','208','73','1199,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('55','1','102','127','2042,69');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('56','1','84','70','440,3');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('57','1','224','75','349,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('58','1','64','55','525,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('59','1','178','101','1999,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('60','1','205','74','649,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('61','1','174','114','798,26');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('62','1','188','130','482,49');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('63','1','70','72','710,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('64','1','199','61','647,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('65','1','280','104','149,88');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('66','1','77','143','695,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('67','1','287','61','329,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('68','1','163','98','1899,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('69','1','206','57','4139');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('70','1','185','146','873,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('71','1','19','146','1704,37');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('72','1','129','101','734,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('73','1','245','120','1699');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('74','1','104','97','83,88');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('75','1','58','73','784,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('76','1','109','92','713,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('77','1','203','65','671,38');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('78','1','92','147','2200');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('79','1','285','145','339,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('80','1','213','63','1469,96');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('81','1','128','133','741,63');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('82','1','91','42','2259,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('83','1','264','35','88,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('84','1','106','137','608,95');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('85','1','155','114','588,95');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('86','1','202','46','713,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('87','1','47','123','2377,09');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('88','1','278','139','677,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('89','1','247','45','339,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('90','1','65','84','1199,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('91','1','122','89','722,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('92','1','208','114','1199,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('93','1','257','70','84,95');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('94','1','255','38','90,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('95','1','52','138','1676,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('96','1','260','34','267,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('97','1','110','39','3192,97');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('98','1','66','104','399,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('99','1','95','66','109,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('100','1','280','70','149,88');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('101','1','17','47','699,01');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('102','1','196','69','1099,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('103','1','6','117','849,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('104','1','129','74','734,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('105','1','31','116','443,72');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('1','2','78','77','686,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('3','2','56','65','16,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('8','2','12','70','824,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('9','2','99','123','68,06');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('10','2','10','102','811,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('12','2','63','58','572,96');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('15','2','154','67','1204,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('16','2','155','106','588,95');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('19','2','24','62','66,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('20','2','41','78','299,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('21','2','101','146','635,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('22','2','116','45','731,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('23','2','190','50','948,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('25','2','239','119','739,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('27','2','141','77','419,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('28','2','121','120','721,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('29','2','82','62','1499,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('31','2','176','97','939,49');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('33','2','153','33','1249');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('35','2','70','134','710,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('36','2','101','105','635,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('37','2','67','129','863,05');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('38','2','169','52','1844,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('39','2','153','108','1249');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('40','2','101','131','635,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('41','2','219','82','1299,73');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('43','2','287','66','329,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('46','2','4','112','2699,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('47','2','55','107','150,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('48','2','158','98','2009,46');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('53','2','168','89','43,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('55','2','32','70','469,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('58','2','120','32','892');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('59','2','166','34','1638,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('60','2','13','138','704,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('61','2','56','75','16,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('63','2','54','47','1019,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('65','2','113','83','704,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('66','2','218','40','1388,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('67','2','144','121','289,79');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('68','2','248','42','2774,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('69','2','71','66','660');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('70','2','83','52','829,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('71','2','241','38','1756');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('72','2','211','123','1064,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('74','2','250','86','338,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('75','2','187','74','353,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('76','2','177','98','1759,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('77','2','168','136','43,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('78','2','169','50','1844,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('79','2','265','53','1431,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('82','2','107','71','644');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('83','2','196','54','1099,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('84','2','199','137','647,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('85','2','230','35','136,69');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('86','2','156','47','394,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('87','2','233','96','59,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('88','2','11','106','2015,11');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('89','2','102','84','2042,69');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('90','2','64','60','525,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('91','2','220','127','759,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('92','2','34','126','417,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('94','2','186','146','1449,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('95','2','143','64','402,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('97','2','207','82','3254,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('101','2','113','134','704,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('104','2','171','90','382,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('105','2','242','67','1751,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('1','3','64','52','525,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('8','3','71','87','660');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('9','3','265','90','1431,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('12','3','42','75','299,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('15','3','246','133','343,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('16','3','235','56','41,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('19','3','23','142','89,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('22','3','24','77','66,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('25','3','29','65','645,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('27','3','68','96','766,11');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('28','3','41','56','299,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('29','3','268','118','47,88');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('36','3','100','102','97,88');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('38','3','264','89','88,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('39','3','109','33','713,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('40','3','250','131','338,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('41','3','69','86','678,75');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('43','3','110','94','3192,97');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('46','3','187','86','353,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('47','3','65','99','1199,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('57','2','177','110','1759,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('58','3','113','73','704,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('59','3','118','105','699,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('60','3','272','144','1073,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('61','3','146','59','283,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('65','3','116','35','731,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('66','3','286','35','234');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('67','3','167','94','1010,46');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('68','3','183','50','899,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('69','3','253','112','579,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('71','3','195','75','1055,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('72','3','273','145','443,64');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('75','3','33','143','52,65');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('76','3','163','134','1899,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('77','3','218','143','1388,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('78','3','125','119','768,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('83','3','116','76','731,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('86','3','287','45','329,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('87','3','130','119','117,45');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('89','3','224','89','349,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('91','3','266','83','1418,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('97','3','270','61','769,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('101','3','135','134','127,88');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('104','3','45','48','2501,69');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('105','3','275','45','399,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('1','4','210','87','1029,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('8','4','25','40','104,88');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('9','4','288','62','319,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('12','4','144','70','289,79');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('13','2','85','82','1274,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('14','2','206','133','4139');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('16','4','95','42','109,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('18','2','226','57','309,85');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('22','4','288','44','319,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('24','2','227','61','305');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('25','4','209','80','1199,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('26','2','186','92','1449,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('27','4','263','95','89,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('28','4','208','139','1199,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('29','4','141','32','419,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('30','2','200','137','620,95');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('33','3','217','67','401,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('36','4','10','72','811,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('38','4','61','59','487,3');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('40','4','230','80','136,69');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('41','4','258','49','57,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('43','4','105','86','2799,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('44','2','215','148','829,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('46','4','264','104','88,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('57','3','238','122','741,78');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('58','4','186','70','1449,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('59','4','47','138','2377,09');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('60','4','92','125','2200');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('61','4','34','71','417,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('67','4','109','117','713,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('68','4','163','125','1899,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('73','2','35','130','1314,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('75','4','142','115','2998,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('76','4','272','56','1073,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('77','4','2','99','2554,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('78','4','200','87','620,95');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('79','3','204','138','686,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('83','4','261','106','1504,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('86','4','121','76','721,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('89','4','253','126','579,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('90','3','134','106','295,72');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('91','4','194','75','397,42');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('94','3','218','86','1388,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('105','4','138','80','645,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('1','5','138','131','645,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('2','2','265','121','1431,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('3','3','28','63','479,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('6','2','138','41','645,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('8','5','284','118','54,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('12','5','208','133','1199,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('13','3','240','80','1805,97');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('15','4','239','71','739,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('19','4','259','46','80,72');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('21','3','250','120','338,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('22','5','160','59','1908,73');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('23','3','210','80','1029,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('24','3','47','51','2377,09');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('25','5','235','45','41,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('27','5','118','122','699,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('28','5','27','99','800,74');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('29','5','258','137','57,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('30','3','260','37','267,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('32','2','142','130','2998,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('35','3','211','87','1064,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('38','5','209','149','1199,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('40','5','98','149','2064,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('41','5','179','83','312,67');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('46','5','181','94','999,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('55','3','260','79','267,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('57','4','164','114','1850');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('58','5','62','143','789,79');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('59','5','203','117','671,38');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('60','5','278','114','677,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('67','5','80','129','564,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('68','5','108','150','849,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('69','4','82','58','1499,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('74','3','242','61','1751,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('75','5','192','37','519,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('76','5','89','133','749,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('78','5','181','37','999,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('82','3','254','121','119,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('89','5','44','55','49,37');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('91','5','272','111','1073,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('94','4','80','133','564,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('1','6','126','95','640,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('2','3','195','39','1055,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('3','4','64','46','525,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('12','6','236','114','745,32');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('13','4','30','60','645,2');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('14','3','231','87','449,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('15','5','230','92','136,69');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('18','3','93','83','2116,72');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('19','5','107','106','644');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('22','6','56','43','16,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('23','4','116','74','731,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('25','6','28','85','479,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('27','6','29','133','645,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('29','6','30','75','645,2');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('30','4','237','50','744,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('31','3','191','147','573,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('38','6','278','76','677,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('39','4','53','128','1003,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('40','6','273','82','443,64');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('41','6','287','112','329,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('46','6','60','80','59,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('47','4','33','98','52,65');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('58','6','213','77','1469,96');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('59','6','154','126','1204,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('65','4','248','42','2774,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('66','4','103','88','809,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('68','6','13','141','704,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('69','5','278','71','677,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('70','3','102','84','2042,69');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('74','4','106','82','608,95');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('75','6','95','81','109,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('76','6','167','46','1010,46');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('78','6','206','145','4139');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('81','2','241','134','1756');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('82','4','157','113','388,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('87','4','127','59','719,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('89','6','122','140','722,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('91','6','123','37','3177,44');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('92','3','65','132','1199,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('95','3','271','69','549,59');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('99','2','118','37','699,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('1','7','30','41','645,2');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('2','4','18','49','799');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('3','5','107','112','644');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('4','2','137','75','469,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('9','5','145','58','287');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('10','3','182','83','949,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('12','7','141','110','419,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('13','5','167','89','1010,46');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('15','6','253','83','579,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('19','6','103','105','809,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('22','7','17','60','699,01');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('23','5','5','59','2290,79');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('26','3','279','71','1318,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('27','7','155','51','588,95');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('29','7','166','103','1638,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('30','5','43','68','298,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('31','4','226','34','309,85');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('34','2','131','113','279,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('38','7','49','139','1499,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('39','5','38','144','1199,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('40','7','258','99','57,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('41','7','25','101','104,88');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('42','2','10','147','811,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('44','3','271','37','549,59');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('46','7','155','114','588,95');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('47','5','149','123','282,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('59','7','152','82','280,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('61','5','15','32','725,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('66','5','174','66','798,26');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('67','6','108','82','849,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('70','4','82','139','1499,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('74','5','3','101','799,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('75','7','106','74','608,95');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('76','7','196','125','1099,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('79','4','63','146','572,96');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('81','3','69','104','678,75');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('82','5','48','59','1218,5');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('83','5','101','122','635,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('84','3','269','147','759,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('87','5','265','74','1431,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('90','4','93','146','2116,72');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('91','7','118','113','699,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('92','4','110','111','3192,97');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('95','4','86','123','804,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('97','4','33','67','52,65');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('99','3','84','98','440,3');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('101','4','284','52','54,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('102','2','95','117','109,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('103','2','258','142','57,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('1','8','170','129','383,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('2','5','160','30','1908,73');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('3','6','36','81','1299,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('4','3','7','140','680,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('8','6','127','34','719,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('9','6','14','48','704,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('10','4','172','133','358,49');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('12','8','256','85','26,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('13','6','1','127','640,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('16','5','45','80','2501,69');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('19','7','30','94','645,2');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('21','4','1','135','640,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('22','8','222','99','754,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('23','6','169','40','1844,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('27','8','71','127','660');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('29','8','10','81','811,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('31','5','79','56','659,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('32','3','73','134','799');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('34','3','39','100','301,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('36','5','255','143','90,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('37','3','147','100','283,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('39','6','20','112','719,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('40','8','31','30','443,72');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('42','3','249','76','2660,72');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('44','4','158','100','2009,46');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('46','8','123','116','3177,44');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('54','2','4','136','2699,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('58','7','108','49','849,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('61','6','5','50','2290,79');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('67','7','78','124','686,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('70','5','124','106','594,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('73','3','31','102','443,72');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('75','8','24','82','66,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('81','4','49','83','1499,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('82','6','180','56','279,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('83','6','233','86','59,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('84','4','95','36','109,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('87','6','174','84','798,26');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('90','5','73','129','799');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('91','8','196','102','1099,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('95','5','107','76','644');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('97','5','99','48','68,06');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('98','2','48','44','1218,5');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('99','4','36','71','1299,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('101','5','150','36','281,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('104','4','48','51','1218,5');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('105','5','103','77','809,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('1','9','196','139','1099,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('2','6','182','95','949,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('3','7','125','73','768,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('4','4','287','60','329,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('7','2','230','49','136,69');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('8','7','16','135','889,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('9','7','124','117','594,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('10','5','218','68','1388,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('11','2','40','79','299,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('12','9','282','117','804,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('13','7','39','67','301,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('14','4','114','40','820,61');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('16','6','131','53','279,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('18','4','91','141','2259,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('22','9','8','89','601,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('23','7','286','36','234');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('24','4','24','59','66,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('27','9','93','132','2116,72');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('28','6','210','120','1029,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('29','9','233','71','59,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('32','4','30','105','645,2');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('33','4','55','93','150,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('34','4','143','106','402,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('36','6','205','33','649,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('39','7','185','101','873,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('40','9','170','31','383,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('43','5','86','114','804,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('46','9','2','65','2554,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('53','3','9','106','899,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('54','3','68','134','766,11');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('57','5','132','77','554,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('58','8','157','65','388,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('61','7','52','45','1676,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('67','8','247','39','339,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('69','6','3','46','799,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('70','6','50','68','8867,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('75','9','20','34','719,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('76','8','201','91','653,5');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('81','5','55','144','150,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('82','7','70','31','710,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('83','7','18','49','799');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('84','5','87','119','759,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('87','7','7','66','680,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('89','7','76','109','629,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('90','6','185','147','873,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('94','5','181','143','999,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('95','6','71','135','660');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('97','6','219','132','1299,73');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('99','5','200','58','620,95');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('101','6','20','138','719,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('104','5','281','85','864,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('1','10','64','147','525,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('2','7','204','100','686,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('3','8','190','127','948,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('4','5','20','80','719,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('6','3','94','90','15,55');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('10','6','64','96','525,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('12','10','210','37','1029,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('13','8','1','95','640,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('14','5','239','125','739,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('15','7','83','118','829,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('16','7','256','44','26,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('18','5','87','103','759,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('22','10','90','95','759,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('23','8','241','126','1756');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('24','5','41','83','299,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('26','4','164','78','1850');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('27','10','150','58','281,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('30','6','4','82','2699,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('33','5','62','84','789,79');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('34','5','68','37','766,11');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('35','4','41','79','299,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('39','8','179','102','312,67');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('40','10','215','36','829,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('41','8','21','31','749,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('42','4','213','103','1469,96');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('43','6','235','86','41,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('46','10','214','91','1009,79');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('58','9','136','134','826,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('66','6','97','130','59,87');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('68','7','189','139','649');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('69','7','79','49','659,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('81','6','65','61','1199,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('82','8','213','56','1469,96');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('87','8','257','110','84,95');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('89','8','151','127','281,97');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('90','7','250','125','338,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('92','5','114','112','820,61');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('93','2','169','46','1844,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('94','6','4','111','2699,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('99','6','1','43','640,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('101','7','102','123','2042,69');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('1','11','169','105','1844,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('2','8','141','97','419,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('4','6','159','96','1994,49');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('6','4','258','145','57,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('10','7','127','52','719,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('12','11','169','114','1844,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('13','9','225','137','503,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('14','6','188','79','482,49');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('15','8','241','77','1756');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('16','8','138','142','645,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('18','6','259','60','80,72');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('19','8','91','130','2259,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('22','11','234','144','150,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('23','9','14','86','704,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('24','6','276','99','1163,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('26','5','151','36','281,97');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('27','11','116','67','731,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('30','7','155','64','588,95');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('33','6','190','70','948,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('42','5','252','85','499,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('43','7','1','57','640,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('45','2','66','126','399,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('58','10','163','31','1899,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('60','6','51','79','2269,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('65','5','119','141','899,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('66','7','49','78','1499,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('68','8','204','56','686,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('87','9','121','142','721,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('91','9','43','44','298,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('92','6','164','91','1850');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('93','3','251','30','337,81');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('94','7','172','37','358,49');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('99','7','201','31','653,5');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('1','12','226','103','309,85');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('6','5','11','74','2015,11');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('10','8','18','124','799');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('12','12','96','120','141,56');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('13','10','245','138','1699');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('14','7','113','32','704,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('18','7','188','133','482,49');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('19','9','63','83','572,96');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('22','12','108','45','849,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('23','10','187','110','353,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('25','7','135','132','127,88');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('27','12','92','105','2200');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('28','7','54','131','1019,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('29','10','76','62','629,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('32','5','85','148','1274,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('33','7','18','41','799');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('36','7','152','45','280,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('42','6','78','47','686,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('43','8','169','73','1844,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('45','3','68','88','766,11');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('57','6','164','44','1850');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('58','11','152','51','280,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('59','8','287','96','329,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('60','7','189','146','649');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('66','8','75','122','624,04');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('67','9','91','138','2259,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('69','8','169','67','1844,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('73','4','45','54','2501,69');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('74','6','187','137','353,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('75','10','72','86','589,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('76','9','155','78','588,95');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('87','10','76','96','629,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('91','10','269','104','759,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('92','7','108','104','849,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('93','4','43','113','298,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('94','8','258','73','57,98');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('99','8','102','101','2042,69');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('104','6','51','139','2269,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('1','13','178','121','1999,89');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('4','7','262','79','1449,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('6','6','89','150','749,99');
Insert into E3T5.ESKARI_LERRO (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,SALNEURRIA) values ('8','8','100','68','97,88');
REM INSERTING into E3T5.ESKARI_LERRO_HORNITZAILE
SET DEFINE OFF;
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','1','107','30','474,18');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','2','27','15','573,41');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','3','124','15','453,14');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','4','108','20','753,18');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','5','125','30','594,04');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','6','88','20','633,29');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','7','109','30','585,26');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','8','136','15','651,92');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','9','110','20','2785,55');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','10','105','20','2313,07');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','11','159','15','1499,26');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','12','31','30','385,24');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','13','129','30','609,53');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','14','34','30','360,72');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','15','121','30','603,22');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','16','115','30','565,73');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','17','30','30','452,54');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','18','145','30','258,1');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','19','90','20','594,46');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','20','21','30','609,89');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','21','17','30','595,42');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','22','140','30','239,95');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','23','103','20','663,54');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','24','116','30','565,39');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','25','101','30','471,78');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','26','137','30','332,52');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','27','120','15','737,68');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','28','18','30','604,04');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','29','151','30','207,08');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','30','122','30','532,27');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','31','146','30','234,26');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','32','148','30','212,69');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','33','152','30','227,48');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','34','46','15','1925,13');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','35','128','30','650,48');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','36','20','30','616,53');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','37','126','30','510,93');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','38','149','30','214,36');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','39','119','15','668,24');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','40','133','20','4058,99');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','41','29','30','571,7');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','42','132','15','481,56');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','43','114','20','580,42');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','44','19','15','1479,56');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','45','144','30','219,69');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','46','139','45','54,03');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','47','106','15','545,19');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','48','89','20','592,12');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','49','147','30','240,62');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','50','150','30','223,92');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','51','123','20','2628,06');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','52','47','15','2101,59');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','53','117','30','617,62');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('2','54','32','30','380,55');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','1','107','30','474,18');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','2','27','15','573,41');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','3','124','15','453,14');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','4','108','20','753,18');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','5','125','30','594,04');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','6','88','20','633,29');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','7','109','30','585,26');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','8','136','15','651,92');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','9','110','20','2785,55');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','10','105','20','2313,07');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','11','159','15','1499,26');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','12','31','30','385,24');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','13','129','30','609,53');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','14','34','30','360,72');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','15','121','30','603,22');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','16','115','30','565,73');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','17','30','30','452,54');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','18','145','30','258,1');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','19','90','20','594,46');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','20','21','30','609,89');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','21','17','30','595,42');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','22','140','30','239,95');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','23','103','20','663,54');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','24','116','30','565,39');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','25','101','30','471,78');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','26','137','30','332,52');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','27','120','15','737,68');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','28','18','30','604,04');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','29','151','30','207,08');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','30','122','30','532,27');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','31','146','30','234,26');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','32','148','30','212,69');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','33','152','30','227,48');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','34','46','15','1925,13');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','35','128','30','650,48');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','36','20','30','616,53');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','37','126','30','510,93');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','38','149','30','214,36');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','39','119','15','668,24');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','40','133','20','4058,99');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','41','29','30','571,7');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','42','132','15','481,56');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','43','114','20','580,42');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','44','19','15','1479,56');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','45','144','30','219,69');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','46','139','45','54,03');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','47','106','15','545,19');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','48','89','20','592,12');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','49','147','30','240,62');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','50','150','30','223,92');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','51','123','20','2628,06');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','52','47','15','2101,59');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','53','117','30','617,62');
Insert into E3T5.ESKARI_LERRO_HORNITZAILE (ID_ESKARI,ID_LERRO,ID_PRODUKTU,KOPURUA,BALIOA) values ('1','54','32','30','380,55');
REM INSERTING into E3T5.HERRIALDE
SET DEFINE OFF;
Insert into E3T5.HERRIALDE (ID,IZENA,ID_KONTINENTE) values ('AR','Argentina','2');
Insert into E3T5.HERRIALDE (ID,IZENA,ID_KONTINENTE) values ('AU','Australia','3');
Insert into E3T5.HERRIALDE (ID,IZENA,ID_KONTINENTE) values ('BE','Belgium','1');
Insert into E3T5.HERRIALDE (ID,IZENA,ID_KONTINENTE) values ('BR','Brazil','2');
Insert into E3T5.HERRIALDE (ID,IZENA,ID_KONTINENTE) values ('CA','Canada','2');
Insert into E3T5.HERRIALDE (ID,IZENA,ID_KONTINENTE) values ('CH','Switzerland','1');
Insert into E3T5.HERRIALDE (ID,IZENA,ID_KONTINENTE) values ('CN','China','3');
Insert into E3T5.HERRIALDE (ID,IZENA,ID_KONTINENTE) values ('DE','Germany','1');
Insert into E3T5.HERRIALDE (ID,IZENA,ID_KONTINENTE) values ('DK','Denmark','1');
Insert into E3T5.HERRIALDE (ID,IZENA,ID_KONTINENTE) values ('EG','Egypt','4');
Insert into E3T5.HERRIALDE (ID,IZENA,ID_KONTINENTE) values ('FR','France','1');
Insert into E3T5.HERRIALDE (ID,IZENA,ID_KONTINENTE) values ('IL','Israel','4');
Insert into E3T5.HERRIALDE (ID,IZENA,ID_KONTINENTE) values ('IN','India','3');
Insert into E3T5.HERRIALDE (ID,IZENA,ID_KONTINENTE) values ('IT','Italy','1');
Insert into E3T5.HERRIALDE (ID,IZENA,ID_KONTINENTE) values ('JP','Japan','3');
Insert into E3T5.HERRIALDE (ID,IZENA,ID_KONTINENTE) values ('KW','Kuwait','4');
Insert into E3T5.HERRIALDE (ID,IZENA,ID_KONTINENTE) values ('ML','Malaysia','3');
Insert into E3T5.HERRIALDE (ID,IZENA,ID_KONTINENTE) values ('MX','Mexico','2');
Insert into E3T5.HERRIALDE (ID,IZENA,ID_KONTINENTE) values ('NG','Nigeria','4');
Insert into E3T5.HERRIALDE (ID,IZENA,ID_KONTINENTE) values ('NL','Netherlands','1');
Insert into E3T5.HERRIALDE (ID,IZENA,ID_KONTINENTE) values ('SG','Singapore','3');
Insert into E3T5.HERRIALDE (ID,IZENA,ID_KONTINENTE) values ('UK','United Kingdom','1');
Insert into E3T5.HERRIALDE (ID,IZENA,ID_KONTINENTE) values ('US','United States of America','2');
Insert into E3T5.HERRIALDE (ID,IZENA,ID_KONTINENTE) values ('ZM','Zambia','4');
Insert into E3T5.HERRIALDE (ID,IZENA,ID_KONTINENTE) values ('ZW','Zimbabwe','4');
Insert into E3T5.HERRIALDE (ID,IZENA,ID_KONTINENTE) values ('SP','Spain','1');
REM INSERTING into E3T5.INBENTARIO
SET DEFINE OFF;
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('210','8','122');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('211','8','123');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('212','8','123');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('214','8','124');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('216','8','125');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('217','8','125');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('218','8','126');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('220','8','149');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('221','8','150');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('222','8','150');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('223','8','151');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('229','8','123');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('230','8','124');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('231','8','124');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('232','8','124');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('233','8','124');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('234','8','124');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('235','8','125');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('241','8','121');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('242','8','121');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('243','8','121');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('245','8','137');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('254','8','136');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('255','8','136');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('256','8','136');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('257','8','136');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('258','8','136');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('259','8','137');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('260','8','137');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('263','8','137');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('264','8','137');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('269','8','178');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('270','8','178');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('271','8','183');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('272','8','184');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('273','8','156');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('274','8','160');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('276','8','187');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('277','8','187');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('278','8','188');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('280','8','154');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('281','8','167');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('283','8','194');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('284','8','268');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('285','8','176');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('286','8','177');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('2','9','23');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('3','9','35');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('4','9','35');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('5','9','36');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('6','9','36');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('7','9','36');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('8','9','36');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('9','9','36');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('11','9','37');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('12','9','37');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('13','9','37');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('14','9','38');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('15','9','41');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('17','9','3');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('18','9','3');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('19','9','3');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('20','9','4');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('21','9','4');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('27','9','5');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('29','9','6');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('30','9','6');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('31','9','7');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('32','9','7');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('34','9','8');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('46','9','6');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('47','9','0');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('54','9','33');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('62','9','32');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('63','9','33');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('67','9','34');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('68','9','34');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('69','9','35');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('70','9','35');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('71','9','35');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('72','9','35');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('73','9','27');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('74','9','27');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('76','9','28');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('78','9','29');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('79','9','29');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('80','9','29');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('84','9','33');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('87','9','35');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('88','9','7');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('89','9','8');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('90','9','8');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('91','9','22');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('98','9','32');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('101','9','3');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('102','9','36');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('103','9','5');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('105','9','6');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('106','9','6');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('107','9','6');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('108','9','6');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('109','9','6');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('110','9','7');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('114','9','8');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('115','9','9');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('116','9','9');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('117','9','9');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('119','9','10');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('120','9','10');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('121','9','10');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('122','9','11');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('123','9','11');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('124','9','11');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('125','9','11');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('126','9','12');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('128','9','12');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('129','9','12');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('132','9','13');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('133','9','13');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('136','9','14');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('137','9','15');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('138','9','16');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('141','9','18');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('142','9','19');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('159','9','15');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('160','9','21');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('161','9','36');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('163','9','35');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('166','9','54');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('174','9','74');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('175','9','74');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('182','9','110');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('184','9','111');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('185','9','111');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('188','9','119');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('189','9','119');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('190','9','120');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('191','9','120');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('193','9','121');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('195','9','122');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('196','9','122');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('198','9','122');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('199','9','123');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('200','9','123');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('201','9','124');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('203','9','124');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('204','9','125');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('205','9','125');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('207','9','109');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('210','9','110');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('211','9','111');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('212','9','111');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('214','9','112');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('216','9','113');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('217','9','113');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('218','9','114');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('220','9','134');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('221','9','135');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('222','9','135');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('223','9','136');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('241','9','109');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('242','9','109');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('243','9','109');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('245','9','125');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('269','9','161');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('270','9','161');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('271','9','165');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('272','9','166');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('274','9','148');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('276','9','169');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('277','9','169');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('278','9','170');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('281','9','155');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('283','9','179');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('3','1','106');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('4','1','106');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('5','1','106');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('6','1','107');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('11','1','108');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('12','1','108');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('80','1','125');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('87','1','131');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('88','1','137');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('89','1','138');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('90','1','138');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('103','1','145');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('105','1','146');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('108','1','146');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('110','1','147');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('114','1','148');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('123','1','151');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('132','1','148');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('133','1','153');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('142','1','89');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('161','1','132');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('174','1','170');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('175','1','170');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('182','1','175');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('184','1','175');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('185','1','176');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('207','1','205');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('216','1','209');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('220','1','196');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('221','1','197');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('222','1','197');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('223','1','197');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('245','1','221');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('269','1','222');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('270','1','222');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('281','1','251');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('3','2','96');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('4','2','96');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('5','2','96');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('6','2','96');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('7','2','97');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('8','2','97');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('9','2','97');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('11','2','98');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('12','2','98');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('13','2','98');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('14','2','98');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('15','2','99');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('17','2','130');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('18','2','131');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('19','2','116');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('20','2','134');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('21','2','135');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('22','2','114');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('23','2','114');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('24','2','115');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('25','2','115');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('26','2','115');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('27','2','121');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('29','2','137');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('30','2','137');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('33','2','117');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('35','2','118');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('36','2','118');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('37','2','119');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('38','2','119');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('39','2','119');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('40','2','119');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('41','2','119');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('42','2','122');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('43','2','122');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('44','2','122');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('50','2','117');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('54','2','110');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('62','2','149');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('63','2','149');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('67','2','154');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('68','2','154');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('69','2','154');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('70','2','155');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('71','2','155');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('72','2','155');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('73','2','111');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('74','2','111');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('76','2','112');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('78','2','113');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('79','2','113');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('80','2','113');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('87','2','119');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('88','2','167');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('89','2','167');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('90','2','167');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('94','2','91');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('99','2','94');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('100','2','94');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('101','2','203');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('103','2','178');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('104','2','81');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('105','2','178');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('106','2','193');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('107','2','208');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('108','2','179');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('109','2','209');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('110','2','179');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('114','2','180');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('115','2','211');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('116','2','212');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('117','2','212');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('119','2','198');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('120','2','198');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('121','2','213');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('122','2','213');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('123','2','184');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('124','2','199');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('125','2','214');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('126','2','214');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('128','2','215');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('129','2','215');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('130','2','88');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('131','2','88');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('132','2','185');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('133','2','185');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('134','2','89');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('135','2','89');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('136','2','201');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('138','2','191');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('139','2','138');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('140','2','124');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('142','2','194');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('144','2','125');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('145','2','126');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('146','2','126');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('147','2','126');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('148','2','127');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('149','2','127');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('150','2','131');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('151','2','131');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('152','2','131');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('161','2','120');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('166','2','138');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('168','2','128');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('174','2','158');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('175','2','158');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('182','2','177');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('184','2','178');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('185','2','178');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('188','2','171');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('189','2','172');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('190','2','172');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('191','2','173');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('193','2','173');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('195','2','174');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('196','2','174');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('198','2','175');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('199','2','176');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('200','2','176');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('201','2','176');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('203','2','177');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('204','2','177');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('205','2','177');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('207','2','193');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('210','2','194');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('211','2','195');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('212','2','195');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('214','2','196');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('216','2','197');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('218','2','198');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('220','2','184');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('221','2','185');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('222','2','185');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('223','2','185');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('227','2','189');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('228','2','189');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('229','2','212');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('230','2','213');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('231','2','213');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('232','2','213');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('233','2','213');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('234','2','213');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('235','2','214');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('236','2','214');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('237','2','214');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('238','2','214');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('239','2','214');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('245','2','209');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('254','2','225');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('255','2','225');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('256','2','225');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('257','2','226');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('258','2','226');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('259','2','226');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('260','2','226');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('261','2','226');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('262','2','227');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('263','2','227');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('264','2','227');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('265','2','227');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('269','2','210');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('270','2','210');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('271','2','215');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('272','2','216');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('273','2','264');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('274','2','232');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('276','2','219');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('277','2','219');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('278','2','220');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('279','2','244');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('280','2','244');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('281','2','239');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('283','2','226');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('284','2','353');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('285','2','267');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('286','2','267');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('2','3','100');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('3','3','88');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('4','3','88');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('5','3','89');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('6','3','89');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('11','3','90');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('12','3','90');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('46','3','127');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('47','3','81');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('80','3','101');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('87','3','107');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('88','3','118');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('89','3','118');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('90','3','118');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('91','3','94');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('98','3','69');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('102','3','73');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('103','3','126');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('105','3','126');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('108','3','127');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('110','3','127');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('114','3','131');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('123','3','135');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('132','3','136');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('133','3','136');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('142','3','142');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('159','3','102');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('160','3','93');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('161','3','108');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('163','3','107');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('174','3','146');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('175','3','146');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('182','3','245');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('184','3','246');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('185','3','246');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('207','3','181');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('216','3','185');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('220','3','272');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('221','3','273');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('222','3','273');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('223','3','273');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('241','3','181');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('242','3','181');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('243','3','181');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('245','3','197');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('269','3','304');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('270','3','304');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('281','3','227');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('3','4','63');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('4','4','63');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('5','4','63');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('6','4','64');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('7','4','64');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('8','4','67');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('9','4','67');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('11','4','68');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('12','4','68');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('13','4','68');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('14','4','68');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('15','4','69');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('17','4','70');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('18','4','71');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('19','4','71');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('20','4','71');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('21','4','72');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('27','4','73');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('29','4','74');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('30','4','74');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('54','4','88');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('62','4','74');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('63','4','74');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('67','4','76');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('68','4','76');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('69','4','76');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('70','4','76');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('71','4','76');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('72','4','77');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('73','4','87');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('74','4','87');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('76','4','88');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('78','4','89');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('79','4','89');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('80','4','89');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('87','4','95');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('88','4','86');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('89','4','86');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('90','4','86');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('101','4','95');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('103','4','97');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('105','4','97');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('106','4','97');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('107','4','97');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('108','4','98');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('109','4','98');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('110','4','98');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('114','4','99');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('115','4','100');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('116','4','100');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('117','4','101');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('119','4','102');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('120','4','102');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('121','4','102');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('122','4','102');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('123','4','103');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('124','4','103');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('125','4','103');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('126','4','103');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('128','4','103');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('129','4','104');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('132','4','104');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('133','4','104');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('136','4','105');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('138','4','107');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('142','4','110');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('161','4','96');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('166','4','114');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('174','4','134');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('175','4','134');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('182','4','210');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('184','4','211');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('185','4','211');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('188','4','219');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('189','4','219');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('190','4','223');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('191','4','223');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('193','4','223');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('195','4','224');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('196','4','225');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('198','4','225');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('199','4','226');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('200','4','226');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('201','4','227');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('203','4','227');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('204','4','227');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('205','4','228');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('207','4','169');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('210','4','170');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('211','4','171');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('212','4','171');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('214','4','172');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('216','4','173');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('218','4','174');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('220','4','234');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('221','4','235');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('222','4','235');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('223','4','236');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('245','4','185');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('269','4','266');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('270','4','266');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('271','4','271');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('272','4','272');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('274','4','208');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('276','4','275');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('277','4','275');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('278','4','276');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('281','4','215');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('283','4','282');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('2','5','71');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('3','5','46');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('4','5','46');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('5','5','47');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('6','5','47');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('11','5','48');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('12','5','48');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('22','5','73');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('23','5','74');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('24','5','74');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('25','5','74');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('26','5','74');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('33','5','77');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('35','5','77');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('36','5','78');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('37','5','78');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('38','5','78');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('39','5','78');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('40','5','78');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('41','5','79');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('42','5','81');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('43','5','81');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('44','5','82');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('46','5','90');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('47','5','44');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('50','5','69');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('80','5','77');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('87','5','83');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('88','5','62');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('89','5','63');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('90','5','63');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('91','5','70');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('94','5','85');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('98','5','86');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('99','5','88');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('100','5','88');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('102','5','90');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('103','5','73');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('104','5','84');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('105','5','74');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('108','5','74');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('110','5','75');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('114','5','76');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('123','5','79');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('130','5','42');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('131','5','42');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('132','5','81');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('133','5','81');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('134','5','42');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('135','5','43');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('139','5','47');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('140','5','47');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('142','5','87');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('144','5','49');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('145','5','49');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('146','5','50');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('147','5','50');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('148','5','50');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('149','5','50');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('150','5','54');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('151','5','54');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('152','5','54');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('159','5','63');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('160','5','69');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('161','5','84');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('163','5','83');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('168','5','92');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('174','5','122');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('175','5','122');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('182','5','184');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('184','5','184');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('185','5','185');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('207','5','157');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('216','5','161');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('220','5','208');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('221','5','209');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('222','5','209');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('223','5','209');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('229','5','163');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('230','5','163');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('231','5','163');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('232','5','163');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('233','5','164');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('234','5','164');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('235','5','164');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('236','5','164');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('237','5','164');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('238','5','165');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('239','5','165');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('241','5','157');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('242','5','157');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('243','5','157');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('245','5','173');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('254','5','175');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('255','5','175');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('256','5','175');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('257','5','176');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('258','5','176');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('259','5','176');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('260','5','176');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('261','5','176');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('262','5','177');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('263','5','177');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('264','5','177');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('265','5','177');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('269','5','237');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('270','5','237');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('273','5','199');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('279','5','193');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('280','5','194');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('281','5','203');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('284','5','220');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('285','5','216');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('286','5','216');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('2','6','58');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('3','6','29');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('4','6','30');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('5','6','30');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('6','6','30');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('7','6','30');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('8','6','30');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('9','6','31');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('11','6','31');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('12','6','32');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('13','6','32');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('14','6','32');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('15','6','33');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('17','6','34');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('18','6','35');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('19','6','35');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('20','6','35');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('21','6','36');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('22','6','62');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('23','6','62');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('24','6','62');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('25','6','62');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('26','6','63');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('27','6','37');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('29','6','38');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('30','6','38');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('31','6','69');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('32','6','69');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('33','6','65');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('34','6','69');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('35','6','66');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('36','6','66');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('37','6','66');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('38','6','66');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('39','6','66');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('40','6','67');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('41','6','67');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('42','6','69');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('43','6','69');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('44','6','70');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('46','6','29');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('47','6','33');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('50','6','84');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('54','6','66');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('56','6','58');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('57','6','66');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('62','6','30');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('63','6','30');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('67','6','34');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('68','6','35');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('69','6','35');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('70','6','35');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('71','6','35');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('72','6','35');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('73','6','63');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('74','6','63');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('76','6','64');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('78','6','65');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('79','6','65');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('80','6','65');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('84','6','69');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('87','6','71');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('88','6','44');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('89','6','45');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('90','6','45');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('91','6','58');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('94','6','71');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('95','6','60');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('96','6','60');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('98','6','72');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('99','6','73');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('100','6','74');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('101','6','51');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('102','6','76');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('103','6','53');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('104','6','71');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('105','6','53');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('106','6','53');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('107','6','53');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('108','6','54');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('109','6','54');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('110','6','54');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('114','6','55');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('115','6','56');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('116','6','56');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('117','6','57');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('119','6','58');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('120','6','58');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('121','6','58');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('122','6','58');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('123','6','59');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('124','6','59');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('125','6','59');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('126','6','59');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('128','6','59');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('129','6','60');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('130','6','78');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('131','6','29');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('132','6','60');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('133','6','60');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('134','6','29');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('135','6','29');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('136','6','61');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('137','6','95');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('138','6','66');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('139','6','34');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('140','6','34');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('141','6','68');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('142','6','69');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('144','6','36');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('145','6','36');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('146','6','37');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('147','6','37');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('148','6','37');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('149','6','37');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('150','6','41');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('151','6','41');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('152','6','41');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('157','6','42');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('159','6','51');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('160','6','57');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('161','6','72');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('163','6','71');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('166','6','90');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('168','6','80');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('170','6','81');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('172','6','85');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('173','6','94');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('174','6','110');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('175','6','110');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('182','6','163');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('184','6','164');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('185','6','164');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('188','6','172');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('189','6','172');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('190','6','173');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('191','6','173');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('193','6','174');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('195','6','175');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('196','6','175');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('198','6','176');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('199','6','176');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('200','6','177');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('201','6','177');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('203','6','177');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('204','6','178');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('205','6','178');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('207','6','145');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('210','6','146');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('211','6','147');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('212','6','147');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('214','6','148');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('216','6','149');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('217','6','149');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('218','6','150');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('220','6','185');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('221','6','185');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('222','6','186');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('223','6','186');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('227','6','141');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('228','6','141');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('229','6','149');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('230','6','149');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('231','6','150');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('232','6','150');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('233','6','150');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('234','6','150');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('235','6','150');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('236','6','151');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('237','6','151');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('238','6','151');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('239','6','151');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('241','6','145');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('242','6','145');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('243','6','145');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('245','6','161');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('247','6','148');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('251','6','150');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('254','6','161');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('255','6','162');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('256','6','162');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('257','6','162');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('258','6','162');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('259','6','162');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('260','6','163');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('261','6','163');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('262','6','163');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('263','6','163');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('264','6','163');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('265','6','164');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('269','6','214');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('270','6','214');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('271','6','221');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('272','6','222');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('273','6','184');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('274','6','184');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('276','6','225');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('277','6','225');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('278','6','226');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('279','6','180');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('280','6','180');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('281','6','191');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('283','6','232');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('284','6','320');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('285','6','202');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('286','6','203');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('287','6','212');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('288','6','213');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('2','7','46');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('3','7','63');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('4','7','63');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('5','7','63');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('6','7','63');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('11','7','65');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('12','7','65');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('22','7','50');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('23','7','50');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('24','7','50');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('25','7','51');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('26','7','51');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('33','7','53');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('35','7','54');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('36','7','54');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('37','7','55');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('38','7','55');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('39','7','55');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('40','7','55');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('41','7','55');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('42','7','57');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('43','7','58');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('44','7','58');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('46','7','18');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('47','7','22');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('50','7','58');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('80','7','53');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('87','7','59');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('88','7','27');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('89','7','27');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('90','7','27');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('91','7','46');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('94','7','57');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('98','7','58');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('99','7','60');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('100','7','60');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('102','7','62');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('103','7','35');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('104','7','58');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('105','7','35');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('108','7','36');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('110','7','36');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('114','7','37');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('123','7','41');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('130','7','66');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('131','7','66');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('132','7','45');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('133','7','45');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('134','7','17');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('135','7','17');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('139','7','21');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('140','7','21');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('142','7','51');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('144','7','23');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('145','7','23');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('146','7','24');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('147','7','24');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('148','7','24');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('149','7','24');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('150','7','28');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('151','7','28');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('152','7','28');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('159','7','39');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('160','7','45');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('161','7','60');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('163','7','59');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('168','7','68');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('174','7','98');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('175','7','98');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('182','7','143');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('184','7','143');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('185','7','144');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('207','7','133');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('216','7','137');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('220','7','167');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('221','7','168');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('222','7','168');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('223','7','168');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('229','7','136');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('230','7','136');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('231','7','136');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('232','7','137');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('233','7','137');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('234','7','137');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('235','7','137');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('241','7','133');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('242','7','133');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('243','7','133');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('245','7','149');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('254','7','148');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('255','7','148');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('256','7','149');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('257','7','149');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('258','7','149');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('259','7','149');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('260','7','149');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('263','7','150');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('264','7','150');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('269','7','196');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('270','7','196');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('273','7','170');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('280','7','167');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('281','7','179');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('284','7','294');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('285','7','189');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('286','7','189');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('2','8','34');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('3','8','49');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('4','8','49');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('5','8','49');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('6','8','50');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('7','8','50');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('8','8','50');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('9','8','50');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('11','8','51');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('12','8','51');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('13','8','51');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('14','8','51');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('15','8','52');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('17','8','54');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('18','8','54');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('19','8','54');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('20','8','5');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('21','8','5');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('22','8','38');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('23','8','39');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('24','8','39');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('25','8','39');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('26','8','39');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('27','8','6');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('29','8','7');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('30','8','7');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('31','8','8');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('32','8','8');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('33','8','42');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('34','8','9');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('35','8','42');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('36','8','43');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('37','8','43');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('38','8','43');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('39','8','43');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('40','8','44');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('41','8','44');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('42','8','46');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('43','8','46');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('44','8','47');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('46','8','7');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('47','8','11');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('50','8','32');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('54','8','44');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('62','8','47');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('63','8','47');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('67','8','49');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('68','8','49');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('69','8','50');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('70','8','50');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('71','8','50');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('72','8','50');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('73','8','39');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('74','8','39');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('76','8','40');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('78','8','41');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('79','8','41');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('80','8','41');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('84','8','45');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('87','8','47');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('88','8','12');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('89','8','12');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('90','8','13');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('91','8','34');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('94','8','44');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('98','8','45');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('99','8','47');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('100','8','47');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('101','8','18');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('102','8','49');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('103','8','20');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('104','8','46');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('105','8','20');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('106','8','21');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('107','8','21');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('108','8','21');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('109','8','21');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('110','8','22');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('114','8','23');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('115','8','24');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('116','8','24');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('117','8','24');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('119','8','25');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('120','8','25');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('121','8','25');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('122','8','26');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('123','8','26');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('124','8','26');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('125','8','26');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('126','8','26');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('128','8','27');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('129','8','27');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('130','8','53');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('131','8','53');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('132','8','28');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('133','8','28');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('134','8','54');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('135','8','54');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('136','8','28');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('137','8','29');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('138','8','31');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('139','8','8');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('140','8','9');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('141','8','33');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('142','8','34');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('144','8','10');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('145','8','11');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('146','8','11');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('147','8','11');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('148','8','12');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('149','8','12');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('150','8','15');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('151','8','15');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('152','8','15');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('159','8','27');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('160','8','33');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('161','8','48');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('163','8','47');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('166','8','66');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('168','8','56');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('174','8','86');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('175','8','86');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('182','8','128');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('184','8','128');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('185','8','129');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('188','8','137');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('189','8','137');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('190','8','137');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('191','8','138');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('193','8','138');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('195','8','139');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('196','8','139');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('198','8','140');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('199','8','141');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('200','8','141');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('201','8','142');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('203','8','142');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('204','8','142');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('205','8','142');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('207','8','121');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('2','10','23');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('3','10','35');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('4','10','35');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('5','10','36');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('6','10','36');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('7','10','36');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('8','10','36');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('9','10','36');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('11','10','37');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('12','10','37');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('13','10','37');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('14','10','38');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('15','10','41');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('17','10','3');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('18','10','3');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('19','10','3');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('20','10','4');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('21','10','4');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('27','10','5');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('29','10','6');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('30','10','6');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('31','10','7');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('32','10','7');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('34','10','8');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('46','10','6');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('47','10','0');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('54','10','33');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('62','10','32');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('63','10','33');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('67','10','34');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('68','10','34');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('69','10','35');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('70','10','35');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('71','10','35');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('72','10','35');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('73','10','27');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('74','10','27');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('76','10','28');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('78','10','29');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('79','10','29');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('80','10','29');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('84','10','33');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('87','10','35');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('88','10','7');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('89','10','8');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('90','10','8');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('91','10','22');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('98','10','32');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('101','10','3');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('102','10','36');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('103','10','5');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('105','10','6');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('106','10','6');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('107','10','6');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('108','10','6');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('109','10','6');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('110','10','7');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('114','10','8');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('115','10','9');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('116','10','9');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('117','10','9');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('119','10','10');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('120','10','10');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('121','10','10');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('122','10','11');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('123','10','11');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('124','10','11');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('125','10','11');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('126','10','12');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('128','10','12');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('129','10','12');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('132','10','13');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('133','10','13');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('136','10','14');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('137','10','15');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('138','10','16');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('141','10','18');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('142','10','19');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('159','10','15');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('160','10','21');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('161','10','36');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('163','10','35');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('166','10','54');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('174','10','74');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('175','10','74');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('182','10','110');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('184','10','111');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('185','10','111');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('188','10','119');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('189','10','119');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('190','10','120');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('191','10','120');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('193','10','121');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('195','10','122');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('196','10','122');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('198','10','122');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('199','10','123');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('200','10','123');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('201','10','124');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('203','10','124');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('204','10','125');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('205','10','125');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('207','10','109');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('210','10','110');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('211','10','111');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('212','10','111');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('214','10','112');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('216','10','113');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('217','10','113');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('218','10','114');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('220','10','134');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('221','10','135');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('222','10','135');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('223','10','136');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('241','10','109');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('242','10','109');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('243','10','109');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('245','10','125');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('269','10','161');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('270','10','161');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('271','10','165');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('272','10','166');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('274','10','148');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('276','10','169');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('277','10','169');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('278','10','170');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('281','10','155');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('283','10','179');
Insert into E3T5.INBENTARIO (ID_PRODUKTU,ID_BILTEGI,KOPURUA) values ('255','10','150');
REM INSERTING into E3T5.KATEGORIA
SET DEFINE OFF;
Insert into E3T5.KATEGORIA (ID,IZENA) values ('1','CPU');
Insert into E3T5.KATEGORIA (ID,IZENA) values ('2','Video Card');
Insert into E3T5.KATEGORIA (ID,IZENA) values ('4','Mother Board');
Insert into E3T5.KATEGORIA (ID,IZENA) values ('5','Storage');
REM INSERTING into E3T5.KOKALEKU
SET DEFINE OFF;
Insert into E3T5.KOKALEKU (ID,HELBIDEA,POSTAKODEA,UDALERRIA,PROBINTZIA,ID_HERRIALDE) values ('1','1297 Via Cola di Rie','00989','Roma',null,'IT');
Insert into E3T5.KOKALEKU (ID,HELBIDEA,POSTAKODEA,UDALERRIA,PROBINTZIA,ID_HERRIALDE) values ('2','93091 Calle della Testa','10934','Venice',null,'IT');
Insert into E3T5.KOKALEKU (ID,HELBIDEA,POSTAKODEA,UDALERRIA,PROBINTZIA,ID_HERRIALDE) values ('3','2017 Shinjuku-ku','1689','Tokyo','Tokyo Prefecture','JP');
Insert into E3T5.KOKALEKU (ID,HELBIDEA,POSTAKODEA,UDALERRIA,PROBINTZIA,ID_HERRIALDE) values ('4','9450 Kamiya-cho','6823','Hiroshima',null,'JP');
Insert into E3T5.KOKALEKU (ID,HELBIDEA,POSTAKODEA,UDALERRIA,PROBINTZIA,ID_HERRIALDE) values ('5','2014 Jabberwocky Rd','26192','Southlake','Texas','US');
Insert into E3T5.KOKALEKU (ID,HELBIDEA,POSTAKODEA,UDALERRIA,PROBINTZIA,ID_HERRIALDE) values ('6','2011 Interiors Blvd','99236','South San Francisco','California','US');
Insert into E3T5.KOKALEKU (ID,HELBIDEA,POSTAKODEA,UDALERRIA,PROBINTZIA,ID_HERRIALDE) values ('7','2007 Zagora St','50090','South Brunswick','New Jersey','US');
Insert into E3T5.KOKALEKU (ID,HELBIDEA,POSTAKODEA,UDALERRIA,PROBINTZIA,ID_HERRIALDE) values ('8','2004 Charade Rd','98199','Seattle','Washington','US');
Insert into E3T5.KOKALEKU (ID,HELBIDEA,POSTAKODEA,UDALERRIA,PROBINTZIA,ID_HERRIALDE) values ('9','147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA');
Insert into E3T5.KOKALEKU (ID,HELBIDEA,POSTAKODEA,UDALERRIA,PROBINTZIA,ID_HERRIALDE) values ('10','6092 Boxwood St','YSW 9T2','Whitehorse','Yukon','CA');
Insert into E3T5.KOKALEKU (ID,HELBIDEA,POSTAKODEA,UDALERRIA,PROBINTZIA,ID_HERRIALDE) values ('11','40-5-12 Laogianggen','190518','Beijing',null,'CN');
Insert into E3T5.KOKALEKU (ID,HELBIDEA,POSTAKODEA,UDALERRIA,PROBINTZIA,ID_HERRIALDE) values ('12','1298 Vileparle (E)','490231','Bombay','Maharashtra','IN');
Insert into E3T5.KOKALEKU (ID,HELBIDEA,POSTAKODEA,UDALERRIA,PROBINTZIA,ID_HERRIALDE) values ('13','12-98 Victoria Street','2901','Sydney','New South Wales','AU');
Insert into E3T5.KOKALEKU (ID,HELBIDEA,POSTAKODEA,UDALERRIA,PROBINTZIA,ID_HERRIALDE) values ('14','270 Orchard Rd','238857','Singapore',null,'SG');
Insert into E3T5.KOKALEKU (ID,HELBIDEA,POSTAKODEA,UDALERRIA,PROBINTZIA,ID_HERRIALDE) values ('15','8204 Arthur St',null,'London',null,'UK');
Insert into E3T5.KOKALEKU (ID,HELBIDEA,POSTAKODEA,UDALERRIA,PROBINTZIA,ID_HERRIALDE) values ('16','Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');
Insert into E3T5.KOKALEKU (ID,HELBIDEA,POSTAKODEA,UDALERRIA,PROBINTZIA,ID_HERRIALDE) values ('17','9702 Chester Road','09629850293','Stretford','Manchester','UK');
Insert into E3T5.KOKALEKU (ID,HELBIDEA,POSTAKODEA,UDALERRIA,PROBINTZIA,ID_HERRIALDE) values ('18','Schwanthalerstr. 7031','80925','Munich','Bavaria','DE');
Insert into E3T5.KOKALEKU (ID,HELBIDEA,POSTAKODEA,UDALERRIA,PROBINTZIA,ID_HERRIALDE) values ('19','Rua Frei Caneca 1360 ','01307-002','Sao Paulo','Sao Paulo','BR');
Insert into E3T5.KOKALEKU (ID,HELBIDEA,POSTAKODEA,UDALERRIA,PROBINTZIA,ID_HERRIALDE) values ('20','20 Rue des Corps-Saints','1730','Geneva','Geneve','CH');
Insert into E3T5.KOKALEKU (ID,HELBIDEA,POSTAKODEA,UDALERRIA,PROBINTZIA,ID_HERRIALDE) values ('21','Murtenstrasse 921','3095','Bern','BE','CH');
Insert into E3T5.KOKALEKU (ID,HELBIDEA,POSTAKODEA,UDALERRIA,PROBINTZIA,ID_HERRIALDE) values ('22','Pieter Breughelstraat 837','3029SK','Utrecht','Utrecht','NL');
Insert into E3T5.KOKALEKU (ID,HELBIDEA,POSTAKODEA,UDALERRIA,PROBINTZIA,ID_HERRIALDE) values ('23','Mariano Escobedo 9991','11932','Mexico City','Distrito Federal,','MX');
Insert into E3T5.KOKALEKU (ID,HELBIDEA,POSTAKODEA,UDALERRIA,PROBINTZIA,ID_HERRIALDE) values ('24','Pajares kalea 34','48980','Santurtzi','Bizkaia','SP');
REM INSERTING into E3T5.KONTINENTE
SET DEFINE OFF;
Insert into E3T5.KONTINENTE (ID,IZENA) values ('1','Europe');
Insert into E3T5.KONTINENTE (ID,IZENA) values ('2','America');
Insert into E3T5.KONTINENTE (ID,IZENA) values ('3','Asia');
Insert into E3T5.KONTINENTE (ID,IZENA) values ('4','Middle East and Africa');
REM INSERTING into E3T5.LANGILE
SET DEFINE OFF;
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('1','Tommy','Bailey','tommy.bailey@example.com','515.123.4567',to_date('17/06/16','DD/MM/RR'),null,'33000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('3','Blake','Cooper','blake.cooper@example.com','515.123.4569',to_date('13/01/16','DD/MM/RR'),'1','34000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('2','Jude','Rivera','jude.rivera@example.com','515.123.4568',to_date('21/09/16','DD/MM/RR'),'1','34000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('102','Emma','Perkins','emma.perkins@example.com','515.123.5555',to_date('17/02/16','DD/MM/RR'),'1','39000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('15','Rory','Kelly','rory.kelly@example.com','515.127.4561',to_date('07/12/16','DD/MM/RR'),'1','43000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('49','Isabella','Cole','isabella.cole@example.com','011.44.1344.619268',to_date('15/10/16','DD/MM/RR'),'1','44000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('48','Jessica','Woods','jessica.woods@example.com','011.44.1344.429278',to_date('10/03/16','DD/MM/RR'),'1','44000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('47','Ella','Wallace','ella.wallace@example.com','011.44.1344.467268',to_date('05/01/16','DD/MM/RR'),'1','44000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('46','Ava','Sullivan','ava.sullivan@example.com','011.44.1344.429268',to_date('01/10/16','DD/MM/RR'),'1','44000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('50','Mia','West','mia.west@example.com','011.44.1344.429018',to_date('29/01/16','DD/MM/RR'),'1','44000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('25','Ronnie','Perry','ronnie.perry@example.com','650.123.5234',to_date('16/11/16','DD/MM/RR'),'1','48000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('24','Callum','Jenkins','callum.jenkins@example.com','650.123.4234',to_date('10/10/16','DD/MM/RR'),'1','48000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('23','Jackson','Coleman','jackson.coleman@example.com','650.123.3234',to_date('01/05/16','DD/MM/RR'),'1','48000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('22','Liam','Henderson','liam.henderson@example.com','650.123.2234',to_date('10/04/16','DD/MM/RR'),'1','48000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('21','Jaxon','Ross','jaxon.ross@example.com','650.123.1234',to_date('18/07/16','DD/MM/RR'),'1','48000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('106','Rose','Stephens','rose.stephens@example.com','515.123.8080',to_date('07/06/16','DD/MM/RR'),'2','31000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('101','Annabelle','Dunn','annabelle.dunn@example.com','515.123.4444',to_date('17/09/16','DD/MM/RR'),'2','32000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('9','Mohammad','Peterson','mohammad.peterson@example.com','515.124.4569',to_date('17/08/16','DD/MM/RR'),'2','36000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('104','Harper','Spencer','harper.spencer@example.com','515.123.7777',to_date('07/06/16','DD/MM/RR'),'2','37000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('105','Gracie','Gardner','gracie.gardner@example.com','515.123.8888',to_date('07/06/16','DD/MM/RR'),'2','41000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('4','Louie','Richardson','louie.richardson@example.com','590.423.4567',to_date('03/01/16','DD/MM/RR'),'3','38000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('107','Summer','Payne','summer.payne@example.com','515.123.8181',to_date('07/06/16','DD/MM/RR'),'106','30000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('11','Tyler','Ramirez','tyler.ramirez@example.com','515.124.4269',to_date('28/09/16','DD/MM/RR'),'9','35000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('10','Ryan','Gray','ryan.gray@example.com','515.124.4169',to_date('16/08/16','DD/MM/RR'),'9','35000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('14','Elliot','Brooks','elliTIENDA.brooks@example.com','515.124.4567',to_date('07/12/16','DD/MM/RR'),'9','35000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('12','Elliott','James','elliott.james@example.com','515.124.4369',to_date('30/09/16','DD/MM/RR'),'9','35000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('13','Albert','Watson','albert.watson@example.com','515.124.4469',to_date('07/03/16','DD/MM/RR'),'9','35000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('5','Nathan','Cox','nathan.cox@example.com','590.423.4568',to_date('21/05/16','DD/MM/RR'),'4','38000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('8','Bobby','Torres','bobby.torres@example.com','590.423.5567',to_date('07/02/16','DD/MM/RR'),'4','38000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('7','Charles','Ward','charles.ward@example.com','590.423.4560',to_date('05/02/16','DD/MM/RR'),'4','38000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('6','Gabriel','Howard','gabriel.howard@example.com','590.423.4569',to_date('25/06/16','DD/MM/RR'),'4','38000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('103','Amelie','Hudson','amelie.hudson@example.com','603.123.6666',to_date('17/08/16','DD/MM/RR'),'102','40000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('17','Frederick','Price','frederick.price@example.com','515.127.4563',to_date('24/12/16','DD/MM/RR'),'47','42000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('16','Alex','Sanders','alex.sanders@example.com','515.127.4562',to_date('18/05/16','DD/MM/RR'),'47','42000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('18','Ollie','Bennett','ollie.bennett@example.com','515.127.4564',to_date('24/07/16','DD/MM/RR'),'47','42000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('19','Louis','Wood','louis.wood@example.com','515.127.4565',to_date('15/11/16','DD/MM/RR'),'47','42000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('20','Dexter','Barnes','dexter.barnes@example.com','515.127.4566',to_date('10/08/16','DD/MM/RR'),'47','42000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('56','Evie','Harrison','evie.harrison@example.com','011.44.1344.486508',to_date('23/11/16','DD/MM/RR'),'15','30000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('57','Scarlett','Gibson','scarlett.gibson@example.com','011.44.1345.429268',to_date('30/01/16','DD/MM/RR'),'15','30000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('58','Ruby','Mcdonald','ruby.mcdonald@example.com','011.44.1345.929268',to_date('04/03/16','DD/MM/RR'),'15','30000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('59','Chloe','Cruz','chloe.cruz@example.com','011.44.1345.829268',to_date('01/08/16','DD/MM/RR'),'15','30000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('60','Isabelle','Marshall','isabelle.marshall@example.com','011.44.1345.729268',to_date('10/03/16','DD/MM/RR'),'15','30000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('61','Daisy','Ortiz','daisy.ortiz@example.com','011.44.1345.629268',to_date('15/12/16','DD/MM/RR'),'15','30000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('62','Freya','Gomez','freya.gomez@example.com','011.44.1345.529268',to_date('03/11/16','DD/MM/RR'),'15','30000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('80','Elizabeth','Dixon','elizabeth.dixon@example.com','011.44.1644.429262',to_date('04/01/16','DD/MM/RR'),'15','30000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('64','Florence','Freeman','florence.freeman@example.com','011.44.1346.229268',to_date('19/03/16','DD/MM/RR'),'15','30000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('65','Alice','Wells','alice.wells@example.com','011.44.1346.329268',to_date('24/01/16','DD/MM/RR'),'15','30000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('66','Charlotte','Webb','charlotte.webb@example.com','011.44.1346.529268',to_date('23/02/16','DD/MM/RR'),'15','30000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('67','Sienna','Simpson','sienna.simpson@example.com','011.44.1346.629268',to_date('24/03/16','DD/MM/RR'),'15','30000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('68','Matilda','Stevens','matilda.stevens@example.com','011.44.1346.729268',to_date('21/04/16','DD/MM/RR'),'15','30000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('69','Evelyn','Tucker','evelyn.tucker@example.com','011.44.1343.929268',to_date('11/03/16','DD/MM/RR'),'15','30000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('70','Eva','Porter','eva.porter@example.com','011.44.1343.829268',to_date('23/03/16','DD/MM/RR'),'15','30000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('71','Millie','Hunter','millie.hunter@example.com','011.44.1343.729268',to_date('24/01/16','DD/MM/RR'),'15','30000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('72','Sofia','Hicks','sofia.hicks@example.com','011.44.1343.629268',to_date('23/02/16','DD/MM/RR'),'15','30000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('74','Elsie','Henry','elsie.henry@example.com','011.44.1343.329268',to_date('21/04/16','DD/MM/RR'),'15','30000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('75','Imogen','Boyd','imogen.boyd@example.com','011.44.1644.429267',to_date('11/05/16','DD/MM/RR'),'15','30000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('76','Layla','Mason','layla.mason@example.com','011.44.1644.429266',to_date('19/03/16','DD/MM/RR'),'15','30000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('77','Rosie','Morales','rosie.morales@example.com','011.44.1644.429265',to_date('24/03/16','DD/MM/RR'),'15','30000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('78','Maya','Kennedy','maya.kennedy@example.com','011.44.1644.429264',to_date('23/04/16','DD/MM/RR'),'15','30000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('79','Esme','Warren','esme.warren@example.com','011.44.1644.429263',to_date('24/05/16','DD/MM/RR'),'15','30000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('54','Lily','Fisher','lily.fisher@example.com','011.44.1344.498718',to_date('30/03/16','DD/MM/RR'),'15','30000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('53','Sophia','Reynolds','sophia.reynolds@example.com','011.44.1344.478968',to_date('20/08/16','DD/MM/RR'),'15','30000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('52','Sophie','Owens','sophie.owens@example.com','011.44.1344.345268',to_date('24/03/16','DD/MM/RR'),'15','30000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('51','Poppy','Jordan','poppy.jordan@example.com','011.44.1344.129268',to_date('30/01/16','DD/MM/RR'),'15','30000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('63','Phoebe','Murray','phoebe.murray@example.com','011.44.1346.129268',to_date('11/11/16','DD/MM/RR'),'15','30000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('85','Holly','Shaw','holly.shaw@example.com','650.509.1876',to_date('27/01/16','DD/MM/RR'),'22','46000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('86','Emilia','Holmes','emilia.holmes@example.com','650.509.2876',to_date('20/02/16','DD/MM/RR'),'22','46000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('87','Molly','Rice','molly.rice@example.com','650.509.3876',to_date('24/06/16','DD/MM/RR'),'22','46000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('88','Ellie','Robertson','ellie.robertson@example.com','650.509.4876',to_date('07/02/16','DD/MM/RR'),'22','46000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('89','Jasmine','Hunt','jasmine.hunt@example.com','650.505.1876',to_date('14/06/16','DD/MM/RR'),'23','46000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('90','Eliza','Black','eliza.black@example.com','650.505.2876',to_date('13/08/16','DD/MM/RR'),'23','46000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('91','Lilly','Daniels','lilly.daniels@example.com','650.505.3876',to_date('11/07/16','DD/MM/RR'),'23','46000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('92','Abigail','Palmer','abigail.palmer@example.com','650.505.4876',to_date('19/12/16','DD/MM/RR'),'23','46000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('93','Georgia','Mills','georgia.mills@example.com','650.501.1876',to_date('04/02/16','DD/MM/RR'),'24','46000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('94','Maisie','Nichols','maisie.nichols@example.com','650.501.2876',to_date('03/03/16','DD/MM/RR'),'24','46000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('95','Eleanor','Grant','eleanor.grant@example.com','650.501.3876',to_date('01/07/16','DD/MM/RR'),'24','46000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('96','Hannah','Knight','hannah.knight@example.com','650.501.4876',to_date('17/03/16','DD/MM/RR'),'24','46000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('97','Harriet','Ferguson','harriet.ferguson@example.com','650.507.9811',to_date('24/04/16','DD/MM/RR'),'47','42000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('98','Amber','Rose','amber.rose@example.com','650.507.9822',to_date('23/05/16','DD/MM/RR'),'25','46000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('99','Bella','Stone','bella.stone@example.com','650.507.9833',to_date('21/06/16','DD/MM/RR'),'25','46000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('100','Thea','Hawkins','thea.hawkins@example.com','650.507.9844',to_date('13/01/16','DD/MM/RR'),'25','46000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('81','Lola','Ramos','lola.ramos@example.com','650.507.9876',to_date('24/01/16','DD/MM/RR'),'21','46000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('82','Willow','Reyes','willow.reyes@example.com','650.507.9877',to_date('23/02/16','DD/MM/RR'),'21','46000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('83','Ivy','Burns','ivy.burns@example.com','650.507.9878',to_date('21/06/16','DD/MM/RR'),'21','46000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('84','Erin','Gordon','erin.gordon@example.com','650.507.9879',to_date('03/02/16','DD/MM/RR'),'21','46000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('33','Reggie','Simmons','reggie.simmons@example.com','650.124.8234',to_date('10/04/16','DD/MM/RR'),'22','47000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('44','Emily','Hamilton','emily.hamilton@example.com','650.121.2874',to_date('15/03/16','DD/MM/RR'),'25','47000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('43','Olivia','Ford','olivia.ford@example.com','650.121.2994',to_date('29/01/16','DD/MM/RR'),'25','47000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('42','Amelia','Myers','amelia.myers@example.com','650.121.8009',to_date('17/10/16','DD/MM/RR'),'25','47000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('41','Connor','Hayes','connor.hayes@example.com','650.121.1834',to_date('06/04/16','DD/MM/RR'),'24','47000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('26','Leon','Powell','leon.powell@example.com','650.124.1214',to_date('16/07/16','DD/MM/RR'),'21','47000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('27','Kai','Long','kai.long@example.com','650.124.1224',to_date('28/09/16','DD/MM/RR'),'21','47000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('28','Aaron','Patterson','aaron.patterson@example.com','650.124.1334',to_date('14/01/16','DD/MM/RR'),'21','47000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('29','Roman','Hughes','roman.hughes@example.com','650.124.1434',to_date('08/03/16','DD/MM/RR'),'21','47000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('30','Austin','Flores','austin.flores@example.com','650.124.5234',to_date('20/08/16','DD/MM/RR'),'22','47000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('31','Ellis','Washington','ellis.washington@example.com','650.124.6234',to_date('30/10/16','DD/MM/RR'),'22','47000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('32','Jamie','Butler','jamie.butler@example.com','650.124.7234',to_date('16/02/16','DD/MM/RR'),'22','47000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('45','Isla','Graham','isla.graham@example.com','650.121.2004',to_date('09/07/16','DD/MM/RR'),'25','47000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('34','Seth','Foster','seth.foster@example.com','650.127.1934',to_date('14/06/16','DD/MM/RR'),'23','47000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('35','Carter','Gonzales','carter.gonzales@example.com','650.127.1834',to_date('26/08/16','DD/MM/RR'),'23','47000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('36','Felix','Bryant','felix.bryant@example.com','650.127.1734',to_date('12/12/16','DD/MM/RR'),'23','47000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('37','Ibrahim','Alexander','ibrahim.alexander@example.com','650.127.1634',to_date('06/02/16','DD/MM/RR'),'23','47000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('38','Sonny','Russell','sonny.russell@example.com','650.121.1234',to_date('14/07/16','DD/MM/RR'),'24','47000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('39','Kian','Griffin','kian.griffin@example.com','650.121.2034',to_date('26/10/16','DD/MM/RR'),'24','47000');
Insert into E3T5.LANGILE (ID,IZENA,ABIZENA,EMAILA,TELEFONOA,KONTRATAZIO_DATA,ID_NAGUSI,SOLDATA) values ('40','Caleb','Diaz','caleb.diaz@example.com','650.121.2019',to_date('12/02/16','DD/MM/RR'),'24','47000');
REM INSERTING into E3T5.PRODUKTU
SET DEFINE OFF;
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('211','Intel Xeon E5-2650','Speed:2.0GHz,Cores:8,TDP:95W','869,03','1064,99','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('210','Intel Core i9-7900X','Speed:3.3GHz,Cores:10,TDP:140W','855,82','1029,99','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('54','Intel Xeon E5-1660 V3 (OEM/Tray)','Speed:3.0GHz,Cores:8,TDP:140W','914,52','1019,99','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('167','Intel Xeon E5-2650L V3 (OEM/Tray)','Speed:1.8GHz,Cores:12,TDP:65W','779,17','1010,46','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('214','Intel Core i7-5960X','Speed:3.0GHz,Cores:8,TDP:140W','865,59','1009,79','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('53','Intel Core 2 Extreme QX6800','Speed:2.93GHz,Cores:4,TDP:100W','787,72','1003,98','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('59','Intel Core i7-5960X (OEM/Tray)','Speed:3.0GHz,Cores:8,TDP:140W','879,8','977,99','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('176','Intel Xeon E5-2650 V3 (OEM/Tray)','Speed:2.3GHz,Cores:10,TDP:105W','799,98','939,49','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('9','Intel Xeon E5-2640 V4','Speed:2.4GHz,Cores:10,TDP:90W','738,71','899,99','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('119','Intel Xeon E5-2640 V3','Speed:2.6GHz,Cores:8,TDP:90W','668,24','899,99','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('120','Intel Core 2 Extreme QX9775','Speed:3.2GHz,Cores:4,TDP:150W','737,68','892','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('16','Intel Core i7-6900K','Speed:3.2GHz,Cores:8,TDP:140W','792,89','889,89','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('111','Intel Core i7-6900K (OEM/Tray)','Speed:3.2GHz,Cores:8,TDP:140W','620,28','827,37','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('136','AMD Opteron 6378','Speed:2.4GHz,Cores:16,TDP:115W','651,92','826,99','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('27','Intel Core i7-3960X Extreme Edition','Speed:3.3GHz,Cores:6,TDP:130W','573,41','800,74','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('73','Intel Core i7-4770K','Speed:3.5GHz,Cores:4,TDP:84W','714,15','799','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('70','Intel Xeon E5-2687W','Speed:3.1GHz,Cores:8,TDP:150W','581,16','710,99','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('74','Intel Xeon E5-2680 V2','Speed:2.8GHz,Cores:10,TDP:115W','567,81','701,95','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('198','Intel Core i7-980','Speed:3.33GHz,Cores:6,TDP:130W','563,7','699,99','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('69','Intel Core i7-7820X','Speed:3.6GHz,Cores:8,TDP:140W','511,1','678,75','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('71','Intel Core i7-3930K','Speed:3.2GHz,Cores:6,TDP:130W','509,32','660','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('199','Intel Xeon E5-2630 V4','Speed:2.2GHz,Cores:10,TDP:85W','528,95','647,99','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('76','Intel Xeon E5-2630 V3','Speed:2.4GHz,Cores:8,TDP:85W','499,96','629,99','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('75','Intel Core i7-4930K','Speed:3.4GHz,Cores:6,TDP:130W','527,69','624,04','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('200','Intel Core i7-4790K','Speed:4.0GHz,Cores:4,TDP:88W','461,92','620,95','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('106','Intel Xeon E5-2640 V2','Speed:2.0GHz,Cores:8,TDP:95W','545,19','608,95','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('8','Intel Xeon E5-1650 V4','Speed:3.6GHz,Cores:6,TDP:140W','535,47','601,99','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('124','Intel Xeon E5-1650 V4 (OEM/Tray)','Speed:3.6GHz,Cores:6,TDP:140W','453,14','594,99','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('72','Intel Xeon E5-2630 V3 (OEM/Tray)','Speed:2.4GHz,Cores:8,TDP:85W','421,9','589,99','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('155','Intel Xeon E5-2630 V2','Speed:2.6GHz,Cores:6,TDP:80W','493,48','588,95','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('80','Intel Xeon E5-1650 V3','Speed:3.5GHz,Cores:6,TDP:140W','399,77','564,89','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('132','Intel Core i7-5930K','Speed:3.5GHz,Cores:6,TDP:140W','481,56','554,99','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('133','PNY VCQP6000-PB','Chipset:Quadro P6000,Memory:24GBCore Clock:1.42GHz','4058,99','6049,99','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('206','PNY VCQM6000-24GB-PB','Chipset:Quadro M6000,Memory:24GBCore Clock:988MHz','3619,14','4552,9','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('207','PNY VCQM6000-PB','Chipset:Quadro M6000,Memory:12GBCore Clock:988MHz','2505,04','3580,49','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('110','ATI FirePro W9000','Chipset:FirePro W9000,Memory:6GBCore Clock:975MHz','2785,55','3512,27','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('123','ATI FirePro S9150','Chipset:FirePro S9150,Memory:16GBCore Clock:900MHz','2628,06','3495,18','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('142','AMD FirePro W9100','Chipset:FirePro W9100,Memory:16GBCore Clock:930MHz','2483,38','3298,78','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('105','EVGA 12G-P4-3992-KR','Chipset:GeForce GTX Titan Z,Memory:12GBCore Clock:732MHz','2313,07','3079,99','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('4','AMD 100-505989','Chipset:FirePro W9100,Memory:32GBCore Clock:930MHz','2128,67','2969,99','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('5','PNY VCQK6000-PB','Chipset:Quadro K6000,Memory:12GBCore Clock:902MHz','1740,31','2519,87','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('11','PNY VCQP5000-PB','Chipset:Quadro P5000,Memory:16GBCore Clock:1.61GHz','1602,21','2216,62','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('178','HP C2J95AT','Chipset:Quadro K5000,Memory:4GBCore Clock:706MHz','1715,91','2199,88','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('267','EVGA 12G-P4-1999-KR','Chipset:GeForce GTX Titan X,Memory:12GBCore Clock:1.15GHz','1328,03','1979,99','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('177','PNY VCQM5000-PB','Chipset:Quadro M5000,Memory:8GBCore Clock:861MHz','1268,42','1935,99','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('245','ATI FirePro S9050','Chipset:FirePro S9050,Memory:12GBCore Clock:900MHz','1237,04','1868,9','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('161','AMD 100-5056062','Chipset:Vega Frontier Edition Liquid,Memory:16GBCore Clock:1.5GHz','1343,84','1649,99','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('186','PNY VCQK5200-PB','Chipset:Quadro K5200,Memory:8GBCore Clock:667MHz','1129,39','1594,98','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('48','AMD FirePro S7000','Chipset:FirePro S7000,Memory:4GBCore Clock:950MHz','936,42','1340,35','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('184','AMD 100-506061','Chipset:Vega Frontier Edition,Memory:16GBCore Clock:1.44GHz','706,99','1099,99','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('181','ATI FirePro R5000','Chipset:FirePro R5000,Memory:2GBCore Clock:825MHz','760,59','1099,99','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('182','PNY VCQK4200-PB','Chipset:Quadro K4200,Memory:4GBCore Clock:771MHz','799,05','1044,88','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('183','Asus GTX780TI-3GD5','Chipset:GeForce GTX 780 Ti,Memory:3GBCore Clock:876MHz','781,91','989,99','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('185','MSI GTX 1080 TI LIGHTNING Z','Chipset:GeForce GTX 1080 Ti,Memory:11GBCore Clock:1.61GHz','688,35','961,38','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('281','Asus ROG-POSEIDON-GTX1080TI-P11G-GAMING','Chipset:GeForce GTX 1080 Ti,Memory:11GBCore Clock:1.62GHz','696,14','951,48','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('216','MSI GTX 1080 TI LIGHTNING X','Chipset:GeForce GTX 1080 Ti,Memory:11GBCore Clock:1.57GHz','742,94','950,38','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('6','Zotac ZT-P10810A-10P','Chipset:GeForce GTX 1080 Ti,Memory:11GBCore Clock:1.48GHz','702,35','934,99','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('108','MSI GAMING','Chipset:GeForce GTX 780 Ti,Memory:3GBCore Clock:1.02GHz','753,18','934,99','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('83','Asus STRIX-GTX1080TI-O11G-GAMING','Chipset:GeForce GTX 1080 Ti,Memory:11GBCore Clock:1.57GHz','691,13','912,99','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('215','PNY VCQP4000-PB','Chipset:Quadro P4000,Memory:8GBCore Clock:1.23GHz','724','912,88','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('12','Gigabyte GV-N108TAORUSX W-11GD','Chipset:GeForce GTX 1080 Ti,Memory:11GBCore Clock:1.63GHz','596,05','907,48','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('114','Zotac ZT-70203-10P','Chipset:GeForce GTX 780,Memory:3GBCore Clock:1.01GHz','580,42','902,67','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('103','EVGA 11G-P4-6598-KR','Chipset:GeForce GTX 1080 Ti,Memory:11GBCore Clock:1.56GHz','663,54','890,99','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('86','MSI GTX 1080 TI SEA HAWK X','Chipset:GeForce GTX 1080 Ti,Memory:11GBCore Clock:1.57GHz','691,32','885,48','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('3','Corsair CB-9060011-WW','Chipset:GeForce GTX 1080 Ti,Memory:11GBCore Clock:1.57GHz','573,51','879,99','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('174','MSI GTX 1080 TI AERO 11G OC','Chipset:GeForce GTX 1080 Ti,Memory:11GBCore Clock:1.51GHz','715,72','878,09','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('175','NVIDIA VCQM4000-PB','Chipset:Quadro M4000,Memory:8GBCore Clock:N/A','682,09','869','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('58','Gigabyte GV-N108TAORUS X-11GD','Chipset:GeForce GTX 1080 Ti,Memory:11GBCore Clock:1.61GHz','688,35','863,48','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('270','Gigabyte GV-N1070WF2OC-8GD','Chipset:GeForce GTX 1070,Memory:8GBCore Clock:1.56GHz','551,62','846,99','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('223','MSI GeForce GTX 1080 TI ARMOR 11G OC','Chipset:GeForce GTX 1080 Ti,Memory:11GBCore Clock:1.48GHz','644,19','841,48','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('90','EVGA 11G-P4-6696-KR','Chipset:GeForce GTX 1080 Ti,Memory:11GBCore Clock:1.56GHz','594,46','835,99','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('220','MSI GeForce GTX 1080 Ti GAMING X 11G','Chipset:GeForce GTX 1080 Ti,Memory:11GBCore Clock:1.57GHz','666,59','835,99','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('221','Zotac ZT-P10810C-10P','Chipset:GeForce GTX 1080 Ti,Memory:11GBCore Clock:1.65GHz','535,03','835,99','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('269','Zotac ZT-P10810D-10P','Chipset:GeForce GTX 1080 Ti,Memory:11GBCore Clock:1.57GHz','580,1','835,99','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('87','PNY VCGGTX1080T11XGPB-OC','Chipset:GeForce GTX 1080 Ti,Memory:11GBCore Clock:1.53GHz','600,92','835,99','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('222','Zotac ZT-P10810G-10P','Chipset:GeForce GTX 1080 Ti,Memory:11GBCore Clock:1.51GHz','598,25','830,48','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('88','Gigabyte GV-N98TWF3OC-6GD','Chipset:GeForce GTX 980 Ti,Memory:6GBCore Clock:1.06GHz','633,29','824,99','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('89','PNY VCGGTX780T3XPB-OC','Chipset:GeForce GTX 780 Ti,Memory:3GBCore Clock:980MHz','592,12','824,99','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('236','MSI GTX 980 Ti Gaming 6G','Chipset:GeForce GTX 980 Ti,Memory:6GBCore Clock:1.18GHz','539,98','819,85','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('237','Gigabyte GV-N108TAORUS-11GD','Chipset:GeForce GTX 1080 Ti,Memory:11GBCore Clock:1.59GHz','605,3','819,48','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('238','EVGA 06G-P4-4998-KR','Chipset:GeForce GTX 980 Ti,Memory:6GBCore Clock:1.19GHz','521,03','815,96','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('232','Western Digital WD1003FZEX','Series:BLACK SERIES,Type:7200RPM,Capacity:1TB,Cache:64MB','61,76','70,89','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('233','SanDisk SDSSDA-120G-G26','Series:SSD PLUS,Type:SSD,Capacity:120GB,Cache:N/A','52,7','59,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('234','Crucial CT525MX300SSD1','Series:MX300,Type:SSD,Capacity:525GB,Cache:N/A','135,59','150,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('235','Hitachi A7K1000-1000','Series:Ultrastar,Type:7200RPM,Capacity:1TB,Cache:32MB','29,94','41,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('253','Samsung MZ-V6P1T0BW','Series:960 Pro,Type:SSD,Capacity:1TB,Cache:1GB','466,49','579,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('254','Samsung MZ-7KE256BW','Series:850 Pro Series,Type:SSD,Capacity:256GB,Cache:N/A','97,19','119,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('255','Seagate ST2000DX002','Series:FireCuda,Type:Hybrid,Capacity:2TB,Cache:64MB','64,48','90,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('256','Western Digital WD5000AACS','Series:Caviar Green,Type:5400RPM,Capacity:500GB,Cache:16MB','20,14','26,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('257','SanDisk SDSSDHII-240G-G25','Series:Ultra II,Type:SSD,Capacity:240GB,Cache:N/A','73,39','84,95','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('258','PNY SSD7CS1311-120-RB','Series:CS1311,Type:SSD,Capacity:120GB,Cache:N/A','50,59','57,98','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('259','PNY SSD9SC240GMDA-RB','Series:XLR8,Type:SSD,Capacity:240GB,Cache:N/A','58,4','80,72','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('260','Crucial CT1050MX300SSD1','Series:MX300,Type:SSD,Capacity:1.1TB,Cache:N/A','192,52','267,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('263','Western Digital WDS250G1B0B','Series:Blue,Type:SSD,Capacity:250GB,Cache:N/A','70,71','89,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('264','Samsung MZ-75E120B/AM','Series:850 EVO-Series,Type:SSD,Capacity:120GB,Cache:N/A','74,41','88,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('280','Western Digital WDS500G1B0B','Series:Blue,Type:SSD,Capacity:500GB,Cache:N/A','106,89','149,88','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('60','Hitachi HUA723020ALA640','Series:Ultrastar 7K3000,Type:7200RPM,Capacity:2TB,Cache:64MB','45,18','59,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('94','Western Digital WD2500AVVS','Series:AV-GP,Type:5400RPM,Capacity:250GB,Cache:8MB','12,63','15,55','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('99','Seagate ST1000DX002','Series:FireCuda,Type:Hybrid,Capacity:1TB,Cache:64MB','55,41','68,06','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('100','Crucial CT275MX300SSD1','Series:MX300,Type:SSD,Capacity:275GB,Cache:N/A','79,21','97,88','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('168','Seagate ST31000340NS - FFP','Series:Barracuda ES,Type:7200RPM,Capacity:1TB,Cache:32MB','34,4','43,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('273','Western Digital WD101KRYZ','Series:Gold,Type:7200RPM,Capacity:10TB,Cache:256MB','313,96','443,64','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('55','Crucial CT525MX300SSD4','Series:MX300,Type:SSD,Capacity:525GB,Cache:N/A','121,92','150,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('56','Western Digital WD2500AAJS','Series:Caviar Blue,Type:7200RPM,Capacity:250GB,Cache:8MB','15,23','16,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('57','Western Digital WD20EZRZ','Series:Blue,Type:5400RPM,Capacity:2TB,Cache:64MB','58,01','67,34','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('95','Western Digital WDS256G1X0C','Series:Black PCIe,Type:SSD,Capacity:256GB,Cache:N/A','85,87','109,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('96','SanDisk SDSSDHII-480G-G25','Series:Ultra II,Type:SSD,Capacity:480GB,Cache:N/A','102,62','141,56','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('97','Kingston SV300S37A/120G','Series:SSDNow V300 Series,Type:SSD,Capacity:120GB,Cache:N/A','45,93','59,87','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('228','Intel Xeon E5-2699 V3 (OEM/Tray)','Speed:2.3GHz,Cores:18,TDP:145W','2867,51','3410,46','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('248','Intel Xeon E5-2697 V3','Speed:2.6GHz,Cores:14,TDP:145W','2326,27','2774,98','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('249','Intel Xeon E5-2698 V3 (OEM/Tray)','Speed:2.3GHz,Cores:16,TDP:135W','2035,18','2660,72','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('2','Intel Xeon E5-2697 V4','Speed:2.3GHz,Cores:18,TDP:145W','2144,4','2554,99','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('45','Intel Xeon E5-2685 V3 (OEM/Tray)','Speed:2.6GHz,Cores:12,TDP:120W','2012,11','2501,69','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('46','Intel Xeon E5-2695 V3 (OEM/Tray)','Speed:2.3GHz,Cores:14,TDP:120W','1925,13','2431,95','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('47','Intel Xeon E5-2697 V2','Speed:2.7GHz,Cores:12,TDP:130W','2101,59','2377,09','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('51','Intel Xeon E5-2695 V4','Speed:2.1GHz,Cores:18,TDP:120W','1780,35','2269,99','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('91','Intel Xeon E5-2695 V2','Speed:2.4GHz,Cores:12,TDP:115W','1793,53','2259,99','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('92','Intel Xeon E5-2643 V2 (OEM/Tray)','Speed:3.5GHz,Cores:6,TDP:130W','1940,18','2200','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('93','Intel Xeon E5-2690 (OEM/Tray)','Speed:2.9GHz,Cores:8,TDP:135W','1888,33','2116,72','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('98','Intel Xeon E5-2687W V3','Speed:3.1GHz,Cores:10,TDP:160W','1781,47','2064,99','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('102','Intel Xeon E5-2687W V4','Speed:3.0GHz,Cores:12,TDP:160W','1723,83','2042,69','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('158','Intel Xeon E5-2667 V3 (OEM/Tray)','Speed:3.2GHz,Cores:8,TDP:135W','1504,08','2009,46','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('159','Intel Xeon E5-2690 V4','Speed:2.6GHz,Cores:14,TDP:135W','1499,26','1994,49','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('160','Intel Xeon E5-2690 V3','Speed:2.6GHz,Cores:12,TDP:135W','1540,35','1908,73','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('162','Intel Xeon E5-2470V2','Speed:2.4GHz,Cores:10,TDP:95W','1671,95','1904,7','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('163','Intel Xeon E5-2683 V4','Speed:2.1GHz,Cores:16,TDP:120W','1706,95','1899,99','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('164','Intel Xeon E5-2637 V2 (OEM/Tray)','Speed:3.5GHz,Cores:4,TDP:130W','1323,12','1850','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('169','Intel Xeon E5-2683 V4 (OEM/Tray)','Speed:2.1GHz,Cores:16,TDP:120W','1369,83','1844,89','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('240','Intel Core i7-4960X Extreme Edition','Speed:3.6GHz,Cores:6,TDP:130W','1496,43','1805,97','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('241','Intel Xeon E5-2699 V4 (OEM/Tray)','Speed:2.2GHz,Cores:22,TDP:145W','1535,62','1756','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('242','Intel Xeon E5-1680 V3 (OEM/Tray)','Speed:3.2GHz,Cores:8,TDP:140W','1519,85','1751,99','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('243','Intel Xeon E5-2643 V4 (OEM/Tray)','Speed:3.4GHz,Cores:6,TDP:135W','1225,59','1708,86','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('19','Intel Core i7-6950X (OEM/Tray)','Speed:3.0GHz,Cores:10,TDP:140W','1479,56','1704,37','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('52','Intel Xeon E5-2670 V3','Speed:2.3GHz,Cores:12,TDP:120W','1453,94','1676,98','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('165','Intel Xeon E5-2680','Speed:2.7GHz,Cores:8,TDP:130W','1479,95','1666,61','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('212','Intel Xeon E5-2680 V4','Speed:2.4GHz,Cores:14,TDP:120W','1365,13','1639,99','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('166','Intel Xeon E5-2680 V3 (OEM/Tray)','Speed:2.5GHz,Cores:12,TDP:120W','1166,89','1638,89','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('82','Intel Core i7-6950X','Speed:3.0GHz,Cores:10,TDP:140W','1052,92','1499,89','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('213','Intel Xeon E5-2643 V3 (OEM/Tray)','Speed:3.4GHz,Cores:6,TDP:135W','1266,37','1469,96','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('218','Intel Xeon E5-2660 V4','Speed:2.0GHz,Cores:14,TDP:105W','1194,03','1388,89','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('219','Intel Xeon E5-2660 V3','Speed:2.6GHz,Cores:10,TDP:105W','1041,99','1299,73','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('85','Intel Xeon E5-2660 V3 (OEM/Tray)','Speed:2.6GHz,Cores:10,TDP:105W','902,18','1274,99','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('153','Intel Xeon E5-2650 V2','Speed:2.6GHz,Cores:8,TDP:95W','961,11','1249','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('154','Intel Xeon E5-2650 V3','Speed:2.3GHz,Cores:10,TDP:105W','906,63','1204,98','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('209','Intel Core i7-990X Extreme Edition','Speed:3.47GHz,Cores:6,TDP:130W','1072,79','1199,99','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('81','Intel Xeon E5-2650 V4','Speed:2.2GHz,Cores:12,TDP:105W','945,11','1099,99','1');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('239','MSI GTX 1080 Ti DUKE 11G OC','Chipset:GeForce GTX 1080 Ti,Memory:11GBCore Clock:1.53GHz','555,07','813,99','2');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('244','Crucial','Speed:DDR4-2133,Type:288-pin DIMM,CAS:15Module:4x16GBSize:64GB','1139,23','1620,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('261','G.Skill TridentZ RGB','Speed:DDR4-3200,Type:288-pin DIMM,CAS:14Module:8x16GBSize:128GB','1330,26','1504,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('262','Corsair Dominator Platinum','Speed:DDR4-3200,Type:288-pin DIMM,CAS:16Module:8x16GBSize:128GB','1051,97','1449,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('265','G.Skill Trident Z','Speed:DDR4-3200,Type:288-pin DIMM,CAS:14Module:8x16GBSize:128GB','1163,49','1431,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('266','G.Skill Trident Z RGB','Speed:DDR4-3333,Type:288-pin DIMM,CAS:16Module:8x16GBSize:128GB','1174,36','1418,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('279','G.Skill Ripjaws V Series','Speed:DDR4-3000,Type:288-pin DIMM,CAS:14Module:8x16GBSize:128GB','1139,87','1318,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('35','Corsair Dominator Platinum','Speed:DDR4-2800,Type:288-pin DIMM,CAS:15Module:8x16GBSize:128GB','1131,68','1314,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('36','Corsair Vengeance LPX','Speed:DDR4-3000,Type:288-pin DIMM,CAS:15Module:8x16GBSize:128GB','912,98','1299,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('37','Corsair Dominator Platinum','Speed:DDR4-2666,Type:288-pin DIMM,CAS:15Module:8x16GBSize:128GB','1068,66','1264,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('38','Corsair Vengeance LPX','Speed:DDR4-2400,Type:288-pin DIMM,CAS:15Module:8x16GBSize:128GB','1019,51','1199,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('65','Corsair Dominator Platinum','Speed:DDR4-2400,Type:288-pin DIMM,CAS:15Module:8x16GBSize:128GB','1002,47','1199,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('276','Corsair Vengeance LPX','Speed:DDR4-2666,Type:288-pin DIMM,CAS:15Module:8x16GBSize:128GB','867,52','1163,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('196','Corsair Vengeance LPX','Speed:DDR4-2133,Type:288-pin DIMM,CAS:15Module:8x16GBSize:128GB','821,91','1099,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('272','G.Skill Ripjaws 4 Series','Speed:DDR4-2800,Type:288-pin DIMM,CAS:15Module:8x16GBSize:128GB','834,06','1073,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('195','G.Skill Ripjaws 4 Series','Speed:DDR4-2400,Type:288-pin DIMM,CAS:14Module:8x16GBSize:128GB','836,03','1055,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('67','Kingston HyperX Beast','Speed:DDR3-1866,Type:240-pin DIMM,CAS:10Module:8x8GBSize:64GB','708,91','863,05','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('10','Crucial','Speed:DDR4-2133,Type:288-pin DIMM,CAS:15Module:2x16GBSize:32GB','580,33','811,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('112','Corsair Vengeance Pro','Speed:DDR3-2133,Type:240-pin DIMM,CAS:11Module:8x8GBSize:64GB','596,25','808,92','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('282','Corsair Dominator Platinum','Speed:DDR4-3200,Type:288-pin DIMM,CAS:15Module:8x8GBSize:64GB','700,5','804,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('197','G.Skill Trident Z RGB','Speed:DDR4-3600,Type:288-pin DIMM,CAS:17Module:4x16GBSize:64GB','622,47','799,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('18','Crucial','Speed:DDR4-2400,Type:288-pin DIMM,CAS:17Module:1x64GBSize:64GB','604,04','799','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('125','G.Skill Trident Z','Speed:DDR4-3600,Type:288-pin DIMM,CAS:17Module:4x16GBSize:64GB','594,04','768,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('68','Crucial','Speed:DDR4-2133,Type:288-pin DIMM,CAS:15Module:4x16GBSize:64GB','590,13','766,11','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('283','G.Skill Trident Z','Speed:DDR4-3200,Type:288-pin DIMM,CAS:14Module:8x8GBSize:64GB','647,83','760,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('277','G.Skill Trident Z','Speed:DDR4-3200,Type:288-pin DIMM,CAS:14Module:8x8GBSize:64GB','556,8','758,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('21','Corsair Dominator Platinum','Speed:DDR4-3466,Type:288-pin DIMM,CAS:16Module:4x16GBSize:64GB','609,89','749,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('128','Kingston','Speed:DDR4-2133,Type:288-pin DIMM,CAS:15Module:4x16GBSize:64GB','650,48','741,63','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('129','Corsair Vengeance LPX','Speed:DDR4-3333,Type:288-pin DIMM,CAS:15Module:4x16GBSize:64GB','609,53','734,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('116','G.Skill Trident Z','Speed:DDR4-3400,Type:288-pin DIMM,CAS:16Module:4x16GBSize:64GB','565,39','731,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('15','G.Skill Trident Z','Speed:DDR4-3466,Type:288-pin DIMM,CAS:16Module:4x16GBSize:64GB','601,56','725,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('122','G.Skill Trident Z','Speed:DDR4-3333,Type:288-pin DIMM,CAS:16Module:4x16GBSize:64GB','532,27','722,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('121','G.Skill Ripjaws V Series','Speed:DDR4-3200,Type:288-pin DIMM,CAS:14Module:8x8GBSize:64GB','603,22','721,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('20','Corsair Dominator Platinum','Speed:DDR4-3200,Type:288-pin DIMM,CAS:15Module:4x16GBSize:64GB','616,53','719,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('127','Corsair Dominator Platinum','Speed:DDR4-3333,Type:288-pin DIMM,CAS:15Module:4x16GBSize:64GB','538,55','719,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('109','G.Skill Trident Z','Speed:DDR4-3200,Type:288-pin DIMM,CAS:14Module:4x16GBSize:64GB','585,26','713,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('202','G.Skill Trident Z','Speed:DDR4-3200,Type:288-pin DIMM,CAS:14Module:4x16GBSize:64GB','533,21','713,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('113','G.Skill Trident Z','Speed:DDR4-3200,Type:288-pin DIMM,CAS:15Module:4x16GBSize:64GB','580,21','704,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('13','G.Skill Ripjaws V Series','Speed:DDR4-3333,Type:288-pin DIMM,CAS:16Module:4x16GBSize:64GB','618,63','704,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('14','G.Skill Ripjaws V Series','Speed:DDR4-3333,Type:288-pin DIMM,CAS:16Module:4x16GBSize:64GB','633,65','704,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('115','Corsair Vengeance LPX','Speed:DDR4-3200,Type:288-pin DIMM,CAS:15Module:8x8GBSize:64GB','565,73','699,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('118','Corsair Dominator Platinum','Speed:DDR4-2800,Type:288-pin DIMM,CAS:15Module:8x8GBSize:64GB','578,46','699,89','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('17','Corsair Vengeance LPX','Speed:DDR4-3333,Type:288-pin DIMM,CAS:15Module:4x16GBSize:64GB','595,42','699,01','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('117','G.Skill Ripjaws V Series','Speed:DDR4-3200,Type:288-pin DIMM,CAS:14Module:4x16GBSize:64GB','617,62','695,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('77','G.Skill Ripjaws V Series','Speed:DDR4-3200,Type:288-pin DIMM,CAS:14Module:4x16GBSize:64GB','577,25','695,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('78','G.Skill Ripjaws V Series','Speed:DDR4-3200,Type:288-pin DIMM,CAS:15Module:4x16GBSize:64GB','517,78','686,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('204','G.Skill Ripjaws V Series','Speed:DDR4-3200,Type:288-pin DIMM,CAS:15Module:4x16GBSize:64GB','546,64','686,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('7','G.Skill Ripjaws V Series','Speed:DDR4-3200,Type:288-pin DIMM,CAS:15Module:8x8GBSize:64GB','602,4','680,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('278','G.Skill Ripjaws V Series','Speed:DDR4-3000,Type:288-pin DIMM,CAS:14Module:8x8GBSize:64GB','546,05','677,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('203','Kingston','Speed:DDR3-1333,Type:240-pin DIMM,CAS:9Module:4x16GBSize:64GB','556,84','671,38','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('79','Corsair Dominator Platinum','Speed:DDR4-2666,Type:288-pin DIMM,CAS:15Module:8x8GBSize:64GB','537,63','659,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('201','Kingston','Speed:DDR3-1600,Type:240-pin DIMM,CAS:11Module:4x8GBSize:32GB','566,98','653,5','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('205','G.Skill Trident X','Speed:DDR3-3100,Type:240-pin DIMM,CAS:12Module:2x4GBSize:8GB','507,32','649,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('29','Corsair Vengeance LPX','Speed:DDR4-3200,Type:288-pin DIMM,CAS:15Module:4x16GBSize:64GB','571,7','645,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('138','G.Skill Ripjaws V Series','Speed:DDR4-3000,Type:288-pin DIMM,CAS:14Module:4x16GBSize:64GB','499,09','645,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('30','G.Skill Ripjaws V Series','Speed:DDR4-2800,Type:288-pin DIMM,CAS:14Module:4x16GBSize:64GB','452,54','645,2','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('107','Kingston','Speed:DDR3-1600,Type:240-pin DIMM,CAS:11Module:4x16GBSize:64GB','474,18','644','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('126','G.Skill Ripjaws V Series','Speed:DDR4-3200,Type:288-pin DIMM,CAS:16Module:8x8GBSize:64GB','510,93','640,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('1','G.Skill Ripjaws V Series','Speed:DDR4-3000,Type:288-pin DIMM,CAS:15Module:8x8GBSize:64GB','450,36','640,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('101','Kingston HyperX Predator','Speed:DDR4-3000,Type:288-pin DIMM,CAS:15Module:4x16GBSize:64GB','471,78','635,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('190','Supermicro X10SDV-8C-TLN4F','CPU:Xeon D-1541,Form Factor:Mini ITX,RAM Slots:4,Max RAM:64GB','664,29','948,99','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('62','Intel DP35DPM','CPU:LGA775,Form Factor:ATX,RAM Slots:4,Max RAM:8GB','626,22','789,79','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('189','Asus X99-E-10G WS','CPU:LGA2011-3,Form Factor:SSI CEB,RAM Slots:8,Max RAM:128GB','582,02','649','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('191','Asus ROG MAXIMUS IX EXTREME','CPU:LGA1151,Form Factor:EATX,RAM Slots:4,Max RAM:64GB','480,89','573,99','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('63','Asus RAMPAGE V EXTREME','CPU:LGA2011-3,Form Factor:EATX,RAM Slots:8,Max RAM:64GB','459','572,96','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('193','Asus Z10PE-D8 WS','CPU:LGA2011-3 x 2,Form Factor:SSI EEB,RAM Slots:8,Max RAM:512GB','504,14','561,59','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('271','MSI X99A GODLIKE GAMING CARBON','CPU:LGA2011-3,Form Factor:EATX,RAM Slots:8,Max RAM:128GB','415','549,59','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('64','Supermicro H8DG6-F','CPU:G34 x 2,Form Factor:EATX,RAM Slots:16,Max RAM:512GB','416,64','525,99','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('192','Asus Rampage V Edition 10','CPU:LGA2011-3,Form Factor:EATX,RAM Slots:8,Max RAM:128GB','452,5','519,99','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('225','Gigabyte GA-Z270X-Gaming 9','CPU:LGA1151,Form Factor:EATX,RAM Slots:4,Max RAM:64GB','380,05','503,98','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('252','Gigabyte X299 AORUS Gaming 9','CPU:LGA2066,Form Factor:ATX,RAM Slots:8,Max RAM:128GB','395,24','499,99','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('274','ASRock E3C224D4M-16RE','CPU:LGA1150,Form Factor:ATX,RAM Slots:4,Max RAM:32GB','364,79','499,99','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('61','Asus PRIME X299-DELUXE','CPU:LGA2066,Form Factor:ATX,RAM Slots:8,Max RAM:128GB','409,92','487,3','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('188','Asus X99-E WS/USB 3.1','CPU:LGA2011-3,Form Factor:SSI CEB,RAM Slots:8,Max RAM:128GB','428,89','482,49','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('28','Supermicro X9SRH-7TF','CPU:LGA2011,Form Factor:ATX,RAM Slots:8,Max RAM:64GB','411,64','479,99','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('137','Asus Z10PE-D16 WS','CPU:LGA2011-3 x 2,Form Factor:SSI EEB,RAM Slots:16,Max RAM:1TB','332,52','469,99','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('32','ASRock X99 Extreme11','CPU:LGA2011-3,Form Factor:EATX,RAM Slots:8,Max RAM:128GB','380,55','469,99','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('31','Supermicro MBD-X10DAX','CPU:LGA2011-3 x 2,Form Factor:EATX,RAM Slots:16,Max RAM:','385,24','443,72','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('84','Asus X99-DELUXE/U3.1','CPU:LGA2011-3,Form Factor:ATX,RAM Slots:8,Max RAM:64GB','332,38','440,3','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('141','Supermicro X11SSL-CF','CPU:LGA1151,Form Factor:Micro ATX,RAM Slots:4,Max RAM:64GB','317,81','419,99','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('34','Asus KGPE-D16','CPU:G34 x 2,Form Factor:SSI EEB,RAM Slots:16,Max RAM:256GB','360,72','417,98','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('143','Asus Z10PE-D16','CPU:LGA2011-3 Narrow x 2,Form Factor:SSI EEB,RAM Slots:16,Max RAM:1TB','293,3','402,99','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('217','ASRock C2750D4I','CPU:Atom C2750,Form Factor:Mini ITX,RAM Slots:4,Max RAM:64GB','339,55','401,98','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('66','Gigabyte X299 AORUS Gaming 7','CPU:LGA2066,Form Factor:ATX,RAM Slots:8,Max RAM:128GB','283,91','399,99','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('275','MSI X99A GODLIKE GAMING','CPU:LGA2011-3,Form Factor:EATX,RAM Slots:8,Max RAM:128GB','302,95','399,99','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('194','MSI X299 GAMING M7 ACK','CPU:LGA2066,Form Factor:ATX,RAM Slots:8,Max RAM:128GB','278,71','397,42','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('156','Supermicro MBD-X10DRI-O','CPU:LGA2011-3 Narrow x 2,Form Factor:EATX,RAM Slots:16,Max RAM:1TB','291,34','394,99','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('157','Asus MAXIMUS IX FORMULA','CPU:LGA1151,Form Factor:ATX,RAM Slots:4,Max RAM:64GB','339,12','388,99','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('170','Asus X99-DELUXE II','CPU:LGA2011-3,Form Factor:ATX,RAM Slots:8,Max RAM:128GB','289,33','383,98','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('171','ASRock Fatal1ty X299 Professional Gaming i9','CPU:LGA2066,Form Factor:ATX,RAM Slots:8,Max RAM:128GB','287,5','382,98','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('172','ASRock EP2C612 WS','CPU:LGA2011-3 x 2,Form Factor:SSI EEB,RAM Slots:8,Max RAM:','308,84','358,49','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('173','ASRock Z270 SuperCarrier','CPU:LGA1151,Form Factor:ATX,RAM Slots:4,Max RAM:64GB','264,35','353,98','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('187','Asus MAXIMUS VIII EXTREME/ASSEMBLY','CPU:LGA1151,Form Factor:EATX,RAM Slots:4,Max RAM:64GB','253,41','353,98','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('224','Asus STRIX X299-E GAMING','CPU:LGA2066,Form Factor:ATX,RAM Slots:8,Max RAM:128GB','306','349,99','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('246','Gigabyte X299 AORUS Ultra Gaming','CPU:LGA2066,Form Factor:ATX,RAM Slots:8,Max RAM:128GB','287,78','343,99','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('247','Asus TUF X299 MARK 1','CPU:LGA2066,Form Factor:ATX,RAM Slots:8,Max RAM:128GB','241,15','339,99','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('250','Asus Z170-WS','CPU:LGA1151,Form Factor:ATX,RAM Slots:4,Max RAM:64GB','279,4','338,99','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('251','MSI X299 GAMING PRO CARBON AC','CPU:LGA2066,Form Factor:ATX,RAM Slots:8,Max RAM:128GB','238,8','337,81','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('287','MSI X99A XPOWER GAMING TITANIUM','CPU:LGA2011-3,Form Factor:EATX,RAM Slots:8,Max RAM:128GB','257,23','329,99','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('288','Asus ROG STRIX X99 GAMING','CPU:LGA2011-3,Form Factor:ATX,RAM Slots:8,Max RAM:128GB','255,86','319,99','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('179','Asus SABERTOOTH X99','CPU:LGA2011-3,Form Factor:ATX,RAM Slots:8,Max RAM:64GB','252,57','312,67','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('226','Asus PRIME X299-A','CPU:LGA2066,Form Factor:ATX,RAM Slots:8,Max RAM:128GB','274,56','309,85','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('227','Gigabyte GA-X99-UD5 WIFI','CPU:LGA2011-3,Form Factor:EATX,RAM Slots:8,Max RAM:64GB','217,83','305','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('39','ASRock EP2C602-4L/D16','CPU:LGA2011 x 2,Form Factor:SSI EEB,RAM Slots:16,Max RAM:512GB','225,47','301,99','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('40','MSI Z170A KRAIT GAMING 3X','CPU:LGA1151,Form Factor:ATX,RAM Slots:4,Max RAM:64GB','245,4','299,89','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('41','MSI Z170 Krait Gaming','CPU:LGA1151,Form Factor:ATX,RAM Slots:4,Max RAM:64GB','231,58','299,89','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('42','MSI Z170A KRAIT GAMING','CPU:LGA1151,Form Factor:ATX,RAM Slots:4,Max RAM:64GB','262,4','299,89','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('43','Asus MAXIMUS IX CODE','CPU:LGA1151,Form Factor:ATX,RAM Slots:4,Max RAM:64GB','266,15','298,98','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('134','Asus Sabertooth 990FX','CPU:AM3+,Form Factor:ATX,RAM Slots:4,Max RAM:32GB','252,31','295,72','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('140','MSI X99A WORKSTATION','CPU:LGA2011-3,Form Factor:ATX,RAM Slots:8,Max RAM:128GB','239,95','289,97','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('144','Intel DG43RK','CPU:LGA775,Form Factor:Micro ATX,RAM Slots:4,Max RAM:8GB','219,69','289,79','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('145','Asus VANGUARD B85','CPU:LGA1150,Form Factor:Micro ATX,RAM Slots:4,Max RAM:32GB','258,1','287','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('146','EVGA Z270 Classified K','CPU:LGA1151,Form Factor:EATX,RAM Slots:4,Max RAM:64GB','234,26','283,98','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('147','EVGA Classified','CPU:LGA2011-3,Form Factor:EATX,RAM Slots:8,Max RAM:128GB','240,62','283,98','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('148','MSI Z270 XPOWER GAMING TITANIUM','CPU:LGA1151,Form Factor:ATX,RAM Slots:4,Max RAM:64GB','212,69','282,98','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('149','ASRock X299 Taichi','CPU:LGA2066,Form Factor:ATX,RAM Slots:8,Max RAM:128GB','214,36','282,98','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('150','MSI X299 TOMAHAWK ARCTIC','CPU:LGA2066,Form Factor:ATX,RAM Slots:8,Max RAM:128GB','223,92','281,98','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('151','Supermicro X10SAT-O','CPU:LGA1150,Form Factor:ATX,RAM Slots:4,Max RAM:32GB','207,08','281,97','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('152','Gigabyte X299 AORUS Gaming 3','CPU:LGA2066,Form Factor:ATX,RAM Slots:8,Max RAM:128GB','227,48','280,98','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('180','Supermicro MBD-X10DAL-I-O','CPU:LGA2011-3 x 2,Form Factor:ATX,RAM Slots:8,Max RAM:512GB','239,28','279,99','4');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('268','Western Digital WD10EZEX','Series:Caviar Blue,Type:7200RPM,Capacity:1TB,Cache:64MB','35,83','47,88','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('24','Seagate ST2000DM006','Series:Barracuda,Type:7200RPM,Capacity:2TB,Cache:64MB','47,93','66,89','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('25','Samsung MZ-75E250B/AM','Series:850 EVO-Series,Type:SSD,Capacity:250GB,Cache:N/A','87,98','104,88','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('26','Samsung MZ-75E500B/AM','Series:850 EVO-Series,Type:SSD,Capacity:500GB,Cache:N/A','157,81','178,09','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('104','SanDisk SDSSDA-240G-G26','Series:SSD PLUS,Type:SSD,Capacity:240GB,Cache:N/A','61,1','83,88','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('135','Samsung MZ-V6E250','Series:960 EVO,Type:SSD,Capacity:250GB,Cache:512MB','92,98','127,88','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('284','Kingston SA400S37/120G','Series:A400,Type:SSD,Capacity:120GB,Cache:N/A','40,63','54,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('285','Samsung MZ-75E1T0B/AM','Series:850 EVO-Series,Type:SSD,Capacity:1TB,Cache:N/A','260,23','339,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('286','Samsung MZ-V6E500','Series:960 EVO,Type:SSD,Capacity:500GB,Cache:512MB','209,62','234','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('22','Seagate ST3000DM008','Series:Barracuda,Type:7200RPM,Capacity:3TB,Cache:64MB','61,63','83,61','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('23','Western Digital WDS250G1B0A','Series:Blue,Type:SSD,Capacity:250GB,Cache:N/A','72,54','89,89','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('33','ADATA ASU800SS-128GT-C','Series:Ultimate SU800,Type:SSD,Capacity:128GB,Cache:N/A','37,78','52,65','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('44','Seagate ST1000DM010','Series:BarraCuda,Type:7200RPM,Capacity:1TB,Cache:64MB','42,18','49,37','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('49','Samsung MZ-75E4T0B','Series:850 EVO,Type:SSD,Capacity:4TB,Cache:4GB','1153,64','1499,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('50','Intel SSDPECME040T401','Series:DC P3608,Type:SSD,Capacity:4TB,Cache:N/A','7123,66','8867,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('130','Western Digital WD2003FZEX','Series:BLACK SERIES,Type:7200RPM,Capacity:2TB,Cache:64MB','91,76','117,45','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('131','Samsung MZ-V6P512BW','Series:960 PRO,Type:SSD,Capacity:512GB,Cache:512MB','223,99','279,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('139','Hitachi HUS724030ALE641','Series:Ultrastar 7K4000,Type:7200RPM,Capacity:3TB,Cache:64MB','54,03','65,92','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('208','Samsung MZ-V6P2T0BW','Series:960 Pro,Type:SSD,Capacity:2TB,Cache:2GB','840,11','1199,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('229','Seagate ST10000DM0004','Series:BarraCuda Pro,Type:7200RPM,Capacity:10TB,Cache:256MB','284,23','399,99','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('230','ADATA ASU800SS-512GT-C','Series:Ultimate SU800,Type:SSD,Capacity:512GB,Cache:N/A','113,29','136,69','5');
Insert into E3T5.PRODUKTU (ID,IZENA,DESKRIBAPENA,BALIOA,SALNEURRIA,ID_KATEGORIA) values ('231','Samsung MZ-V6E1T0','Series:960 EVO,Type:SSD,Capacity:1TB,Cache:1000MB','358,06','449,99','5');
--------------------------------------------------------
--  DDL for Index PK_BEZERO
--------------------------------------------------------

  CREATE UNIQUE INDEX "E3T5"."PK_BEZERO" ON "E3T5"."BEZERO" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_BILTEGI
--------------------------------------------------------

  CREATE UNIQUE INDEX "E3T5"."PK_BILTEGI" ON "E3T5"."BILTEGI" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_BULEGARI
--------------------------------------------------------

  CREATE UNIQUE INDEX "E3T5"."PK_BULEGARI" ON "E3T5"."BULEGARI" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_ERABILTZAILEAK
--------------------------------------------------------

  CREATE UNIQUE INDEX "E3T5"."PK_ERABILTZAILEAK" ON "E3T5"."ERABILTZAILEAK" ("ID", "MOTA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_ESKARI
--------------------------------------------------------

  CREATE UNIQUE INDEX "E3T5"."PK_ESKARI" ON "E3T5"."ESKARI" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_ESKARI_EGOERA
--------------------------------------------------------

  CREATE UNIQUE INDEX "E3T5"."PK_ESKARI_EGOERA" ON "E3T5"."ESKARI_EGOERA" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_ESKARI_LERRO
--------------------------------------------------------

  CREATE UNIQUE INDEX "E3T5"."PK_ESKARI_LERRO" ON "E3T5"."ESKARI_LERRO" ("ID_ESKARI", "ID_LERRO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_ESK_LERRO_HORN
--------------------------------------------------------

  CREATE UNIQUE INDEX "E3T5"."PK_ESK_LERRO_HORN" ON "E3T5"."ESKARI_LERRO_HORNITZAILE" ("ID_ESKARI", "ID_LERRO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_HERRIALDE
--------------------------------------------------------

  CREATE UNIQUE INDEX "E3T5"."PK_HERRIALDE" ON "E3T5"."HERRIALDE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_ID_ESK_HORNITZAILE
--------------------------------------------------------

  CREATE UNIQUE INDEX "E3T5"."PK_ID_ESK_HORNITZAILE" ON "E3T5"."ESKARI_HORNITZAILE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_INBENTARIO
--------------------------------------------------------

  CREATE UNIQUE INDEX "E3T5"."PK_INBENTARIO" ON "E3T5"."INBENTARIO" ("ID_PRODUKTU", "ID_BILTEGI") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_KATEGORIA
--------------------------------------------------------

  CREATE UNIQUE INDEX "E3T5"."PK_KATEGORIA" ON "E3T5"."KATEGORIA" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_KOKALEKU
--------------------------------------------------------

  CREATE UNIQUE INDEX "E3T5"."PK_KOKALEKU" ON "E3T5"."KOKALEKU" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_KONTINENTE
--------------------------------------------------------

  CREATE UNIQUE INDEX "E3T5"."PK_KONTINENTE" ON "E3T5"."KONTINENTE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_LANGILE
--------------------------------------------------------

  CREATE UNIQUE INDEX "E3T5"."PK_LANGILE" ON "E3T5"."LANGILE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_PRODUKTU
--------------------------------------------------------

  CREATE UNIQUE INDEX "E3T5"."PK_PRODUKTU" ON "E3T5"."PRODUKTU" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_BEZERO
--------------------------------------------------------

  CREATE UNIQUE INDEX "E3T5"."PK_BEZERO" ON "E3T5"."BEZERO" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_BILTEGI
--------------------------------------------------------

  CREATE UNIQUE INDEX "E3T5"."PK_BILTEGI" ON "E3T5"."BILTEGI" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_BULEGARI
--------------------------------------------------------

  CREATE UNIQUE INDEX "E3T5"."PK_BULEGARI" ON "E3T5"."BULEGARI" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_ERABILTZAILEAK
--------------------------------------------------------

  CREATE UNIQUE INDEX "E3T5"."PK_ERABILTZAILEAK" ON "E3T5"."ERABILTZAILEAK" ("ID", "MOTA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_ESKARI
--------------------------------------------------------

  CREATE UNIQUE INDEX "E3T5"."PK_ESKARI" ON "E3T5"."ESKARI" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_ESKARI_EGOERA
--------------------------------------------------------

  CREATE UNIQUE INDEX "E3T5"."PK_ESKARI_EGOERA" ON "E3T5"."ESKARI_EGOERA" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_ID_ESK_HORNITZAILE
--------------------------------------------------------

  CREATE UNIQUE INDEX "E3T5"."PK_ID_ESK_HORNITZAILE" ON "E3T5"."ESKARI_HORNITZAILE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_ESKARI_LERRO
--------------------------------------------------------

  CREATE UNIQUE INDEX "E3T5"."PK_ESKARI_LERRO" ON "E3T5"."ESKARI_LERRO" ("ID_ESKARI", "ID_LERRO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_ESK_LERRO_HORN
--------------------------------------------------------

  CREATE UNIQUE INDEX "E3T5"."PK_ESK_LERRO_HORN" ON "E3T5"."ESKARI_LERRO_HORNITZAILE" ("ID_ESKARI", "ID_LERRO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_HERRIALDE
--------------------------------------------------------

  CREATE UNIQUE INDEX "E3T5"."PK_HERRIALDE" ON "E3T5"."HERRIALDE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_INBENTARIO
--------------------------------------------------------

  CREATE UNIQUE INDEX "E3T5"."PK_INBENTARIO" ON "E3T5"."INBENTARIO" ("ID_PRODUKTU", "ID_BILTEGI") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_KATEGORIA
--------------------------------------------------------

  CREATE UNIQUE INDEX "E3T5"."PK_KATEGORIA" ON "E3T5"."KATEGORIA" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_KOKALEKU
--------------------------------------------------------

  CREATE UNIQUE INDEX "E3T5"."PK_KOKALEKU" ON "E3T5"."KOKALEKU" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_KONTINENTE
--------------------------------------------------------

  CREATE UNIQUE INDEX "E3T5"."PK_KONTINENTE" ON "E3T5"."KONTINENTE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_LANGILE
--------------------------------------------------------

  CREATE UNIQUE INDEX "E3T5"."PK_LANGILE" ON "E3T5"."LANGILE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_PRODUKTU
--------------------------------------------------------

  CREATE UNIQUE INDEX "E3T5"."PK_PRODUKTU" ON "E3T5"."PRODUKTU" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table BEZERO
--------------------------------------------------------

  ALTER TABLE "E3T5"."BEZERO" MODIFY ("IZENA" NOT NULL ENABLE);
  ALTER TABLE "E3T5"."BEZERO" MODIFY ("ABIZENA" NOT NULL ENABLE);
  ALTER TABLE "E3T5"."BEZERO" MODIFY ("EMAILA" NOT NULL ENABLE);
  ALTER TABLE "E3T5"."BEZERO" ADD CONSTRAINT "PK_BEZERO" PRIMARY KEY ("ID")
  USING INDEX "E3T5"."PK_BEZERO"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BILTEGI
--------------------------------------------------------

  ALTER TABLE "E3T5"."BILTEGI" MODIFY ("IZENA" NOT NULL ENABLE);
  ALTER TABLE "E3T5"."BILTEGI" MODIFY ("ID_KOKALEKU" NOT NULL ENABLE);
  ALTER TABLE "E3T5"."BILTEGI" ADD CONSTRAINT "PK_BILTEGI" PRIMARY KEY ("ID")
  USING INDEX "E3T5"."PK_BILTEGI"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BULEGARI
--------------------------------------------------------

  ALTER TABLE "E3T5"."BULEGARI" MODIFY ("ID_LANPOSTU" NOT NULL ENABLE);
  ALTER TABLE "E3T5"."BULEGARI" ADD CONSTRAINT "PK_BULEGARI" PRIMARY KEY ("ID")
  USING INDEX "E3T5"."PK_BULEGARI"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ERABILTZAILEAK
--------------------------------------------------------

  ALTER TABLE "E3T5"."ERABILTZAILEAK" MODIFY ("ERABILTZAILEA" NOT NULL ENABLE);
  ALTER TABLE "E3T5"."ERABILTZAILEAK" MODIFY ("PASAHITZA" NOT NULL ENABLE);
  ALTER TABLE "E3T5"."ERABILTZAILEAK" ADD CHECK (MOTA IN ('S', 'B')) ENABLE;
  ALTER TABLE "E3T5"."ERABILTZAILEAK" ADD CONSTRAINT "PK_ERABILTZAILEAK" PRIMARY KEY ("ID", "MOTA")
  USING INDEX "E3T5"."PK_ERABILTZAILEAK"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ESKARI
--------------------------------------------------------

  ALTER TABLE "E3T5"."ESKARI" MODIFY ("ID_BEZERO" NOT NULL ENABLE);
  ALTER TABLE "E3T5"."ESKARI" MODIFY ("ID_EGOERA" NOT NULL ENABLE);
  ALTER TABLE "E3T5"."ESKARI" MODIFY ("ESKAERA_DATA" NOT NULL ENABLE);
  ALTER TABLE "E3T5"."ESKARI" ADD CONSTRAINT "PK_ESKARI" PRIMARY KEY ("ID")
  USING INDEX "E3T5"."PK_ESKARI"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ESKARI_EGOERA
--------------------------------------------------------

  ALTER TABLE "E3T5"."ESKARI_EGOERA" MODIFY ("DESKRIBAPENA" NOT NULL ENABLE);
  ALTER TABLE "E3T5"."ESKARI_EGOERA" ADD CONSTRAINT "CK_DESKRIBAPENA" CHECK (DESKRIBAPENA IN ('Pending','Canceled','Shipped')) ENABLE;
  ALTER TABLE "E3T5"."ESKARI_EGOERA" ADD CONSTRAINT "PK_ESKARI_EGOERA" PRIMARY KEY ("ID")
  USING INDEX "E3T5"."PK_ESKARI_EGOERA"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ESKARI_HORNITZAILE
--------------------------------------------------------

  ALTER TABLE "E3T5"."ESKARI_HORNITZAILE" MODIFY ("ESKAERA_DATA" NOT NULL ENABLE);
  ALTER TABLE "E3T5"."ESKARI_HORNITZAILE" MODIFY ("EGOERA" NOT NULL ENABLE);
  ALTER TABLE "E3T5"."ESKARI_HORNITZAILE" ADD CONSTRAINT "CK_EGOERA" CHECK (EGOERA IN ('Bidaltzeko', 'Bidalita', 'Ezeztatuta', 'Entregatuta')) ENABLE;
  ALTER TABLE "E3T5"."ESKARI_HORNITZAILE" ADD CONSTRAINT "PK_ID_ESK_HORNITZAILE" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ESKARI_LERRO
--------------------------------------------------------

  ALTER TABLE "E3T5"."ESKARI_LERRO" MODIFY ("ID_PRODUKTU" NOT NULL ENABLE);
  ALTER TABLE "E3T5"."ESKARI_LERRO" MODIFY ("KOPURUA" NOT NULL ENABLE);
  ALTER TABLE "E3T5"."ESKARI_LERRO" MODIFY ("SALNEURRIA" NOT NULL ENABLE);
  ALTER TABLE "E3T5"."ESKARI_LERRO" ADD CONSTRAINT "PK_ESKARI_LERRO" PRIMARY KEY ("ID_ESKARI", "ID_LERRO")
  USING INDEX "E3T5"."PK_ESKARI_LERRO"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ESKARI_LERRO_HORNITZAILE
--------------------------------------------------------

  ALTER TABLE "E3T5"."ESKARI_LERRO_HORNITZAILE" MODIFY ("ID_PRODUKTU" NOT NULL ENABLE);
  ALTER TABLE "E3T5"."ESKARI_LERRO_HORNITZAILE" MODIFY ("KOPURUA" NOT NULL ENABLE);
  ALTER TABLE "E3T5"."ESKARI_LERRO_HORNITZAILE" MODIFY ("BALIOA" NOT NULL ENABLE);
  ALTER TABLE "E3T5"."ESKARI_LERRO_HORNITZAILE" ADD CONSTRAINT "PK_ESK_LERRO_HORN" PRIMARY KEY ("ID_ESKARI", "ID_LERRO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table HERRIALDE
--------------------------------------------------------

  ALTER TABLE "E3T5"."HERRIALDE" MODIFY ("IZENA" NOT NULL ENABLE);
  ALTER TABLE "E3T5"."HERRIALDE" MODIFY ("ID_KONTINENTE" NOT NULL ENABLE);
  ALTER TABLE "E3T5"."HERRIALDE" ADD CONSTRAINT "PK_HERRIALDE" PRIMARY KEY ("ID")
  USING INDEX "E3T5"."PK_HERRIALDE"  ENABLE;
--------------------------------------------------------
--  Constraints for Table INBENTARIO
--------------------------------------------------------

  ALTER TABLE "E3T5"."INBENTARIO" MODIFY ("KOPURUA" NOT NULL ENABLE);
  ALTER TABLE "E3T5"."INBENTARIO" ADD CONSTRAINT "PK_INBENTARIO" PRIMARY KEY ("ID_PRODUKTU", "ID_BILTEGI")
  USING INDEX "E3T5"."PK_INBENTARIO"  ENABLE;
--------------------------------------------------------
--  Constraints for Table KATEGORIA
--------------------------------------------------------

  ALTER TABLE "E3T5"."KATEGORIA" MODIFY ("IZENA" NOT NULL ENABLE);
  ALTER TABLE "E3T5"."KATEGORIA" ADD CONSTRAINT "PK_KATEGORIA" PRIMARY KEY ("ID")
  USING INDEX "E3T5"."PK_KATEGORIA"  ENABLE;
--------------------------------------------------------
--  Constraints for Table KOKALEKU
--------------------------------------------------------

  ALTER TABLE "E3T5"."KOKALEKU" MODIFY ("HELBIDEA" NOT NULL ENABLE);
  ALTER TABLE "E3T5"."KOKALEKU" MODIFY ("UDALERRIA" NOT NULL ENABLE);
  ALTER TABLE "E3T5"."KOKALEKU" MODIFY ("ID_HERRIALDE" NOT NULL ENABLE);
  ALTER TABLE "E3T5"."KOKALEKU" ADD CONSTRAINT "PK_KOKALEKU" PRIMARY KEY ("ID")
  USING INDEX "E3T5"."PK_KOKALEKU"  ENABLE;
--------------------------------------------------------
--  Constraints for Table KONTINENTE
--------------------------------------------------------

  ALTER TABLE "E3T5"."KONTINENTE" MODIFY ("IZENA" NOT NULL ENABLE);
  ALTER TABLE "E3T5"."KONTINENTE" ADD CONSTRAINT "PK_KONTINENTE" PRIMARY KEY ("ID")
  USING INDEX "E3T5"."PK_KONTINENTE"  ENABLE;
--------------------------------------------------------
--  Constraints for Table LANGILE
--------------------------------------------------------

  ALTER TABLE "E3T5"."LANGILE" MODIFY ("IZENA" NOT NULL ENABLE);
  ALTER TABLE "E3T5"."LANGILE" MODIFY ("ABIZENA" NOT NULL ENABLE);
  ALTER TABLE "E3T5"."LANGILE" MODIFY ("EMAILA" NOT NULL ENABLE);
  ALTER TABLE "E3T5"."LANGILE" MODIFY ("KONTRATAZIO_DATA" NOT NULL ENABLE);
  ALTER TABLE "E3T5"."LANGILE" ADD CONSTRAINT "PK_LANGILE" PRIMARY KEY ("ID")
  USING INDEX "E3T5"."PK_LANGILE"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PRODUKTU
--------------------------------------------------------

  ALTER TABLE "E3T5"."PRODUKTU" MODIFY ("IZENA" NOT NULL ENABLE);
  ALTER TABLE "E3T5"."PRODUKTU" MODIFY ("BALIOA" NOT NULL ENABLE);
  ALTER TABLE "E3T5"."PRODUKTU" MODIFY ("SALNEURRIA" NOT NULL ENABLE);
  ALTER TABLE "E3T5"."PRODUKTU" MODIFY ("ID_KATEGORIA" NOT NULL ENABLE);
  ALTER TABLE "E3T5"."PRODUKTU" ADD CONSTRAINT "CK_BALIOA" CHECK (BALIOA BETWEEN 10 AND 10000) ENABLE;
  ALTER TABLE "E3T5"."PRODUKTU" ADD CONSTRAINT "PK_PRODUKTU" PRIMARY KEY ("ID")
  USING INDEX "E3T5"."PK_PRODUKTU"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BILTEGI
--------------------------------------------------------

  ALTER TABLE "E3T5"."BILTEGI" ADD CONSTRAINT "FK_KOKALEKU_ID" FOREIGN KEY ("ID_KOKALEKU")
	  REFERENCES "E3T5"."KOKALEKU" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BULEGARI
--------------------------------------------------------

  ALTER TABLE "E3T5"."BULEGARI" ADD CONSTRAINT "FK_LANGILE_ID_2" FOREIGN KEY ("ID")
	  REFERENCES "E3T5"."LANGILE" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ESKARI
--------------------------------------------------------

  ALTER TABLE "E3T5"."ESKARI" ADD CONSTRAINT "FK_SALTZAILE_ID_ESKARI" FOREIGN KEY ("ID_SALTZAILE")
	  REFERENCES "E3T5"."LANGILE" ("ID") ENABLE;
  ALTER TABLE "E3T5"."ESKARI" ADD CONSTRAINT "FK_BEZERO_ID_ESKARI" FOREIGN KEY ("ID_BEZERO")
	  REFERENCES "E3T5"."BEZERO" ("ID") ENABLE;
  ALTER TABLE "E3T5"."ESKARI" ADD CONSTRAINT "FK_EGOERA_ID_ESKARI" FOREIGN KEY ("ID_EGOERA")
	  REFERENCES "E3T5"."ESKARI_EGOERA" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ESKARI_LERRO
--------------------------------------------------------

  ALTER TABLE "E3T5"."ESKARI_LERRO" ADD CONSTRAINT "FK_ESKARI_ID" FOREIGN KEY ("ID_ESKARI")
	  REFERENCES "E3T5"."ESKARI" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "E3T5"."ESKARI_LERRO" ADD CONSTRAINT "FK_PRODUKTU_ID" FOREIGN KEY ("ID_PRODUKTU")
	  REFERENCES "E3T5"."PRODUKTU" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ESKARI_LERRO_HORNITZAILE
--------------------------------------------------------

  ALTER TABLE "E3T5"."ESKARI_LERRO_HORNITZAILE" ADD CONSTRAINT "FK_ESK_HORN" FOREIGN KEY ("ID_ESKARI")
	  REFERENCES "E3T5"."ESKARI_HORNITZAILE" ("ID") ENABLE;
  ALTER TABLE "E3T5"."ESKARI_LERRO_HORNITZAILE" ADD CONSTRAINT "FK_PROD" FOREIGN KEY ("ID_PRODUKTU")
	  REFERENCES "E3T5"."PRODUKTU" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table HERRIALDE
--------------------------------------------------------

  ALTER TABLE "E3T5"."HERRIALDE" ADD CONSTRAINT "FK_KONTINENTE_ID" FOREIGN KEY ("ID_KONTINENTE")
	  REFERENCES "E3T5"."KONTINENTE" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table INBENTARIO
--------------------------------------------------------

  ALTER TABLE "E3T5"."INBENTARIO" ADD CONSTRAINT "FK_PRODUKTU_ID_INBENTARIO" FOREIGN KEY ("ID_PRODUKTU")
	  REFERENCES "E3T5"."PRODUKTU" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "E3T5"."INBENTARIO" ADD CONSTRAINT "FK_BILTEGI_ID_INBENTARIO" FOREIGN KEY ("ID_BILTEGI")
	  REFERENCES "E3T5"."BILTEGI" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table KOKALEKU
--------------------------------------------------------

  ALTER TABLE "E3T5"."KOKALEKU" ADD CONSTRAINT "FK_HERRIALDE_ID" FOREIGN KEY ("ID_HERRIALDE")
	  REFERENCES "E3T5"."HERRIALDE" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table LANGILE
--------------------------------------------------------

  ALTER TABLE "E3T5"."LANGILE" ADD CONSTRAINT "FK_NAGUSI_ID" FOREIGN KEY ("ID_NAGUSI")
	  REFERENCES "E3T5"."LANGILE" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRODUKTU
--------------------------------------------------------

  ALTER TABLE "E3T5"."PRODUKTU" ADD CONSTRAINT "FK_KATEGORIA_ID" FOREIGN KEY ("ID_KATEGORIA")
	  REFERENCES "E3T5"."KATEGORIA" ("ID") ENABLE;
