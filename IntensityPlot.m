clc

folders = {'18 hrs_cocl2', '18 hrs_control', '24 hrs_cocl2', '24 hrs_control','32 hrs_cocl2', '32 hrs_control'};
Intensity = zeros(16, length(folders));
for j = 1:length(folders)
    folder = folders{j};
    for i = 1:16
        name = fullfile(folder, [num2str(i) '.00 s.tif']);
        I = imread(name);
%         I= I(80:410,110:440,:);
        X = im2double(I(:,:,1));
        X_matrix = reshape(X, [], 3);
        new_matrix = imresize(X_matrix, [512 512]);
        average_X = mean(X(:));
        Intensity(i, j) = average_X;
    end
end

figure(1);

subplot(3,1,3);
plot(Intensity(:,1),'red', LineWidth=1.5,Marker="o");
hold on;
plot(Intensity(:,2),'blue', LineWidth=1.5,Marker="+");
% legend('cocl2', 'control');
title('18 Hours')
% ylabel('Average Intensity');
xlabel('Time','FontSize',15,'FontWeight','bold');

subplot(3,1,2);
plot(Intensity(:,3),'red', LineWidth=1.5,Marker="o");
hold on;
plot(Intensity(:,4),'blue', LineWidth=1.5,Marker="+");
% legend('cocl2', 'control');
title('24 Hours')
ylabel('Average Intensity','FontSize',15,'FontWeight','bold');

subplot(3,1,1);
plot(Intensity(:,5),'red', LineWidth=1.5,Marker="o");
hold on;
plot(Intensity(:,6),'blue', LineWidth=1.5,Marker="+");
legend('cocl2', 'control');
title('32 Hours')



