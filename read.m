clear;
tic
%���ļ�������aΪ�����ļ�����ʽΪcell��
clear;
tic
%���ļ�������aΪ�����ļ�����ʽΪcell��
file=dir('D:\����\����\�������ݲɼ�\½���\*.csv');
a=cell(1,12);
for i=1:12
    a{i}=zeros(12000,2);
end
for i=1:size(file,1)
     file_name=['D:\����\����\�������ݲɼ�\½���\',file(i).name];
     file_data=csvread(file_name,7,1);
     a{i}=file_data;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for data_number=1:12
 
  %����ʱ��ָ��Ϊ10
time_index_number=10;
%������������
% time_index_name={'ƽ��ֵ', '����','��׼��','���ֵ','��Сֵ','���','һ�ײ��','���ײ��','RR����s','ƫ��','���'};
% %����ecg�źš�rsp�ź�result���飬����Ϊ��time_index)
ecg_result=cell(1,time_index_number);
rsp_result=cell(1,time_index_number);

%ȡ���г���ֵlength=12000
length=12000;
data_first_column=a{data_number}(1:length,1);%ȡecg�ź�
ecg_result{1}=mean(data_first_column);%��ֵ
ecg_result{2}=var(data_first_column);%����
ecg_result{3}=std(data_first_column);%��׼��
ecg_result{4}=max(data_first_column);%���ֵ
ecg_result{5}=min(data_first_column);%��Сֵ
ecg_result{6}=sum(data_first_column);%���
ecg_result{7}=sum(abs(diff(data_first_column)))/(length-1);%һ�ײ��
ecg_result{8}=sum(abs(diff(diff(data_first_column))))/(length-2);%���ײ��
ecg_result{9}=skewness(data_first_column);% ƫ��
ecg_result{10}= kurtosis(data_first_column);% ���




%%%[PP1,LL1]=PL(data_first_column);%����ƽ�����ֵ���PP�͹ȹ�ֵ���LL
% tau1=zi_xiangguan(data_first_column);%����ʱ���ӳ�
% m1=cao(data_first_column,tau1);%����Ƕ��ά��

%%%
%     [rate,RR]=RRjianqi(data_first_column,100);
%     ecg_result{9}=RR;
%

 
% pp1=round(RR);%PPֵȡ��
%%%ecg_result{9}=lyapunov(data_first_column,length,m1,tau1,pp1);%����ŵ��ָ��

%%ȡecg�ź�
data_second_column=a{data_number}(1:length,2);
rsp_result{1}=mean(data_second_column);%��ֵ
rsp_result{2}=var(data_second_column);%����
rsp_result{3}=std(data_second_column);%��׼��
rsp_result{4}=max(data_second_column);%���ֵ
rsp_result{5}=min(data_second_column);%��Сֵ
rsp_result{6}=sum(data_second_column);%���
rsp_result{7}=sum(abs(diff(data_second_column)))/(length-1);%һ�ײ��
rsp_result{8}=sum(abs(diff(diff(data_second_column))))/(length-2);%���ײ��


% [rate,RR]=RRjianqi(data_first_column,100);
% ecg_result{9}=RR;
%
rsp_result{9}=skewness(data_second_column);% ƫ��
rsp_result{10}= kurtosis(data_second_column);% ���
%
% PP2=PL(data_second_column);%����ƽ�����ֵ���PP
% tau2=zi_xiangguan(data_second_column);%����ʱ���ӳ�
% m2=cao(data_second_column,tau2);%����Ƕ��ά��
% pp2=round(PP2);%PPֵȡ��
%
% rsp_result{9}=lyapunov(data_second_column,length,m2,tau2,pp2);%����ŵ��ָ��
% %���ֵ

% rsp_result{9}=PP2;

txt_file_name=['D:\����\����\data\',file(data_number).name,'.txt'];
%%%%%%%%%%%%д����ֵ
fp = fopen(txt_file_name,'wt');
fprintf(fp,'%s','ecg');

for j=1:time_index_number
    
    fprintf(fp,'\r\n');
    fprintf(fp, '%s', time_index_name{j});
    fprintf(fp,'\r\n');
    fprintf(fp, '%g',ecg_result{j});
    fprintf(fp,'\r\n');
   
    
end
fprintf(fp,'%s','rsp');
fprintf(fp,'\r\n');

for k=1:time_index_number
  
%     fprintf(fp,'\r\n');
%     fprintf(fp, '%s', time_index_name{k});
%     fprintf(fp,'\r\n');
    fprintf(fp, '%g',rsp_result{k});
    fprintf(fp,'\r\n');
  
end
fclose(fp);
end
toc

    
%%%%%%%%%%%%






% %���ݵ���
% data=xlsread('E:\����\ԭʼ���� z����.xlsx',1)';
% %��ʼ��������
% [m,n]=size(data);
% D=[];
% DA=[];
% %�������
% for i=1:1:m
%     d=data(i,:)
%     d=d(~isnan(d));%ȥ��NANֵ 
%     ave=mean(d);%��ֵ
%     u=std(d);%��׼��
%     time=length(d);%ʱ��
%     theta=var(d);%����
%     area=sum(abs(d));%���
%     maxv=max(d);%���ֵ
%     minv=min(d);%��Сֵ
%     [dd,minp,maxp]=premnmx(d);  %�����Ϣ��
%     entropy=yyshang(dd,9);%��Ϣ��
%     D=[D;ave;maxv;minv;u;area;time;theta;entropy];
%     DA=[DA,D];
%     D=[];
% end
% DA=DA';
% 
% --------------------- 
% ���ߣ�Melo0705 
% ��Դ��CSDN 
% ԭ�ģ�https://blog.csdn.net/Melo0705/article/details/80888803 
% ��Ȩ����������Ϊ����ԭ�����£�ת���븽�ϲ������ӣ�
 
