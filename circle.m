clear;
tic
%���ļ�������aΪ�����ļ�����ʽΪcell��
file=dir('D:\����\����\�������ݲɼ�\LJR\*.csv');
a=cell(1,12);
for i=1:12
    a{i}=zeros(12000,2);
end
for i=1:size(file,1)
     file_name=['D:\����\����\�������ݲɼ�\LJR\',file(i).name];
     file_data=csvread(file_name,7,1);
     a{i}=file_data;
end
% b=cell(1,12);
ecg_result=cell(1,12);
rsp_result=cell(1,12);
for data_number=1:12
 
  %����ʱ��ָ��Ϊ10
time_index_number=13;


%ȡ���г���ֵlength=12000
length=6000;
data_first_column=a{data_number}(1:length,1);%ȡecg�ź�
ecg_result{data_number}(1)=mean(data_first_column);%��ֵ
ecg_result{data_number}(2)=var(data_first_column);%����
ecg_result{data_number}(3)=std(data_first_column);%��׼��
ecg_result{data_number}(4)=max(data_first_column);%���ֵ
ecg_result{data_number}(5)=min(data_first_column);%��Сֵ
ecg_result{data_number}(6)=sum(data_first_column);%���
ecg_result{data_number}(7)=sum(abs(diff(data_first_column)))/(length-1);%һ�ײ��
ecg_result{data_number}(8)=sum(abs(diff(diff(data_first_column))))/(length-2);%���ײ��

%%%[PP1,LL1]=PL(data_first_column);%����ƽ�����ֵ���PP�͹ȹ�ֵ���LL
% tau1=zi_xiangguan(data_first_column);%����ʱ���ӳ�
% m1=cao(data_first_column,tau1);%����Ƕ��ά��

%%%
%     [rate,RR]=RRjianqi(data_first_column,100);
%     ecg_result{9}=RR;
%
ecg_result{data_number}(9)=skewness(data_first_column);% ƫ��
ecg_result{data_number}(10)= kurtosis(data_first_column);% ���
ecg_result{data_number}(11)=rms(data_first_column)/mean(abs(data_first_column))    ;% ��������
ecg_result{data_number}(12)=(max(data_first_column)-min(data_first_column))/mean(abs(data_first_column));%��ֵ����
ecg_result{data_number}(13)=sum(data_first_column.^4)/sqrt(sum(data_first_column.^2))	;%�Ͷ�����
[rate,RR]=RRjianqi(data_first_column,100);
ecg_result{data_number}(14)=RR;
% % pp1=round(RR);%PPֵȡ��
% %%%ecg_result{9}=lyapunov(data_first_column,length,m1,tau1,pp1);%����ŵ��ָ��
% 
% %%ȡecg�ź�
data_second_column=a{data_number}(1:length,2);
rsp_result{data_number}(1)=mean(data_second_column);%��ֵ
rsp_result{data_number}(2)=var(data_second_column);%����
rsp_result{data_number}(3)=std(data_second_column);%��׼��
rsp_result{data_number}(4)=max(data_second_column);%���ֵ
rsp_result{data_number}(5)=min(data_second_column);%��Сֵ
rsp_result{data_number}(6)=sum(data_second_column);%���
rsp_result{data_number}(7)=sum(abs(diff(data_second_column)))/(length-1);%һ�ײ��
rsp_result{data_number}(8)=sum(abs(diff(diff(data_second_column))))/(length-2);%���ײ��


% [rate,RR]=RRjianqi(data_first_column,100);
% ecg_result{9}=RR;
%
rsp_result{data_number}(9)=skewness(data_second_column);% ƫ��
rsp_result{data_number}(10)= kurtosis(data_second_column);% ���
rsp_result{data_number}(11)=rms(data_second_column)/mean(abs(data_second_column))    ;% ��������
rsp_result{data_number}(12)=(max(data_second_column)-min(data_second_column))/mean(abs(data_second_column));%��ֵ����
rsp_result{data_number}(13)=sum(data_second_column.^4)/sqrt(sum(data_second_column.^2))	;%�Ͷ�����
PP1=PL(data_second_column);
rsp_result{data_number}(14)=PP1;

end
ecg=[12,28];
for u=1:12
    ecg(u,1:14)=ecg_result{u};
    ecg(u,15:28)=rsp_result{u};
end