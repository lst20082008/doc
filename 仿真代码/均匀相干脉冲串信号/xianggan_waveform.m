clear;
c=10;                                   %改变幅度
fc=5e6;                                 %载波频率
Tr=1e-6;                                %脉冲重复间隔
N=4;                                    %脉冲个数
Dt=1/(c*fc);
t0=0:Dt:Tr-Dt;
xt0=exp(j*(2*pi*fc*t0+pi/3));           %初相为pi/3
ut0=(square(2*pi*(1/Tr)*t0,40)+1)/2;    %square生成一个一定占空比的方波包络
st0=xt0.*ut0;                           %调制
st=st0'*ones(1,N);                      % '表示取共轭
st=(st(:))';
t1=0:Dt:(N*Tr-Dt);
for i=1:N;
    ti=(i-1)*Tr:Dt:(i*Tr-Dt);
    t((i-1)*length(ti)+1:i*length(ti))=ti;
end
figure(1)
subplot(211)
plot(t,real(st))
xlabel('Time in s');
title('Real part of signal');
grid on;
axis tight;
subplot(212)
plot(t,imag(st))
xlabel('Time in s');
title('Imaginary part of signal');
grid on;
axis tight;
figure(2)
plot(t,fftshift(abs(fft(st))));
xlabel('Frequency in MHz');
title('Magnitude spectrum of signal');
grid on;
axis tight;