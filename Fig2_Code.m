load HurricaneEvents_Outage.mat

test_color = colormap(turbo(11));
saturation_factor = 0.6;
hsv_color = rgb2hsv(test_color);
hsv_color(:,2) = hsv_color(:,2) * saturation_factor;
test_color = hsv2rgb(hsv_color);



worldmap([15,50],[-110 -65]);
setm(gca, 'Frame', 'off');
mlabel off; plabel off; gridm off

for i = 1:length(D)
    %if length(find(FIPS_idx == i))>0
    temp_idx1 = find(Power_Rec(:,1) == FIPS(i));
	if Power_Rec(temp_idx1,13) > 0.02
		if length(find(state_list == floor(Power_Rec(temp_idx1,1)/1000)))>0
			color_idx = Power_Rec(temp_idx1,14);
			geoshow(D(i),'facecolor',test_color(color_idx,:),'edgecolor',[0.3,0.3,0.3],'LineWidth',0.3);
			hold on
		end
    end
    %end
end

for i = 1:length(D)
    %if length(find(FIPS_idx == i))>0
	if length(find(state_list == str2num(D(i).STATEFP)))>0
		geoshow(D(i),'facecolor','r','facealpha',0,'edgecolor',[0.3,0.3,0.3],'LineWidth',0.3);
		hold on
    end
    %end
end

for i = 1:length(S_map)
	if length(find(state_list == str2num(S_map(i).STATEFP)))>0
		geoshow(S_map(i),'facecolor','r','facealpha',0,'edgecolor',[0,0,0],'LineWidth',1.2);
		temp_loc(1) =  nanmean(S_map(i).Lon);
		temp_loc(2) =  nanmean(S_map(i).Lat);

		textm(temp_loc(2),temp_loc(1),S_map(i).STUSPS,'fontsize',17)
		hold on
	end
end


for i = 1:11
     geoshow(track_hurricane{i}(:,1),-track_hurricane{i}(:,2),'color',test_color(i,:),'LineWidth',2)
     hold on
end