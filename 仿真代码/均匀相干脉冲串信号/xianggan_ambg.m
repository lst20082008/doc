close all
clear all
taup=0.3;
pri=1;
n=4;
x=train_ambg(taup,n,pri);
figure(1)
mesh(x)
xlabel('Delay-seconds')
ylabel('Doppler-Hz')
zlabel('Ambiguity function')
figure(2)
contour(x);
xlabel('Delay-seconds')
ylabel('Doppler-Hz')

