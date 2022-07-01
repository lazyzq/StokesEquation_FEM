% 曲线积分测试
clear;
count = 7;
% 曲线上点的个数
theta = linspace(0,pi,count);
x = cos(theta);
y = sin(theta);
vertices = [x;y];
% 曲线上各点坐标
% scatter(x,y);
% hold on;
value = 0;
for n = 1:count-1
    [Gauss_Pt_Line,Gauss_weights] = Gen_Gauss_Pt_Line(vertices(:,n:n+1),1);
    scatter(Gauss_Pt_Line(1,:),Gauss_Pt_Line(2,:));
    hold on;
    
    y_der = (vertices(2,n+1)- vertices(2,n))/(vertices(1,n+1)- vertices(1,n)+eps);
    k_ds = sqrt(1+y_der*y_der);
%     value = value + abs(vertices(1,n+1)- vertices(1,n))*k_ds;
    
    int_value = 0;
    for nGp = 1:size(Gauss_weights,2)
        %int_value = int_value + abs((vertices(1,n+1)- vertices(1,n))/2)*Gauss_weights(nGp)*sqrt(1+Gauss_Pt_Line(1,nGp)^2/(1-Gauss_Pt_Line(1,nGp)^2));
        int_value = int_value + abs((vertices(1,n+1)- vertices(1,n))/2)*Gauss_weights(nGp)*k_ds;

    end
    value = value + int_value;
end
value

