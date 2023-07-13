%selma_run.m
clear; close all
pausetime = 2; %<<<<< edit this if the code has problems fining files
%% >>>> edit N layer model
dss{1}=[0.6,1.0]; rhoss{1}=[30,400,30];
dss{2}=[0.6];     rhoss{2}=[30,400];
dss{3}=[5];       rhoss{3}=[120,30];
%% >>>> enter your data
% run an m-file wit this format, or just fill in here
Location = 'Ved møllen 1';
Measured_date = '20. marts klokken 12:30'
X = [
  0.2   30.9
  0.5   40.6
  1     65.2
  2    111
  5     90
  10   50
  ];
a_data = X(:,1); Lhalf_data = X(:,1)*1.5;
rhoa_data = X(:,2);

%% >>>> edit layout of loglog plot
fignum=1; %what figure number
pap_orient='l'; %orientation of paper; 'p' = portrait, 'l' = landscape
Lhalf_min=0.1; Lhalf_max=100; %The interval of L/2 values you want to show
f_min=5; f_max=f_min*100; %The interval of rho_a values to show
decade_size=50; %How many mm per decade; foils have 83.33 mm
model_colors = 'rgb';
%% >>>> Run computation

figure
%fignum=3; a_min=4.5; a_max=320; f_min=7; f_max=200; decade_size=50.0; pap_orient='l';
loglogpap(fignum,Lhalf_min,Lhalf_max,f_min,f_max,decade_size,pap_orient)
hold on
TitleString{1} = [Location, '.   Målt ',Measured_date];
LegendString{1} = 'Observed \rho_a';
h(1)=plot(log10(Lhalf_data),log10(rhoa_data),'om')
Nmod = length(dss);
for imod=1:Nmod
  ds = dss{imod};
  rhos = rhoss{imod};
  writemod(rhos,ds,'modfil','MOD');
  !selma99 acrofil
  pause(pausetime)
  %     slmatlab
  movefile SLMATLAB.M slmatlab.m_bad;
  movefile slmatlab.m_bad slmatlab.m;
  slmatlab
  % keyboard
  ds_sand(:,1)=dcsch(:,4);
  i_plot = find(dcsch(:,1)>Lhalf_min & dcsch(:,1)<Lhalf_max)
  h(2*imod)=plot(log10(dcsch(:,1)),log10(ds_sand),'-','color',model_colors(imod))
  % text(log10(dcsch(i_plot,1)),log10(ds_sand(i_plot,1)),'A','horiz','center')
  % text(log10(dcsch(i_plot,1)),log10(ds_sand(i_plot,2)),'B','horiz','center')
  % text(log10(dcsch(i_plot,1)),log10(ds_sand(i_plot,3)),'C','horiz','center')
  set(get(gca,'xlabel'),'string','L/2 [m]')
  set(get(gca,'ylabel'),'string','\rho_a [\Omegam]')
  % title('Fig. 1: Schlumberger-data ved \bfA\rm, \bfB \rmog \bfC')
  % grid on
  Lhalf_model = Lhalf_min;
  rho_model = rhos(1);
  zs = cumsum(ds);
  for ibound=1:length(zs)
    Lhalf_model(ibound*2+[0,1])=[zs(ibound),zs(ibound)];
    rho_model(ibound*2+[0,1])=[rhos(ibound),rhos(ibound+1)];
  end
  Lhalf_model(end+1)=Lhalf_max;
  rho_model(end+1) = rhos(end);
  h(2*imod+1)=plot(log10(Lhalf_model)+imod*0.01,log10(rho_model)+imod*0.01,model_colors(imod),'linewidth',2)
  
  TitleString{imod+1} = ['Model-',num2str(imod),': \rho=[',num2str(rhos,'%5.1f '),'] \Omegam.  zs=[',num2str(zs,'%5.1f '),'] m'];
  LegendString{2*imod} = ['Model-',num2str(imod)];
  LegendString{2*imod+1} = ['Model-',num2str(imod)];
end
title(TitleString)
legend(h,LegendString)