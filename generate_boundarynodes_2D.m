function boundarynodes = generate_boundarynodes_2D(n1,n2,boundary_type,basis_type)
% generate_boundarynodes_2D 生成n1（横向）*n2（纵向）矩形单元的边界节点
% Input n1:横向单元总数 n2:纵向单元总数
% Output  

if basis_type == 201
    boundarynodes = zeros(2,n1*2+n2*2);
    if boundary_type == -1
        boundarynodes(1,:) = -1*ones(1,size(boundarynodes,2));
        boundarynodes(2,1:n1) = linspace(1,1+(n1-1)*(n2+1),n1);
        boundarynodes(2,n1+1:n1+n2) = linspace(1+n1*(n2+1),1+n1*(n2+1)+n2-1,n2);
        boundarynodes(2,n1+n2+1:n1+n2+n1) = linspace(1+n1*(n2+1)+n2,2*(n2+1),n1);
        boundarynodes(2,n1+n2+n1+1:n1+n2+n1+n2) = linspace(n2+1,2,n2);
    end
elseif basis_type == 202
    if boundary_type == -1
        boundarynodes = generate_boundarynodes_2D(2*n1,2*n2,boundary_type,201);
    end
end

