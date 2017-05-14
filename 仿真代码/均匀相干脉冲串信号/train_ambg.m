function x=train_ambg(taup,n,pri)
if(taup>pri/2.)
    'ERROR.Pulsewidth must be less than the PRI/2.'%条件taup<pri/2.
    return
end
gap=pri-2.*taup;%taup为脉冲宽度为T，pri脉冲重复间隔Tr，n为串中的脉冲数,gap大于零
eps=0.000001;%浮点运算误差,也就是精度
b=1./taup;%b为频率
ii=0;
for q=-(n-1):1:n-1;%最外面的累加和,q的取值的个数为2*n-1个
    tauo=q-taup;%
    index=-1.;
    for tau1=tauo:0.0533:tauo+gap+2.*taup%间隔0.0533最佳，gap+2.*taup=pri，tau1脉冲间隔pri当跳出循环，就表示进行下一个脉冲
        index=index+1;
        tau=-taup+index*.0533;%tau=taup-q.*pri
        ii=ii+1;
        j=0.;
        for fd=-b:0.0533:b
            j=j+1;
            if(abs(tau)<=taup)%单脉冲的条件
                val1=1.-abs(tau)/taup;%tau为均匀变量，taup为恒定值
                val2=pi*taup*fd*(1.0-abs(tau)/taup);
                val3=abs(val1*sin(val2+eps)/(val2+eps));
                val4=abs((sin(pi*fd*(n-abs(q))*pri+eps))/(sin(pi*fd*pri+eps)));%q的改变会导致x的不同，和前一个相同位置
                x(j,ii)=val3*val4/n;
            else
                x(j,ii)=0;
            end
        end
       % ambig(j,ii)=fftshift(abs(ifft(x(j,ii))));
    end
end

%1.因为当每一个脉冲经过时，tau这个变量在一定范围内重复变化，而tau1这个变量只是用来定量脉冲重复间隔，没有实际意义
%2.和单个脉冲比较，由于tau重复变化，导致时延轴的坐标不能确定，因此只能使横纵坐标均匀变化
