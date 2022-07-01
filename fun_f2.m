function result = fun_f2(x,y)
    result =4*fun_nu(x,y)*x*y-fun_nu(x,y)*pi^3*sin(pi*x) ...
            +2*pi*(2-pi*sin(pi*x))*sin(2*pi*y);
end