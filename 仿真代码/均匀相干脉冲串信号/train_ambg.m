function x=train_ambg(taup,n,pri)
if(taup>pri/2.)
    'ERROR.Pulsewidth must be less than the PRI/2.'%����taup<pri/2.
    return
end
gap=pri-2.*taup;%taupΪ������ΪT��pri�����ظ����Tr��nΪ���е�������,gap������
eps=0.000001;%�����������,Ҳ���Ǿ���
b=1./taup;%bΪƵ��
ii=0;
for q=-(n-1):1:n-1;%��������ۼӺ�,q��ȡֵ�ĸ���Ϊ2*n-1��
    tauo=q-taup;%
    index=-1.;
    for tau1=tauo:0.0533:tauo+gap+2.*taup%���0.0533��ѣ�gap+2.*taup=pri��tau1������pri������ѭ�����ͱ�ʾ������һ������
        index=index+1;
        tau=-taup+index*.0533;%tau=taup-q.*pri
        ii=ii+1;
        j=0.;
        for fd=-b:0.0533:b
            j=j+1;
            if(abs(tau)<=taup)%�����������
                val1=1.-abs(tau)/taup;%tauΪ���ȱ�����taupΪ�㶨ֵ
                val2=pi*taup*fd*(1.0-abs(tau)/taup);
                val3=abs(val1*sin(val2+eps)/(val2+eps));
                val4=abs((sin(pi*fd*(n-abs(q))*pri+eps))/(sin(pi*fd*pri+eps)));%q�ĸı�ᵼ��x�Ĳ�ͬ����ǰһ����ͬλ��
                x(j,ii)=val3*val4/n;
            else
                x(j,ii)=0;
            end
        end
       % ambig(j,ii)=fftshift(abs(ifft(x(j,ii))));
    end
end

%1.��Ϊ��ÿһ�����徭��ʱ��tau���������һ����Χ���ظ��仯����tau1�������ֻ���������������ظ������û��ʵ������
%2.�͵�������Ƚϣ�����tau�ظ��仯������ʱ��������겻��ȷ�������ֻ��ʹ����������ȱ仯
