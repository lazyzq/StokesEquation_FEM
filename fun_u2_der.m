function result = fun_u2_der(x,y,derx,dery)
    if derx == 0 && dery == 0
       result = -2/3*x*y^3+2-pi*sin(pi*x); 
    elseif derx == 1 && dery == 0
       result = -2/3*y^3-pi^2*cos(pi*x);
    elseif derx == 0 && dery == 1
        result = -2*x*y^2;
    end
end