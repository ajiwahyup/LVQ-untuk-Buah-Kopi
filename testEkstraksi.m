g = imread('cd');   % Lokasi file image

red=mean(mean(g(:,:,1)));   %Mean R
green=mean(mean(g(:,:,2))); %Mean G
blue=mean(mean(g(:,:,3)));  %Mean B