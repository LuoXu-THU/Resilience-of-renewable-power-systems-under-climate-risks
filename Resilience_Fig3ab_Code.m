load Heatwave_freq_Fig3ab.mat



[D_map.Lon] = D_map.X; D_map = orderfields(D_map,[1:2,12,3:11]); D_map = rmfield(D_map,'X');
[D_map.Lat] = D_map.Y; D_map = orderfields(D_map,[1:3,12,4:11]); D_map = rmfield(D_map,'Y');
[S_map.Lon] = S_map.X; S_map = orderfields(S_map,[1:2,14,3:13]); S_map = rmfield(S_map,'X');
[S_map.Lat] = S_map.Y; S_map = orderfields(S_map,[1:3,14,4:13]); S_map = rmfield(S_map,'Y');

temp_color = copper(256);
saturation_factor = 0.8;
hsv_color = rgb2hsv(temp_color);
hsv_color(:,2) = hsv_color(:,2) * saturation_factor;
temp_color = hsv2rgb(hsv_color);
temp_color = temp_color(:,[1,1,2]);
%figure('Renderer', 'painters', 'Position', [10 10 850 550])


temp_color = hot(256)
hsv_values = rgb2hsv(temp_color);


hsv_values(:, 2) = hsv_values(:, 2) * 0.5;


modified_color = hsv2rgb(hsv_values);
temp_color = modified_color;


state_list = [48 22 28 01 13 45 37 51 24 10 34 09 25 33 23 50 36 42 54 21 47 05 40 72 12];

worldmap([15,50],[-110 -65]);
setm(gca, 'Frame', 'off');
mlabel off; plabel off; gridm off

figure(1)
for i = 1:length(D_map)
	if length(find(state_list == str2num(D_map(i).STATEFP)))>0

		geoshow(D_map(i),'facecolor',temp_color(freq_color245(i),:),'edgecolor',[0.3,0.3,0.3]);
		hold on

	end
end

for i = 1:length(S_map)
	if length(find(state_list == str2num(S_map(i).STATEFP)))>0
		geoshow(S_map(i),'facecolor','r','facealpha',0,'edgecolor',[0.3,0.3,0.3],'LineWidth',1.2);
		temp_loc(1) =  nanmean(S_map(i).Lon);
		temp_loc(2) =  nanmean(S_map(i).Lat);

		textm(temp_loc(2),temp_loc(1),S_map(i).STUSPS,'fontsize',17)
		hold on
	end
end



figure(2)
for i = 1:length(D_map)
	if length(find(state_list == str2num(D_map(i).STATEFP)))>0

		geoshow(D_map(i),'facecolor',temp_color(freq_color585(i),:),'edgecolor',[0.3,0.3,0.3]);
		hold on

	end
end

for i = 1:length(S_map)
	if length(find(state_list == str2num(S_map(i).STATEFP)))>0
		geoshow(S_map(i),'facecolor','r','facealpha',0,'edgecolor',[0.3,0.3,0.3],'LineWidth',1.2);
		temp_loc(1) =  nanmean(S_map(i).Lon);
		temp_loc(2) =  nanmean(S_map(i).Lat);

		textm(temp_loc(2),temp_loc(1),S_map(i).STUSPS,'fontsize',17)
		hold on
	end
end




