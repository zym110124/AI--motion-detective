mov=VideoReader('jiaotong.avi');  %��ȡ��Ƶ�ļ�
for i=1:mov.numberofframes
    b=read(mov,i)
    imwrite(b,strcat('m', int2str(i),'.bmp'),'bmp')  %��ÿ֡����ΪͼƬ�ļ�
end;
