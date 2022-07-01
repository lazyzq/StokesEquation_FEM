function std = generate_std_2D(coe_fun,Pb_trial)
std = zeros(size(Pb_trial,2),1);
for k = 1:size(Pb_trial,2)
    std(k) = feval(coe_fun,Pb_trial(1,k),Pb_trial(2,k));
end

