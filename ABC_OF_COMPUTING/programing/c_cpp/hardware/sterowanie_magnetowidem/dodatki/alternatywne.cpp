/*
 * plik zawiera alternatywne roziwązania dla pewnych funkcji / fragmentów kodu
 *
 */


/*
 * podstawowa wersja funkcji zczytującej kod pilota
 * nie uwzglądania ona tego iż kod nałożony jest na falę nośną
 * zczytuje wszystko jak leci (wraz z modlacją ...)
 * uzyteczna w zasadzie tylko w celach testowych
 *
 */
int zczytaj_prosto(double czasy[], int buffor_size) {
	long long czas_1 = czas();
	long long czas_2;

	int wartosc, numer_impulsu = 0, poprzednia = 64;
	// poprzednia = 64 - zapewnia nie znajdywanie ACK zaraz po starcie programu

	while(1)
	{
		// zczytuje wartosc portu
		wartosc = inb(LPT_PORT +1);

		// wykrywam nacisniecie BUSY - koniec programu
		if ( (wartosc & 128) && !(poprzednia & 128) ) break;

		// wykrywam stan wysoki na ACK
		if ( (wartosc & 64) && !(poprzednia & 64) ) {
			czas_2 = czas();

			// czas od poprzedniej zmiany
			czasy[numer_impulsu++] = (czas_2-czas_1) / PROCESOR;

			// wykrywam przepelnienie buforu
			if (numer_impulsu >= buffor_size) break;

			czas_1 = czas_2;
		}

		// zapamietuje obecny stan portu - reaguje tylko gdy sie zmienil
                poprzednia = wartosc;
	}
	return numer_impulsu;
}


/*
 * wynkcje wyslij z probami implementacji modulacji fali nosnej
 *
 */
double wyslij(double czasy[], int ograniczenie, double okres_fali_nosnej) {
	long long czas_1, czas_2;

	for (int i=1; i<=(ograniczenie-2)/2; i++) {
		// nadawanie jedynki
		czas_1 = czas();
		while(czasy[2*i] >= (czas()-czas_1) / PROCESOR) {
			// modulacja jedynki
			czas_2 = czas();
			while(okres_fali_nosnej >= (czas()-czas_2) / PROCESOR) {
				outb(3, LPT_PORT +2);
			}
			czas_2 = czas();
			while(okres_fali_nosnej >= (czas()-czas_2) / PROCESOR) {
				outb(11, LPT_PORT +2);
			}
		}

		// nadawanie zera
		czas_1 = czas();
		while(czasy[2*i+1] - 0.9 * okres_fali_nosnej >= (czas()-czas_1) / PROCESOR) {
				outb(11, LPT_PORT +2);
		}
	}
	return 0;
}
// UWAGA: funkcja wymaga tablicy czasy w wieloktotnosciach okresu_fali_nosnej
//        oraz wartosci okres_fali_nosnej wyrazonej w mikrosekundach i podzielonej przez 2
void wyslij(double czasy[], int ograniczenie, double czas_jedynki, double czas_zera) {
	int i, j, k;

	for (i=1; i<=(ograniczenie-2)/2; i++) {
		// nadawanie jedynki
		for(j=0; j<czasy[2*i]; j++) {
			// przez jeden polokres nadajemy jedynke
			for(k=0; k<czas_jedynki; k++) outb(3, LPT_PORT +2);
			// przez nastepny polokres nadajemy zero
			for(k=0; k<czas_zera; k++) outb(11, LPT_PORT +2);
		}
		// nadawanie zera
		for(j=0; j<czasy[2*i+1]; j++) {
			for(k=0; k<czas_jedynki; k++) outb(11, LPT_PORT +2);
			for(k=0; k<czas_zera; k++) outb(11, LPT_PORT +2);
		}
	}
}


/*
 * ponizsze linijki byly uzyteczne dla wersji wykonujacych programowa modulacje fali nosnej
 * jednak ze wzgledu na mala wydajnosc, znaczna komplikacje kodu programu oraz watpliwa elegancje tego rozwiazania
 * zrezygnowalem z niego narzecz konstrukcji sprzetowego generatora fali nosnej opartego na ukladzie NE555
 * wiecej w pliku "generator.info"
 *
 */
// przetwaramy dane do postaci zgodnej z danymi wejsciowymi funkcji wyslij
for (int j=0; j<= buffor_size ; j++) czasy[j] = round(czasy[j] / (okres_fali_nosnej));
double pol_okres_fali_nosnej = 500000 * okres_fali_nosnej;


// wypisujemy tak przetworzone dane
printf("double pol_okres_fali_nosnej = %f;\n\ndouble funkcja_XX[] = {", pol_okres_fali_nosnej);
for (i=2; i<=ograniczenie-3; i++) printf("%f, ",czasy[i]);
printf("%f};\n\n", czasy[i]);

// wypisujemy dane przetworzone na 32-bitowa liczbe kodujaca ciag z naszej tablicy
double liczba = 0;
for (i=3; i<=ograniczenie-3; i++) {
	// jako 1 kodujemy CZAS_DLUGI jako 0 CZAS_KROTKI
	// pomijamy imuls poczatkowy
	if (czasy[i] == CZAS_DLUGI) {
		liczba += pow(2, i-3);
	} else if (czasy[i] == CZAS_KROTKI) {
		; // instrukcja pusta czyli 'liczba += 0;'
	} else {
		// blad
		liczba = NAN;
		break;
	}
}
printf ("Zakodowane w 32-bitowej liczbie: %f\n", liczba);


/*
 * program nadajnika opartego na mikrokontrolerze
 * wersja bez przerwan i z modulacja fali nosnej
 *
 */
// polokres fali nosnej wyrazony w mikrosekundach
	#define POL_OKRES_FALI_NOSNEJ 13.741500

// funkcje i ich dlugosci
	#define STANDBY 2261538	// 22, 44, 22, 22, 22, 44, 22, 22, 22, 44, 22, 22, 22, 22, 22, 44, 22, 44, 22, 22, 22, 44, 22, 22
	#define STANDBY_L 24	// ilosc istotnych informacjizakodowanych w bitach STANDBY

// dluzszy czas impulsu w standardzie danego pilota
	#define CZAS_DLUGI 44
// ktotszy czas impulsu w standardzie danego pilota
	#define CZAS_KROTKI 22
// czas startowy (glownie dla Sony)
	#define CZAS_POCZATKU 88
// generalie rozwiazanie takie jak zaprezentowane tutaj bedzie nadawalo sie do dowolnego standardu
// ewentualnie z drobnymi zmianami dotyczacymi nadawania kodu poczatku,
// a w przypadku ITT rownierz wiekszych zmian dotyczacych piku rozpoczynajacego kazdy z impusow


 // bool
char nadajemy_jedynke = 1, bylo_ack = 0;

// numery akrtualnie nadawanych podimpulsow i impulsow oraz nadawanej funkcji (zczyrtany przez ACK)
char numer_podimpulsu = 0, numer_impulsu = 0, funkcja = 0;

// nadawany sygnal
long sygnal = 0;

// dlugosc nadawanego sygnalu i dlugosc nadawanego impulsu
char dugosc_sygnalu = 0, czas_impulsu = 0;

// reszta zmiennych
char num_tab[ 10 ] = { 237, 72, 117, 93, 216, 157, 189, 73, 253, 221 };


/* MEMORY MAP:
                0x00800060                nadajemy_jedynke
                0x00800061                bylo_ack
                0x00800062                numer_podimpulsu
                0x00800063                numer_impulsu
                0x00800064                funkcja
                0x00800065                sygnal
                0x0080006a                czas_impulsu
                0x0080006b                num_tab
                0x00800069                dugosc_sygnalu
*/

int main() {

	// sbi(PORT, BIT) - ustawia bit BIT na porcie PORT
	// DDRX - ustalenie kierunku dla portu X: ustawiony - wyjście, skasowany - wejście
	sbi (DDRD, PD1);
	cbi (PORTD, PD1);

	sbi (DDRD, PD5);
	sbi (PORTD, PD5);

	outp (0xFF, DDRB);
	outp (0, PORTB);

	// zapisujemy na port bez ustawionego kierunku (bedziemy mogli tez z niego czytac)
	// ustawienia stanu wysokiego na tym porcie (tak jak ma komputer w pinach LPT nie będących masą)
	// wymagaja ULN2003AN z naszej plytki aby poprawnie dzialac
	// - zastepowac go niskim gdy na swoim wejsciu maja wysoki (w przeciwnym razie nie zmieniac go ...)
	sbi (PORTD, PD0);
	sbi (PORTD, PD6);

	// start programu z stanem niskim na PD0
	// (wcisniete ACK) spowoduje pracę w trybie echa
	if ( bit_is_set (PIND, PD0) ) {

		outp (num_tab[0], PORTB);

		while (1) {

		// USTAWIENIA

			// gdy nasisnelismy ACK zwiekszamy licznik o 1
			if ( bit_is_clear (PIND, PD0) ) {
				if ( !bylo_ack ) {
					bylo_ack = 1;

					funkcja++;

					if (funkcja > 9) funkcja=0;

					outp( num_tab[funkcja], PORTB );
				}
			} else {
				bylo_ack = 0;
			}

			// nie interesuje nas dalsza czesc petli gdy nie naciskamy BUSY
			if ( bit_is_set (PIND, PD6) ) continue;

		// WYSYLANIE

			// inicjacja zmiennych dla nadawanego sygnału
			sygnal = STANDBY ;
			dugosc_sygnalu = STANDBY_L;
			czas_impulsu = CZAS_POCZATKU;

			// tryb pracy licznika (porównywanie)
			outp( 64 , TCCR1A ); // przełączączenie bitu OC1A gdy wartosci pasuja
			outp( 8 + 1 , TCCR1B ); // zliczanie pojedyńczych taktów (CS10), zerowanie po porównaniu (CTC1)
//outp( 8 + 4 , TCCR1B );

			// jako że jest nam potrzebne jedno przerwanie na każdy pół okres
			// (czyli co 'pol_okres_fali_nosnej' milisekund)
			// przerwan_na_sekunde = 1000000 / pol_okres_fali_nosnej

			// a nasz mikrokontroler taktowany jest z czestoscia 7372800 Hz
			// to musimy ustalic zakres licznika na
			// zakres_licznika = 7372800 / przerwan_na_sekunde;

			// KOMENTARZ NA TEMAT UTRATY DOKLADNOSCI

			// ustalam zakres pracy licznika
			// układ porównywać będzie mniej znaczący bit z zadana wartoscia
			// bit bardziej znaczacy (OCR1AH) nas nie interesuje gdyz nie kozystamy z 16-bitowosci tego licznika
			// TUTAJ zaczyna sie odliczanie (po tej instrukcji)
			outp( (int)(POL_OKRES_FALI_NOSNEJ * 7.3728) , OCR1L );
//outp( 14400 / 256, OCR1H ); outp( 14400 % 256, OCR1L ); // okres = 1s

			while (1) {
				if ( inp( TCNT1L ) > 5 ) continue;
				// to takie niebezpieczne miejsce ale niech bedzie ....
				// ponizszy kod mozna by wsadzic w przerwanie zegarowe
				// i zamiast break; uzywac zmiennej zakanczajacej tego while'a oraz wylacznika przerwan
				// jednak kod generowany przez zastosowane rozwiazanie jest duzo sprawniejszy,
				// a czas obslugi wystawienia przerwania nie jest wiekszy od czasu aktywnego czekania na powyzszym if'ie

				if ( nadajemy_jedynke ) {
					outp( inp( PORTD ) ^ 2, PORTD );
				}

				if ( ++numer_podimpulsu / 2 >= czas_impulsu) {

					czas_impulsu = (sygnal & 1)!=0 ? CZAS_DLUGI : CZAS_KROTKI ;	// jako 1 kodujemy CZAS_DLUGI jako 0 CZAS_KROTKI
					sygnal = sygnal >> 1;

					numer_podimpulsu = 0;

					nadajemy_jedynke = !nadajemy_jedynke;

					if (++numer_impulsu > dugosc_sygnalu) {
						numer_impulsu = 0;
						cbi (PORTD, PD1);
						break;
					}
				}
			}
		}

	} else {

		outp (16, PORTB);

		// ten mało estetyczny programistycznie element jakim jest pętla nieskończona jest tutaj wręcz nieodzowny
		while ( 1 ) {
			// bit_is_set(PORT, BIT) - zwraca 1 gdy bit BIT jest ustawiony na porcie PORT, w przeciwnym razie 0
			// PINX - czytanie z portu X
			if ( bit_is_set (PIND, PD0) )
				// PORTX - zapis na port X
				sbi (PORTD, PD1);
			else
				// cbi(PORT, BIT) - kasuje bit BIT na porcie PORT
				cbi (PORTD, PD1);
		}

	}
}
