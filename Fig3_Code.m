load HeatwaveandTropicalCyclone_feq.mat

temp_color = pink(256);
saturation_factor = 0.6;
hsv_color = rgb2hsv(temp_color);
hsv_color(:,2) = hsv_color(:,2) * saturation_factor;
temp_color = hsv2rgb(hsv_color);

worldmap([15,50],[-110 -65]);
setm(gca, 'Frame', 'off');
mlabel off; plabel off; gridm off



D_map = D;
for i = 1:length(D_map)
	if length(find(state_list == str2num(D_map(i).STATEFP)))>0
	%if temp_dist(i)<2
		color_used = 257-(floor(max(min(test_rate_245(i),1),0)*255)+1);
		geoshow(D_map(i),'facecolor',temp_color(color_used,:),'edgecolor',[0.3,0.3,0.3]);
		hold on
	%end
	end
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
