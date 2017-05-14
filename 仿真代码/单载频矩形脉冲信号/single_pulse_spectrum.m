%%%%%%%%%%single pulse signal的时域波形及其幅度谱%%%%%%%%%%%
clc;
clear all;
T=10e-6;                              %信号的持续时间10us
f0=5e6;                             %载波频率
B=10e6;                          %调频带宽30MH
K=B/T;                            %K为线性调频斜率
Fs=2*B;Ts=1/Fs;                   %采样频率和采样间隔
N=T/Ts;                           %采样点
t=linspace(-T/2,T/2,N);           %用于产生-T/2,T/2之间的N点行矢量
Ut=exp(j*pi*f0*t);                %产生single pulse signal
%%%%%%%%%single pulse复包络实部波形%%%%%%%%%%%
subplot(311)
plot(t*1e6,real(Ut));
xlabel('Time in us');
title('Real part of single pulse signal');
grid on;axis tight;
%%%%%%%%%single pulse复包络虚部波形%%%%%%%%%
subplot(312)
plot(t*1e6,imag(Ut));
xlabel('Time in us');
title('Imaginary part of single pulse signal');
grid on;axis tight;
%%%%%%%%single pulse信号的幅度谱%%%%%%%%%%%%%%%
subplot(313)
freq=linspace(-Fs/2,Fs/2,N);
plot(freq*1e-6,fftshift(abs(fft(Ut))));   %fftshift将fft的DC分量移到频谱中心
xlabel('Frequency in MHz');
title('Magnitude spectrum of single pulse signal');
grid on;axis tight;
