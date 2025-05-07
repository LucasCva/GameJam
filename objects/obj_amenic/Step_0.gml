// FIZ UM BAGULHO ESTARNHO AI DE GRAVIDADE E PULO, AJEITA AI :) ASS: lucas

var velocidade_horizontal = 0;

if (keyboard_check(ord("D"))) {
	 velocidade_horizontal = velocidade;
}
if (keyboard_check(ord("A"))) {
	velocidade_horizontal = -velocidade;
}

velocidade_vertical  = gravidade;

// Movimento horizontal
if(!place_meeting(x + sign(velocidade_horizontal), y, obj_chao)){ // Se não ter colisão ele continua
	x += velocidade_horizontal;
}

// Movimento vertical
if(!place_meeting(x, y + velocidade_vertical, obj_chao)){
	y += velocidade_vertical
}else{
	while(!place_meeting(x , y + sign(velocidade_vertical), obj_chao)){
		y += sign(velocidade_vertical);
	}
	velocidade_vertical = 0;
}

// Pulinho básico

if (keyboard_check_pressed(vk_space)){
	y -= pulo;
}