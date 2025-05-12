velocidade = 3;
distancia_do_player = 0;
gravidade = 5;
andar = 0

function seguir_player(deteccao){
	if(abs(distancia_do_player) < deteccao){
		andar = 1;
		if(obj_amenic.x < x){
			x -= andar * velocidade;
		}else{
			x += andar * velocidade;
		}
	}else{
		andar = 0;
	}
}
	
function atacar(){
	if(distancia_do_player <= 35){
		velocidade = 0
	}else{
		velocidade = 3
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



