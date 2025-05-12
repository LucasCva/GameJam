event_inherited();

distancia_ataque = 32;
tempo_ataque = 60;
timer_ataque = 0;
atacando = false;

image_xscale = 2;
image_yscale = 2;


// TODO Inverter lado conforme a velociadade
function invertendo_lado(){
	if(obj_amenic.x < x){
		image_xscale = -2;
	}else{
		image_xscale = 2;
	}
}

function animacao_andar(){
	if (andar != 0){
		sprite_index = spr_esqueleto_walk;
	}else{
		sprite_index = spr_esqueleto_idle;
	}
}
	
