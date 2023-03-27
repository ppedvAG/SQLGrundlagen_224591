--Datentypen

/*

Strings:

ASCII '00000000'

UTF-8 '0000000000000000'

char(10) = 'Otto      ' = Speicherplatz 10 byte
nchar(10) = 'Otto      ' = Speicherplatz 20 byte

varchar(10) = 'Otto' = Speicherplatz 4 byte
nvarchar(10) = 'Otto' = Speicherplatz 8 byte


Numerisch:
integer = ganze Zahl
tinyint = 8 bit
smallint = 16 bit
int = 32 bit 
bigint = 64 bit
bit = 1 oder 0, "Wahr/Falsch"
binary = stellt Zahl bin‰r da, also in 0 und 1

Kommazahlen:
real
float = einziger auﬂer decimal der sinnvoll ist
decimal(10,2) = insgesamt 10 Stellen, 2 davon Nachkomma
decimal rundet auch kaufm‰nnisch
smallmoney
money -- braucht kein Mensch


Datum:
time = nur Zeit
date = nur Datum
smalldatetime = Beides bis MS Bereich
datetime = Beides bis NS Bereich
(datetime2)

Format immer US 'YYYYMMDD-HH:MM:SS:MS...
Datum Filtern immer in ' ' (wie String)

"Bonus":
XML
JSON
Geography
Geometry
image
text