image_blend = position_meeting(mouse_x, mouse_y, id) ? c_white : c_silver;

draw_self();

draw_set_color(c_black);
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x + sprite_width div 2, y + sprite_height div 2, text);

draw_set_color(c_white);
draw_set_alpha(1);
