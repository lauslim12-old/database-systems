/* Create Database */
DROP DATABASE Dealership;
CREATE DATABASE Dealership;
USE Dealership;

/* Making Tables */
CREATE TABLE Pembeli (
	ID_Customer VARCHAR(255) NOT NULL,
	NamaDepan CHAR(255) NOT NULL,
	NamaBelakang CHAR(255),
	BirthDate DATE,
	Alamat VARCHAR(255),
	ZipCode INT(255),
	Kota CHAR(255),
	Pekerjaan VARCHAR(255),
	PRIMARY KEY (ID_Customer)
);

CREATE TABLE PhonePembeli (
	ID_Customer VARCHAR(255),
	NoTelp VARCHAR(255),
	PRIMARY KEY (NoTelp),
	FOREIGN KEY (ID_Customer) REFERENCES Pembeli(ID_Customer)
	ON DELETE CASCADE
);

CREATE TABLE Job (
	JobID VARCHAR(255) NOT NULL,
	JobDesc VARCHAR(255),
	Salary INT,
	PRIMARY KEY (JobID)
);

CREATE TABLE Bengkel (
	ID_Bengkel VARCHAR(255),
	Jasa VARCHAR(255),
	HargaJasa VARCHAR(255),
	PRIMARY KEY (ID_Bengkel)
);

CREATE TABLE Sparepart (
	ID_Sparepart VARCHAR(255) NOT NULL,
	Harga VARCHAR(255),
	MerekSP VARCHAR(255),
	DescSP VARCHAR(255),
	Qty INT,
	ID_Bengkel VARCHAR(255),
	PRIMARY KEY (ID_Sparepart),
	FOREIGN KEY (ID_Bengkel) REFERENCES Bengkel(ID_Bengkel)
);

CREATE TABLE Mobil (
	SerialNumber VARCHAR(255) NOT NULL,
	Merek VARCHAR(255),
	NamaMobil VARCHAR(255),
	Model CHAR(255),
	TahunPembuatan INT,
	HargaJual BIGINT,
	Qty INT,
	PRIMARY KEY (SerialNumber)
);

CREATE TABLE WarnaMobil (
	SerialNumber VARCHAR(255) NOT NULL,
	WarnaMobil VARCHAR(255),
	PRIMARY KEY (SerialNumber, WarnaMobil),
	FOREIGN KEY (SerialNumber) REFERENCES Mobil(SerialNumber)
	ON DELETE CASCADE
);

CREATE TABLE Modifikasi (
	SerialNumber VARCHAR(255),
	TipeModif VARCHAR(255),
	HargaModif BIGINT,
	DescModif VARCHAR(255),
	PRIMARY KEY (SerialNumber, DescModif),
	FOREIGN KEY (SerialNumber) REFERENCES Mobil(SerialNumber)
	ON DELETE CASCADE
);

CREATE TABLE Perusahaan (
	ID_Perusahaan VARCHAR(255) NOT NULL,
	NamaPerusahaan VARCHAR(255),
	Kota CHAR(255), 
	Alamat CHAR(255),
	ZipCode INT,
	NoTelp VARCHAR(255),
	Email VARCHAR(255),
	ID_Pusat VARCHAR(255),
	ID_Bengkel VARCHAR(255),
	PRIMARY KEY (ID_Perusahaan),
	FOREIGN KEY (ID_Pusat) REFERENCES Perusahaan(ID_Perusahaan),
	FOREIGN KEY (ID_Bengkel) REFERENCES Bengkel(ID_Bengkel)
);

CREATE TABLE PenyediaanMobil (
	ID_Perusahaan VARCHAR(255),
	SerialNumber VARCHAR(255),
	ProsesDate DATE,
	TotalHarga VARCHAR(255),
	PRIMARY KEY (ID_Perusahaan, SerialNumber),
	FOREIGN KEY (ID_Perusahaan) REFERENCES Perusahaan(ID_Perusahaan),
	FOREIGN KEY (SerialNumber) REFERENCES Mobil(SerialNumber)
);

CREATE TABLE Karyawan (
	ID_Karyawan VARCHAR(255) NOT NULL,
	NamaDepan CHAR(255),
	NamaBelakang CHAR(255),
	Email VARCHAR(255),
	Kota CHAR(255),
	ZipCode CHAR(255),
	Alamat VARCHAR(255),
	JobID VARCHAR(255),
	ID_Manager VARCHAR(255),
	ID_Perusahaan VARCHAR(255),
	PRIMARY KEY (ID_Karyawan),
	FOREIGN KEY (JobID) REFERENCES Job(JobID),
	FOREIGN KEY (ID_Manager) REFERENCES Karyawan(ID_Karyawan),
	FOREIGN KEY (ID_Perusahaan) REFERENCES Perusahaan(ID_Perusahaan)
);

CREATE TABLE OrderMobil (
	ID_Customer VARCHAR(255),
	ID_Karyawan VARCHAR(255),
	OrderDate DATE,
	DownPayment VARCHAR(255),
	SerialNumber VARCHAR(255), 
	PRIMARY KEY (ID_Customer, ID_Karyawan, SerialNumber),
	FOREIGN KEY (ID_Customer) REFERENCES Pembeli(ID_Customer),
	FOREIGN KEY (ID_Karyawan) REFERENCES Karyawan(ID_Karyawan),
	FOREIGN KEY (SerialNumber) REFERENCES Mobil(SerialNumber)
);
		
CREATE TABLE PhoneKaryawan (
	ID_Karyawan VARCHAR(255),
	NoTelp VARCHAR(255),
	PRIMARY KEY (ID_Karyawan, NoTelp),
	FOREIGN KEY (ID_Karyawan) REFERENCES Karyawan(ID_Karyawan)
	ON DELETE CASCADE
);

CREATE TABLE Keluarga (
	ID_Karyawan VARCHAR(255),
	Nama CHAR(255),
	TipeAsuransi VARCHAR(255),
	BirthDate DATE,
	Gender CHAR(255),
	PRIMARY KEY (ID_Karyawan, Nama),
	FOREIGN KEY (ID_Karyawan) REFERENCES Karyawan(ID_Karyawan)
	ON DELETE CASCADE
);

/* Populating Tables */
INSERT INTO Pembeli VALUES
('C0001', 'Gery', 'Santoso', '2000-09-03', 'Taman Alfa Indah', '12220', 'Jakarta Barat', 'Anak Motor'),
('C0002', 'Sebastian', 'Duto', '2000-06-04', 'Pondok Indah', '14440', 'Jakarta Selatan', 'CEO'),
('C0003', 'Irvan', 'Kurniawan', '2000-01-10', 'Kuta Bumi', '15550', 'Tangerang', 'Karyawan'),
('C0004', 'Rahoel', 'Andrianz', '2000-05-10', 'Regency', '15552', 'Tangerang', 'CTO'),
('C0005', 'Ahmad', 'Maulana', '1988-05-20', 'Regency', '16600', 'Tangerang', 'Manager'),
('C0006', 'Ilham', 'Lesmana', '1994-08-12', 'Duren Sawit', '16600', 'Jakarta Timur', 'Customer Service'),
('C0007', 'Hamzah', 'Nursyam', '1996-03-30', 'Cokokol', '36601', 'Tangerang', 'Mobile Developer'),
('C0008', 'Nuraini', 'Hamidah', '1998-07-17', 'Pluit', '36602', 'Jakarta Utara', 'Web Developer'),
('C0009', 'Puja', 'Nurdianti', '1997-09-12', 'Gandaria', '16603', 'Jakarta Selatan', 'Cloud Computing'),
('C0010', 'Robi', 'Mulyadi', '1997-11-18', 'Kemang', '16605', 'Bekasi Timur', 'Database Administrator'),
('C0011', 'Aga', 'Prasetyo', '1993-10-23', 'Grogol', '16605', 'Jakarta Barat', 'Software Enginner'),
('C0012', 'Hilman', 'Nugraha', '1995-09-29', 'Kemang', '47771', 'Jakarta Selatan', 'Desktop Developer'),
('C0013', 'Asep', 'Yahoman', '1995-04-12', 'Kali Deres', '17772', 'Jakarta Barat', 'Data Scientist'),
('C0014', 'Dendi', 'Nugraha', '1987-05-04', 'Braga', '47773', 'Bandung', 'Data Engineer'),
('C0015', 'Fahmi', 'Kusnadi', '1999-03-08', 'Cibadak', '17774', 'Bandung', 'IT Support'),
('C0016', 'Indri', 'Anjaniyanti', '1997-03-16', 'Cibaduyut', '17775', 'Bandung', 'Game Developer'),
('C0017', 'Andrian', 'Raul', '2001-07-15', 'Ciparay', '18880', 'Bandung', 'Game Designer'),
('C0018', 'Firdaus', 'Ahmad', '2000-05-14', 'Cimahi', '68881', 'Bandung', 'Security Engineer'),
('C0019', 'Azriel', 'Susanto', '1992-01-13', 'Soreang', '68882', 'Bandung', 'System Analyst'),
('C0020', 'Michael', 'Oswin', '1995-12-12', 'Sadu', '18883', 'Bandung', 'UI/UX Designer'),
('C0021', 'Anna', 'Jeanne', '1996-10-04', 'Dago', '18884', 'Bandung', 'Hadware Enginner'),
('C0022', 'Raymond', '', '1998-03-08', 'Ciputat', '18885', 'Tangerang Selatan', 'Network Enginner'),
('C0023', 'Theodore', 'Mulia', '1998-02-25', 'Gading Serpong', '38886', 'Tangerang', 'System Support'),
('C0024', 'Niki', 'Emersan', '2000-06-29', 'Kebayoran Baru', '28887', 'Jakarta Selatan', 'Software Enginner'),
('C0025', 'Christine', 'Nurdianti', '1994-08-27', 'Pulo Gadung', '19990', 'Jakarta Timur', 'Mobile Developer'),
('C0026', 'Hermawan', 'Agung', '1994-09-24', 'Sepatan', '19991', 'Tangerang', 'Mobile Developer'),
('C0027', 'Samuel', 'Sandoro', '1994-03-23', 'Cakung', '59992', 'Jakarta Timur', 'Data Scientist'),
('C0028', 'Anthony', 'Kevin', '1990-09-13', 'Gajah Mada', '59993', 'Jakarta Pusat', 'IT Support'),
('C0029', 'Akino', '', '1997-12-18', 'Radio Dalam', '19994', 'Jakarta Selatan', 'Database Administrator'),
('C0030', 'Rizal', 'Alcander', '1997-10-16', 'Alam Sutera', '19995', 'Tangerang Selatan', 'UI/UX Designer'),
('C0031', 'Ivy', 'Macria', '1982-09-15', 'Joglo', '19996', 'Jakarta Barat', 'Web Designer'),
('C0032', 'Fahrur', 'Rozi', '1985-04-25', 'Karawaci', '99997', 'Tangerang Kota', 'Game Designer'),
('C0033', 'Dimas', 'Aditya', '1997-03-17', 'Cisauk', '79998', 'Tangerang', 'Customer Service'),
('C0034', 'Alfan', 'Putra', '1993-02-14', 'Braga', '15551', 'Bandung', 'Security Enginner'),
('C0035', 'Arie', 'Trian', '1990-02-08', 'Soreang', '65552', 'Bandung', 'Desktop Developer'),
('C0036', 'Kevin', 'Kurniawan', '1989-11-21', 'Cimahi', '15553', 'Bandung', 'Mobile Developer'),
('C0037', 'Boy', 'Chandra', '1978-11-20', 'Sepatan', '15554', 'Tangerang', 'Android Developer'),
('C0038', 'William', '', '1977-09-25', 'Kuta Bumi', '45556', 'Tangerang Kota', 'IOS Developer'),
('C0039', 'Alfian', 'Muhammad', '1990-07-30', 'Joglo', '15555', 'Jakarta Barat', 'Web Designer'),
('C0040', 'Andreas', 'Ardi', '1980-05-25', 'Regency', '41110', 'Tangerang Selatan', 'Network Enginner'),
('C0041', 'Ary', 'Asyari', '1982-04-24', 'Gajah Mada', '11111', 'Jakarta Pusat', 'IT Support'),
('C0042', 'Muhammad', 'Nurhadi', '2002-07-07', 'Tomang', '71112', 'Tangerang', 'Mobile Developer'),
('C0043', 'Surya', 'Wiguna', '1975-09-09', 'Pluit', '81113', 'Jakarta Utara', 'Data Enginner'),
('C0044', 'Yusuf', 'Purnama', '1978-02-03', 'Kemang', '11114', 'Bekasi Timur', 'Cloud Computing'),
('C0045', 'Galih', 'Pratama', '1974-11-30', 'Grogol', '21115', 'Jakarta Barat', 'Game Developer'),
('C0046', 'Rere', 'Octaviana', '1996-10-23', 'Alam Sutera', '31116', 'Tangerang Selatan', 'UI/UX Designer'),
('C0047', 'Adela', 'Safitri', '1992-07-26', 'Radio Dalam', '11117', 'Jakarta Selatan', 'System Analyst'),
('C0048', 'Feronika', 'Wulandari', '2000-03-23', 'Cakung', '20003', 'Jakarta Timur', 'Database Administrator'),
('C0049', 'Adhiresti', 'Prima', '2001-02-27', 'Gading Serpong', '20005', 'Tangerang', 'System Support'),
('C0050', 'Satria', 'Hero', '1995-12-01', 'Cimahi', '20006', 'Bandung', 'Mobile Developer');

INSERT INTO PhonePembeli VALUES
('C0001', '082174383697'),
('C0002', '088234870994'),
('C0003', '088945844392'),
('C0004', '021783457991'),
('C0005', '054894235789'),
('C0006', '099834874832'),
('C0007', '039712403978'),
('C0008', '075904307234'),
('C0009', '087894378923'),
('C0010', '074114239782'),
('C0011', '097834034129'),
('C0012', '008934272304'),
('C0013', '028743703032'),
('C0014', '066234923423'),
('C0015', '082328938378'),
('C0016', '037658324021'),
('C0017', '012390876511'),
('C0018', '054784723841'),
('C0019', '033387923540'),
('C0020', '023458623443'),
('C0021', '091254294637'),
('C0022', '077218583948'),
('C0023', '022774832839'),
('C0024', '012483247823'),
('C0025', '098765434567'),
('C0026', '023456764345'),
('C0027', '043763763248'),
('C0028', '028194871234'),
('C0029', '001818181823'),
('C0030', '023489234784'),
('C0031', '034786634272'),
('C0032', '072184373481'),
('C0033', '070450978127'),
('C0034', '038383827211'),
('C0035', '088837317123'),
('C0036', '097802783921'),
('C0037', '098122352435'),
('C0038', '024879789213'),
('C0039', '033499877423'),
('C0040', '009213498763'),
('C0041', '009078659831'),
('C0042', '023478234732'),
('C0043', '081389134891'),
('C0044', '047318647234'),
('C0045', '085745872349'),
('C0046', '013873412781'),
('C0047', '034423643626'),
('C0048', '022347862347'),
('C0049', '058738942372'),
('C0050', '056948950983'),
('C0001', '012345812432'),
('C0002', '081379583492'),
('C0003', '008934732927'),
('C0004', '038427834436'),
('C0007', '023498723875'),
('C0008', '023573478175'),
('C0011', '033085934553'),
('C0014', '023244681443'),
('C0016', '012648792312'),
('C0019', '028962481123'),
('C0020', '018411238123'),
('C0022', '065792087948'),
('C0023', '003243896421'),
('C0024', '088829123892'),
('C0027', '012881881230'),
('C0029', '089439832434'),
('C0031', '123789823825'),
('C0033', '087884872348'),
('C0035', '013484992225'),
('C0036', '019982919132'),
('C0037', '071238928319'),
('C0039', '082382932302'),
('C0044', '098394931733'),
('C0047', '091239932481'),
('C0048', '031298923489'),
('C0050', '008349989123'),
('C0001', '012345992432'),
('C0002', '081379923492'),
('C0003', '008234932927'),
('C0004', '038477934436'),
('C0007', '023418923875'),
('C0008', '023873978175'),
('C0011', '033485034553'),
('C0014', '023144981443'),
('C0016', '012348992312'),
('C0019', '028932981123'),
('C0020', '018481938123'),
('C0022', '065789987948'),
('C0023', '003247996421'),
('C0024', '088829923892'),
('C0027', '012881981230'),
('C0029', '089439932434'),
('C0031', '123789923825'),
('C0033', '087884972348'),
('C0035', '013484192225'),
('C0036', '019982119132'),
('C0037', '071238128319'),
('C0039', '082382132302'),
('C0044', '098394131733'),
('C0047', '091239992481'),
('C0048', '031298493489'),
('C0050', '008349399123');

INSERT INTO Job VALUES
('J0001', 'Boss / Pemilik', '50000000'),
('J0002', 'Manager', '7500000'),
('J0003', 'Sales', '4000000'),
('J0004', 'Mekanik', '4500000'),
('J0005', 'Resepsionis', '3500000'),
('J0006', 'Intern', '1000000'),
('J0007', 'Stackholder', '50000000'),
('J0008', 'Office Boy', '1500000'),
('J0009', 'Operasional', '2500000'),
('J0010', 'Security', '2000000');

INSERT INTO Bengkel VALUES
('B0001', 'Bengkel Rem', '500000'),
('B0002', 'Bengkel Ban', '1000000'),
('B0003', 'Bengkel Exhaust', '750000'),
('B0004', 'Bengkel Spoiler', '1500000'),
('B0005', 'Bengkel Mesin', '3500000'),
('B0006', 'Bengkel Knalpot', '550000'),
('B0007', 'Bengkel Velg', '5500000'),
('B0008', 'Bengkel Modifikasi', '7500000'),
('B0009', 'Bengkel Body Mobil', '10000000'),
('B0010', 'Car Wash', '250000');

INSERT INTO Sparepart VALUES
('S0001', '250000', 'Brembo', 'Kaliper Rem', '50', 'B0001'),
('S0002', '350000', 'K-Sports', 'Kaliper Rem', '25', 'B0001'),
('S0003', '250000', 'Michelin', 'R-17 Sport', '5', 'B0002'),
('S0004', '100000', 'Perawatan', 'Spooring', '1', 'B0002'),
('S0005', '125000', 'Perawatan', 'Balancing', '1', 'B0002'),
('S0006', '400000', 'HKS', 'Knalpot Racing', '5', 'B0003'),
('S0007', '777000', 'Fujitsubo', 'Knalpot S Racing', '2', 'B0003'),
('S0008', '2639000', 'Cadillac', 'Spoiler Wing', '2', 'B0004'),
('S0009', '2205000', 'BMW', 'Car Tail', '4', 'B0004'),
('S0010', '13000000', 'Cadillac', 'Twin Turbo V8', '2', 'B0005'),
('S0011', '16000000', 'Toyota', 'V8 Toyota', '2', 'B0005'),
('S0012', '660000', 'Shell', 'Helix Ultra', '10', 'B0006'),
('S0013', '220000', 'Fastron', '10W-40', '10', 'B0006'),
('S0014', '5800000', 'BSS', 'Vleg BSS R-17', '10', 'B0007'),
('S0015', '3700000', 'Volkray', 'Vleg 3Volk Ray ce28 R-15', '5', 'B0007'),
('S0016', '840000', 'J-Fit', 'Suspensi Macpherson', '5', 'B0008'),
('S0017', '6500000', 'Unichip', 'Dastek Q+', '10', 'B0008'),
('S0018', '27000000', 'Rocket Bunny', 'Bemper', '5', 'B0009'),
('S0019', '23700000', 'Varis', 'Bemper', '5', 'B0009'),
('S0020', '35000', 'M3', 'Carwash', '1', 'B0010'),
('S0021', '75000', 'Black Beauty', 'Carwash', '1', 'B0010'),
('S0022', '90000', 'Premium', 'Engine Flush', '1', 'B0005'),
('S0023', '1000000', 'Autosculpting', 'Fabrication', '1', 'B0009'),
('S0024', '500000', 'Bridgestone', 'R-21 Racing', '10', 'B0002'),
('S0025', '250000', 'Repaint', 'Solar Red', '1', 'B0008');

INSERT INTO Mobil VALUES
('M0001', 'Ferrari', 'California', 'Supercar', '2012', '5000000000', '1'),
('M0002', 'Lamborghini', 'Murcielago LP640', 'Supercar', '2010', '3500000000', '2'),
('M0003', 'Volvo', 'XC90', 'SUV', '2020', '1300000000', '3'),
('M0004', 'Ferrari', '488', 'Supercar', '2015', '15000000000', '1'),
('M0005', 'Suzuki', 'Baleno Hatchback', 'Hatchback', '2019', '250000000', '5'),
('M0006', 'Mazda', 'Rx-8', 'Sportcar', '2003', '840000000', '5'),
('M0007', 'Dodge', 'Viper', 'Supercar', '1992', '1000000000', '1'),
('M0008', 'Honda', 'New Acura NSX', 'Supercar', '2020', '2500000000', '1'),
('M0009', 'Toyota', 'Trueno GT Apex', 'Hatchback', '1972', '1300000000', '1'),
('M0010', 'Lincoln', 'Continental Mark III', 'Sedan Coupe', '1969', '1000000000', '5'),
('M0011', 'Lexus', 'LFA', 'Sportcar', '2008', '5250000000', '1'),
('M0012', 'Nissan', '370z Fairlady', 'Sportcar', '2011', '925000000', '3'),
('M0013', 'Chevrolet', 'Camaro SS', 'Musclecar', '2009', '994000000', '2'),
('M0014', 'Minicooper', 'S Mark I', 'Citycar', '1963', '318668000', '1'),
('M0015', 'Mustang', 'Ford Mustang Boss 302','Musclecar', '1970', '2000000000', '4'),
('M0016', 'Chevrolete', 'Chevrolet Chevelle SS 454', 'Musclecar', '1970', '750000000', '3'),
('M0017', 'Plymouth', 'Plymouth Hemi Cuda', 'Musclecar', '1971', '18200000000', '1'),
('M0018', 'Dodge', 'Dodge Charger R/T-SE', 'Musclecar', '1969', '1750000000', '2'),
('M0019', 'Honda', 'NXS', 'Coupe', '1990', '2200000000', '3'), 
('M0020', 'Astonmartin', 'DB10', 'Coupe', '2015', '2900000000', '2'),
('M0021', 'Audi', 'R8', 'Supercar', '2019', '2700000000', '2'),
('M0022', 'BMW', 'M4', 'Executivecar', '2014', '2000000000', '5'),
('M0023', 'Bugati', 'Bugatti Veryon EB 16.4', 'Supersport', '2019', '33000000000', '1'),
('M0024', 'Chevrolet', 'Corvette Z06','Sportcar', '2000', '9900000000', '2'),
('M0025', 'Ferrari', '225 S', 'Sportcar', '1952', '5217780000', '1'),
('M0026', 'Pontiac', 'Firebird 400 Coupe', 'Musclecar', '1969', '511000000', '2'),
('M0027', 'Ford', 'GT40', 'Sportcar', '2004', '25200000000', '2'),
('M0028', 'Honda', 'CR-X', 'Sportcar', '1991', '92400000', '5'),
('M0029', 'Honda', 'S2000', 'Sportcar', '2009', '497000000', '3'),
('M0030', 'Mitsubishi', 'Lancer Evo 9', 'Sedan', '2002', '531930000', '2'),
('M0031', 'Nissan', 'Silvia S15', 'Sedan', '1999', '170410850', '4'),
('M0032', 'Nissan', 'GTR R35', 'Supercar', '2007', '1399860000', '3'),
('M0033', 'Jaguar', 'F-type', 'Sportcar', '2013', '3000000000', '2'),
('M0034', 'Koenigsegg', 'CCX', 'Sportcar', '2006', '64700000000', '4'),
('M0035', 'Lotus', 'Exige', 'Sportcar', '2000', '1140000000', '3'),
('M0036', 'McLaren', '12C', 'Sportcar', '2011', '7000000000', '2'),
('M0037', 'Mercedes-Benz', 'CLK', 'Luxurycar', '1997', '514360000', '2'),
('M0038', 'Mercedes-Benz', 'SLR McLaren', 'Supercar', '2003', '20300000000', '3'),
('M0039', 'Morgan', 'Plus4', 'Classiccar', '1969', '1120000000', '2'),
('M0040', 'Pagani', 'Zonda', 'Sportcar', '1997', '19600000000', '3'),
('M0041', 'Porsche', '991', 'Sportcar', '1963', '1582000000', '2'),
('M0042', 'Toyota', '2000GT', 'Sportcar', '1967', '16240000000', '3'),
('M0043', 'Toyota', 'MR-S', 'Sportcar', '1999', '266000000', '4'),
('M0044', 'TVR', 'Tuscan', 'Sportcar', '1967', '697500000', '2'),
('M0045', 'JEEP', 'F-Pace SVR', 'SUV', '2018', '1120000000', '3'),
('M0046', 'LandRover', 'Range Rover Sport', 'SUV', '2005', '3343606000', '4'),
('M0047', 'Maserati', 'Levante', 'SUV', 2017, '1232000000', '3'),
('M0048', 'Rolls-Royce', 'Cullinan', 'SUV', '2018', '4830000000', '2'),
('M0049', 'Subaru', 'Foresta', 'SUV', '2013', '392000000', '4'),
('M0050', 'BMW', 'i8', 'Sportcar', '2017', '2079000000', '5');

INSERT INTO WarnaMobil VALUES
('M0001', 'Fire Red'),
('M0002', 'Lambo Orange'),
('M0003', 'Beige'),
('M0004', 'Fire Red'),
('M0005', 'Metallic Premium Silver'),
('M0006', 'Metallic Black'),
('M0007', 'Baby Blue'),
('M0008', 'Electric Orange'),
('M0009', 'Pearl White'),
('M0010', 'Black'),
('M0011', 'Night Black'),
('M0012', 'Orange'),
('M0013', 'Bumblebee'),
('M0013', 'Pearl Black'),
('M0014', 'Black-White Stripes'),
('M0015', 'Lime Green'),
('M0016', 'Dusk Red'),
('M0017', 'Orange'),
('M0018', 'Solid Green'),
('M0019', 'Pearl White'),
('M0019', 'Glass White'),
('M0019', 'Night Black'),
('M0020', 'Coupe Blue'),
('M0021', 'Le Mans Quattro'),
('M0021', 'Stacked Deck'),
('M0022', 'BMW Blue'),
('M0023', 'Electric Blue'),
('M0024', 'Corvette Yellow'),
('M0024', 'Azure'),
('M0025', 'California Red'),
('M0026', 'Fuchsia'),
('M0027', 'Silver-Black Stripes'),
('M0028', 'Solid Red'),
('M0029', 'S200 Yellow'),
('M0030', 'Bushido Green'),
('M0030', 'Stacked Deck'),
('M0031', 'Electric Green'),
('M0032', 'Dark Black'),
('M0032', 'Solid Blue'),
('M0033', 'Premium Silver'),
('M0034', 'Darkness Returns'),
('M0035', 'Soft Yellow'),
('M0036', 'Metallic Purple'),
('M0037', 'Mercedes Silver'),
('M0038', 'Mercedes Silver'),
('M0039', 'Classic Black'),
('M0040', 'Pagani Silver'),
('M0040', 'Zonda Black'),
('M0041', 'Solid Yellow'),
('M0042', 'Black'),
('M0043', 'Silver'),
('M0044', 'Solid Yellow'),
('M0044', 'Solid Black'),
('M0045', 'Dark Black'),
('M0046', 'Metallic Silver'),
('M0047', 'Metallic Red'),
('M0048', 'Premium Black'),
('M0049', 'Baby Blue'),
('M0050', 'i8 Signature');

INSERT INTO Modifikasi VALUES
('M0001', 'Bodykit', '10000000', 'Sport Bodykit'),
('M0002', 'Exhaust', '2500000', 'Magnaflow Performance Exhaust'),
('M0009', 'Vinyls', '5000000', 'Initial D Paintjob'),
('M0011', 'Interior', '10000000', 'Luxury Seats'),
('M0013', 'Full Modification', '25000000', 'Optimus Prime'),
('M0014', 'Interior', '100000', 'Leather Dashboard'),
('M0019', 'Bodykit', '10000000', 'Sport Bodykit'),
('M0020', 'Glass', '3500000', 'Tempered Film Glass 80%'),
('M0021', 'Exhaust', '15000000', 'Stacked Deck Exhaust'),
('M0021', 'Bodykit', '20000000', 'Stacked Deck Body'),
('M0021', 'Vinyls', '5000000', 'Stacked Deck Vinyls'),
('M0021', 'Interior', '2500000', 'Racing Rollbars'),
('M0021', 'Wheels', '10000000', 'Atomic Wheels'),
('M0021', 'Engine', '50000000', 'Stacked Deck Engine'),
('M0021', 'Doors', '10000000', 'Automatic Theft Detector'),
('M0021', 'Lights', '5000000', 'Stacked Deck Lights'),
('M0023', 'Wheels', '50000000', 'Special Bugatti Wheels'),
('M0023', 'Body', '5000000', 'Parachute'),
('M0023', 'Interior', '5000000', 'Automatic Cosinetta'),
('M0024', 'Wheels', '5000000', 'Michelin'),
('M0025', 'Wheels' ,'5000000', 'Bridgestone'),
('M0026', 'Engine', '10000000', 'Supercharged Hood'),
('M0027', 'Engine', '25000000', 'Stacked Deck Engine (Ford GT Special)'),
('M0027', 'Vinyls', '10000000', 'Stacked Deck Vinyls'),
('M0027', 'Wheels', '10000000', 'GT Radial Sport'),
('M0027', 'Doors', '10000000', 'Automatic Theft Detector'),
('M0027', 'Engine', '5000000', 'Nitrous Oxide (N20)'),
('M0027', 'Lights', '5000000', 'Stacked Deck Lights'),
('M0030', 'Engine', '10000000', 'Drift Engines'),
('M0030', 'Wheels', '5000000', 'Drift Wheels'),
('M0031', 'Wheels', '5000000', 'Drift Wheels'),
('M0031', 'Engine', '5000000', 'Nitrous Oxide (N20)'),
('M0031', 'Engine', '15000000', 'Magnaflow Performance Drift'),
('M0031', 'Vinyls', '10000000', 'Drift Vinyls'),
('M0032', 'Engine', '15000000', 'Supercharged'),
('M0050', 'Battery', '25000000', 'Rechargeable Battery'),
('M0050', 'Engine', '5000000', 'Nitrous Oxide Electric'),
('M0050', 'Engine', '5000000', 'Engine Overhaul');

INSERT INTO Perusahaan VALUES
('P0001', 'Prestige Image Motorsports', 'Jakarta Selatan', 'Lebak Bulus', '12440', '0217655423', 'prestige@imports.com', NULL, 'B0001'),
('P0002', 'PT. Astra Auto 2000', 'Jakarta Pusat', 'Menteng', '15550', '0216452319', 'astra@imports.com', 'P0001', 'B0002'),
('P0003', 'PT. Xpander', 'Tangerang', 'Gading Serpong', '14440', '0214563219', 'xpander@imports.com', 'P0001', 'B0004'),
('P0004', 'PT. Toyota', 'Jawa Barat', 'Bandung', '14045', '0217713219', 'toyota@imports.com', 'P0001', 'B0003'),
('P0005', 'PT. BMW Corporad', 'Jakarta Selatan', 'Cilandak', '15440', '0214565519', 'bmwcorpo@imports.com', 'P0001', 'B0005'),
('P0006', 'PT. Oplet Company', 'Jakarta Barat', 'Joglo', '12260', '0215850623', 'oplet@imports.com', 'P0001', 'B0009'),
('P0007', 'PT. Mobil Tua Asik', 'Bali', 'Denpasar', '17941', '0214390211', 'tuakuasik@imports.com', 'P0001', 'B0007'),
('P0008', 'PT. Mobil Anak Lippo', 'Tangerang', 'Lippo Karawaci', '16660', '0216663444', 'lippomurah@imports.com', 'P0001', 'B0010'),
('P0009', 'PT. Candi Mobil Bersaudara', 'Yogyakarta', 'Sleman', '17111', '0211566289', 'candiku1@imports.com', 'P0001', 'B0006'),
('P0010', 'PT. Otomotif Pasti Jaya', 'Jakarta Pusat', 'Sudirman', '13330', '0213333219', 'otojaya@imports.com', 'P0001', 'B0008');

INSERT INTO Karyawan VALUES
('K0001', 'Nicholas', 'Dwiarto Wirasbawa', 'nicholasdwiarto@prestige.com', 'Jakarta Selatan', '12440', 'Jl. Lebak Bulus', 'J0001', NULL, 'P0001'),
('K0002', 'Fadla', 'Ichsan', 'fadlaichsan@prestige.com', 'Tangerang', '12240', 'BSD Cisauk', 'J0002', NULL, 'P0001'),
('K0003', 'Sinzie', 'Winata', 'sinzie@prestige.com', 'Tangerang Kota', '13550', 'Karawaci', 'J0007', NULL, 'P0001'),
('K0004', 'Raul', 'Andrian', 'andrian.raul@prestige.com', 'Tangerang Kota', '13450', 'Kutabumi', 'J0007', NULL, 'P0001'),
('K0005', 'Gery', 'Santoso', 'youghysakhae@prestige.com', 'Jakarta Barat', '12240', 'Joglo', 'J0007', NULL, 'P0001'),
('K0006', 'Juan', 'Akmal', 'juan.akmal@gmail.com', 'Tangerang Selatan', '11240', 'Alam Sutera', 'J0002', NULL, 'P0002'),
('K0007', 'Andi', NULL, 'andi12@yahoo.com', 'Jakarta Selatan', '10510', 'Radio Dalam', 'J0009', 'K0006', 'P0002'),
('K0008', 'Anastasia', 'Ranisa', 'ranitasia@hotmail.com', 'Jakarta Pusat', '12420', 'Gajah Mada', 'J0005', 'K0006', 'P0002'),
('K0009', 'Gusti', 'Arya', 'gusti.arya@yahoo.com', 'Jakarta Timur', '11650', 'Cakung', 'J0010', 'K0006', 'P0002'),
('K0010', 'Rido', 'Hendrawan', 'rido.hendra@gmail.com', 'Tangerang Selatan', '11240', 'Alam Sutera', 'J0003', 'K0006', 'P0002'),
('K0011', 'Deka', 'Primatio', 'deka.primatio@gmail.com', 'Tangerang', '12520', 'Sepatan', 'J0002', NULL, 'P0003'),
('K0012', 'Ananda', 'Fatu', 'ananda14@yahoo.com', 'Jakarta Timur', '14230', 'Pulo Gadung', 'J0003', 'K0011', 'P0003'),
('K0013', 'Fahris', NULL, 'fahrisss@yahoo.com', 'Jakarta Selatan', '14620', 'Kebayoran Baru', 'J0003', 'K0011', 'P0003'),
('K0014', 'Dzulfiqar', NULL, 'dzul77@hotmail.com', 'Tangerang', '14310', 'Gading Serpong', 'J0006', 'K0011', 'P0003'),
('K0015', 'Faisal', 'Farhan', 'faisal.farhan@gmail.com', 'Tangerang Selatan', '14320', 'Ciputat', 'J0010', 'K0011', 'P0003'),
('K0016', 'Attar', 'Pratiwa', 'attar.pratiwa@yahoo.com', 'Bandung', '40266', 'Dago', 'J0002', NULL, 'P0004'),
('K0017', 'Dinda', 'Ayu', 'dinda.ayay@gmail.com', 'Bandung', '40267', 'Cidadap', 'J0005', 'K0016', 'P0004'),
('K0018', 'Tianimanuel', NULL, 'tian69@gmail.com', 'Bandung', '40867', 'Cibaduyut', 'J0003', 'K0016', 'P0004'),
('K0019', 'Mutiara', 'Dewi', 'mutiara.dewi@hotmail.com', 'Bandung', '40286', 'Cibadak', 'J0003', 'K0016', 'P0004'),
('K0020', 'Hananto', NULL, 'hanantooo@gmail.com', 'Bandung', '40257', 'Braga', 'J0010', 'K0016', 'P0004'),
('K0021', 'Zipora', 'Sakura', 'zipora.sakura@hotmail.com', 'Jakarta Selatan', '11650', 'Kemang', 'J0002', NULL, 'P0005'),
('K0022', 'Bambang', 'Sutrisno', 'bambangsutri@gmail.com', 'Jakarta Barat', '12650', 'Kali Deres', 'J0003', 'K0021', 'P0005'),
('K0023', 'Alan', 'Kusuma', 'alan.kusuma@gmail.com', 'Jakarta Barat', '12670', 'Grogol', 'J0004', 'K0021', 'P0005'),
('K0024', 'Susi', 'Susanta', 'susisusann@gmail.com', 'Jakarta Utara', '13650', 'PIK', 'J0009', 'K0021', 'P0005'),
('K0025', 'Yudi', NULL, 'yudidiiiii@hotmail.com', 'Bekasi Timur', '13390', 'Kemang Pratama', 'J0010', 'K0021', 'P0005'),
('K0026', 'Stefany', 'Elsa', 'stefany.elsa@gmail.com', 'Jakarta Selatan', '11510', 'Gandaria', 'J0002', NULL, 'P0006'),
('K0027', 'Sutejo', NULL, 'sutejoo@yahoo.com', 'Jakarta Utara', '12888', 'Pluit', 'J0005', 'K0026', 'P0006'),
('K0028', 'Ariel', 'Ezra', 'arielez1@yahoo.com', 'Jakarta Selatan', '12898', 'Pondok Indah', 'J0006', 'K0026', 'P0006'),
('K0029', 'Hokky', 'Luhendo', 'hokky.luhen@hotmail.com', 'Tangerang', '11460', 'Cikokol', 'J0003', 'K0026', 'P0006'),
('K0030', 'Cahyadi', 'Bambang', 'cahyabambang@gmail.com', 'Jakarta Timur', '19088', 'Duren Sawit', 'J0010', 'K0026', 'P0006'),
('K0031', 'Maria', 'Ozawa', 'mariaenak@hotmail.com', 'Bali', '14588', 'Denpasar', 'J0002', NULL, 'P0007'),
('K0032', 'Farrel', 'Fanny', 'farrel.fanny@gmail.com', 'Bali', '14798', 'Tanah Lot', 'J0003', 'K0031', 'P0007'),
('K0033', 'Ian', NULL, 'ian121@gmail.com', 'Bali', '14738', 'Badung', 'J0004', 'K0031', 'P0007'),
('K0034', 'I Gusti', 'Ketut', 'gustiketut@gmail.com', 'Bali', '13598', 'Jimbaran', 'J0006', 'K0031', 'P0007'),
('K0035', 'Albert', 'Kulo', 'albert.kulo@gmail.com', 'Bali', '10098', 'Tabanan', 'J0004', 'K0031', 'P0007'),
('K0036', 'Arthuro', 'Vidal', 'arthurovidal@hotmail.com', 'Tangerang', '15800', 'Regency', 'J0002', NULL, 'P0008'),
('K0037', 'Bastian', 'Steel', 'bastian.steel@yahoo.com', 'Tangerang', '13377', 'Ciledug', 'J0006', 'K0036', 'P0008'),
('K0038', 'Chaca', 'Septriasa', 'cacasepti12@hotmail.com', 'Bekasi', '15899', 'Pondek Gede', 'J0005', 'K0036', 'P0008'),
('K0039', 'Dinka', NULL, 'dinka77@gmail.com', 'Jakarta Barat', '16700', 'Meruya', 'J0009', 'K0036', 'P0008'),
('K0040', 'Ethan', NULL, 'ethan1977@yahoo.com', 'Jakarta Barat', '16800', 'Kebon Jeruk', 'J0004', 'K0036', 'P0008'),
('K0041', 'Crysania', 'Suhartanto', 'crysania.manis@hotmail.com', 'Yogyakarta', '14221', 'Sleman', 'J0002', NULL, 'P0009'),
('K0042', 'Gregorius', 'Aldo', 'grego.aldo@gmail.com', 'Yogyakarta', '15621', 'Bantul', 'J0003', 'K0041', 'P0009'),
('K0043', 'Hanif', 'Prananda', 'hanifprananda@yahoo.com', 'Yogyakarta', '19821', 'Kulon Progo', 'J0009', 'K0041', 'P0009'),
('K0044', 'Jessica', 'Klopp', 'klopp.jesica@gmail.com', 'Yogyakarta', '13781', 'Gunungkidul', 'J0005', 'K0041', 'P0009'),
('K0045', 'Joseph', 'Alando', 'joseph.alando@yahoo.com', 'Yogyakarta', '19021', 'Yogyakarta', 'J0006', 'K0041', 'P0009'),
('K0046', 'Karin', 'Elizabeth', 'karin.elizabeth@gmail.com', 'Jakarta Pusat', '19832', 'Sudirman', 'J0002', NULL, 'P0010'),
('K0047', 'Simon', 'Putra', 'simonemone@gmail.com', 'Jakarta Selatan', '15500', 'Pancoran', 'J0004', 'K0046', 'P0010'),
('K0048', 'Venno', 'Kipli', 'kiplyycihuy@yahoo.com', 'Tangerang', '15980', 'Pondok Cabe', 'J0003', 'K0046', 'P0010'),
('K0049', 'Theo', 'Rheza', 'theo.rheza@hotmail.com', 'Jakarta Selatan', '17903', 'Gandaria', 'J0006', 'K0046', 'P0010'),
('K0050', 'Maulana', 'Ibrahim', 'enmen@gmail.com', 'Jakarta Selatan', '15500', 'Pasar Minggu', 'J0009', 'K0046', 'P0010');

INSERT INTO OrderMobil VALUES
('C0001', 'K0005', '2019-10-12', '100000000', 'M0007'),
('C0002', 'K0002', '2019-04-26', '50000000', 'M0003'),
('C0003', 'K0004', '2019-06-17', '750000000', 'M0010'),
('C0004', 'K0008', '2019-03-10', 'NULL', 'M0018'),
('C0005', 'K0001', '2019-05-09', '350000000', 'M0013'),
('C0006', 'K0006', '2019-03-06', '500000000', 'M0002'),
('C0007', 'K0009', '2019-02-22', 'NULL', 'M0014'),
('C0008', 'K0003', '2019-04-24', '535000000', 'M0011'),
('C0009', 'K0007', '2019-05-15', '753500000', 'M0047'),
('C0010', 'K0015', '2019-06-19', '550000000', 'M0024'),
('C0011', 'K0013', '2019-05-22', 'NULL', 'M0035'),
('C0012', 'K0020', '2019-08-24', '253500000', 'M0017'),
('C0013', 'K0014', '2019-06-23', '500050000', 'M0040'),
('C0014', 'K0016', '2019-06-08', '435000000', 'M0036'), 
('C0015', 'K0026', '2019-03-01', '153400000', 'M0022'),
('C0016', 'K0027', '2019-07-15', '555000000', 'M0015'),
('C0017', 'K0024', '2019-02-03', '30000000', 'M0043'),
('C0018', 'K0038', '2019-10-04', 'NULL', 'M0020'),
('C0019', 'K0010', '2019-01-26', 'NULL', 'M0012'),
('C0020', 'K0012', '2019-02-23', '539600000', 'M0032'),
('C0021', 'K0018', '2019-02-22', 'NULL', 'M0027'),
('C0022', 'K0011', '2019-09-25', '200000000', 'M0030'),
('C0023', 'K0032', '2019-05-18', '434500000', 'M0039'),
('C0024', 'K0018', '2019-03-21', '100000000', 'M0044'),
('C0025', 'K0017', '2019-08-12', 'NULL', 'M0021'),
('C0026', 'K0019', '2019-02-11', '150000000', 'M0008'),
('C0027', 'K0014', '2019-07-07', '150000000', 'M0025'),
('C0028', 'K0021', '2019-07-05', '400000000', 'M0001'), 
('C0029', 'K0047', '2019-05-07', '150000000', 'M0023'),
('C0030', 'K0022', '2019-07-19', '25000000', 'M0031'),
('C0031', 'K0043', '2019-02-28', '300000000', 'M0009'),
('C0032', 'K0025', '2019-10-13', 'NULL', 'M0033'),
('C0033', 'K0023', '2019-01-03', 'NULL', 'M0042'),
('C0034', 'K0048', '2019-02-25', '240000000', 'M0048'),
('C0035', 'K0042', '2019-02-22', 'NULL', 'M0005'),
('C0036', 'K0028', '2019-09-01', '250000000', 'M0016'),
('C0037', 'K0044', '2019-05-06', '400000000', 'M0028'),
('C0038', 'K0050', '2019-03-13', '335000000', 'M0037'),
('C0039', 'K0049', '2019-08-18', 'NULL', 'M0038'),
('C0040', 'K0041', '2019-02-19', '755000000', 'M0041'),
('C0041', 'K0029', '2019-07-13', '520000000', 'M0026'),
('C0042', 'K0040', '2019-07-05', '435000000', 'M0050'), 
('C0043', 'K0033', '2019-02-26', 'NULL', 'M0029'),
('C0044', 'K0034', '2019-09-05', '600000000', 'M0004'),
('C0045', 'K0037', '2019-05-20', '150000000', 'M0034'),
('C0046', 'K0035', '2019-03-21', '335000000', 'M0046'),
('C0047', 'K0039', '2019-08-17', 'NULL', 'M0006'),
('C0048', 'K0045', '2019-02-19', '755000000', 'M0045'),
('C0049', 'K0046', '2019-07-13', '100000000', 'M0019'),
('C0050', 'K0036', '2019-07-05', '335000000', 'M0049'), 
('C0010', 'K0015', '2019-02-19', '755000000', 'M0041'),
('C0031', 'K0019', '2019-07-13', '125000000', 'M0026'),
('C0015', 'K0032', '2019-07-17', '435000000', 'M0050'), 
('C0037', 'K0027', '2019-02-26', 'NULL', 'M0029'),
('C0039', 'K0044', '2019-09-07', '600000000', 'M0004'),
('C0018', 'K0039', '2019-05-30', '330000000', 'M0034'),
('C0033', 'K0026', '2019-03-11', '335000000', 'M0046'),
('C0025', 'K0018', '2019-08-28', 'NULL', 'M0006'),
('C0029', 'K0021', '2019-02-11', '755000000', 'M0045'),
('C0047', 'K0020', '2019-07-13', '120000000', 'M0019'),
('C0045', 'K0006', '2019-07-05', '335000000', 'M0049');

/* Harga belum termasuk modifikasi, dan hanya 1 mobil saja! */
INSERT INTO PenyediaanMobil VALUES
('P0001', 'M0007', '2019-10-22', '1000000000'),
('P0001', 'M0001', '2019-12-10', '5000000000'),
('P0001', 'M0004', '2019-10-01', '15000000000'),
('P0001', 'M0008', '2019-04-01', '2500000000'),
('P0001', 'M0021', '2019-04-07', '2700000000'),
('P0002', 'M0023', '2019-03-07', '33000000000'),
('P0002', 'M0025', '2019-05-02', '5217780000'),
('P0002', 'M0017', '2019-02-02', '18200000000'),
('P0002', 'M0021', '2019-04-01', '2700000000'),
('P0002', 'M0020', '2019-01-01', '2900000000'),
('P0002', 'M0014', '2019-02-02', '318668000'),
('P0003', 'M0003', '2019-03-20', '1300000000'),
('P0003', 'M0002', '2019-01-02', '3500000000'),
('P0003', 'M0006', '2019-03-04', '840000000'),
('P0004', 'M0009', '2019-04-07', '1300000000'),
('P0004', 'M0010', '2019-04-07', '1000000000'),
('P0004', 'M0011', '2019-04-07', '5250000000'),
('P0005', 'M0012', '2019-02-02', '925000000'),
('P0005', 'M0018', '2019-01-04', '1750000000'),
('P0005', 'M0024', '2019-03-04', '9900000000'),
('P0005', 'M0037', '2019-01-01', '514360000'),
('P0006', 'M0026', '2019-05-05', '511000000'),
('P0006', 'M0030', '2019-05-01', '531930000'),
('P0007', 'M0049', '2019-02-25', '392000000'),
('P0007', 'M0050', '2019-01-02', '2079000000'),
('P0007', 'M0047', '2019-03-10', '1232000000'),
('P0007', 'M0036', '2019-07-07', '7000000000'),
('P0008', 'M0035', '2019-09-10', '1140000000'),
('P0008', 'M0039', '2019-10-10', '1120000000'),
('P0009', 'M0027', '2019-11-20', '25200000000'),
('P0010', 'M0034', '2019-11-10', '64700000000'),
('P0010', 'M0032', '2019-10-10', '1399860000');

INSERT INTO PhoneKaryawan VALUES
('K0001', '083897875697'),
('K0002', '083897593894'),
('K0003', '083572875692'),
('K0004', '083890013491'),
('K0005', '087888562756'),
('K0006', '090197875690'),
('K0007', '080234524693'),
('K0008', '087887873246'),
('K0009', '082897561107'),
('K0010', '083902341334'),
('K0011', '081108472223'),
('K0012', '080988704414'),
('K0013', '083984289427'),
('K0014', '080808527569'),
('K0015', '070184048233'),
('K0016', '090914882621'),
('K0017', '081314685611'),
('K0018', '013892324141'),
('K0019', '097081401840'),
('K0020', '081707811465'),
('K0021', '042088028832'),
('K0022', '070948528852'),
('K0023', '009308352885'),
('K0024', '008108422523'),
('K0025', '090418135411'),
('K0026', '009414151311'),
('K0027', '094797294114'),
('K0028', '020142828197'),
('K0029', '001949871242'),
('K0030', '014673424685'),
('K0031', '072246852252'),
('K0032', '070922222111'),
('K0033', '070944225551'),
('K0034', '070920924115'),
('K0035', '008275287142'),
('K0036', '000134414221'),
('K0037', '092341452431'),
('K0038', '012442953253'),
('K0039', '032423432546'),
('K0040', '009740998141'),
('K0041', '009000998141'),
('K0042', '099410992455'),
('K0043', '098999999999'),
('K0044', '098140852523'),
('K0045', '090983331214'),
('K0046', '098622214515'),
('K0047', '087888856235'),
('K0048', '032994313194'),
('K0049', '001314746422'),
('K0050', '014140536867'),
('K0001', '025626698141'),
('K0002', '009895822242'),
('K0003', '042562152667'),
('K0004', '057484899436'),
('K0007', '054673998135'),
('K0008', '025773535756'),
('K0011', '002358535353'),
('K0014', '003156981443'),
('K0016', '024637433522'),
('K0019', '025298333333'),
('K0020', '001456613322'),
('K0022', '000990998141'),
('K0023', '009794329811'),
('K0024', '095972952222'),
('K0027', '097948191341'),
('K0029', '087690999992'),
('K0031', '009719900100'),
('K0033', '089899992428'),
('K0035', '011740999143'),
('K0036', '008909797084'),
('K0037', '098759289252'),
('K0039', '009252693533'),
('K0044', '009525367673'),
('K0047', '009898958359'),
('K0048', '009724521455'),
('K0050', '002567899000');

INSERT INTO Keluarga VALUES
('K0001', 'Nicholas', 'Full Asuransi', '1998-01-26', 'M'),
('K0002', 'Fadla', 'Half Asuransi', '1992-01-21', 'M'),
('K0005', 'Gery', 'Full Asuransi', '1995-09-03', 'M'),
('K0007', 'Andi', 'Tidak Asuransi', '1993-08-26', 'M'),
('K0017', 'Dinda', 'Full Asuransi', '1993-02-01', 'F'),
('K0019', 'Mutiara', 'Half Asuransi', '1978-01-23', 'F'),
('K0020', 'Hananto', 'Tidak Asuransi', '1988-04-16', 'M'),
('K0021', 'Zipora', 'Full Asuransi', '1997-01-17', 'F'),
('K0029', 'Hokky', 'Half Asuransi', '1988-07-19', 'M'),
('K0031', 'Ozawa', 'Full Asuransi', '1978-04-23', 'F'),
('K0034', 'I Gusti', 'Tidak Asuransi', '1989-03-13', 'M'),
('K0037', 'Bastian', 'Half Asuransi', '1999-05-22', 'M'),
('K0039', 'Dinka', 'Tidak Asuransi', '1991-03-11', 'F'),
('K0011', 'Deka', 'Half Asuransi', '1997-04-15', 'M'),
('K0041', 'Crysania', 'Full Asuransi', '1998-09-14', 'F'),
('K0044', 'Jessica', 'Tidak Asuransi', '1989-08-06', 'F'),
('K0047', 'Simon', 'Full Asuransi', '1998-09-09', 'M'),
('K0003', 'Sinzie', 'Full Asuransi', '2001-03-10', 'M'),
('K0004', 'Raul', 'Full Asuransi', '1999-05-13', 'M'),
('K0050', 'Maul', 'Tidak Asuransi', '1987-07-21', 'M');

/* Select Statement / Query */
/* Query 1 - Display the managers and their employees. */
SELECT CONCAT(e.NamaDepan, " ", e.NamaBelakang) AS Manager,
GROUP_CONCAT(f.NamaDepan, " ", f.NamaBelakang SEPARATOR ', ') AS Karyawan
FROM karyawan AS e
JOIN karyawan AS f ON (f.ID_Manager = e.ID_Karyawan)
GROUP BY 1
UNION
SELECT CONCAT('Total jumlah karyawan adalah: '), CONCAT(COUNT(*), ' orang.')
FROM karyawan AS e;

/* Query 2 - Total harga kendaraan dengan modifikasi. Asumsi kurs rupiah 14 ribu. */
CREATE VIEW DaftarHarga
AS SELECT m.SerialNumber AS 'Nomor Seri', CONCAT(m.Merek, ' ', m.NamaMobil) AS 'Mobil', m.Model, m.TahunPembuatan AS 'Tahun Pembuatan', COUNT(modif.SerialNumber) AS 'Jumlah Modifikasi', CONCAT('$', FLOOR(m.HargaJual / 14000)) AS 'Harga Orisinal', CONCAT('$', COALESCE(FLOOR(SUM(modif.hargaModif) / 14000), 0)) AS 'Harga Modifikasi', CONCAT('Rp. ', FORMAT((m.HargaJual + COALESCE(SUM(modif.hargaModif), 0)), 0, 'de_DE'), ',-') AS 'Harga Total'
FROM mobil AS m
LEFT JOIN modifikasi AS modif USING (SerialNumber)
GROUP BY 1
ORDER BY 5 DESC, 8 DESC;

/* Melihat Query 2 */
SELECT * FROM DaftarHarga;

/* Query 3 - Display Email */
SELECT IF(k.NamaBelakang IS NOT NULL, CONCAT(k.NamaDepan, ' ', k.NamaBelakang), k.NamaDepan) AS 'Nama Karyawan', j.JobDesc AS 'Posisi', j.Salary AS 'Gaji'
FROM karyawan AS k
JOIN job AS j USING (JobID)
WHERE email LIKE '%@gmail%' OR email LIKE '%@prestige%'
GROUP BY k.ID_Karyawan
HAVING j.Salary > 2500000
ORDER BY 3 DESC
LIMIT 10;

/* Query 4 - Employee Information */
CREATE VIEW GeneralInformation
AS SELECT CONCAT(
IF(e.NamaBelakang IS NOT NULL, RPAD(CONCAT(e.NamaDepan, ' ', e.NamaBelakang), 40, ' '), RPAD(e.NamaDepan, 40, ' ')), 
CASE
	WHEN j.JobID = 'J0001' THEN 'statusnya adalah '
	WHEN j.JobID = 'J0002' OR j.JobID = 'J0007' THEN 'adalah seorang '
	ELSE 'bekerja sebagai '
END,
RPAD(j.JobDesc, 40, ' '),
CASE
	WHEN j.JobID = 'J0007' THEN LPAD(CONCAT('di ', d.NamaPerusahaan), 41, ' ')
	WHEN j.JobID = 'J0001' THEN LPAD(CONCAT('di ', d.NamaPerusahaan), 39, ' ')
	WHEN j.JobID <> 'J0002' OR 'J0007' THEN LPAD(CONCAT('di ', d.NamaPerusahaan), 40, ' ')
	ELSE LPAD(CONCAT('di ', d.NamaPerusahaan), 41, ' ')
END
)
AS 'Informasi Karyawan'
FROM karyawan as e
JOIN job AS j USING (JobID)
JOIN perusahaan AS d USING (ID_Perusahaan)
ORDER BY j.JobDesc, d.NamaPerusahaan;

/* Melihat Query 4 */
SELECT * FROM GeneralInformation;

/* Query 5 - Replace Nama Karyawan */
CREATE VIEW Enkripsi 
AS SELECT CONCAT(REPEAT("*", LENGTH(NamaDepan)), " ",
(CASE 
	WHEN NamaBelakang IS NULL THEN ' ' 
	ELSE REPEAT("*", LENGTH(NamaBelakang))
END
)
)
AS 'Enkripsi'
FROM karyawan;

/* Melihat Query 5 */
SELECT * FROM Enkripsi;

/* Query 6 - Replace Gaji Karyawan */
CREATE VIEW CobaLihatGaji
AS SELECT CASE
	WHEN e.NamaBelakang IS NULL THEN e.NamaDepan
	ELSE CONCAT(e.NamaDepan, ' ', e.NamaBelakang)
END AS 'Nama Lengkap',
CONCAT(IF(j.Salary MOD 1000000 = 0, LPAD("", (j.Salary / 1000000), "$"), LPAD("", (j.Salary / 1000000) - 1, "$")), LPAD("", ((j.Salary % 1000000) / 500000), "#")) AS 'Enkripsi Gaji', j.JobDesc AS 'Jenis Pekerjaan',
GROUP_CONCAT(hp.NoTelp SEPARATOR ' - ') AS 'Nomor Telepon'
FROM karyawan AS e
JOIN job AS j USING (JobID)
JOIN phonekaryawan AS hp USING (ID_Karyawan)
GROUP BY ID_Karyawan
ORDER BY j.Salary ASC, 1 ASC;

/* Melihat Query 6 */
SELECT * FROM CobaLihatGaji;

/* Query 7 - Check Mobil yang Tidak Ada di Toko */
SELECT SerialNumber AS 'Nomor Seri', CONCAT(m.Merek, ' ', m.NamaMobil) AS 'Mobil di Pusat', GROUP_CONCAT(war.WarnaMobil SEPARATOR ' <> ') AS 'Warna Tersedia'
FROM Mobil AS m
JOIN warnamobil AS war USING (SerialNumber)
WHERE SerialNumber NOT IN (SELECT SerialNumber FROM PenyediaanMobil)
GROUP BY 1;

/* Query 8 - Bonus dalam Yuan (asumsi 2000 rupiah = 1 yuan) */
SELECT e.ID_Karyawan, CASE
	WHEN e.NamaBelakang IS NULL THEN e.NamaDepan
	ELSE CONCAT(e.NamaDepan, ' ', e.NamaBelakang)
END AS 'Nama Lengkap',
CONCAT('Rp. ', FORMAT(FLOOR(0.75 * SUM(ord.DownPayment)), 0, 'de_DE'), ',-') AS 'Kontribusi', CONCAT(FLOOR(0.20 * j.Salary / 2000), ' Yuan') AS Bonus
FROM karyawan AS e
JOIN ordermobil AS ord USING (ID_Karyawan)
JOIN pembeli USING (ID_Customer)
JOIN job AS j USING (JobID)
GROUP BY 1
HAVING FLOOR(0.75 * SUM(ord.DownPayment)) > 115000000
ORDER BY 3 DESC;

/* Query 9 - Doorprize */
CREATE VIEW Doorprize
AS SELECT o.ID_Karyawan, CONCAT(LEFT(e.NamaDepan, 1), LEFT(e.NamaBelakang, 1)) AS 'Inisial Karyawan', CONCAT(c.NamaDepan, ' ', c.NamaBelakang) AS 'Nama Customer', CONCAT(m.Merek, ' ', m.NamaMobil) AS 'Kendaraan Dibeli', CONCAT('Rp. ', FORMAT(SUM(modif.hargaModif), 0, 'de_DE'), ',-') AS 'Harga Modifikasi', COUNT(modif.SerialNumber) AS 'Jumlah Modifikasi', COALESCE(IF(manaj.NamaBelakang IS NULL, manaj.NamaDepan, CONCAT(manaj.NamaDepan, ' ', manaj.NamaBelakang)), 'Tidak ada Manager!') AS 'Manager Berprestasi', IF(SUM(modif.hargaModif) > 100000000, 'DOORPRIZE!', CONCAT('Nomor undian: ', FLOOR(1 + RAND() * 100), '.')) AS 'Doorprize'
FROM ordermobil AS o
JOIN karyawan AS e USING (ID_Karyawan)
LEFT JOIN karyawan AS manaj ON (manaj.ID_Karyawan = e.ID_Manager)
JOIN pembeli AS c USING (ID_Customer)
JOIN mobil AS m USING (SerialNumber)
JOIN modifikasi AS modif USING (SerialNumber)
WHERE o.ID_Karyawan LIKE "K000%" OR o.ID_Karyawan LIKE "K00%_" AND m.TahunPembuatan > 2000
GROUP BY SerialNumber
HAVING MOD(SUBSTRING(o.ID_Karyawan, 5), 2) = 1 OR MOD(SUBSTRING(o.ID_Karyawan, 4), 2) = 1
ORDER BY SUM(modif.hargaModif) DESC;

/* Melihat Query 9 */
SELECT * FROM Doorprize;

/* Query 10 - Hashing Union */
SELECT k.ID_Karyawan, CASE
	WHEN k.NamaBelakang IS NULL THEN
		CASE
			WHEN LENGTH(k.NamaDepan) % 3 = 0 THEN LOWER(CONCAT(REVERSE(LEFT(k.NamaDepan, 3)), "aeolian",
			CASE
				WHEN (LENGTH(SUBSTRING_INDEX(TRIM(SUBSTRING(p.NamaPerusahaan, 4, 15)), ' ', 1)) MOD 3) = 0 THEN LEFT(LOWER(REVERSE(SUBSTRING_INDEX(TRIM(SUBSTRING(p.NamaPerusahaan, 4, 15)), ' ', 1))), 4)
				WHEN (LENGTH(SUBSTRING_INDEX(TRIM(SUBSTRING(p.NamaPerusahaan, 4, 15)), ' ', 1)) MOD 3) = 1 THEN SUBSTRING_INDEX(TRIM(SUBSTRING(p.NamaPerusahaan, 4, 15)), ' ', 1)
				ELSE REVERSE(SUBSTRING_INDEX(TRIM(SUBSTRING(p.NamaPerusahaan, 4, 15)), ' ', 1))
			END
			))

			WHEN LENGTH(k.NamaDepan) % 3 = 1 THEN LOWER(CONCAT(REVERSE(LEFT(k.NamaDepan, 3)), "ionian",
			CASE
				WHEN (LENGTH(SUBSTRING_INDEX(TRIM(SUBSTRING(p.NamaPerusahaan, 4, 15)), ' ', 1)) MOD 3) = 0 THEN LEFT(LOWER(REVERSE(SUBSTRING_INDEX(TRIM(SUBSTRING(p.NamaPerusahaan, 4, 15)), ' ', 1))), 4)
				WHEN (LENGTH(SUBSTRING_INDEX(TRIM(SUBSTRING(p.NamaPerusahaan, 4, 15)), ' ', 1)) MOD 3) = 1 THEN SUBSTRING_INDEX(TRIM(SUBSTRING(p.NamaPerusahaan, 4, 15)), ' ', 1)
				ELSE REVERSE(SUBSTRING_INDEX(TRIM(SUBSTRING(p.NamaPerusahaan, 4, 15)), ' ', 1))
			END
			))

			ELSE LOWER(CONCAT(REVERSE(LEFT(k.NamaDepan, 3)), "lydian",
			CASE
				WHEN (LENGTH(SUBSTRING_INDEX(TRIM(SUBSTRING(p.NamaPerusahaan, 4, 15)), ' ', 1)) MOD 3) = 0 THEN LEFT(LOWER(REVERSE(SUBSTRING_INDEX(TRIM(SUBSTRING(p.NamaPerusahaan, 4, 15)), ' ', 1))), 4)
				WHEN (LENGTH(SUBSTRING_INDEX(TRIM(SUBSTRING(p.NamaPerusahaan, 4, 15)), ' ', 1)) MOD 3) = 1 THEN SUBSTRING_INDEX(TRIM(SUBSTRING(p.NamaPerusahaan, 4, 15)), ' ', 1)
				ELSE REVERSE(SUBSTRING_INDEX(TRIM(SUBSTRING(p.NamaPerusahaan, 4, 15)), ' ', 1))
			END
			))
		END

	WHEN k.NamaBelakang IS NOT NULL THEN
		CASE
			WHEN (LENGTH(k.NamaDepan) + LENGTH(k.NamaBelakang)) MOD 3 = 0 THEN LOWER(CONCAT(REVERSE(LEFT(k.NamaDepan, 3)), "mixolydian",
			CASE
				WHEN (LENGTH(SUBSTRING_INDEX(TRIM(SUBSTRING(p.NamaPerusahaan, 4, 15)), ' ', 1)) MOD 3) = 0 THEN LEFT(LOWER(REVERSE(SUBSTRING_INDEX(TRIM(SUBSTRING(p.NamaPerusahaan, 4, 15)), ' ', 1))), 4)
				WHEN (LENGTH(SUBSTRING_INDEX(TRIM(SUBSTRING(p.NamaPerusahaan, 4, 15)), ' ', 1)) MOD 3) = 1 THEN SUBSTRING_INDEX(TRIM(SUBSTRING(p.NamaPerusahaan, 4, 15)), ' ', 1)
				ELSE REVERSE(SUBSTRING_INDEX(TRIM(SUBSTRING(p.NamaPerusahaan, 4, 15)), ' ', 1))
			END
			))

			WHEN (LENGTH(k.NamaDepan) + LENGTH(k.NamaBelakang)) MOD 3 = 1 THEN LOWER(CONCAT(REVERSE(LEFT(k.NamaDepan, 3)), "mandalorian",
			CASE
				WHEN (LENGTH(SUBSTRING_INDEX(TRIM(SUBSTRING(p.NamaPerusahaan, 4, 15)), ' ', 1)) MOD 3) = 0 THEN LEFT(LOWER(REVERSE(SUBSTRING_INDEX(TRIM(SUBSTRING(p.NamaPerusahaan, 4, 15)), ' ', 1))), 4)
				WHEN (LENGTH(SUBSTRING_INDEX(TRIM(SUBSTRING(p.NamaPerusahaan, 4, 15)), ' ', 1)) MOD 3) = 1 THEN SUBSTRING_INDEX(TRIM(SUBSTRING(p.NamaPerusahaan, 4, 15)), ' ', 1)
				ELSE REVERSE(SUBSTRING_INDEX(TRIM(SUBSTRING(p.NamaPerusahaan, 4, 15)), ' ', 1))
			END
			))

			ELSE LOWER(CONCAT(REVERSE(LEFT(k.NamaDepan, 3)), "petatonic",
			CASE
				WHEN (LENGTH(SUBSTRING_INDEX(TRIM(SUBSTRING(p.NamaPerusahaan, 4, 15)), ' ', 1)) MOD 3) = 0 THEN LEFT(LOWER(REVERSE(SUBSTRING_INDEX(TRIM(SUBSTRING(p.NamaPerusahaan, 4, 15)), ' ', 1))), 4)
				WHEN (LENGTH(SUBSTRING_INDEX(TRIM(SUBSTRING(p.NamaPerusahaan, 4, 15)), ' ', 1)) MOD 3) = 1 THEN SUBSTRING_INDEX(TRIM(SUBSTRING(p.NamaPerusahaan, 4, 15)), ' ', 1)
				ELSE REVERSE(SUBSTRING_INDEX(TRIM(SUBSTRING(p.NamaPerusahaan, 4, 15)), ' ', 1))
			END
			))
		END
	END AS 'Hashing'
FROM karyawan AS k
JOIN perusahaan AS p USING (ID_Perusahaan)
ORDER BY REVERSE(LEFT(k.NamaDepan, 3)) ASC;

/* Stored Procedure */
/* Procedure 1 - Cek Nama Mobil + Type + Harga */
DROP PROCEDURE IF EXISTS diskon_bonus;
DELIMITER //

CREATE PROCEDURE diskon_bonus(IN idpembeli VARCHAR(255))
BEGIN
	SELECT CONCAT(c.NamaDepan, ' ', c.NamaBelakang) AS 'Nama Lengkap', CONCAT(m.Merek, ' ', m.NamaMobil) AS 'Kendaraan', GROUP_CONCAT(modif.TipeModif SEPARATOR ', ') AS 'Tipe Modifikasi Kendaraan', 
	CASE
		WHEN m.hargaJual < 1000000000 THEN
			CONCAT('Tidak ada diskon! Harga asli: ', m.hargaJual)
		WHEN m.hargaJual BETWEEN 1000000000 AND 1500000000 THEN 
			CONCAT((FLOOR(m.hargaJual * 0.10 / 2000)), ' Yuan. Harga asli: ', m.hargaJual, ' rupiah.')
		WHEN m.hargaJual BETWEEN 1500000001 AND 2000000000 THEN 
			CONCAT((FLOOR(m.hargaJual * 0.15 / 10000)), ' SGD. Harga asli: ', m.hargaJual, ' rupiah.')
		ELSE CONCAT((FLOOR(m.hargaJual * 0.20 / 14000)), ' USD. Harga asli: ', m.hargaJual, ' rupiah.')
	END AS 'Diskon dan Bonus'
	FROM ordermobil
	JOIN pembeli AS c USING (ID_Customer)
	JOIN mobil AS m USING (SerialNumber)
	LEFT JOIN modifikasi AS modif USING (SerialNumber)
	WHERE ID_Customer = idpembeli
	GROUP BY SerialNumber;
END//
DELIMITER ;

/* Lihat Procedure 1 */
call diskon_bonus('C0001');
call diskon_bonus('C0021');
call diskon_bonus('C0004');

/* Procedure 2 - Cursor */
DROP PROCEDURE IF EXISTS checkmobil;
DELIMITER //
CREATE PROCEDURE checkmobil(IN search VARCHAR(100))
BEGIN
	DECLARE i INTEGER;
	DECLARE jumlahHasil INTEGER;
	DECLARE placeholderNama VARCHAR(255);
	DECLARE placeholderMerek VARCHAR(255);
	DECLARE placeholderHarga VARCHAR(255);
	DECLARE placeholderPerusahaan VARCHAR(255);
	DECLARE placeholderBengkel VARCHAR(255);

	DECLARE CMobil CURSOR FOR 
		SELECT m.Merek, m.NamaMobil, m.hargaJual, p.NamaPerusahaan, b.Jasa
		FROM Mobil AS m
		LEFT JOIN PenyediaanMobil USING (SerialNumber)
		LEFT JOIN Perusahaan AS p USING (ID_Perusahaan)
		LEFT JOIN bengkel AS b USING (ID_Bengkel)
		WHERE NamaMobil LIKE CONCAT('%', search, '%');
	OPEN CMobil;

	CREATE TEMPORARY TABLE hasil(MMobil VARCHAR(255), NMobil VARCHAR(255), MJual BIGINT, NPerusahaan VARCHAR(255), JBengkel VARCHAR(255));
	SELECT COUNT(*) INTO jumlahHasil FROM Mobil WHERE NamaMobil LIKE CONCAT('%', search, '%');
	SET i = 0;

	WHILE(i < jumlahHasil) DO
		FETCH CMobil INTO placeholderMerek, placeholderNama, placeholderHarga, placeholderPerusahaan, placeholderBengkel;
		INSERT INTO hasil(MMobil, NMobil, MJual, NPerusahaan, JBengkel) VALUES(placeholderMerek, placeholderNama, placeholderHarga, placeholderPerusahaan, placeholderBengkel);
		SET i = i + 1;
	END WHILE;
	CLOSE CMobil;

	IF(jumlahHasil = 0) THEN
		SELECT "No data found!" AS "Search Results";
	ELSE
		SELECT MMobil AS 'Merek Mobil', NMobil AS 'Nama Mobil', CONCAT('Rp. ', FORMAT(MJual, 0, 'de_DE'), ',-') AS 'Harga Jual', NPerusahaan AS 'Perusahaan Penyedia', JBengkel AS 'Jasa Bengkel Perusahaan' FROM hasil ORDER BY MJual;
	END IF;
	DROP TEMPORARY TABLE hasil;	
END//
DELIMITER ;

/* Lihat Procedure 2 */
call checkmobil('GTR');
call checkmobil('Camaro');
call checkmobil('A');
call checkmobil('Sinzie');
	
/* Stored Functions */
/* Function 1 - Beli */
DROP FUNCTION IF EXISTS beliMobil;
DELIMITER //
CREATE FUNCTION beliMobil(ID_Customer VARCHAR(255), ID_Karyawan VARCHAR(255), DownPayment BIGINT, SerialNumber VARCHAR(255)) RETURNS VARCHAR(255)
BEGIN
	DECLARE hasil VARCHAR(255);
	INSERT INTO OrderMobil VALUES(ID_Customer, ID_Karyawan, CURDATE(), DownPayment, SerialNumber);
	SELECT CONCAT('Anda telah membeli mobil dengan serial number: ', SerialNumber, ' dengan nomor ID karyawan: ', ID_Karyawan, ' dan DP sebesar: ', DownPayment, '. Terima kasih!') INTO hasil;
	RETURN hasil;
END//
DELIMITER ;

/* Lihat Function 1 */
SELECT beliMobil('C0001', 'K0001', 100000000, 'M0001') AS 'Faktur Pembelian Mobil';
SELECT beliMobil('C0005', 'K0003', 500000000, 'M0013') AS 'Faktur Pembelian Mobil';
SELECT beliMobil(0, 0, 0, 0) AS 'Faktur Pembelian Mobil';

/* Kembalikan Semula */
DELETE FROM OrderMobil WHERE ID_Customer = 'C0001' AND ID_Karyawan = 'K0001' AND SerialNumber = 'M0001';
DELETE FROM OrderMobil WHERE ID_Customer = 'C0005' AND ID_Karyawan = 'K0003' AND SerialNumber = 'M0013';

/* Function 2 - Cek Garansi */
DROP FUNCTION IF EXISTS cekGaransi;
DELIMITER //
CREATE FUNCTION cekGaransi(OrderDate DATE) RETURNS VARCHAR(255)
BEGIN
	DECLARE hasil VARCHAR(255);
	SELECT CASE
		WHEN DATEDIFF(CURDATE(), OrderDate) BETWEEN 0 AND 365 THEN
			CONCAT('Garansi Anda masih tersisa ', DATEDIFF(CURDATE(), OrderDate), '. Anda masih bisa melakukan Full Service di bengkel kami!')
		WHEN DATEDIFF(CURDATE(), OrderDate) BETWEEN 366 AND 730 THEN
			CONCAT('Garansi Anda masih tersisa ', DATEDIFF(CURDATE(), OrderDate), '. Anda bisa melakukan check up tahunan di bengkel kami!')
		WHEN DATEDIFF(CURDATE(), OrderDate) BETWEEN 731 AND 1095 THEN
			CONCAT('Garansi Anda masih tersisa ', DATEDIFF(CURDATE(), OrderDate), '. Anda bisa melakukan servis khusus rem dan roda di bengkel kami!')
		WHEN DATEDIFF(CURDATE(), OrderDate) BETWEEN 1096 AND 1460 THEN
			CONCAT('Garansi Anda masih tersisa ', DATEDIFF(CURDATE(), OrderDate), '. Anda bisa melakukan servis kaki-kaki di bengkel kami!')
		WHEN DATEDIFF(CURDATE(), OrderDate) BETWEEN 1461 AND 1825 THEN
			CONCAT('Garansi Anda masih tersisa ', DATEDIFF(CURDATE(), OrderDate), '. Anda bisa melakukan ganti oli lengkap di bengkel kami!')
		ELSE CONCAT('Garansi Anda overdue ', DATEDIFF(CURDATE(), OrderDate), '. Anda hanya bisa cuci mobil dan vakum sekali di bengkel kami! Gratis!')
	END INTO hasil;
	RETURN hasil;
END//
DELIMITER ;

/* Lihat Function 2 */
SELECT CONCAT(c.NamaDepan, ' ', c.NamaBelakang) AS 'Nama Lengkap', m.NamaMobil AS 'Nama Mobil', ord.OrderDate AS 'Waktu Pemesanan', cekGaransi(ord.OrderDate) AS 'Sisa Garansi'
FROM ordermobil AS ord
JOIN pembeli AS c USING (ID_Customer)
JOIN mobil AS m USING (SerialNumber)
ORDER BY 4;

/* Trigger - Update Pembelian - Hapus di Table */
DROP TABLE IF EXISTS finalisasiPemesanan;
DROP TRIGGER IF EXISTS pencatatan_history;

CREATE TABLE finalisasiPemesanan (
	SerialNumber VARCHAR(255) UNIQUE,
	ID_Customer VARCHAR(255) UNIQUE,
	ID_Karyawan VARCHAR(255) UNIQUE,
	ListModifikasi VARCHAR(255),
	TotalHarga BIGINT,
	PerubahanQty INT,
	SisaQty INT,
	WaktuPembayaran DATETIME,
	FOREIGN KEY (SerialNumber) REFERENCES Mobil(SerialNumber),
	FOREIGN KEY (ID_Customer) REFERENCES Pembeli(ID_Customer),
	FOREIGN KEY (ID_Karyawan) REFERENCES Karyawan(ID_Karyawan)
);

DELIMITER //
CREATE TRIGGER pencatatan_history BEFORE UPDATE ON ordermobil FOR EACH ROW
BEGIN
	IF(NEW.DownPayment = (SELECT HargaJual FROM mobil WHERE SerialNumber = OLD.SerialNumber) + COALESCE((SELECT SUM(HargaModif) FROM modifikasi WHERE SerialNumber = OLD.SerialNumber GROUP BY SerialNumber), 0)) THEN
		INSERT INTO finalisasiPemesanan VALUES (OLD.SerialNumber, OLD.ID_Customer, OLD.ID_Karyawan, (SELECT SUBSTRING_INDEX(GROUP_CONCAT(DescModif SEPARATOR ' - '), ' - ', 3) FROM modifikasi WHERE SerialNumber = OLD.SerialNumber GROUP BY SerialNumber), (SELECT HargaJual FROM mobil WHERE SerialNumber = OLD.SerialNumber), -1, (SELECT Qty FROM Mobil WHERE SerialNumber = OLD.SerialNumber) - 1, NOW());
	ELSE
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Belum mencukupi untuk indent mobil! Silakan bayar full terlebih dahulu!';
	END IF;
	
	UPDATE Mobil
	SET Qty = Qty - 1
	WHERE SerialNumber = OLD.SerialNumber;

	DELETE FROM Modifikasi
	WHERE SerialNumber = OLD.SerialNumber;

END//
DELIMITER ;

/* Tes */
UPDATE ordermobil
SET DownPayment = 1300000000
WHERE ID_Customer = 'C0002' AND ID_Karyawan = 'K0002' AND SerialNumber = 'M0003';

UPDATE ordermobil
SET DownPayment = 2700000000
WHERE ID_Customer = 'C0025' AND ID_Karyawan = 'K0017' AND SerialNumber = 'M0021';

UPDATE ordermobil
SET DownPayment = 2817500000
WHERE ID_Customer = 'C0025' AND ID_Karyawan = 'K0017' AND SerialNumber = 'M0021';

UPDATE ordermobil
SET DownPayment = 5000000000
WHERE ID_Customer = 'C0028' AND ID_Karyawan = 'K0021' AND SerialNumber = 'M0001';

UPDATE ordermobil
SET DownPayment = 5010000000
WHERE ID_Customer = 'C0028' AND ID_Karyawan = 'K0021' AND SerialNumber = 'M0001';

SELECT * FROM finalisasiPemesanan;
