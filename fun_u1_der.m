function result = fun_u1_der(x,y,derx,dery)
    if derx == 0 && dery == 0
        result = x^2*y^2+exp(-y);
    elseif derx == 1 && dery == 0
        result = 2*x*y^2;
    elseif derx == 0 && dery == 1
        result = x^2*2*y-exp(-y);
    end
end