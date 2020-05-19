function [v1, v2] = jtv(f1,f2, beta)
%Joint TV regulization, output is the gradient descending direction
%  f is [x, y, 2] images
%  beta is the parameter account for sigularity
%  v1, v2 are the gradient for each channel
     

% minimise sum{s,t} sqrt(|TV(x1(s,t))|.^2 + |TV(x2(s,t))|.^2)


% tv (squared value) of indivisual channel
tv1 = tv(f1);
tv2 = tv(f2);

% sum of tv
tv_t = tv1 + tv2 + beta.^2;

%grad_tv1 = tv_grad(f1);
%grad_tv2 = tv_grad(f2);

%something si wrong here, not used for now
%p1 = 1./sqrt(tv_t);
%v1 = sqrt(tv1)*p1.*grad_tv1;
%v2 = sqrt(tv2)*p1.*grad_tv2;

% the right gradient
p1 = sqrt(tv1)./sqrt(tv_t);
p2 = sqrt(tv2)./sqrt(tv_t);
v1 = p1.*tv_grad(f1);
v2 = p2.*tv_grad(f2);

%no need to normalise here
%v1 = v1/norm(v1(:));
%v2 = v2/norm(v2(:));

%%this will be the same as the non joint tv
%v1 = grad_tv1;
%v2 = grad_tv2;






