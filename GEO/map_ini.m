% map_ini.m
function map_ini(mapscale,xmin,xmax,ymin,ymax);

fig_num=gcf;
lx = xmax-xmin; % length in reality in meter
ly = ymax-ymin;

lx_pap = 100*lx/mapscale; % length on paper in cm
ly_pap = 100*ly/mapscale; % length on paper  

%................................ setting axes
x0       =  2.9; % Y-axis 1.9 cm from figure left edge
y0       =  2.9; % X-axis 1.9 cm from figure top edge

set(fig_num,'paperunits','centim')
fig_pap_pos = get(fig_num,'paperposition');
fx0 = fig_pap_pos(1);
fy0 = fig_pap_pos(2);
fxl = fig_pap_pos(3);
fyl = fig_pap_pos(4); 
set(fig_num,'paperunits','inches');

ax_pos = [x0/fxl,y0/fyl,lx_pap/fxl,ly_pap/fyl],
ax_h = axes('position',ax_pos,'box','on');
%set(gca,'position',ax_pos,'box','on');

axis([xmin,xmax,ymin,ymax]);
axis manual
hold on


