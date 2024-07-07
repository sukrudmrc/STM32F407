#include "stm32f4xx.h"
#include "stm32f4_discovery.h"

void CLK_CONFIG(){
	RCC->CR |= 0x00010000; 				//HSE ON
	while(!(RCC->CR & (0x00020000)));	//HSE ON READY FLAG
	RCC->CR |= 0x00080000;				//Clock security system ON

	//PLL CONFIG

	RCC->PLLCFGR |= 0x00000004;			//PLLM = 4
	RCC->PLLCFGR |= 0x00002A00;			//PLLN = 168
	RCC->PLLCFGR &= !(0x00030000);		//PLLP = 2
	RCC->PLLCFGR |= 0x00400000;			//HSE oscillator clock selected as PLL and PLLI2S clock entry


	RCC->CR |= 0x01000000;				//PLL ON
	while(!(RCC->CR & 0x02000000));		//Main PLL (PLL) clock ready flag

	// AHB , APB1 , APB2 prescellar config

	RCC->CFGR |= 0x00000000; 			//AHB  prescaler = 1
	RCC->CFGR |= 0x00001000;			//APB1 prescaler = 2
	RCC->CFGR |= 0x0000A000;			//APB2 prescaler = 4

	RCC->CFGR |= 0x00000002;			//PLL selected as system clock
	while(!(RCC->CFGR & 0x00000008));	//PLL FLAG WAIT

}

int main(void)
{

  while (1)
  {
	  CLK_CONFIG();
  }
}



void EVAL_AUDIO_TransferComplete_CallBack(uint32_t pBuffer, uint32_t Size){
  /* TODO, implement your code here */
  return;
}

/*
 * Callback used by stm324xg_eval_audio_codec.c.
 * Refer to stm324xg_eval_audio_codec.h for more info.
 */
uint16_t EVAL_AUDIO_GetSampleCallBack(void){
  /* TODO, implement your code here */
  return -1;
}

