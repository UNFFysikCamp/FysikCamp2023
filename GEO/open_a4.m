%file=open_a4.m
%update: 6. aug. 1994 / BHJ
% purpose: This function opens a figure window of a specified number.
%          The window will have a fixed size on screen, conforming with
%          the aspect ratio of a portrait A4 paper.
% input:
%   fig_num: integer.
%          
% CALL:
%        open_a4(fig_num,orientation,scr_fac)

function open_a4(fig_num,orientation,scr_fac)
if (nargin<1); fig_num=gcf; end
if (nargin<2); orientation='portrait'; end
if (nargin<3); scr_fac=1; end

figure(fig_num);
set(fig_num,'papertype',    'a4'        )
set(fig_num,'resize','on')

if strcmp(orientation(1),'p'); %............................ portrait:
  set(fig_num,'paperorient',  'portrait'  )
  set(fig_num,'paperunit',    'centimeter')
  set(fig_num,'paperposition',[4,0,18,27] )
  set(fig_num,'paperunit',    'inch'      )
  set(fig_num,'unit',         'pixels'    )
  set(fig_num,'position',[320,25,300*scr_fac,400*scr_fac] ); 
                          % = the right half of a VGA screen.
%   set(fig_num,'resize',       'off'       );
elseif strcmp(orientation,'l'); %.......................... landscape:
  set(fig_num,'paperorient',  'landscape' )
  set(fig_num,'paperunit',    'centimeter')
  set(fig_num,'paperposition',[2,0,27,18] )
  set(fig_num,'paperunit',    'inch'      )
  set(fig_num,'unit',         'pixels'    )
  set(fig_num,'position',[25,25,520*scr_fac,390*scr_fac]  ); 
                         % = almost a full VGA screen.
%   set(fig_num,'resize',       'off'       );
else
  disp('error in input for the function open_a4.m');
  disp(['''',orientation,''' is illegal; ''p'' or ''l'' expected']);
  disp('Look at this help:');
  help open_a4;
end   

  