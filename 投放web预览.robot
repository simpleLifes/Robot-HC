*** Settings ***
Library           Selenium2Library
Library           MyLibrary
Resource          HCkeywords.txt

*** Test Cases ***
投放web预览-选择IP
    [Tags]    zhongming    
    登录
	wait until element is visible			css=#menu_723				10
    click element    xpath=//*[@id="menu_723"]			#进入小工具
	wait2
    click element    xpath=//*[@id="menu_category"]/div/div[3]/ul/li[4]/a		#进入投放web预览界面
    wait2
    web预览请求IP			#web预览输入关键字	
    ${status}	run keyword and return status	  Page should contain 		正在请求	#判断状态
	run keyword if 				'$status'=='True'			IP重新加载	
	wait2
    ${id}    get text    xpath=//*[@id="preview_result"]/div/div/ul
	wait2
    should contain    ${id}     43007	
	[Teardown]    Selenium2Library.Close Browser	

投放web预览-选择牌照方
    [Tags]    zhongming   
    登录
    click element    xpath=//*[@id="menu_723"]
	wait2
    click element    xpath=//*[@id="menu_category"]/div/div[3]/ul/li[4]/a
    wait2
    选择牌照方
	wait2
	${status}	 run keyword and return status	  Page should contain 	 正在请求
	run keyword if 		'${status}'=='True'		牌照方重新加载	
    ${code}    get text    xpath=//*[@id="preview_result"]/span[2]/pre/span[3]
	wait2
    should contain    ${code}    70200
	[Teardown]    Selenium2Library.Close Browser


投放web预览-imei设置
    [Tags]    zhongming		
    登录
    click element    xpath=//*[@id="menu_723"]
	wait2
    click element    xpath=//*[@id="menu_category"]/div/div[3]/ul/li[4]/a
    wait2
    选择imei
	${status}	 run keyword and return status	  Page should contain 	 正在请求
	run keyword if 		'${status}'=='True'		imei重新加载
    ${code}    get text    xpath=//*[@id="preview_result"]/span[2]/pre/span[3]
	wait2
    should contain    ${code}    70200
    wait2
    [Teardown]    Selenium2Library.Close Browser

投放web预览
    [Tags]    zhongming    
    登录
    click element    xpath=//*[@id="menu_723"]
	wait2
    click element    xpath=//*[@id="menu_category"]/div/div[3]/ul/li[4]/a
    wait2
    投放预览
	${status}	 run keyword and return status	  Page should contain 	 正在请求
	run keyword if 		'${status}'=='True'		预览重新加载		
    ${code}    get text    xpath=//*[@id="preview_result"]/span[2]/pre/span[3]
	wait2
    should contain    ${code}    70200
    [Teardown]    Selenium2Library.Close Browser

程序化订单报表优化-多天数据
    [Tags]    zhongming    
    登录
    数据报表
    click element    xpath=//*[@id="menu_category"]/div/div[3]/ul/li[3]/a			#进入运营
    wait2
    click element    css=a[href="/index.php/gnome_admin/bimanage/routinizationReport"]			#进入程序化订单报表
    wait2
    click element    xpath=//*[@id="double_date"]				#点击起止时间
    wait2
    select from list by value 	    	xpath=/html/body/div[6]/div[2]/div[1]/table/thead/tr[1]/th[2]/select[2]			 2019
	wait2
    select from list by value    		css=select[class="monthselect"]    		 	11
    wait2
    click element    css=td[data-title="r0c6"]
    click element    css=td[data-title="r5c1"]
    click element    css=button[class="applyBtn btn btn-sm btn-primary"][type="button"]
    click element    xpath=//*[@id="btn_search"]
    wait until element is visible 			xpath=//*[@id="data_body"]/tr[1]/td[1]			20
    ${choosetime}    get text    xpath=//*[@id="data_body"]/tr[1]/td[1]
    run keyword if    '${choosetime}'=='2019-12-09'    log    数据查询正确：${choosetime}
    ...    ELSE    log    数据查询123错误：${choosetime}
    wait2
    ${number}    get text    xpath=//*[@id="total_table"]/tr[2]/td[1]
    should contain    ${number}     59
	[Teardown]    Selenium2Library.Close Browser


投放城市报表优化-多天全部城市
    [Tags]    zhongming    
    登录
    数据报表
    click element    xpath=//*[@id="menu_category"]/div/div[1]/ul/li[2]/a				#进入投放报表
    wait2
    click element    css=a[href="/index.php/gnome_admin/bimanage/directDataReport/invest/city"]			#进入城市报表
    wait2
    click element    xpath=//*[@id="double_date"]				#点击选择起止时间
    wait2
	select from list by value			css=select[class="yearselect"]				2019			#选择时间
    select from list by value    		css=select[class="monthselect"]    			0
	wait2
    click element    css=td[data-title="r0c1"]		
    click element    css=td[data-title="r0c1"]
    click element    css=button[class="applyBtn btn btn-sm btn-primary"][type="button"]			#确定时间
    wait2
    click element    xpath=//*[@id="btn_search"]
    wait2
    ${imp}    get text    xpath=//*[@id="total_table"]/tr[2]/td[1]
    run keyword if    '${imp}'=='18'    log    	总曝光数：${imp}
    ...    ELSE    log    数据不正确
    wait2
    ${number}    get text    xpath=//*[@id="total_table"]/tr[2]/td[2]
    should contain    ${number}     548
	[Teardown]    Selenium2Library.Close Browser

投放省份报表优化-单天单独省份
    [Tags]    zhongming    
    登录
    数据报表
    click element    xpath=//*[@id="menu_category"]/div/div[1]/ul/li[2]/a
    wait2
    click element    css=a[href="/index.php/gnome_admin/bimanage/directDataReport/invest/province"]			#进入省份报表
    wait2
    click element    xpath=//*[@id="double_date"]			#点击时间
	wait2
    select from list by value			css=select[class="yearselect"]				2019
    select from list by value			css=select[class="monthselect"]				0
    sleep    2
    click element    css=td[data-title="r0c1"]			
    select from list by value			xpath=/html/body/div[6]/div[3]/div[1]/table/thead/tr[1]/th[2]/select[2]				2019			#select选取年份
    select from list by value			xpath=/html/body/div[6]/div[3]/div[1]/table/thead/tr[1]/th[2]/select[1]				11				#select选取月份
	click element 		xpath=/html/body/div[6]/div[3]/div[1]/table/tbody/tr[6]/td[2]		#确定时间
	click element		css=#btn_search		
	wait until element Is visible				xpath=//*[@id="total_table"]/tr[2]/td[1]				10
    ${imp}    get text    xpath=//*[@id="total_table"]/tr[2]/td[1]
    run keyword if    '${imp}'=='190'    log    曝光数据正确
    ...    ELSE    log    曝光数据错误
    ${number}    get text    xpath=//*[@id="total_table"]/tr[2]/td[2]
    should contain    ${number}     35
	[Teardown]    Selenium2Library.Close Browser

媒体城市报表优化-单天单独省份
    [Tags]    zhongming    
    登录
    数据报表
    click element    xpath=//*[@id="menu_category"]/div/div[1]/ul/li[1]/a		#进入媒体报表
    wait2
    click element    xpath=//*[@id="page_nav"]/ul/li[6]/a			#进入城市报表
    wait2
    click element    xpath=//*[@id="double_date"]
	wait2
    select from list by value		 css=select[class="yearselect"]				2019
	select from list by value		 css=select[class="monthselect"]			1
    click element    css=td[data-title="r0c4"]
    click element    css=td[data-title="r0c4"]
    click element    css=button[class="applyBtn btn btn-sm btn-primary"]					#确定时间
    wait2
    click element    xpath=//*[@id="city_id_mul"]/li/div/div[text()="全部"]
	wait2
	click element	 css=#_easyui_tree_825
	click element	 css=span[title="北京市[1156110000]"]
    click element    xpath=//*[@id="btn_search"]
    wait2
    ${city}    get text    css=td[key="CITY"]
    Should Contain    ${city}    北京市	
	[Teardown]    Selenium2Library.Close Browser  

媒体城市报表优化-多天单独省份
    [Tags]    zhongming    
    登录
    数据报表
	wait until element is visible			css=a[href="/index.php/gnome_admin/bimanage/mediaDataReport/index/whole"]			20
    click element    xpath=//*[@id="menu_category"]/div/div[1]/ul/li[1]/a		#进入媒体报表
    wait2
    click element    xpath=//*[@id="page_nav"]/ul/li[6]/a			#进入城市报表
    wait2
    click element    xpath=//*[@id="double_date"]
	wait2
    select from list by value		 css=select[class="yearselect"]				2019
	select from list by value		 css=select[class="monthselect"]			1
    click element    css=td[data-title="r0c4"]
    click element    css=td[data-title="r4c3"]
    click element    css=button[class="applyBtn btn btn-sm btn-primary"]					#确定时间
    wait2
    click element    xpath=//*[@id="city_id_mul"]/li/div/div[text()="全部"]
	wait2
	click element	 css=#_easyui_tree_825
	click element	 css=span[title="北京市[1156110000]"]
    click element    xpath=//*[@id="btn_search"]
    wait until element contains			css=td[key="PROVINCE"]				北京市			100
    ${city}    get text    css=td[key="PROVINCE"]
    Should Contain    ${city}    北京市	
	[Teardown]    Selenium2Library.Close Browser  

媒体省份报表优化-多天数据
    [Tags]    zhongming    
    登录
    数据报表
    click element    xpath=//*[@id="menu_category"]/div/div[1]/ul/li[1]/a		#进入媒体报表
    wait2
    click element    xpath=//*[@id="page_nav"]/ul/li[6]/a			#进入城市报表
    wait2
    click element    xpath=//*[@id="double_date"]
	wait2
    select from list by value		 css=select[class="yearselect"]				2019
	select from list by value		 css=select[class="monthselect"]			1
    click element    css=td[data-title="r0c4"]
    click element    css=td[data-title="r4c3"]
    click element    css=button[class="applyBtn btn btn-sm btn-primary"]					#确定时间
    wait2
    click element    xpath=//*[@id="city_id_mul"]/li/div/div[text()="全部"]
	wait2
	click element	 css=#_easyui_tree_825
	click element	 css=span[title="北京市[1156110000]"]
    click element    xpath=//*[@id="btn_search"]
    wait until element contains			css=td[key="PROVINCE"]				北京市			20    
	${time}			get text		xpath=//*[@id="data_body"]/tr[1]/td[1]
	should contain			${time}				2019-02-13
	${time2}		get text		xpath=//*[@id="data_body"]/tr[2]/td[1]
	should contain			${time2}			2019-02-24
	[Teardown]    Selenium2Library.Close Browser  

*** Keywords ***

wait2
	sleep			2
	
web预览请求IP
	click element    css=#select2-adunitid-container				#点击广告位名称
    input text    xpath=/html/body/span/span/span[1]/input    咪咕音乐-web预览zm1-原生广告-开屏			#输入广告位名称搜索
    wait until element contains			 css=li[class="select2-results__option select2-results__option--highlighted"][role="treeitem"][aria-selected="false"]				咪咕音乐-web预览zm1-原生广告-开屏				10			
    click element    css=li[class="select2-results__option select2-results__option--highlighted"][role="treeitem"][aria-selected="false"]
    click element    xpath=//*[@id="start_date"]  
	wait2
    Select Frame    css=iframe[src="http://tinneradx.ad.cmvideo.cn:18088/js/gnome_admin/DatePicker/My97DatePicker.html"]
    wait2
	click element    xpath=//*[@id="dpTime"]/table/tbody/tr[1]/td[1]/input[1]
    wait2
    click element    xpath=//*[@id="dpTime"]/div[1]/table/tbody/tr[4]/td[6]
    click element    xpath=//*[@id="dpOkInput"]
    Unselect Frame
    wait2
    input text    xpath=//*[@id="ip"]    1.2.2.1
    input text    xpath=//*[@id="device"]    imei1234567890
    wait2
    click element    xpath=//*[@id="ott_copy_right_id"]
    click element    xpath=//*[@id="ott_copy_right_id"]/option[2]
    click element    xpath=//*[@id="save"]

IP重新加载
	Reload Page
	web预览请求IP
选择牌照方
	click element    css=#select2-adunitid-container				#点击广告位名称
    input text    xpath=/html/body/span/span/span[1]/input    咪咕音乐-web预览zm1-原生广告-开屏			#输入广告位名称搜索
    wait until element contains			 css=li[class="select2-results__option select2-results__option--highlighted"][role="treeitem"][aria-selected="false"]				咪咕音乐-web预览zm1-原生广告-开屏				10			
    click element    css=li[class="select2-results__option select2-results__option--highlighted"][role="treeitem"][aria-selected="false"]
    click element    xpath=//*[@id="start_date"]  
    Select Frame    css=iframe[src="http://tinneradx.ad.cmvideo.cn:18088/js/gnome_admin/DatePicker/My97DatePicker.html"][frameborder="0"]
    wait2
	click element    xpath=//*[@id="dpTime"]/table/tbody/tr[1]/td[1]/input[1]
    wait2
    click element    xpath=//*[@id="dpTime"]/div[1]/table/tbody/tr[4]/td[6]
    click element    xpath=//*[@id="dpOkInput"]
    Unselect Frame
    wait2
    click element    xpath=//*[@id="select2-province-container"]
    click element    xpath=//*[@id="select2-province-results"]/li[2]
    input text    xpath=//*[@id="device"]    imei1234567890
    wait2
    click element    xpath=//*[@id="ott_copy_right_id"]
    click element    xpath=//*[@id="ott_copy_right_id"]/option[2]
    click element    xpath=//*[@id="save"]
	wait2

牌照方重新加载
	Reload Page
	选择牌照方
选择imei
	click element    css=#select2-adunitid-container				#点击广告位名称
    input text    xpath=/html/body/span/span/span[1]/input    咪咕音乐-web预览zm1-原生广告-开屏			#输入广告位名称搜索
    wait until element contains			 css=li[class="select2-results__option select2-results__option--highlighted"][role="treeitem"][aria-selected="false"]				咪咕音乐-web预览zm1-原生广告-开屏				10			
    click element    css=li[class="select2-results__option select2-results__option--highlighted"][role="treeitem"][aria-selected="false"]
    click element    xpath=//*[@id="start_date"]  
    Select Frame    css=iframe[src="http://tinneradx.ad.cmvideo.cn:18088/js/gnome_admin/DatePicker/My97DatePicker.html"][frameborder="0"]
    wait2
	click element    xpath=//*[@id="dpTime"]/table/tbody/tr[1]/td[1]/input[1]
    wait2
    click element    xpath=//*[@id="dpTime"]/div[1]/table/tbody/tr[4]/td[6]
    click element    xpath=//*[@id="dpOkInput"]
    Unselect Frame
    wait2
    click element    xpath=//*[@id="select2-province-container"]
    click element    xpath=//*[@id="select2-province-results"]/li[2]
    input text    xpath=//*[@id="device"]    imei1234567890
    click element    xpath=//*[@id="save"]
    sleep     5
imei重新加载
	Reload Page
	选择imei
投放预览
	click element    css=#select2-adunitid-container				#点击广告位名称
    input text    xpath=/html/body/span/span/span[1]/input    咪咕音乐-web预览zm1-原生广告-开屏			#输入广告位名称搜索
    wait until element contains			 css=li[class="select2-results__option select2-results__option--highlighted"][role="treeitem"][aria-selected="false"]				咪咕音乐-web预览zm1-原生广告-开屏				10			
    click element    css=li[class="select2-results__option select2-results__option--highlighted"][role="treeitem"][aria-selected="false"]
    click element    xpath=//*[@id="start_date"]  
    Select Frame    css=iframe[src="http://tinneradx.ad.cmvideo.cn:18088/js/gnome_admin/DatePicker/My97DatePicker.html"][frameborder="0"]
    wait2
	click element    xpath=//*[@id="dpTime"]/table/tbody/tr[1]/td[1]/input[1]
    wait2
    click element    xpath=//*[@id="dpTime"]/div[1]/table/tbody/tr[4]/td[6]
    click element    xpath=//*[@id="dpOkInput"]
    Unselect Frame
    wait2
    click element    xpath=//*[@id="select2-province-container"]
    click element    xpath=//*[@id="select2-province-results"]/li[2]
    click element    xpath=//*[@id="save"]
    sleep	  5
预览重新加载
	Reload page
	投放预览
