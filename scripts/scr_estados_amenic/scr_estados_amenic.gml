function animacao_acabou(instancia) {
    return (instancia.image_index >= instancia.image_number - 1);
}

function movimentacao() {
	key_dir = keyboard_check(ord("D"));
    key_esq = keyboard_check(ord("A"));
	key_atack = keyboard_check(ord("F"));
    key_jump = keyboard_check_pressed(vk_space);
    key_dash = keyboard_check_pressed(vk_shift);
	

    var move = key_dir - key_esq;
    hspd = move * spd;
    vspd += grv;
	
	
    // Colisão horizontal
    if (place_meeting(x + hspd, y, obj_chao)) {
        while (!place_meeting(x + sign(hspd), y, obj_chao)) {
            x += sign(hspd);
        }
        hspd = 0;
    }
    x += hspd;

    // Colisão vertical
    if (place_meeting(x, y + vspd, obj_chao)) {
        while (!place_meeting(x, y + sign(vspd), obj_chao)) {
            y += sign(vspd);
        }
        vspd = 0;
    }
    y += vspd;
	
	if (key_dir) {
		direc = 1;
	}else if (key_esq) {
		direc = 2;
	}
	
}

function dash() {
	if (alarm[0] <= 0 && alarm[1] <= 0) {
	    spd = 18;
	    alarm[0] = 10;   // ao acabar, vamos redefinir o spd
	    alarm[1] = 100;
	}	
}

function estado_correndo() {
	movimentacao();
	
    var no_chao = place_meeting(x, y + 1, obj_chao);

    // Troca de sprite
    if (key_dir) {
        sprite_index = spr_teste_correndo_direita;
        direc = 1;
    } else if (key_esq) {
        sprite_index = spr_teste_correndo_esquerda;
        direc = 2;
    } else {
        if (direc == 1) sprite_index = spr_teste_parado_direita;
        else if (direc == 2) sprite_index = spr_teste_parado_esquerda;
    }
	
	// Dano
	if (vida < vida_control) {
		estado = estado_dano;
	}

    // Pulo
    if (key_jump) {
		estado = estado_pulando;
        vspd = -12;
        qtd_pulos++;
    }

    if (no_chao) {
        qtd_pulos = 0;
    }

    // Dash
	if (key_dash) {
		dash();	
	}
	
	// Attack
	if (key_atack) {
		ds_list_clear(inimigos_atingidos);
		image_index = 0;
		estado = estado_atacando;
	}
 

}

function estado_pulando() {
	movimentacao(); 
	
	if (key_jump && qtd_pulos < 2) {
	    vspd = -12;
        qtd_pulos++;
	}
	
	if (key_dash) {
		dash();
	}
	
	if (key_atack) {
		estado = estado_atacando;
	}
	
    // Troca apenas a sprite
    if (direc == 1) {
        sprite_index = spr_teste_pulando_direita2;
    } else {
        sprite_index = spr_teste_pulando_esquerda2;
    }

   


    // Se tocar no chão, volta ao estado correndo
    var no_chao = place_meeting(x, y + 1, obj_chao);
    if (no_chao) {
        estado = estado_correndo;
    }
}
	
function estado_atacando() {
	movimentacao();
	

	
	//ATAQUE EM INIMIGOS
    var inimigos_na_hitbox = ds_list_create();
	
    var inimigo = instance_place_list(x, y, obj_inimigo, inimigos_na_hitbox, false);
	
        for (var i = 0; i < inimigo; i++) {
            var inimigoID = inimigos_na_hitbox[| i];
            
            if (ds_list_find_index(inimigos_atingidos, inimigoID) == -1) {
                ds_list_add(inimigos_atingidos, inimigoID);
                
                with (inimigoID) {
                    vida -= 1;	

					
                }
            }
        }
		
		
    if (direc == 1) {
        sprite_index = spr_teste_atacando_direita;
		mask_index = spr_teste_atacando_direita_hb;
    } else {
        sprite_index = spr_teste_atacando_esquerda;
		mask_index = spr_teste_atacando_esquerda_hb;
    }
		
		
	if (animacao_acabou(self)) {
		estado = estado_correndo;
		mask_index = spr_teste_parado_direita;
	}	
		
	
}	
	

function estado_dano() {
	
	movimentacao();
		
		
	if (direc == 1) {
		sprite_index = spr_teste_dano_direita;
	} else {
		 sprite_index = spr_teste_dano_esquerda;
	}
			
	if (animacao_acabou(self)) {
		vida_control = vida;
		estado = estado_correndo;
	}
}
	
		

	