#region CONTROLES	
var key_dir = keyboard_check(ord("D"));
var key_esq = keyboard_check(ord("A"));
var key_jump = keyboard_check_pressed(vk_space);
var key_dash = keyboard_check_pressed(vk_shift);
#endregion

#region MOVIMENTAÇÃO

var move = key_dir - key_esq;

hspd = move * spd;
vspd = vspd + grv;

if (hspd != 0) image_xscale = sign(hspd);  

#endregion

#region COLISÃO HORIZONTAL

if (place_meeting(x + hspd, y, obj_chao)) {
	while (!place_meeting(x + sign(hspd), y, obj_chao)) {
		x += sign(hspd);
	}
	hspd = 0;
}
x += hspd;


#endregion

#region COLISÃO VERTICAL

if (place_meeting(x, y + vspd, obj_chao)) {
	while (!place_meeting(x, y + sign(vspd), obj_chao)) {
		y += sign(vspd);
	}
	vspd = 0;
}
y += vspd;


#endregion

#region PULO

var no_chao = place_meeting(x, y + 1, obj_chao);

if (no_chao) {qtd_pulos=0}

if (key_jump && qtd_pulos < 2) {
	vspd = -12;	
	qtd_pulos = qtd_pulos + 1;
}




#endregion

#region DASH



if (key_dash && alarm[0] <= 0 && alarm[1] <= 0) {
	spd = 18;
	alarm[0] = 10;
	alarm[1] = 100;
}else if (alarm[0] <= 0){
	spd = 8;
}



#endregion

