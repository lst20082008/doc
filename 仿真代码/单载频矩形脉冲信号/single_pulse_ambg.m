function x=single_pulse_ambg(taup)%������taup
eps=0.000001;
i=0;
taumax=1.1*taup;
taumin=-taumax;
for tau=taumin:.05:taumax%tauΪĿ��T1��T2�ز������ź�����ڷ����źŵ���ʱ�Ĳ�ֵ
    i=i+1;
    j=0;
    for fd=-10/taup:.05:10/taup%fdΪ������Ƶ�ʵĲ�ֵ
        j=j+1;
        val1=taup-abs(tau);
        val2=pi*(taup-abs(tau))*fd;
        x(j,i)=abs(val1*sin(val2+eps)/(val2+eps));
    end
end
