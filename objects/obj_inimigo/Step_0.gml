if(abs(obj_amenic.x - x) < detect_range){
	if(obj_amenic.x < x){
		x -= velocidade;
	}else{
		x += velocidade;
	}
}