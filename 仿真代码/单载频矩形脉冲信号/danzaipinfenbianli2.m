close all
clear all
taup=2;
ii=0.;
B=2.5;

fdy=-2*B:.05:2*B;
for fd=-2*B:.05:2*B;
    ii=ii+1;
    x(ii)=abs(sin(pi*fd*taup)/(pi*fd))
end

plot(fdy,x);
grid on;
xlabel ('Doppler - Hz')
ylabel ('Uncertainty')