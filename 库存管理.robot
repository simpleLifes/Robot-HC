*** Settings ***
Library           Selenium2Library
Library           MyLibrary
Resource          HCkeywords.txt		  

*** Test Cases ***
库存管理-排期预定新增
    [Tags]    zhongming    
    登录
    库存管理
    go to    http://tinneradx.ad.cmvideo.cn:18088/index.php/gnome_admin/schedule/schedule/add			#进入新增页面
    Wait Until Element Contains			css=#select2-advertiser_select-container		 	请选择			10	 
    click element    id=select2-advertiser_select-container					#点击广告位下拉框
    Wait Until Element Contains			xpath=/html/body/span/span/span[2]		zm			10
    input text    xpath=/html/body/span/span/span[1]/input    zhong			#输入广告位名称
    Wait Until Element Contains			xpath=//*[@id="select2-advertiser_select-results"]		zhong			10
    click element    xpath=/html/body/span/span/span[2]/ul/li				#点击选择广告主	
    click element    id=start_date				#点击选择排期时间
    select frame    css=iframe[style="width: 186px; height: 198px;"][src="http://tinneradx.ad.cmvideo.cn:18088/js/gnome_admin/DatePicker/My97DatePicker.html"]		#进入iframe框架
    click element    id=dpOkInput				#点击确定选定时间
    Unselect Frame								#退出iframe框架	
    click element    id=end_date				#点击选择结束时间
	wait2
    select frame    css=iframe[style="width: 186px; height: 198px;"][src="http://tinneradx.ad.cmvideo.cn:18088/js/gnome_admin/DatePicker/My97DatePicker.html"]
	click element    id=dpOkInput				#确定结束时间
    Unselect Frame								#退出iframe框架
    click element    id=sel_adunit				#选择广告位
    wait until element contains 		css=div[class="tree-content content-left tree"]			 	咪咕音乐			10
    input text    xpath=//*[@id="search_adunit_wrap"]/div[1]/div[1]/input    15921			#选择广告位
    wait2
    click element    xpath=//*[@id="search_adunit_wrap"]/div[1]/div[1]/a
    wait until element contains			css=div[id="_easyui_tree_103"][class="tree-node"]				15921-咪咕音乐-zm_自用广告位-原生广告-开屏				10
    click element    xpath=//span[text()='咪咕音乐']
    click element    xpath=//button[text()='确定']
    wait until element contains			css=td[class="adunit-name op icon-edit"][title="咪咕音乐-zm_自用广告位-原生广告-开屏"]			  咪咕音乐-zm_自用广告位-原生广告-开屏			10
    click element    xpath=//*[@id="blocked_schedule_set_table"]/div[2]/div[1]/table/tbody/tr/td[7]/select
    wait2
    Mouse Over    xpath=//table[@id="schedule_set_table"]/tbody/tr/td[20]/img
    Set Focus To Element    xpath=//table[@id="schedule_set_table"]/tbody/tr/td[20]/img
    wait2
    click element    xpath=//table[@id="schedule_set_table"]/tbody/tr/td[20]/img
    wait2
    input text    xpath=/html/body/div[1]/div/table/tbody/tr[2]/td[2]/div/table/tbody/tr[2]/td[2]/div/div/div[1]/table/tbody/tr/td[2]/input    10000
    wait2
    Clear Element Text    xpath=/html/body/div[1]/div/table/tbody/tr[2]/td[2]/div/table/tbody/tr[2]/td[2]/div/div/div[1]/table/tbody/tr/td[3]/input
    wait2
    input text    xpath=/html/body/div[1]/div/table/tbody/tr[2]/td[2]/div/table/tbody/tr[2]/td[2]/div/div/div[1]/table/tbody/tr/td[3]/input    10000
    wait2
    click element    xpath=//*[@id="label_0"]/img
    wait2
    click element    xpath=//*[text()='全选']
    wait2
    click element    xpath=/html/body/div[1]/div/table/tbody/tr[2]/td[2]/div/table/tbody/tr[2]/td[2]/div/div/p/span[2]
	sleep			 1
    click element    xpath=/html/body/div[1]/div/table/tbody/tr[2]/td[2]/div/table/tbody/tr[3]/td/div/button[1]
    wait2
    click element    id=submit
    wait2
    click element    xpath=/html/body/div[1]/div/table/tbody/tr[2]/td[2]/div/table/tbody/tr[3]/td/div/button
	wait2
    [Teardown]    Selenium2Library.Close Browser

库存管理-编辑
    [Tags]    zhongming
    登录
    库存管理
    Wait Until Element Is Visible    xpath=//*[@id="data_list"]/tr[1]/td[13]/a[2]    10
    click element    xpath=//*[@id="data_list"]/tr[1]/td[13]/a[2]
    Clear Element Text    xpath=//*[@id="operate_wrapper"]/div[1]/div[2]/div[1]/div/p/input
    wait2
    input text    xpath=//*[@id="operate_wrapper"]/div[1]/div[2]/div[1]/div/p/input    zhongming-guang-验证编辑功能
    click element    xpath=//*[@id="submit"]
    wait until element contains			css=button[class="aui_state_highlight"][type="button"]			确定			10
    click element    xpath=/html/body/div[1]/div/table/tbody/tr[2]/td[2]/div/table/tbody/tr[3]/td/div/button
    wait until element contains			xpath=//*[@id="data_list"]/tr[1]/td[2]				zhongming-guang-验证编辑功能			20	
    ${name}    get text    xpath=//*[@id="data_list"]/tr[1]/td[2]
    run keyword if    '${name}'=='zhongming-guang-验证编辑功能'    log    编辑成功
    ...    ELSE    log    编辑失败
	[Teardown]    Selenium2Library.Close Browser

库存管理-排期预定查询
    [Tags]    zhongming
    登录
    库存管理
    wait until element contains			css=#data_list			zhongm-guang			10
    input text    id=keywords    zhongm-guang
    click element    xpath=//*[@id="page_content"]/div[3]/div[2]/table/tbody/tr[2]/th/a
	wait until element contains			xpath=//*[@id="data_list"]/tr[1]/td[2]			zhongm-guang			10
    ${count}    get element count    xpath=//*[@id="data_list"]/tr
    log    总共：${count}条数据
    : FOR    ${n}    IN RANGE    1    ${count+1}
    \    ${list}    get text    xpath=//*[@id="data_list"]/tr[${n}]
    \    log    ${list}
	[Teardown]    Selenium2Library.Close Browser

库存管理-排期预定下单
    [Tags]    zhongming
    登录
    库存管理
    Wait Until Element Is Visible       xpath=//*[@id="data_list"]/tr[1]/td[13]/a[2]    	20
	${statuold}    get text    xpath=//*[@id="data_list"]/tr[1]/td[12]/span
	run keyword if 		'${statuold}'=='已下单'			log			状态已更改为：已下单
    ...		ELSE		下单
	[Teardown]    Selenium2Library.Close Browser


库存管理-排期预定删除
    [Tags]    zhongming
    登录
    库存管理
    wait2
    input text    id=keywords    zhongm-guang
    wait2
    click element    xpath=//*[@id="page_content"]/div[3]/div[2]/table/tbody/tr[2]/th/a
	Wait Until Element Is Visible				css=a[class="link-text del"][href="javascript:void(null)"]				10
	click element 			 css=a[class="link-text del"][href="javascript:void(null)"]
	wait until element contains				css=button[class="aui_state_highlight"][type="button"]			  确定		10
	click element			 css=button[class="aui_state_highlight"][type="button"]	
    ${status}    get text    xpath=//*[@id="data_list"]/tr[1]/td[12]/span
    run keyword if    '${status}'=='已下单'		log	    库存管理删除
    ...    ELSE    log   不能删除
    [Teardown]    Selenium2Library.Close Browser

*** Keywords ***
下单
	click element    xpath=//*[@id="data_list"]/tr[1]/td[13]/a[text()='下单']					#点击下单按扭
	wait2
	click element			css=button[class="aui_state_highlight"][type="button"]				#确定下单			
	Wait Until Element Is Visible	    xpath= //*[@id="data_list"]/tr[1]/td[12]		10		
    ${statu}    get text    xpath=//*[@id="data_list"]/tr[1]/td[12]/span
    run keyword if    '${statu}'=='已下单'    下单
    ...    ELSE    log    状态为：${statu},不能更改状态
wait2
	sleep			 2

