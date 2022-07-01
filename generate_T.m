function T=generate_T(n1,n2)
T=zeros(3,2*n1*n2);
for ce=1:n1
    for re=1:n2
        T(:,2*(ce-1)*n2+2*re-1)=[(ce-1)*(n2+1)+re;ce*(n2+1)+re;(ce-1)*(n2+1)+re+1];
        T(:,2*(ce-1)*n2+2*re)=[(ce-1)*(n2+1)+re+1;ce*(n2+1)+re;ce*(n2+1)+re+1];   
    end
end