function result = function_u_der(x,y,x_der,y_der)
if x_der == 0 && y_der == 0
    result = x*y*(1-x/2)*(1-y)*exp(x+y);
elseif x_der == 1 && y_der == 0
    result = y*(1-y)*(1-x)*exp(x+y)+y*(1-y)*(x-x*x/2)*exp(x+y);
elseif x_der == 0 && y_der == 1
    result = (1-2*y)*exp(x+y)*(x-x*x/2)+(y-y*y)*exp(x+y)*(x-x*x/2);
end
