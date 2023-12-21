% For Making a Histogram Fig1(right) of Iteration Number in Example 1
clear;
close all;

%data=[13 10; 12 10;12 9];
data=[16 12; 16 11; 15 11];
bar(data,1);

xlabel ( 'Example 5.1', 'fontsize', 15, 'FontName', 'Times New Roman');
ylabel ( 'Iteration number', 'fontsize', 15, 'FontName', 'Times New Roman');
%axis([0 4 0 15]);                                
axis([0 4 0 18]);                               
%legend('BI1','BI1-OC','Square');                 
legend('BI2','BI2-OC','Square');                
set (gca, 'XTickLabel', { 'm=30', 'm=100','m=500'}, 'FontSize', 15, 'FontName', 'Times New Roman');
