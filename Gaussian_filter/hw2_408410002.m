clear all
close all

photo = im2double(imread('柴犬飛飛.jpg'));
[m,n,c]=size(photo);
G=fspecial('gaussian',3,1);
Gh7=fspecial('gaussian',7,1);
Gh13=fspecial('gaussian',13,1);
Gs30=fspecial('gaussian',3,30);
Gs100=fspecial('gaussian',3,100);
edge = [-1 -1 -1; -1 8 -1; -1 -1 -1];
unsharp = [0 0 0; 0 2 0; 0 0 0] - [0 1 0; 1 -3 1; 0 1 0];
PG=photo;
PGS30=photo;
PGS100=photo;
PGH7=photo;
PGH13=photo;
PE=photo;
PU=photo;
h13=zeros(m+12,n+12,3);
h13(7:m+6,7:n+6,1:3)=photo;
h7=zeros(m+6,n+6,3);
h7(4:m+3,4:n+3,1:3)=photo;
h3=zeros(m+2,n+2,3);
h3(2:m+1,2:n+1,1:3)=photo;
for i = 1:m
    for j = 1:n
        PG(i,j,1)=sum(h3(i:i+2,j:j+2,1).*G,'all');
        PG(i,j,2)=sum(h3(i:i+2,j:j+2,2).*G,'all');
        PG(i,j,3)=sum(h3(i:i+2,j:j+2,3).*G,'all');
        PGS30(i,j,1)=sum(h3(i:i+2,j:j+2,1).*Gs30,'all');
        PGS30(i,j,2)=sum(h3(i:i+2,j:j+2,2).*Gs30,'all');
        PGS30(i,j,3)=sum(h3(i:i+2,j:j+2,3).*Gs30,'all');
        PGS100(i,j,1)=sum(h3(i:i+2,j:j+2,1).*Gs100,'all');
        PGS100(i,j,2)=sum(h3(i:i+2,j:j+2,2).*Gs100,'all');
        PGS100(i,j,3)=sum(h3(i:i+2,j:j+2,3).*Gs100,'all');
        PGH7(i,j,1)=sum(h7(i:i+6,j:j+6,1).*Gh7,'all');
        PGH7(i,j,2)=sum(h7(i:i+6,j:j+6,2).*Gh7,'all');
        PGH7(i,j,3)=sum(h7(i:i+6,j:j+6,3).*Gh7,'all');
        PGH13(i,j,1)=sum(h13(i:i+12,j:j+12,1).*Gh13,'all');
        PGH13(i,j,2)=sum(h13(i:i+12,j:j+12,2).*Gh13,'all');
        PGH13(i,j,3)=sum(h13(i:i+12,j:j+12,3).*Gh13,'all');
        PE(i,j,1)=sum(h3(i:i+2,j:j+2,1).*edge,'all');
        PE(i,j,2)=sum(h3(i:i+2,j:j+2,2).*edge,'all');
        PE(i,j,3)=sum(h3(i:i+2,j:j+2,3).*edge,'all');
        PU(i,j,1)=sum(h3(i:i+2,j:j+2,1).*unsharp,'all');
        PU(i,j,2)=sum(h3(i:i+2,j:j+2,2).*unsharp,'all');
        PU(i,j,3)=sum(h3(i:i+2,j:j+2,3).*unsharp,'all');
    end
end
% for i = 1:m
%     for j = 1:n
%         if (i==1) || (i==m) || (j==1) || (j==n)
%             if i==1
%                 if j==1
%                     PG(i,j)= photo(i,j)*G(2,2) + photo(i,j+1)*G(2,3) + photo(i+1,j)*G(3,2) + photo(i+1,j+1)*G(3,3) ;
%                     PGS30(i,j)= photo(i,j)*Gs30(2,2) + photo(i,j+1)*Gs30(2,3) + photo(i+1,j)*Gs30(3,2) + photo(i+1,j+1)*Gs30(3,3) ;
%                     PGS100(i,j)= photo(i,j)*Gs100(2,2) + photo(i,j+1)*Gs100(2,3) + photo(i+1,j)*Gs100(3,2) + photo(i+1,j+1)*Gs100(3,3) ;
%                 elseif j==n
%                     PG(i,j)= photo(i,j)*G(2,2) + photo(i,j-1)*G(2,1) + photo(i+1,j)*G(3,2) + photo(i+1,j-1)*G(3,1) ;
%                     PGS30(i,j)= photo(i,j)*Gs30(2,2) + photo(i,j-1)*Gs30(2,1) + photo(i+1,j)*Gs30(3,2) + photo(i+1,j-1)*Gs30(3,1) ;
%                     PGS100(i,j)= photo(i,j)*Gs100(2,2) + photo(i,j-1)*Gs100(2,1) + photo(i+1,j)*Gs100(3,2) + photo(i+1,j-1)*Gs100(3,1) ;
%                 else
%                     PG(i,j)= photo(i,j-1)*G(2,1) + photo(i,j)*G(2,2) + photo(i,j+1)*G(2,3) + photo(i+1,j-1)*G(3,1) + photo(i+1,j)*G(3,2) + photo(i+1,j+1)*G(3,3) ;
%                     PGS30(i,j)= photo(i,j-1)*Gs30(2,1) + photo(i,j)*Gs30(2,2) + photo(i,j+1)*Gs30(2,3) + photo(i+1,j-1)*Gs30(3,1) + photo(i+1,j)*Gs30(3,2) + photo(i+1,j+1)*Gs30(3,3) ;
%                     PGS100(i,j)= photo(i,j-1)*Gs100(2,1) + photo(i,j)*Gs100(2,2) + photo(i,j+1)*Gs100(2,3) + photo(i+1,j-1)*Gs100(3,1) + photo(i+1,j)*Gs100(3,2) + photo(i+1,j+1)*Gs100(3,3) ;
%                 end
%             elseif i==m
%                 if j==1
%                     PG(i,j)= photo(i,j)*G(2,2) + photo(i,j+1)*G(2,3) + photo(i-1,j)*G(1,2) + photo(i-1,j+1)*G(1,3) ;
%                     PGS30(i,j)= photo(i,j)*Gs30(2,2) + photo(i,j+1)*Gs30(2,3) + photo(i-1,j)*Gs30(1,2) + photo(i-1,j+1)*Gs30(1,3) ;
%                     PGS100(i,j)= photo(i,j)*Gs100(2,2) + photo(i,j+1)*Gs100(2,3) + photo(i-1,j)*Gs100(1,2) + photo(i-1,j+1)*Gs100(1,3) ;
%                 elseif j==n
%                     PG(i,j)= photo(i,j)*G(2,2) + photo(i,j-1)*G(2,1) + photo(i-1,j)*G(1,2) + photo(i-1,j-1)*G(1,1) ;
%                     PGS30(i,j)= photo(i,j)*Gs30(2,2) + photo(i,j-1)*Gs30(2,1) + photo(i-1,j)*Gs30(1,2) + photo(i-1,j-1)*Gs30(1,1) ;
%                     PGS100(i,j)= photo(i,j)*Gs100(2,2) + photo(i,j-1)*Gs100(2,1) + photo(i-1,j)*Gs100(1,2) + photo(i-1,j-1)*Gs100(1,1) ;
%                 else
%                     PG(i,j)= photo(i-1,j-1)*G(1,1) + photo(i-1,j)*G(1,2) + photo(i-1,j+1)*G(1,3) + photo(i,j-1)*G(2,1) + photo(i,j)*G(2,2) + photo(i,j+1)*G(2,3);
%                     PGS30(i,j)= photo(i-1,j-1)*Gs30(1,1) + photo(i-1,j)*Gs30(1,2) + photo(i-1,j+1)*Gs30(1,3) + photo(i,j-1)*Gs30(2,1) + photo(i,j)*Gs30(2,2) + photo(i,j+1)*Gs30(2,3);
%                     PGS100(i,j)= photo(i-1,j-1)*Gs100(1,1) + photo(i-1,j)*Gs100(1,2) + photo(i-1,j+1)*Gs100(1,3) + photo(i,j-1)*Gs100(2,1) + photo(i,j)*Gs100(2,2) + photo(i,j+1)*Gs100(2,3);
%                 end
%             elseif j==1
%             else
%             end
%         else
%             PG(i,j)= photo(i-1,j-1)*G(1,1) + photo(i-1,j)*G(1,2) + photo(i-1,j+1)*G(1,3) + photo(i,j-1)*G(2,1) + photo(i,j)*G(2,2) + photo(i,j+1)*G(2,3) + photo(i+1,j-1)*G(3,1) + photo(i+1,j)*G(3,2) + photo(i+1,j+1)*G(3,3) ;
%             PGS30(i,j)= photo(i-1,j-1)*Gs30(1,1) + photo(i-1,j)*Gs30(1,2) + photo(i-1,j+1)*Gs30(1,3) + photo(i,j-1)*Gs30(2,1) + photo(i,j)*Gs30(2,2) + photo(i,j+1)*Gs30(2,3) + photo(i+1,j-1)*Gs30(3,1) + photo(i+1,j)*Gs30(3,2) + photo(i+1,j+1)*Gs30(3,3) ;
%             PGS100(i,j)= photo(i-1,j-1)*Gs100(1,1) + photo(i-1,j)*Gs100(1,2) + photo(i-1,j+1)*Gs100(1,3) + photo(i,j-1)*Gs100(2,1) + photo(i,j)*Gs100(2,2) + photo(i,j+1)*Gs100(2,3) + photo(i+1,j-1)*Gs100(3,1) + photo(i+1,j)*Gs100(3,2) + photo(i+1,j+1)*Gs100(3,3) ;
%         end
%    end
% end
psnr1= psnr(PG,photo);
psnr2= psnr(PGH7,photo);
psnr3= psnr(PGH13,photo);
psnr4= psnr(PGS30,photo);
psnr5= psnr(PGS100,photo);
imwrite(PG,'a_1.jpg');
imwrite(PG,'b_1.jpg');
imwrite(PGS30,'b_2.jpg');
imwrite(PGS100,'b_3.jpg');
imwrite(PGH7,'a_2.jpg');
imwrite(PGH13,'a_3.jpg');
imwrite(PE,'d_edge.jpg');
imwrite(PU,'d_unsharp.jpg');
%imwrite(PT,'text.jpg');
disp(psnr1);
disp(psnr2);
disp(psnr3);
disp(psnr1);
disp(psnr4);
disp(psnr5);
fid=fopen(('psnr_result.txt'),'w+');
fprintf(fid,'a_1 and origin photo psnr is %d\n',psnr1);
fprintf(fid,'a_2 and origin photo psnr is %d\n',psnr2);
fprintf(fid,'a_3 and origin photo psnr is %d\n',psnr3);
fprintf(fid,'b_1 and origin photo psnr is %d\n',psnr1);
fprintf(fid,'b_2 and origin photo psnr is %d\n',psnr4);
fprintf(fid,'b_3 and origin photo psnr is %d\n',psnr5);
fclose(fid);
return