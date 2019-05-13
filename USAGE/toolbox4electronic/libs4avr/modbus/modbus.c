#include "mb.h"
#include "mbport.h"

/* ----------------------- Supporting functions -----------------------------*/
eMBEventType mb_event;
BOOL         mb_is_event;
BOOL  xMBPortEventInit( void ) {
	mb_is_event = FALSE;
	return TRUE;
}
BOOL  xMBPortEventPost( eMBEventType eEvent ) {
	mb_event = eEvent;
	mb_is_event = TRUE;
	return TRUE;
}
BOOL  xMBPortEventGet(  eMBEventType * eEvent ) {
	if (mb_is_event) {
		*eEvent = mb_event;
		mb_is_event = FALSE;
		return TRUE;
	}
	return FALSE;
}

/* ----------------------- Serial port functions ----------------------------*/

BOOL  xMBPortSerialInit( UCHAR ucPort, ULONG ulBaudRate, UCHAR ucDataBits, eMBParity eParity ) {
	//UBRRH = 0x02; UBRRL = 0x6f; // BAUD = 300 przy 3 MHz
	UBRRH = 0x00; UBRRL = 0x13; // BAUD = 9600 przy 3 MHz
	
	// RS485 transmiter control
	DDRB  |=    _BV( PB2 )  ;
	PORTB &= ~( _BV( PB2 ) );
	
	return TRUE;
}

void  vMBPortSerialEnable( BOOL xRxEnable, BOOL xTxEnable ) {
	if( xRxEnable ) {
		UCSRB |= _BV( RXEN ) | _BV( RXCIE );
	} else {
		UCSRB &= ~( _BV( RXEN ) | _BV( RXCIE ) );
	}
	
	if( xTxEnable ) {
		UCSRB |= _BV( TXEN ) | _BV(TXCIE) | _BV( UDRE );
		// RS485 transmiter control
		PORTB |= ( _BV( PB2 ) );
	} else {
		UCSRB &= ~( _BV( UDRE ) );
	}
}

BOOL  xMBPortSerialGetByte( CHAR * pucByte ) {
	*pucByte = UDR;
	return TRUE;
}

BOOL  xMBPortSerialPutByte( CHAR ucByte ) {
	UDR = ucByte;
	return TRUE;
}

SIGNAL( USART_UDRE_vect ) {
	pxMBFrameCBTransmitterEmpty(  );
}

SIGNAL( USART_RXC_vect ) {
	pxMBFrameCBByteReceived(  );
}

SIGNAL( USART_TXC_vect ) {
	// RS485 transmiter control
	PORTB &= ~( _BV( PB2 ) );
}

/* ----------------------- Timers functions ---------------------------------*/
uint8_t timerVal;

BOOL  xMBPortTimersInit( USHORT usTimeOut50us ) { // number of 50us ticks
	timerVal = ( F_CPU / 1024UL ) * usTimeOut50us / 20000UL;
	TCCR2 = 0x00;
	return TRUE;
}

void  vMBPortTimersEnable( void ) {
	TCNT2 = 0x0000;
	TIMSK |= _BV( OCIE2 ); // enable interrupt from this timer
	OCR2 = timerVal;
	TCCR2 = _BV( CS22 ) | _BV( CS21 ) | _BV( CS20 ); // timer ticks = F_CPU / 1024
}

void  vMBPortTimersDisable( void ) {
	TCCR2 = 0;
	TIMSK &= ~_BV( OCIE2 ); // disable interrupt from this timer
}

SIGNAL( TIMER2_COMP_vect ) {
	pxMBPortCBTimerExpired();
}
