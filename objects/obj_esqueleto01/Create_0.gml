// === VARIÁVEIS INICIAIS (coloque no Create Event ou no topo do script) ===
velocidade = 3;
distancia_ataque = 32;
gravidade = 5;
tempo_ataque = 400;
timer_ataque = 0;
atacando = false;
andar = false;
distancia_do_player = 0;

image_xscale = 2;
image_yscale = 2;


// === FUNÇÃO: SEGUIR O PLAYER ===
function seguir_player(deteccao) {
    if (distancia_do_player < deteccao && distancia_do_player > distancia_ataque && !atacando) {
        andar = true;

        if (obj_amenic.x < x) {
            x -= velocidade;
        } else {
            x += velocidade;
        }
    } else {
        andar = false;
    }
}


// === FUNÇÃO: COLISÃO VERTICAL ===
function colisaoV() {
    if (place_meeting(x, y + gravidade, obj_chao)) {
        while (!place_meeting(x, y + sign(gravidade), obj_chao)) {
            y += sign(gravidade);
        }
        gravidade = 0;
    }
    y += gravidade;
}


// === FUNÇÃO: INVERTER LADO ===
function invertendo_lado() {
    if (obj_amenic.x < x) {
        image_xscale = -2;
    } else {
        image_xscale = 2;
    }
}


// === FUNÇÃO: ATACAR ===
function atacar() {
	if(timer_ataque > 0){
		timer_ataque--;
	}
	
	if(timer_ataque == 0){
		if (distancia_do_player <= distancia_ataque && !atacando) {
	        atacando = true;
	        andar = false;
	        sprite_index = spr_esqueleto_attack;
	        image_index = 0;
	        image_speed = 1;
			timer_ataque = tempo_ataque;
		}
	}
}


// === FUNÇÃO: CONTROLAR ANIMAÇÃO ===
function controlar_animacao() {
    if (atacando) {
        if (image_index >= image_number - 1) {
            atacando = false;
            sprite_index = spr_esqueleto_idle;
        }
    } else if (andar) {
        sprite_index = spr_esqueleto_walk;
    } else {
        sprite_index = spr_esqueleto_idle;
    }
}


// === CHAMADAS NO STEP EVENT (chame todas essas no Step) ===

