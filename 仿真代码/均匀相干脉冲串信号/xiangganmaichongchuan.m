close all
clear all
taup=0.3;
pri=1;
n=4;%脉冲波形2*n-1
x=train_ambg(taup,n,pri);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fd=-1./taup:0.0533:1./taup;
tau1=-(n-1)-taup:0.0533:-(n-1)-taup+pri;
% figure(1)
% mesh(ambig)
% xlabel('Delay-seconds')
% ylabel('Doppler-Hz')
% zlabel('Ambiguity function')
% figure(2)
% contour(ambig);
% xlabel('Delay-seconds')
% ylabel('Doppler-Hz')
figure(1)
% plot(ambig(:,10+19*(n-1)))%不是很准
plot(x(:,100))
xlabel('Doppler-Hz')
ylabel('Uncertainty')
figure(2)
plot(x(100,:))
xlabel('Delay-seconds')
ylabel('Uncertainty')
