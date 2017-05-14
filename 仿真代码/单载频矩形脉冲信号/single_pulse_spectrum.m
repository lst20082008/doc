%%%%%%%%%%single pulse signal��ʱ���μ��������%%%%%%%%%%%
clc;
clear all;
T=10e-6;                              %�źŵĳ���ʱ��10us
f0=5e6;                             %�ز�Ƶ��
B=10e6;                          %��Ƶ����30MH
K=B/T;                            %KΪ���Ե�Ƶб��
Fs=2*B;Ts=1/Fs;                   %����Ƶ�ʺͲ������
N=T/Ts;                           %������
t=linspace(-T/2,T/2,N);           %���ڲ���-T/2,T/2֮���N����ʸ��
Ut=exp(j*pi*f0*t);                %����single pulse signal
%%%%%%%%%single pulse������ʵ������%%%%%%%%%%%
subplot(311)
plot(t*1e6,real(Ut));
xlabel('Time in us');
title('Real part of single pulse signal');
grid on;axis tight;
%%%%%%%%%single pulse�������鲿����%%%%%%%%%
subplot(312)
plot(t*1e6,imag(Ut));
xlabel('Time in us');
title('Imaginary part of single pulse signal');
grid on;axis tight;
%%%%%%%%single pulse�źŵķ�����%%%%%%%%%%%%%%%
subplot(313)
freq=linspace(-Fs/2,Fs/2,N);
plot(freq*1e-6,fftshift(abs(fft(Ut))));   %fftshift��fft��DC�����Ƶ�Ƶ������
xlabel('Frequency in MHz');
title('Magnitude spectrum of single pulse signal');
grid on;axis tight;
