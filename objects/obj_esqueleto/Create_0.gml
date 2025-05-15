event_inherited();

distancia_ataque = 32;
tempo_ataque = 60;  // Defina o tempo de ataque
timer_ataque = 0;   // Inicia o timer
atacando = false;   // A flag de ataque

image_xscale = 2;   // Escala da imagem para o lado direito
image_yscale = 2;

function invertendo_lado() {
    if (obj_amenic.x < x) {
        image_xscale = -2; 
    } else {
        image_xscale = 2;  
    }
}

function animacao_andar() {
    if (andar != 0) {
        sprite_index = spr_esqueleto_walk; 
    } else {
        sprite_index = spr_esqueleto_idle; 
    }
}

function atacar() {
    if(distancia_do_player <= distancia_ataque){
		andar = false;
		image_index = spr_esqueleto_attack;
	}else{
		andar = true;
	}
}


