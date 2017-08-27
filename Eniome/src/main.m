#include <main.h>

void eniome_main_loop(void){
	al_flip_display();
	al_get_keyboard_state(env.key);
	if(al_key_down(env.key, ALLEGRO_KEY_LEFT)){
		env.img_pos.x-=3;
	}
	if(al_key_down(env.key, ALLEGRO_KEY_RIGHT)){
		env.img_pos.x+=3;
	}
	if(al_key_down(env.key, ALLEGRO_KEY_UP)){
		env.img_pos.y-=3;
	}
	if(al_key_down(env.key, ALLEGRO_KEY_DOWN)){
		env.img_pos.y+=3;
	}
	al_clear_to_color(al_map_rgba(0,0,0,255));
}

void eniome_key_down(void){
	al_get_keyboard_state(env.key);

	if (al_key_down(env.key,ALLEGRO_KEY_ESCAPE)){
		free(env.key);
		free(env.event);
		al_destroy_bitmap(env.img);
		al_destroy_event_queue(env.eventQueue);
		al_destroy_display(env.allegroDisplay);
		exit(0);
	}
}

void eniome_key_up(void){

	// al_get_keyboard_state(env.key);
	// if (al_key_up(env.key, ALLEGRO_KEY_LEFT)){
	// 	env.push[ALLEGRO_KEY_LEFT] = false;
	// }
}

int main(int argc, char **argv){
	al_init();
	al_init_image_addon();
	env.allegroDisplay = al_create_display(1900, 1000);
	al_install_keyboard();
	al_install_mouse();
	env.keybord = al_get_keyboard_event_source();
	env.timer = al_create_timer(0.01);
	al_start_timer(env.timer);
	env.eventQueue = al_create_event_queue();
	env.key = malloc(1000);
	env.event = malloc(1000);
	al_register_event_source(env.eventQueue, env.keybord);
	al_register_event_source(env.eventQueue, al_get_timer_event_source(env.timer));
	al_register_event_source(env.eventQueue, al_get_mouse_event_source());
	env.img = al_load_bitmap("/home/gueluak/Emma/Eniome/data/test.bmp");
	env.img_pos.x = 0; env.img_pos.y = 0;
	while (1){
		al_wait_for_event(env.eventQueue, env.event);
		printf("%d\n", env.event->type);
		switch (env.event->type) {
			case 30:
				eniome_main_loop();
				break;
			case 11:
				eniome_key_down();
				break;
			case 12:
				eniome_key_up();
				break;
		}
		al_draw_bitmap(env.img, env.img_pos.x + 100, env.img_pos.y + 100, 0);
	}
	exit(0);
}
