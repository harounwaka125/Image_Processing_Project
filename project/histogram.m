function [histo]= histogram(img)
img=RGB2GRAY(img,1);
 [H ,W]=size(img);    
 histo=zeros(256,1);
for i=1:H
   for j=1:W
       for r=1:256
           if img(i,j)==r-1
            histo(r)=histo(r)+1;
           end            
       end
   end
end
histo=uint8(histo);
end
