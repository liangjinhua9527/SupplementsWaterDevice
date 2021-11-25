#include "led.h";


//LED…¡À∏
void led_flash(void)
{
    RA6 = 0;
    DELAY_MS(500);
    RA6 = 1;
}