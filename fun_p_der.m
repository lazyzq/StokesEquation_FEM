function result = fun_p_der(x,y,derx,dery)
    if derx == 0 && dery == 0
        result = -(2-pi*sin(pi*x))*cos(2*pi*y);
    elseif derx == 1 && dery == 0
        result = -(-pi^2*cos(pi*x))*cos(2*pi*y);
    elseif derx == 0 && dery == 1
        result = (2-pi*sin(pi*x))*2*pi*sin(2*pi*y);
    end
end