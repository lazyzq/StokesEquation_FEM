function [Gauss_Pt_Line,Gauss_weights] = Gen_Gauss_Pt_Line(vertices,type)
if type == 1
    A1 = vertices(:,1);
    A2 = vertices(:,2);
    Gauss_Pt = [-0.9061798459,-0.5384693101,0,0.5384693101,0.9061798459]';
 
    Gauss_Pt_Line = [(A2(1)-A1(1))/2,(A2(2)-A1(2))/2].*Gauss_Pt+[(A2(1)+A1(1))/2,(A2(2)+A1(2))/2];
    Gauss_Pt_Line = Gauss_Pt_Line';
    Gauss_weights = [0.2369268851,0.4786286705,0.568888889,0.4786286705,0.2369268851];
else
    warning 'wrong Gauss type'
end

