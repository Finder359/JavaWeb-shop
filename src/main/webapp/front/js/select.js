$.fn.selectDate = function(){
			var znn_minYear = 1900
			var znn_maxYear = (new Date).getFullYear()
			var znn_yearSel = document.getElementById('year')
			var znn_monthSel = document.getElementById('month')
			var znn_daySel = document.getElementById('days')
	
			for(var y = znn_maxYear;y >= znn_minYear;y--){
				var yearOpt = document.createElement('option')
				yearOpt.value = y
				yearOpt.innerHTML = y+'年'
				znn_yearSel.appendChild(yearOpt)
			}

			$("#year").click(function(event){
				if(!$("#year option:selected").val()) return;
				removeOption(znn_monthSel)
				addOption(12,'月',znn_monthSel)
				removeOption(znn_daySel)
			})

			$("#month").click(function(){
				removeOption(znn_daySel)
				var year = $("#year option:selected").val()
				var month = $("#month option:selected").val()
				if(month==1 || month==3 || month==5 || month==7 || month==8 || month==10 || month==12){
					addOption(31,'日',znn_daySel)
				}else if(month==4 || month==6 || month==9 || month==11){
					addOption(30,'日',znn_daySel)
				}else if(month==2){
					if((year%4 == 0 && year%100 != 0 ) || (year%400 == 0)){
						addOption(29,'日',znn_daySel)
					}else{	
						addOption(28,'日',znn_daySel)
					}
				} 
			})

			function addOption(num,unit,parent){
				//num：选项个数
				//unit：单位（年/月/日）
				//parent：父对象
				for(var index=1;index <= num;index++){
					var opt =document.createElement('option')
					$(opt).attr('value',index)
					if(index<10){index = '0'+index}
					$(opt).html(index+unit)
					$(parent).append(opt)
				}
			}
			
			function removeOption(parent){
				//parent：父对象
				var options = $(parent).find('option')
				for(var index = 1;index < options.length;index++){
					parent.removeChild(options[index])
				}
			}
		}