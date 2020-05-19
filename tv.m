function v = tv(f)
%Calculate the total variance of a 2D image, not sqaure root
[s1,s2]=size(f);
%extend
fe=[zeros(1,s2+2);[zeros(s1,1) f zeros(s1,1)];zeros(1,s2+2)];

tv_x = (f-fe(1:s1,2:s2+1)).^2;
tv_y = (f-fe(2:s1+1,1:s2)).^2;

v = tv_x + tv_y;
end

