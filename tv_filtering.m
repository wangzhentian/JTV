% this is to compare the results with jtv_filtering, tv the channel
% indivisually
clear all;
close all;

I = double(imread('cameraman.tif'));
I = I./max(max(I));
J1 = imnoise(I,'gaussian',0,0.01);
J2 = imnoise(I,'gaussian',0,0.02);

%display window
win = [0 1];

figure;
subplot(221);
imshow(J1,win);
title('Image 1');
subplot(222);
imshow(J2,win);
title('Image 2');

% tv parameters
nIter = 42;  % num of iteration
e     = 1e-8; % anti singular eps
dt    = 1;    % relaxing factor


% error agaist groundtruth
err = zeros(nIter,2);

for ntv=1:nIter       
    ntv
    
    grad1 = tv_grad(J1);
    grad2 = tv_grad(J2);
    
    J1 = J1 - dt*grad1;
    J2 = J2 - dt*grad2;

    err(ntv,1) = sum(sum(((J1-I).^2)));
    err(ntv,2) = sum(sum(((J2-I).^2)));

end

% %try with version 1 tv regulizer
% J1 = tv_pan(J1,nIter,dt,1,e);
% J2 = tv_pan(J2,nIter,dt,1,e);

subplot(223);
imshow(J1,win);
title('Denoised Image 1');
subplot(224);
imshow(J2,win);
title('Denoised Image 2');

%plot convergence curve
figure;
plot(err(:,1));hold on;plot(err(:,2),'r');hold on;plot(sum(err,2),'g');
xlabel('Num of iteration');
ylabel('Error');
legend('Image 1','Image 2', 'Summed error');

