clear all;
close all;
a=imread('m1.bmp');
b=imread('m18.bmp');
c=b-a;           %����ͼƬ������
ex=rgb2gray(c);  %��ͼƬת���ɻҶ�ͼ
bw1=im2bw(ex,0.2);   %ͼ���ֵ������ֵ��0.4
figure(1)
subplot(2,2,1);
imshow(b);title('�����˶�Ŀ��ͼ��')
subplot(2,2,2);
imshow(c);title('���ͼ��')
subplot(2,2,3);
imshow(ex);title('�Ҷ�ͼ��');
subplot(2,2,4);
imshow(bw1);title('��ֵͼ��')

SE=strel('square',3); %���û���Ԫ
bw2=imerode(bw1,SE);  %��ʴ����
SE=strel('square',13); %���ýṹԪ
bw3=imdilate(bw2,SE);  %���ʹ���
bw4=bwperim(bw3,8);   %��ȡ��Ե
 [m,n]=size(bw4);
bw4=uint8(bw4);  %ת����8λ
for i = 1:m
    for j = 1:n
        if bw4(i,j)==1
            bw4(i,j)=255;
        end
    end
end
temp=zeros(m,n,3);
temp(:,:,1)=bw4;
temp(:,:,2)=bw4;
temp(:,:,3)=bw4;
figure(2)
temp = uint8(temp);
imshow(temp);title('�˶�Ŀ������')
figure(4)
subplot(2,2,1);
imshow(bw1);title('��ֵͼ��')
subplot(2,2,2);
imshow(bw2);title('��ʴ����')
subplot(2,2,3);
imshow(bw3);title('���ʹ���')
subplot(2,2,4);
imshow(temp);title('�˶�Ŀ������')

x=imadd(b,temp,'uint8');
figure(3)
imshow(x);title('�˶�Ŀ������ͼ')



