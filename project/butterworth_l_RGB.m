function  [ni]=butterworth_l_RGB( RGB,d0 ,n)
%figure,imshow(RGB),title('orignal');
R1=butterworth_low(RGB(:,:,1),d0,n );
G1=butterworth_low(RGB(:,:,2),d0 ,n);
B1=butterworth_low(RGB(:,:,3),d0 ,n);
ni=cat(3,uint8(R1),uint8(G1),uint8(B1));
imshow(ni);
end