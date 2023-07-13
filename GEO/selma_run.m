%selma_run.m
clear; close all
LavBesvarelse=0;
d1=[1,1,4];
%d2=[40,80,40];
% d2=[zA_grundvand-d1(1),zB_grundvand-d1(2),zC_grundvand-d1(3)];
rho1=[500,70,20];
rho2=[3000,300,1000];
% rho3=[100,100,100];
disp('DC A,B,C:Running')
if ~LavBesvarelse
    for i=1:3
        %      writemod([rho1(i),rho2(i),rho3(i)],[d1(i),d2(i)],'modfil','MOD');
        writemod([rho1(i),rho2(i)],[d1(i)],'modfil','MOD');
        !selma99 acrofil
        %      X=inv(randn(400)); %just to use time
        pause(2)
        %     slmatlab
        movefile SLMATLAB.M slmatlab.m_bad;
        movefile slmatlab.m_bad slmatlab.m;
        slmatlab
        ds_sand(:,i)=dcsch(:,4);
    end
    
    disp('DC A,B,C: Done')
    figure
    %fignum=3; a_min=4.5; a_max=320; f_min=7; f_max=200; decade_size=50.0; pap_orient='l';
    fignum=1; a_min=0.5; a_max=15; f_min=15; f_max=4000; decade_size=83.33; pap_orient='p';
    loglogpap(fignum,a_min,a_max,f_min,f_max,decade_size,pap_orient)
    hold on
    i_plot = find(dcsch(:,1)>a_min & dcsch(:,1)<a_max)
    plot(log10(dcsch(:,1)),log10(ds_sand),'-')
    %plot(log10(dcsch(:,1)),log10(ds_25),':') %test af ækvivalens
    text(log10(dcsch(i_plot,1)),log10(ds_sand(i_plot,1)),'A','horiz','center')
    text(log10(dcsch(i_plot,1)),log10(ds_sand(i_plot,2)),'B','horiz','center')
    text(log10(dcsch(i_plot,1)),log10(ds_sand(i_plot,3)),'C','horiz','center')
    set(get(gca,'xlabel'),'string','L/2 [m]')
    set(get(gca,'ylabel'),'string','\rho_a [\Omegam]')
    title('Fig. 1: Schlumberger-data ved \bfA\rm, \bfB \rmog \bfC')
    grid on
    %shift_axes(gca,3,-2);
    % shift_axes(gca,3,+10);
    %Og nu beregnes "Wennerdata" for a=10, 20 og 30 meter
    %Der snydes ved at beregne Schlumbergerdata ved L/2 = 1.4*a.
end