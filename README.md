# 🎮 GameStop Kudeaketa Sistema

**🏷️ Deskribapena:**
Aplikazio hau GameStop dendarentzat garatutako **saltzaile eta bezeroen kudeaketa sistema** da. Erabiltzaileek saioa hasi dezakete bere kredentzialekin eta baimen mailaren arabera, hainbat funtzionalitate erabili.

---

## ✨ Ezaugarriak

### 🔐 Saio-hasiera
- Erabiltzaile motaren arabera baimenak
- Pasahitz enkriptatua
- Saiakera kopuru mugatua (3 saiakera)

### 👨‍💼 Saltzaileen Interfazea
- Erabiltzaileak kudeatu (gehitu, ezabatu, editatu, kontsultatu)
- Produktuak kudeatu
- Eskariak ikusi
- Informeak sortu

### 👤 Bezeroen Interfazea
- Produktuak ikusi
- Nire eskaerak kontsultatu
- Kontuko datuak eguneratu

---

## 🛠️ Instalazioa

1. **Datu-basea konfiguratu** OracleDB erabiliz:
   - Exekutatu "e3t5schema.sql" erabiltzailea eta taulak sortzeko.
   - Logeatu E3T5 erabiltzailearekin eta ikasle123 pasahitzarekin.
   - Behin logeatuta, exekutatu "e3t5schema2.sql".

2. **Aplikazioa abiarazi**: exekutatu GameStopApp.exe fitxategia

---

## 📁 Fitxategi-egitura

```
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
│   │   ├── database.properties
│   │   ├── e3t5schema.sql
│   │   └── e3t5schema2.sql
│   └── images/
├── lib/
├── .project
├── .classpath
└── README.md
```

---

## 💡 Erabilera

1. **Saioa hasi** erabiltzaile eta pasahitzarekin
2. **Aukeratu ekintza** menuan:
   - Bezeroa bazara: produktuak ikusi, eskaerak kontsultatu...
   - Saltzailea bazara: erabiltzaileak/produktuak kudeatu...

---

## 🛑 Oharrak

- ❗ **Ez ahaztu** e3t5schema.sql eta e3t5schema2.sql exekutatzea datu-basea sortzeko
- 🔄 **Aplikazioa eguneratzeko**: git pull && mvn clean install

---

## 📜 Lizentzia
Programak ez dauka lizentziarik

---

🎯 **Helburua**: Dendako operazioak erraztu eta kudeaketa modernizatzea!

<p align="center"> <img src="resources/images/GameStop.png" width="100" alt="GameStop Logo"> </p>

✨ **Eskerrik asko** proiektua bisitatzeagatik! Laguntza behar baduzu, bidali mezu bat [glopezm22](mailto:glopezm22@fpsanturtzilh.eus) helbidera.