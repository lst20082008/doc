close all
clear all
taup=2;
ii=0.;
B=2.5;

tauy=-2*B:.05:2*B;
for tau=-2*B:.05:2*B
    ii=ii+1;
    x(ii)=taup-abs(tau);
end

plot(tauy,x);
grid on;
xlabel ('Delay - seconds')
ylabel ('Uncertainty')
    