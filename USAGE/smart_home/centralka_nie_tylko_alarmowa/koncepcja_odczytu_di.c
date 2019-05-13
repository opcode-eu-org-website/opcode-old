struct punktDI {
	char val        :1;
	char val_tmp    :1;
	char action_id  :2;
	int counter;
	int counter_max;
	int action_id;
};

watek_czytajacy() {
	struct timeval loop_time;
	loop_time.tv_usec = READ_LOOP_TIME;
	loop_time.tv_sec = 0;
	
	while(1) {
		// zapis czasu
		struct timeval tv_curr, tv_next, timeout;
		gettimeofday(&tv_curr, NULL);
		timeradd(&loop_time, &tv_curr, &tv_next);
		
		for (i=0; i<DI_MAX; ++i) {
			if (punty[i].do_action != 1) {
				// punkt nie oczekuje na wykonanie na nim akcji => sprawdzanie aktualnego stanu
				tmp = read_di(i);
				if (tmp != punty[i].val) {
					// punkt jest w innym stanie niż zapisany w systemie => obsługa timera
					if (++punty[i].counter > punty[i].counter_max) {
						// timer przekroczony => aktualizacja stanu punktu
						punty[i].val = tmp
						punty[i].do_action = 1
					}
				} else {
					// punkt jest w identycznym stanie jak zapisany w systemie => zerowanie timera
					// jeżeli był nie zerowy to były oscylacje punktu które timer ma wytłumić
					punty[i].counter = 0
				}
			}
		}
		
		// porównanie czasu z zapisanym i czekanie na select()
		gettimeofday(&tv_curr, NULL);
		timersub(&tv_next, &tv_curr, &timeout);
		if (timeout.tv_sec < 0)
			LOG_PRINT_WARN("OverRun Error (%ds %dus) in count=%d count2=%d count3=%d",
					(int)timeout.tv_sec, (int)timeout.tv_usec, count, count2, count3);
		else
			select(0, NULL, NULL, NULL, &timeout);
	}
}

watek_realizujacy_akcje() {
	struct timeval loop_time;
	loop_time.tv_usec = ACTION_LOOP_TIME;
	loop_time.tv_sec = 0;
	
	while(1) {
		// zapis czasu
		struct timeval tv_curr, tv_next, timeout;
		gettimeofday(&tv_curr, NULL);
		timeradd(&loop_time, &tv_curr, &tv_next);
		
		for (i=0; i<DI_MAX; ++i) {
			if (punty[i].do_action != 0) {
				switch (punty[i].action_id) {
					...
				}
				punty[i].action_id = 0;
			}
		}
		
		// porównanie czasu z zapisanym i czekanie na select()
		gettimeofday(&tv_curr, NULL);
		timersub(&tv_next, &tv_curr, &timeout);
		if (timeout.tv_sec < 0)
			LOG_PRINT_WARN("OverRun Error (%ds %dus) in count=%d count2=%d count3=%d",
					(int)timeout.tv_sec, (int)timeout.tv_usec, count, count2, count3);
		else
			select(0, NULL, NULL, NULL, &timeout);
	}
}

main() {
	// inicjalizacja konfiguracji punktów
	for (i=0; i<DI_MAX; ++i) {
		punty[i].val = read_di(i);
		punty[i].counter_max = ...
		punty[i].action_id = ...
	}
	/* ... */
}

/*
	rozdział na dwa wątki oparty na polu do_action zapewnia:
		1) reakcję na pik:    _    o czsie trwania t > READ_LOOP_TIME
		                    _| |_
		                     |t|
		
		2) reakcję na oscylacje:    _   _    o czsie trwania t > ACTION_LOOP_TIME
		                          _| |_| |_
		                           | t |

	do zliczania czasu trwania impulsu ponad counter_max można użyć
		1) wyzerowania counter i zanegowania val w ramch watek_realizujacy_akcje()
		spowoduje to oszukanie watek_czytajacy() która uzna że punkt się zmienił i należy ponownie odliczać do wykonania akcji
		2) do_action == 2 ale wtedy w każdym obiegu watek_realizujacy_akcje() będziemy wykonywać akcję dla tego punktu
*/
