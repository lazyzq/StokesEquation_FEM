function P = generate_P(left_bottom,right_top,n1,n2)
% generate_P generates the P matrix for area(left_bottom to right_top) by uniform partition(n1 colunns n2 rows) 
P=zeros(2,(n1+1)*(n2+1));
h1=(right_top(1)-left_bottom(1))/n1;
% h1: mesh size of n1 uniform partition in x-axis
h2=(right_top(2)-left_bottom(2))/n2;
% h2: mesh size of n2 uniform partition in y-axis
for cn = 1:n1+1
    % cn:the natural "column" index of a node in 2D mesh 
    for rn = 1:n2+1
        % rn:the natural "row" index of a node in 2D mesh
        P(1,(cn-1)*(n2+1)+rn)=(cn-1)*h1+left_bottom(1);
        P(2,(cn-1)*(n2+1)+rn)=(rn-1)*h2+left_bottom(2);
    end
end


