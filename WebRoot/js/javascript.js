function xiala(){
	//动态下拉菜单
	var menu = $("#nav2 li");
	menu.each(function(i){
		if($(this).children().is("ul")){
			$(this).css("background","url(images/right.png) 13px right no-repeat");
			$(this).mouseover(function(){
				$(this).children("ul").show();	
			});
			$(this).mouseout(function(){
				$(this).children("ul").hide("");	
			});	
		}
	});
}