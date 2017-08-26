#include <stdio.h>
#include <unistd.h>
#include <time.h>
#include <allegro5/allegro.h>
#include <allegro5/allegro_image.h>

typedef struct img_po{
	int x;
	int y;
}	t_img;

struct env{
	ALLEGRO_DISPLAY 		*allegroDisplay;
	void 					*keybord;
	void 					*timer;
	bool					push[ALLEGRO_KEY_MAX];
	ALLEGRO_EVENT_QUEUE		*eventQueue;
	ALLEGRO_KEYBOARD_STATE	*key;
	ALLEGRO_EVENT			*event;
	ALLEGRO_BITMAP			*img;
	t_img 					img_pos;
}	env;
