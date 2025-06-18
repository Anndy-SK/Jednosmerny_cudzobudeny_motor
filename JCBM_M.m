%   Andrej Klein
%   matematicky model JCBM
%   simulacie priebehov v Simulinku
clc, clear all, close all, format compact;
%% --> parametre a konstanty JCBM:
Un=400; P=29000; In=89; n=819; J=0.5; Ra=0.705; La=0.00905; Mn=339;
w=n/9.55;
Cfi=(Un-(In*Ra))/w;
Ka=1/Ra;
Ta=La/Ra;
%% --> simulacia, kde Mz = Mn a Mz = 0.5Mn:
Ua=Un; Jm=J; Mz=Mn;
sim('JCBM_S'); Is1 = Is; wns1 = wns;
Mz=0.5*Mn;
sim('JCBM_S'); Is2 = Is; wns2 = wns;
% > GRAF - prud kotvy motora:
set(0,'DefaultLineLineWidth',2) % nastavenie hrubky ciary
figure (1)
plot(Is1,'b','linewidth',1.5), hold on, plot(Is2,'r','linewidth',1.5)
title('Priebeh prúdu kotvy')
xlabel('Čas [s]'), ylabel('Prúd kotvy [A]')
grid on, axis([0 1 -50 400])
legend("M_z = M_n","M_z = 0,5M_n")
% > GRAF - uhlova rychlost motora:
figure (2)
plot(wns1,'b'), hold on, plot(wns2,'r')
title('Priebeh uhlovej rýchlosti')
xlabel('Čas [Hz]'), ylabel('Uhlová rýchlosť [rad/s]')
grid on, axis([0 1 0 120])
legend("M_z = M_n","M_z = 0,5M_n")
%% --> simulacia, kde Ua = Un, Ua = 0.8Un a Ua = 0.5Un:
Jm=J; Mz=Mn; Ua=Un;
sim('JCBM_S'); Is1 = Is; wns1 = wns;
Ua=0.8*Un;
sim('JCBM_S'); Is2 = Is; wns2 = wns;
Ua=0.5*Un;
sim('JCBM_S'); Is3 = Is; wns3 = wns;
% > GRAF - prud kotvy motora:
figure (3)
plot(Is1,'b'), hold on, plot(Is2,'r'), hold on, plot(Is3,'k')
title('Priebeh prúdu kotvy')
xlabel('Čas [s]'), ylabel('Prúd kotvy [A]')
grid on, axis([0 1 -50 400])
legend("U_a = U_n","U_a = 0,8U_n","U_a = 0,5U_n")
% > GRAF - uhlova rychlost motora:
figure (4)
plot(wns1,'b'), hold on, plot(wns2,'r'), hold on, plot(wns3,'k')
title('Priebeh uhlovej rýchlosti')
xlabel('Čas [Hz]'), ylabel('Uhlová rýchlosť [rad/s]')
grid on, axis([0 1 0 120])
legend("U_a = U_n","U_a = 0,8U_n","U_a = 0,5U_n")
%% --> simulacia, kde Cfi = Cfin, Cfi = 0.85Cfin a Cfi = 0.7Cfin:
Jm=J; Mz=Mn; Ua=Un;
Cfin = Cfi; % vytvorenie pomocnej konstanty Cfin
sim('JCBM_S'); Is1 = Is; wns1 = wns;
Cfi = 0.85*Cfin;
sim('JCBM_S'); Is2 = Is; wns2 = wns;
Cfi = 0.7*Cfin;
sim('JCBM_S'); Is3 = Is; wns3 = wns;
Cfi = Cfin; clear Cfin; % zmena Cfi do povodneho stavu, odstranenie Cfin
% > GRAF - prud kotvy motora:
figure (5)
plot(Is1,'b'), hold on, plot(Is2,'r'), hold on, plot(Is3,'k')
title('Priebeh prúdu kotvy')
xlabel('Čas [s]'), ylabel('Prúd kotvy [A]')
grid on, axis([0 1 -50 450])
legend("C\phi = C\phi_n","C\phi = 0,85C\phi_n","C\phi = 0,7C\phi_n")
% > GRAF - uhlova rychlost motora:
figure (6)
plot(wns1,'b'), hold on, plot(wns2,'r'), hold on, plot(wns3,'k')
title('Priebeh uhlovej rýchlosti')
xlabel('Čas [Hz]'), ylabel('Uhlová rýchlosť [rad/s]')
grid on, axis([0 1 0 150])
legend("C\phi = C\phi_n","C\phi = 0,85C\phi_n","C\phi = 0,7C\phi_n")
%% --> simulacia, kde Jc = Jcn, Jc = 5Jcn a Jc = 10Jcn:
Jm=J; Mz=Mn; Ua=Un;
sim('JCBM_S'); Is1 = Is; wns1 = wns;
Jm=5*J;
sim('JCBM_S'); Is2 = Is; wns2 = wns;
Jm=10*J;
sim('JCBM_S'); Is3 = Is; wns3 = wns;
% > GRAF - prud kotvy motora:
figure (7)
plot(Is1,'b'), hold on, plot(Is2,'r'), hold on, plot(Is3,'k')
title('Priebeh prúdu kotvy')
xlabel('Čas [s]'), ylabel('Prúd kotvy [A]')
grid on, axis([0 1 -40 520])
legend("J_c = J_{cn}","J_c = 5J_{cn}","J_c = 10J_{cn}")
% > GRAF - uhlova rychlost motora:
figure (8)
plot(wns1,'b'), hold on, plot(wns2,'r'), hold on, plot(wns3,'k')
title('Priebeh uhlovej rýchlosti')
xlabel('Čas [Hz]'), ylabel('Uhlová rýchlosť [rad/s]')
grid on, axis([0 1 0 120])
legend("J_c = J_{cn}","J_c = 5J_{cn}","J_c = 10J_{cn}")
set(0,'DefaultLineLineWidth',1) % nastavenie ciary do povodneho stavu
disp("test JCBM is pass")