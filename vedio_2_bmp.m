mov=VideoReader('jiaotong.avi');  %读取视频文件
for i=1:mov.numberofframes
    b=read(mov,i)
    imwrite(b,strcat('m', int2str(i),'.bmp'),'bmp')  %将每帧保存为图片文件
end;
