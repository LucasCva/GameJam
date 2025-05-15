velocidade = 3;
distancia_ataque = 32;
distancia_do_player = 0;
gravidade = 5;
andar = false;

function seguir_player(deteccao){
	if(abs(distancia_do_player) < deteccao && distancia_do_player > distancia_ataque){
		andar = true;
		if(obj_amenic.x < x){
			x -= andar * velocidade;
		}else if(obj_amenic.x > x && andar = 1){
			x += andar * velocidade;
		}
	}else{
		andar = false;
	}
}
	
function atacar(){
	if(distancia_do_player <= distancia_ataque){
		andar = false
	}else{
		andar = true;
	}
}

function colisaoV (){
	if (place_meeting(x, y + gravidade, obj_chao)) {
	while (!place_meeting(x, y + sign(gravidade), obj_chao)) {
		y += sign(gravidade);
	}
	gravidade = 0;
}
y += gravidade;
}



