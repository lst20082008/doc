function x=single_pulse_ambg(taup)%脉冲宽度taup
eps=0.000001;
i=0;
taumax=1.1*taup;
taumin=-taumax;
for tau=taumin:.05:taumax%tau为目标T1和T2回波接收信号相对于发射信号的延时的差值
    i=i+1;
    j=0;
    for fd=-10/taup:.05:10/taup%fd为多普勒频率的差值
        j=j+1;
        val1=taup-abs(tau);
        val2=pi*(taup-abs(tau))*fd;
        x(j,i)=abs(val1*sin(val2+eps)/(val2+eps));
    end
end
