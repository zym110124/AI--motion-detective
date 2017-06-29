clear all;
close all;
a=imread('m1.bmp');
b=imread('m18.bmp');
c=b-a;           %两个图片做减法
ex=rgb2gray(c);  %将图片转换成灰度图
bw1=im2bw(ex,0.2);   %图像二值化，阈值是0.4
figure(1)
subplot(2,2,1);
imshow(b);title('含有运动目标图像')
subplot(2,2,2);
imshow(c);title('差分图像')
subplot(2,2,3);
imshow(ex);title('灰度图像');
subplot(2,2,4);
imshow(bw1);title('二值图像')

SE=strel('square',3); %设置机构元
bw2=imerode(bw1,SE);  %腐蚀处理
SE=strel('square',13); %设置结构元
bw3=imdilate(bw2,SE);  %膨胀处理
bw4=bwperim(bw3,8);   %提取边缘
 [m,n]=size(bw4);
bw4=uint8(bw4);  %转换成8位
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
imshow(temp);title('运动目标区域')
figure(4)
subplot(2,2,1);
imshow(bw1);title('二值图像')
subplot(2,2,2);
imshow(bw2);title('腐蚀处理')
subplot(2,2,3);
imshow(bw3);title('膨胀处理')
subplot(2,2,4);
imshow(temp);title('运动目标区域')

x=imadd(b,temp,'uint8');
figure(3)
imshow(x);title('运动目标检测结果图')



