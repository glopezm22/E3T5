# 🎮 GameStop Kudeaketa Sistema

**🏷️ Deskribapena:**
Aplikazio hau GameStop dendarentzat garatutako saltzaile eta bezeroen kudeaketa sistema da. Erabiltzaileek saioa hasi dezakete bere kredentzialekin eta baimen mailaren arabera, hainbat funtzionalitate erabili.

---

## ✨ Ezaugarriak

### 🔐 Saio-hasiera
- Erabiltzaile motaren arabera baimenak (S saltzailea, B bezeroa)
- Pasahitz enkriptatua
- Saiakera kopuru mugatua (3 saiakera)

### 👨‍💼 Saltzaileen Interfazea
- Erabiltzaileak kudeatu (gehitu, ezabatu, editatu)
- Produktuak kudeatu
- Eskariak ikusi

### 👤 Bezeroen Interfazea
- Produktuak ikusi
- Nire eskaerak kontsultatu
- Kontuko datuak eguneratu

---

## 🛠️ Instalazioa

1. Datu-basea konfiguratu OracleDB erabiliz:
   ALTER SESSION SET CONTAINER = XEPDB1;
   CREATE USER erabiltzailea IDENTIFIED BY pasahitza; -- erabiltzailea eta pasahitza database.properties fitxategian bat etorri behar dira.
   GRANT ALL PRIVILEGES TO erabiltzailea;
   -- Exekutatu 'schema.sql' fitxategia taulak sortzeko behin conexioa ezarri dugunean erabiltzaile horrekin.

2. Aplikazioa abiarazi:
   git clone https://github.com/glopezm22/E3T5.git
   cd E3T5
   mvn clean install
   java -jar target/E3T5.jar

---

## 📁 Fitxategi-egitura

E3T5/
├── src/
│   └── com/gamestop/
│       ├── app/
│       │   ├── auth/
│       │   │   └── Login.java
│       │   ├── main/ 
│       │   │   ├── MenuSaltzaile.java
│       │   │   └── MenuBezero.java
│       │   └── panels/
│       │       ├── ErabiltzaileakPanels.java
│       │       ├── EskariakPanels.java
│       │       ├── KontuaPanels.java
│       │       └── ProduktuakPanels.java
│       ├── db/
│       │   ├── DatabaseManager.java
│       │   ├── DBErabiltzaile.java
│       │   └── DBProduktu.java
│       └── model/
│           ├── location/
│           │   ├── Herrialde.java
│           │   ├── Kokaleku.java
│           │   └── Kontinente.java
│           ├── order/
│           │   ├── Eskari.java
│           │   ├── Eskari_egoera.java
│           │   └── Eskari_lerro.java
│           ├── product/
│           │   ├── Biltegi.java
│           │   ├── Inbentario.java
│           │   ├── Kategoria.java
│           │   └── Produktu.java
│           └── user/
│               ├── Bezero.java
│               ├── Erabiltzaile.java
│               └── Langile.java
├── resources/
│   ├── config/
│   │   └── database.properties
│   └── images/
├── lib/
└── README.md

---

## 💡 Erabilera

1. Saioa hasi erabiltzaile eta pasahitzarekin
2. Aukeratu ekintza menuan:
   - Bezeroa bazaude: produktuak ikusi, eskaerak kontsultatu
   - Saltzailea bazaude: erabiltzaileak/produktuak kudeatu

---

## 🛑 Oharrak

- ❗ Ez ahaztu schema.sql exekutatu datu-basea sortzeko
- 🔄 Aplikazioa eguneratzeko: git pull && mvn clean install

---

## 📜 Lizentzia
MIT Lizentzia

---

🎯 Helburua: Dendako operazioak erraztu eta kudeaketa modernizatzea!

<p align="center"> <img src="resources/images/GameStopIcon.png" width="100" alt="GameStop Logo"> </p>

✨ Eskerrik asko proiektua bisitatzeagatik! Laguntza behar baduzu, ireki issue bat.