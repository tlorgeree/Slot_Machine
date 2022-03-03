/// @desc
if((y > view_hport[0]) || (x > view_wport[0]))instance_destroy();

y+=spd;
x+=x_spd;
spd+=grav;