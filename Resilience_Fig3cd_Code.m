
load TC_freq_fig3.mat

[D.Lon] = D.X; D = orderfields(D,[1:2,12,3:11]); D = rmfield(D,'X');
[D.Lat] = D.Y; D = orderfields(D,[1:3,12,4:11]); D = rmfield(D,'Y');
[S_map.Lon] = S_map.X; S_map = orderfields(S_map,[1:2,14,3:13]); S_map = rmfield(S_map,'X');
[S_map.Lat] = S_map.Y; S_map = orderfields(S_map,[1:3,14,4:13]); S_map = rmfield(S_map,'Y');

temp_color = pink(256);
saturation_factor = 0.6;
hsv_color = rgb2hsv(temp_color);
hsv_color(:,2) = hsv_color(:,2) * saturation_factor;
temp_color = hsv2rgb(hsv_color);

worldmap([15,50],[-110 -65]);
setm(gca, 'Frame', 'off');
mlabel off; plabel off; gridm off



figure(1)
D_map = D;
for i = 1:length(D_map)
	if length(find(state_list == str2num(D_map(i).STATEFP)))>0

		geoshow(D_map(i),'facecolor',temp_color(freq_color245(i),:),'edgecolor',[0.3,0.3,0.3]);
		hold on
	end
end

for i = 1:length(S_map)
	if length(find(state_list == str2num(S_map(i).STATEFP)))>0
		geoshow(S_map(i),'facecolor','r','facealpha',0,'edgecolor',[0,0,0],'LineWidth',1.2);
		temp_loc(1) =  nanmean(S_map(i).Lon);
		temp_loc(2) =  nanmean(S_map(i).Lat);
        %textm(temp_loc(2),temp_loc(1),S_map(i).STUSPS,'fontsize',17)
        hold on
	end
end

hold off

figure(2)
for i = 1:length(D_map)
	if length(find(state_list == str2num(D_map(i).STATEFP)))>0

		geoshow(D_map(i),'facecolor',temp_color(freq_color585(i),:),'edgecolor',[0.3,0.3,0.3]);
		hold on
	end
end

for i = 1:length(S_map)
	if length(find(state_list == str2num(S_map(i).STATEFP)))>0
		geoshow(S_map(i),'facecolor','r','facealpha',0,'edgecolor',[0,0,0],'LineWidth',1.2);
		temp_loc(1) =  nanmean(S_map(i).Lon);
		temp_loc(2) =  nanmean(S_map(i).Lat);
        %textm(temp_loc(2),temp_loc(1),S_map(i).STUSPS,'fontsize',17)
        hold on
	end
end