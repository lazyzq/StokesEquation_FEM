[P,T]=generate_Pb_Tb([-1,1],[4,4],8,8,201);
result = 0;
for n = 1 : size(T,2)
    vertices = P(:,T(:,n));
    xn1 = vertices(1,1);
    xn2 = vertices(1,2);
    xn3 = vertices(1,3);
    yn1 = vertices(2,1);
    yn2 = vertices(2,2);
    yn3 = vertices(2,3);
    Jn = (xn2-xn1)*(yn3-yn1)-(xn3-xn1)*(yn2-yn1);
    [Gauss_weights, Gauss_points] = generate_Gauss_local(vertices,1);
    scatter(Gauss_points(1,:),Gauss_points(2,:));
    hold on;
    pause(0.1);
    for ng = 1:size(Gauss_points,2)
        result = result+Jn/2*Gauss_weights(ng)*feval(@(x,y)(x.^2+y.^2+1),Gauss_points(1,ng),Gauss_points(2,ng));
    end
end
std = integral2(@(x,y)(x.^2+y.^2+1),2,4,2,4);
std/result


