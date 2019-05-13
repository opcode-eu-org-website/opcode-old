Przedmiotem niniejszej pracy było stworzenie rozwiazania umożliwiającego zczytanie kodu pilota oraz wykożystanie tak zczytanego kodu do sterowania mgnetowidem. Rozwiązanie zostało przystosowane do działania w standardzie Sony (dokładnie do sterowania magnetowidem SLV-SE500K z pilotem RMT-V295), jednak tworząc ten pakien miałem na uwadze możliwość łatwego przystosowania go do pracy w innych standardach.

Początkowo planowałem oprzeć się na programowej generacji fali nośnej 40kHz, rozwiązanie to jednak nastręczało wiele problemów technicznych (mala wydajnosc, znaczna komplikacje kodu programu) oraz jego sensowność i elegancja budziła moje wątpliwości. Dlatego też zrezygnowałem z niego narzecz konstrukcji sprzetowego generatora fali nośnej opartego na ukladzie NE555. Schemat tego generatora załączam do tej dokumentacji. Wartości na nim nie opisane są bezpośrednio odpowiedzialne za częstotliwość (f) i procentowy udział czasu trwania stanu niskiego w jednym okresie (D), R2 odpowiada za czas trwania stanu niskiego, R3 - za czas trwania stanu wysokiego, natomiast C2 "przeskalowanie". W naszym przypadku powinny wynosić: R2 = R3 = 10k (regulowany), C2 = 4.7nF, co pozwoli na regulacje zakresu pracy: 30kHz < f < 50KHz i 20% < D < 80%, co wydaje się wystarczające dla dowolnego ze znanych mi standardów pilotów RTV.

Podanie sygnału sterującego na wejscie 4 ukladu (połączonego przez reystor z masą celem zapewnienia zera gdy sygnał sterujący nie jest jedynką) powoduje że gdy jest tam podawana jedynka na wyjściu generatora mamy tąże jedynkę zmodulowaną określoną częstotliwością fali nośnej, natomiast gdy nie jest tam podawany sygnal (czyli w skutek opisanego wyżej rozwiązania) jest tam zero to na wyjściu generatora podawane jest zero. Czas przełączenia jest na tyle mały że mieści się w przyjętych granicach niedokładnoci czasu trwania impulsów i nam nie przeszkadza.

Oprócz opisanego powyżej sprzętowego generatora fali nośnej w skład niniejszej pracy wchodzi zewnętrzny (w stosunku co do wykożystywanej płytki: "Uniwersytet Warszawski - Wydział Fizyki -- Programowanie II - Jesien 2003 - P.Klimczewski & R.Kus", oraz wykożystywanej płytki z układem mikrokontrolera: "Uniwersytet Warszawski - Wydział Fizyki -- Programowanie II - Zima 2003 - P.Klimczewski & R.Kus" - http://www.fuw.edu.pl/~pablo/s/index.html) nadajnik podczerwieni oparty na diodzie IRED o numerze katalogowym L-53F3BT, pracującej na długości fali 940 nm, zabezpieczonej rezystorem 1k (co pozwala na prace w nominalnym zakresie pradow 4 - 20 mA, przy napieciu od 5V do 15V -> ewentualne zastosowanie portu szeregowego).

W 2005 roku generator został przystosowany do komunikacji przez port COM (pin 7 - RTS podłączony do wejścia CYFRA4 oraz podłaczona masa) i zasilania poprzez USB (stosowna przejścówka). Umożliwiło to stanie mu się niezależnym od wspomnianej płytki urządzeniem sterującym układem wykonawczym którym jest (oddalona o kilka metrów) dioda IRED.

Aby program mógł być używany przez zwykłych użytkowników powinien być ustawiony z SUID root'a: `chown root:root nadajnik_asm; chmod 6755 nadajnik_asm`.

Pliki wchodzące w skład pracy (dokladniejszy opis umieszczony w komentarzach wewnątrz stosownego pliku):
    config.h                  	- plik z ustawieniami konfiguracyjnymi
    czas.cpp                  	- plik z funkcjami odpowiedzilnymi za pomiar czasu
    Makefile                  	- plik Makefile dla programów Linux'owych
    nadajnik_asm.cpp         	- plik źródłowy programu nadajnika stworzonego z wykozystaniem instrukcji blokujacych przerwania poprzez blokade szyny systemowej
    nadajnik_mikro.c         	- plik źródłowy programu nadajnika opartego na mikrokontrolerze (niestety nie został jeszcze uruchomiony z powodzeniem)
    odczyt_pilota.cpp        	- plik źródłowy programu zczytującego kod z pilota
    pilot.dat                 	- plik zawierajacy informacje o standardzie pilota
    pilot_kody.dat           	- plik zawierający zczytane (przez "odczyt_pilota") kody wykożystywane w programch nadawczych
    sprawdz_ack.cpp          	- pik źródłowy pomocniczego programu informującego o stanie pinu ACK
    sprawdz_com.cpp          	- program slużący do testowania komunikacji przez COM
    strojenie_generatora.cpp 	- pik źródłowy pomocniczego programu umożliwiającego regulacje generatora
    tester_nadajnika.c       	- pik źródłowy pomocniczego programu (dla mikrokontrolera) realizującego w oparciu o niego echo (prosty tester nadajnika)

    docs/readme.txt          	- plik zawierający podstawowe informacje o projekcie
    docs/generator.png       	- schemat generatora PNG
    docs/generator.sch       	- schemat generatora Eagle

    dodatki/alternatywne.cpp 	- alternatywne rozwiązania niektórych zagadnień, których ze względu na usterki lub inne wady nie zdecydowałem się wykożystać w finalnym rozwiązaniu (ale z jakiś względów chciałem je zachować)
    dodatki/Makefile         	- plik Makefile dla mikrokontrolera
    dodatki/nagraj.bat       	- dosowy skrypt realizujący zapis do pamięci flash mikrokontrolera

UWAGA: programy wymagają kompilacji współczesną wersją G++, gdyż kożystają z specyficznych rozszerzeń tego kompilatora (np. 64 bitowy typ calkowity long long)
