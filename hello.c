#include "uart.h"

void _start(void)
{
	register unsigned long ra __asm__ ("ra");
	register unsigned long sp __asm__ ("sp");
	unsigned long ra_saved = ra;
	unsigned long prid;
	unsigned long config;

	prints("Hello World!\n");


	prints("ra = ");
	printx(ra_saved);
	prints("\n");

	prints("sp = ");
	printx(sp);
	prints("\n");

	prints("prid = ");
	__asm__ volatile ("sync.p\nmfc0 %0, $15\nsync.p\n":"=r"(prid)::"memory");
	printx(prid);
	prints("\n");

	prints("config = ");
	__asm__ volatile ("sync.p\nmfc0 %0, $16\nsync.p\n":"=r"(config)::"memory");
	printx(config);
	prints("\n");

	prints("config1 = ");
	__asm__ volatile ("sync.p\nmfc0 %0, $16, 1\nsync.p\n":"=r"(config)::"memory");
	printx(config);
	prints("\n");

	prints("config2 = ");
	__asm__ volatile ("sync.p\nmfc0 %0, $16, 2\nsync.p\n":"=r"(config)::"memory");
	printx(config);
	prints("\n");

	prints("config3 = ");
	__asm__ volatile ("sync.p\nmfc0 %0, $16, 3\nsync.p\n":"=r"(config)::"memory");
	printx(config);
	prints("\n");
}
