function [Pb,Tb]=generate_Pb_Tb(left_bottom,right_top,n1,n2,basis_type)
% generate_P generates the P matrix for area(left_bottom to right_top) by uniform partition(n1 colunns n2 rows) 
if basis_type == 201
    Pb=zeros(2,(n1+1)*(n2+1));
    h1=(right_top(1)-left_bottom(1))/n1;
    % h1: mesh size of n1 uniform partition in x-axis
    h2=(right_top(2)-left_bottom(2))/n2;
    % h2: mesh size of n2 uniform partition in y-axis
    for cn = 1:n1+1
        % cn:the natural "column" index of a node in 2D mesh 
        for rn = 1:n2+1
            % rn:the natural "row" index of a node in 2D mesh
            Pb(1,(cn-1)*(n2+1)+rn)=(cn-1)*h1+left_bottom(1);
            Pb(2,(cn-1)*(n2+1)+rn)=(rn-1)*h2+left_bottom(2);
        end
    end

    Tb=zeros(3,2*n1*n2);
    for ce=1:n1
        for re=1:n2
            Tb(:,2*(ce-1)*n2+2*re-1)=[(ce-1)*(n2+1)+re;ce*(n2+1)+re;(ce-1)*(n2+1)+re+1];
            Tb(:,2*(ce-1)*n2+2*re)=[(ce-1)*(n2+1)+re+1;ce*(n2+1)+re;ce*(n2+1)+re+1];   
        end
    end
elseif basis_type == 202
    Pb=zeros(2,(2*n1+1)*(2*n2+1));
    h1=(right_top(1)-left_bottom(1))/n1/2;
    % h1: mesh size of n1 uniform partition in x-axis
    h2=(right_top(2)-left_bottom(2))/n2/2;
    % h2: mesh size of n2 uniform partition in y-axis
    for cn = 1:2*n1+1
        % cn:the natural "column" index of a node in 2D mesh 
        for rn = 1:2*n2+1
            % rn:the natural "row" index of a node in 2D mesh
            Pb(1,(cn-1)*(2*n2+1)+rn)=(cn-1)*h1+left_bottom(1);
            Pb(2,(cn-1)*(2*n2+1)+rn)=(rn-1)*h2+left_bottom(2);
        end
    end
    Tb=zeros(6,2*n1*n2);
    for ce=1:n1
        for re=1:n2
            Tb(:,2*(ce-1)*n2+2*re-1)=[2*(ce-1)*(2*n2+1)+2*(re-1)+1;2*ce*(2*n2+1)+2*(re-1)+1;2*(ce-1)*(2*n2+1)+2*(re-1)+3; ...
                                      (2*(ce-1)+1)*(2*n2+1)+2*(re-1)+1;(2*(ce-1)+1)*(2*n2+1)+2*(re-1)+2;2*(ce-1)*(2*n2+1)+2*(re-1)+2];
            Tb(:,2*(ce-1)*n2+2*re)=[2*(ce-1)*(2*n2+1)+2*(re-1)+3;2*ce*(2*n2+1)+2*(re-1)+1;2*ce*(2*n2+1)+2*(re-1)+3; ...
                                    (2*(ce-1)+1)*(2*n2+1)+2*(re-1)+2;2*ce*(2*n2+1)+2*(re-1)+2;(2*(ce-1)+1)*(2*n2+1)+2*(re-1)+3];   
        end
    end
end
