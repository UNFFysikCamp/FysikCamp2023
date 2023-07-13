
%Call:   loglogpap(fignum,a_min,a_max,f_min,f_max,decade_size,pap_orient)
function loglogpap(fignum,a_min,a_max,f_min,f_max,decade_size,pap_orient,col1,col2)
if nargin<8
  col1='k';col2=0.8*[1,1,1];
elseif nargin<9
  col2=col1;
end

figure(fignum)

%mapscale = 100*3/25; %83.333 mm pr. decade
mapscale = 1000/decade_size;
%x_decades = 3;
%y_decades = 2;
%xmin = 0; ymin = 0;
%xmax = 25/3*x_decades;
%ymax = 25/3*y_decades;
%xmax=x_decades;
%ymax=y_decades;

xmin = log10(a_min);
xmax = log10(a_max);
ymin = log10(f_min);
ymax = log10(f_max);

open_a4(fignum,pap_orient,1.7)
map_ini(mapscale,xmin,xmax,ymin,ymax)

ticks = [1,1.5,2,3,4,5,7];
xticks = [0.01*ticks,0.1*ticks,ticks,10*ticks,100*ticks,1000*ticks];
yticks = xticks;

%ticklab = [' 1 ';'1.5';' 2 ';' 3 ';' 4 ';' 5 ';' 7 '];
%xlab = [ticklab;ticklab;ticklab;ticklab;' 1 '];
%xlab=strvcat(xlab,strjust(num2str(xticks(1),5),'center'));;
xlab=[];
for i=1:length(xticks)
   xlab=strvcat(xlab,num2str(xticks(i),5));
end
xlab=strjust(xlab,'center');
ylab = xlab;

plot(0,0); hold on
for i=1:length(yticks)
   plot(([xmin,xmax]),log10([yticks(i),yticks(i)]),'color',col2);
end
for i=1:length(xticks)
   plot(log10([xticks(i),xticks(i)]),([ymin,ymax]),'color',col2);
end
set(gca,'xtick',log10(xticks),'xticklabel',xlab)
set(gca,'ytick',log10(xticks),'yticklabel',ylab)

for i=-3:3
  lh=plot([xmin,xmax],[i,i]);
  set(lh,'linewidth',2,'color',col1);
end
for i=-3:3
  lh=plot([i,i],[ymin,ymax]);
  set(lh,'linewidth',2,'color',col1);
end

set(gca,'linewidth',2)


%set(gca,'fontsize',16)
xlabel('Elektrodeafstand','fontsize',16)
ylabel('Tilsyneladende halvrumsresistivitet, \rho_a [\Omegam]','fontsize',16)

return
finegrid = [1,1.2,1]

for i=[1:9,10:10:90,100]
  lh=plot([xmin,xmax],log10([i,i]),'r');
  set(lh,'linewidth',0.2);
end
for i=logspace(-3,3,61)
  lh=plot(log10([i,i]),[ymin,ymax],'r');
  set(lh,'linewidth',0.2);
end

