*** Settings ***
Library           Selenium2Library
Library           MyLibrary
Resource          HCkeywords.txt

*** Test Cases ***
安卓-PD投放oaid黑名单验证
    [Tags]    zhongming
    登录
    click element    xpath=//*[@id="menu_736"]			#进入投放管理
    wait2
    click element    xpath=//*[@id="page_content"]/div[3]/div[1]/a[text()='新增投放']		#点击投放新增
    wait2
    click element    xpath=//*[@id="select2-advertiser_id-container"]
    input text    xpath=/html/body/span/span/span[1]/input    zhongm
    wait until element contains  		xpath=//*[@id="select2-advertiser_id-results"]/li			zhongm-guang			10
    click element    xpath=//*[@id="select2-advertiser_id-results"]/li	
    click element    xpath=//*[@id="select2-activity_id-container"]/span
    wait until element contains 			 xpath=//*[@id="select2-activity_id-results"]/li			zhong-ding			10
    click element    xpath=//*[@id="select2-activity_id-results"]/li
    ${radomename}    evaluate    random.uniform(1000000,9999999)    random					#随机投放名称
    input text    xpath=//*[@id="name"]    zm自动化-${radomename}
    wait2
    select from list by value    xpath=//*[@id="is_activity"]    5
    input text    xpath=//*[@id="search_adunit_wrap"]/div[1]/div[1]/input    17027			#输入广告位ID
    click element    xpath=//*[@id="search_adunit_wrap"]/div[1]/div[1]/a					#确定搜索
    wait until element contains				xpath=//*[@id="search_adunit_wrap"]/div[1]/div[2]/li/ul/li/div/span[5]				17027-咪咕音乐-zm-test1-原生广告-开屏				100
    click element    xpath=//*[@id="search_adunit_wrap"]/div[1]/div[2]/li/ul/li/div/span[5]				#选择广告位
	click element		xpath=//*[@id="invest_calendar"]/div/div[1]/div[1]/a[5]				#选择日期（全选）
    input text    xpath=//*[@id="impress_count"]    1000
    wait2
    input text    xpath=//*[@id="push_ratio"]    1000
	wait2
    click element    xpath=//*[@id="flow_set"]
    click element    css=a[class="submit btn-operate"][data-next="#/step2"][data-operator="new"]		#提交下一步
	wait until element contains				xpath=//*[@id="pd_creative_wrap"]/div/div[2]/p/span				DealID			20
    input text    	 css=input[class="info-input"][name="deal_id"]    		zmnative2		#输入dealid
    click element    xpath=//*[@id="pd_creative_wrap"]/div/div[3]/div/select				
    wait2
    click element    xpath=//*[@id="pd_creative_wrap"]/div/div[3]/div/select/option[text()='zm_dsp_native(可用)']			#选择投放平台名称
    input text    xpath=//*[@id="pd_price"]    100						#输入价格
    click element    xpath=//*[@id="step4"]/div[3]/div[2]/a[2]			#提交下一步
    wait until element is visible			css=input[data-tag-id="9"][type="button"][class="nav-btn"][value="设备ID"]				20
    click element    css=input[data-tag-id="9"][type="button"][class="nav-btn"][value="设备ID"]
	wait2
    click element    css=a[id="btn_dir_render"][class="button btn-dir-render"]
    wait2
    click element    xpath=//*[@id="setting_9"]/div/div[1]/label[2]/input
    wait2
    input text    xpath=//*[@id="setting_9"]/div/div[2]/textarea    oaid123,oaid';,.&$!
    wait2
    click Element    xpath=//*[@id="step5"]/div[5]/div[2]/a[1]
    wait until element contains			xpath=//*[@id="data_list"]/tr[1]/td[2]			zm自动化			20
    input text    xpath=//*[@id="keywords"]    zm自动化-${radomename}
    wait2
    click Element    xpath=//*[@id="page_content"]/div[3]/div[2]/div[2]/button[1]
    Wait Until Element Is Visible    xpath=//*[@id="data_list"]/tr[1]/td[2]    20
    ${name}    get text    xpath=//*[@id="data_list"]/tr[1]/td[2]
    should contain    ${name}    zm自动化
    [Teardown]    Selenium2Library.Close Browser


安卓-PD投放oaid白名单验证
    [Tags]    zhongming
    登录
    click element    xpath=//*[@id="menu_736"]			#进入投放管理
    wait2
    click element    xpath=//*[@id="page_content"]/div[3]/div[1]/a[text()='新增投放']		#点击投放新增
    wait2
    click element    xpath=//*[@id="select2-advertiser_id-container"]
    input text    xpath=/html/body/span/span/span[1]/input    zhongm
    wait until element contains  		xpath=//*[@id="select2-advertiser_id-results"]/li			zhongm-guang			10
    click element    xpath=//*[@id="select2-advertiser_id-results"]/li	
    click element    xpath=//*[@id="select2-activity_id-container"]/span
    wait until element contains 			 xpath=//*[@id="select2-activity_id-results"]/li			zhong-ding			10
    click element    xpath=//*[@id="select2-activity_id-results"]/li
    ${radomename}    evaluate    random.uniform(1000000,9999999)    random					#随机投放名称
    input text    xpath=//*[@id="name"]    zm自动化-${radomename}
    wait2
    select from list by value    xpath=//*[@id="is_activity"]    5
    input text    xpath=//*[@id="search_adunit_wrap"]/div[1]/div[1]/input    17027			#输入广告位ID
    click element    xpath=//*[@id="search_adunit_wrap"]/div[1]/div[1]/a					#确定搜索
    wait until element contains				xpath=//*[@id="search_adunit_wrap"]/div[1]/div[2]/li/ul/li/div/span[5]				17027-咪咕音乐-zm-test1-原生广告-开屏				100
    click element    xpath=//*[@id="search_adunit_wrap"]/div[1]/div[2]/li/ul/li/div/span[5]				#选择广告位
	click element		xpath=//*[@id="invest_calendar"]/div/div[1]/div[1]/a[5]				#选择日期（全选）
    input text    xpath=//*[@id="impress_count"]    1000
    wait2
    input text    xpath=//*[@id="push_ratio"]    1000
	wait2
    click element    xpath=//*[@id="flow_set"]
    click element    css=a[class="submit btn-operate"][data-next="#/step2"][data-operator="new"]		#提交下一步
	wait until element contains				xpath=//*[@id="pd_creative_wrap"]/div/div[2]/p/span				DealID			20
    input text    	 css=input[class="info-input"][name="deal_id"]    		zmnative2		#输入dealid
    click element    xpath=//*[@id="pd_creative_wrap"]/div/div[3]/div/select				
    wait2
    click element    xpath=//*[@id="pd_creative_wrap"]/div/div[3]/div/select/option[text()='zm_dsp_native(可用)']			#选择投放平台名称
    input text    xpath=//*[@id="pd_price"]    100						#输入价格
    click element    xpath=//*[@id="step4"]/div[3]/div[2]/a[2]			#提交下一步
    wait until element is visible			css=input[data-tag-id="9"][type="button"][class="nav-btn"][value="设备ID"]			20
    click element    css=input[data-tag-id="9"][type="button"][class="nav-btn"][value="设备ID"]
	wait until element is visible				css=a[id="btn_dir_render"][class="button btn-dir-render"]				20
    click element    css=a[id="btn_dir_render"][class="button btn-dir-render"]
	wait until element is visible			xpath=//*[@id="setting_9"]/div/div[2]/textarea				20
    input text    xpath=//*[@id="setting_9"]/div/div[2]/textarea    oaid123,oaid';,.&$!
    wait2
    click Element    xpath=//*[@id="step5"]/div[5]/div[2]/a[1]
    wait until element contains			xpath=//*[@id="data_list"]/tr[1]/td[2]			zm自动化			20
    input text    xpath=//*[@id="keywords"]    zm自动化-${radomename}
    wait2
    click Element    xpath=//*[@id="page_content"]/div[3]/div[2]/div[2]/button[1]
    Wait Until Element Is Visible    xpath=//*[@id="data_list"]/tr[1]/td[2]    20
    ${name}    get text    xpath=//*[@id="data_list"]/tr[1]/td[2]
    should contain    ${name}    zm自动化
    [Teardown]    Selenium2Library.Close Browser

安卓-投放ID定向黑名单
    [Tags]    zhongming   
    登录
    click element    xpath=//*[@id="menu_736"]			#进入投放管理
    wait2
    click element    xpath=//*[@id="page_content"]/div[3]/div[1]/a[text()='新增投放']		#点击投放新增
    wait2
    click element    xpath=//*[@id="select2-advertiser_id-container"]
    input text    xpath=/html/body/span/span/span[1]/input    zhongm
    wait until element contains  		xpath=//*[@id="select2-advertiser_id-results"]/li			zhongm-guang			10
    click element    xpath=//*[@id="select2-advertiser_id-results"]/li	
    click element    xpath=//*[@id="select2-activity_id-container"]/span
    wait until element contains 			 xpath=//*[@id="select2-activity_id-results"]/li			zhong-ding			10
    click element    xpath=//*[@id="select2-activity_id-results"]/li
    ${radomename}    evaluate    random.uniform(1000000,9999999)    random					#随机投放名称
    input text    xpath=//*[@id="name"]    zm自动化-${radomename}
    wait2
    select from list by value    xpath=//*[@id="is_activity"]    5
    input text    xpath=//*[@id="search_adunit_wrap"]/div[1]/div[1]/input    17027			#输入广告位ID
    click element    xpath=//*[@id="search_adunit_wrap"]/div[1]/div[1]/a					#确定搜索
    wait until element contains				xpath=//*[@id="search_adunit_wrap"]/div[1]/div[2]/li/ul/li/div/span[5]				17027-咪咕音乐-zm-test1-原生广告-开屏				100
    click element    xpath=//*[@id="search_adunit_wrap"]/div[1]/div[2]/li/ul/li/div/span[5]				#选择广告位
	click element		xpath=//*[@id="invest_calendar"]/div/div[1]/div[1]/a[5]				#选择日期（全选）
    input text    xpath=//*[@id="impress_count"]    1000
    wait2
    input text    xpath=//*[@id="push_ratio"]    1000
	wait2
    click element    xpath=//*[@id="flow_set"]
    click element    css=a[class="submit btn-operate"][data-next="#/step2"][data-operator="new"]		#提交下一步
	wait until element contains				xpath=//*[@id="pd_creative_wrap"]/div/div[2]/p/span				DealID			20
    input text    	 css=input[class="info-input"][name="deal_id"]    		zmnative2		#输入dealid
    click element    xpath=//*[@id="pd_creative_wrap"]/div/div[3]/div/select				
    wait2
    click element    xpath=//*[@id="pd_creative_wrap"]/div/div[3]/div/select/option[text()='zm_dsp_native(可用)']			#选择投放平台名称
    input text    xpath=//*[@id="pd_price"]    100						#输入价格
    click element    xpath=//*[@id="step4"]/div[3]/div[2]/a[2]			#提交下一步
	wait until element is visible			css=input[data-tag-id="9"][type="button"][class="nav-btn"][value="设备ID"]			20
    click element    css=input[data-tag-id="9"][type="button"][class="nav-btn"][value="设备ID"]			#选择设备ID定向
    wait until element is visible				css=a[id="btn_dir_render"][class="button btn-dir-render"]				20
    click element    xpath=//*[@id="btn_dir_render"]			#新增设备ID定向	
    wait until element contains				xpath=//*[@id="setting_9"]/div/div[1]/label[2]			不投（黑名单）			20
    click element    xpath=//*[@id="setting_9"]/div/div[1]/label[2]/input			#选择黑名单
    input text    xpath=//*[@id="setting_9"]/div/div[2]/textarea    oaid123,oaid';,.&$!			#输入设备ID
    click element    xpath=//*[@id="step5"]/div[5]/div[2]/a[1]			#提交
    wait until element contains			xpath=//*[@id="data_list"]/tr[1]/td[2]			zm自动化			20
    input text    xpath=//*[@id="keywords"]    zm自动化-${radomename}
    wait2
    click Element    xpath=//*[@id="page_content"]/div[3]/div[2]/div[2]/button[1]
    Wait Until Element Is Visible    xpath=//*[@id="data_list"]/tr[1]/td[2]    10
    ${name}    get text    xpath=//*[@id="data_list"]/tr[1]/td[2]
    should contain    ${name}    zm自动化-${radomename}
    [Teardown]    Selenium2Library.Close Browser

安卓-投放ID定向白名单
    [Tags]    zhongming    
    登录
    click element    xpath=//*[@id="menu_736"]			#进入投放管理
    wait2
    click element    xpath=//*[@id="page_content"]/div[3]/div[1]/a[text()='新增投放']		#点击投放新增
    wait2
    click element    xpath=//*[@id="select2-advertiser_id-container"]
    input text    xpath=/html/body/span/span/span[1]/input    zhongm
    wait until element contains  		xpath=//*[@id="select2-advertiser_id-results"]/li			zhongm-guang			10
    click element    xpath=//*[@id="select2-advertiser_id-results"]/li	
    click element    xpath=//*[@id="select2-activity_id-container"]/span
    wait until element contains 			 xpath=//*[@id="select2-activity_id-results"]/li			zhong-ding			10
    click element    xpath=//*[@id="select2-activity_id-results"]/li
    ${radomename}    evaluate    random.uniform(1000000,9999999)    random					#随机投放名称
    input text    xpath=//*[@id="name"]    zm自动化-${radomename}
    wait2
    select from list by value    xpath=//*[@id="is_activity"]    5
    input text    xpath=//*[@id="search_adunit_wrap"]/div[1]/div[1]/input    17027			#输入广告位ID
    click element    xpath=//*[@id="search_adunit_wrap"]/div[1]/div[1]/a					#确定搜索
    wait until element contains				xpath=//*[@id="search_adunit_wrap"]/div[1]/div[2]/li/ul/li/div/span[5]				17027-咪咕音乐-zm-test1-原生广告-开屏				100
    click element    xpath=//*[@id="search_adunit_wrap"]/div[1]/div[2]/li/ul/li/div/span[5]				#选择广告位
	click element		xpath=//*[@id="invest_calendar"]/div/div[1]/div[1]/a[5]				#选择日期（全选）
    input text    xpath=//*[@id="impress_count"]    1000
    wait2
    input text    xpath=//*[@id="push_ratio"]    1000
	wait2
    click element    xpath=//*[@id="flow_set"]
    click element    css=a[class="submit btn-operate"][data-next="#/step2"][data-operator="new"]		#提交下一步
	wait until element contains				xpath=//*[@id="pd_creative_wrap"]/div/div[2]/p/span				DealID			20
    input text    	 css=input[class="info-input"][name="deal_id"]    		zmnative2		#输入dealid
    click element    xpath=//*[@id="pd_creative_wrap"]/div/div[3]/div/select				
    wait2
    click element    xpath=//*[@id="pd_creative_wrap"]/div/div[3]/div/select/option[text()='zm_dsp_native(可用)']			#选择投放平台名称
    input text    xpath=//*[@id="pd_price"]    100						#输入价格
    click element    xpath=//*[@id="step4"]/div[3]/div[2]/a[2]			#提交下一步
	wait until element is visible			css=input[data-tag-id="9"][type="button"][class="nav-btn"][value="设备ID"]			20
    click element    css=input[data-tag-id="9"][type="button"][class="nav-btn"][value="设备ID"]			#选择设备ID定向
    wait until element is visible				css=a[id="btn_dir_render"][class="button btn-dir-render"]				20
    click element    xpath=//*[@id="btn_dir_render"]			#新增设备ID定向	
    wait until element is visible			css=textarea[class="textarea border-radius"][name="textarea_9"]				20
    input text    xpath=//*[@id="setting_9"]/div/div[2]/textarea    oaid123,oaid';,.&$!			#输入设备ID
    wait2
    click element    xpath=//*[@id="step5"]/div[5]/div[2]/a[1]			#提交
    wait until element contains			xpath=//*[@id="data_list"]/tr[1]/td[2]			zm自动化			20
    input text    xpath=//*[@id="keywords"]    zm自动化-${radomename}
    sleep    2
    click Element    xpath=//*[@id="page_content"]/div[3]/div[2]/div[2]/button[1]
    Wait Until Element Is Visible    xpath=//*[@id="data_list"]/tr[1]/td[2]    10
    ${name}    get text    xpath=//*[@id="data_list"]/tr[1]/td[2]
    should contain    ${name}    zm自动化-${radomename}
    [Teardown]    Selenium2Library.Close Browser

删除投放
    [Tags]    zhongming    
    登录
    click element    xpath=//*[@id="menu_736"]
    wait2
    input text    xpath=//*[@id="keywords"]    		zm自动化    		#输入搜索关键字
    wait2
    click button    xpath=//*[@id="page_content"]/div[3]/div[2]/div[2]/button[1]    #点击搜索
    wait2
    ${items}    get text    xpath=//*[@id="page"]/form/p[1]/b[1]    #获取记录总数
    log    ${items}

	run keyword if 			'${items}'=='0'			log				数据为空
	: FOR    ${n}    IN RANGE    ${items}
    \    log    ${n}
    \    wait until element contains		  xpath=//*[@id="data_list"]/tr[1]/td[2]			zm自动化-			20
    \    ${name}    get text    xpath=//*[@id="data_list"]/tr[1]/td[3]/span    #获取投放状态
    \    log    ${name}
    \    exit for loop if    '${name}'=='开启'
    \    table cell should contain    xpath=//*[@id="fix_table_list"]     2     3     暂停
    \    click element    xpath=//*[@id="data_list"]/tr[1]/td[12]/a[4]    #点击删除
    \    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/table/tbody/tr[2]/td[2]/div/table/tbody/tr[3]/td/div/button[1]    20    #等待页面显示
    \    click button    xpath=/html/body/div[1]/div/table/tbody/tr[2]/td[2]/div/table/tbody/tr[3]/td/div/button[1]    #点击确定
    \    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/table/tbody/tr[2]/td[2]/div/table/tbody/tr[3]/td/div/button    20    #等待页面显示
    \    click button    xpath=/html/body/div[1]/div/table/tbody/tr[2]/td[2]/div/table/tbody/tr[3]/td/div/button    #点击确定		 
	wait2
    ${items1}    get text    xpath=//*[@id="page"]/form/p[1]/b[1]
    wait2
    should contain    ${items1}    0
    [Teardown]    Selenium2Library.Close Browser


*** Keywords ***


wait2
	sleep	2
	
循环删除
	: FOR    ${n}    IN RANGE    ${items}
    \    log    ${n}
    \    wait until element contains		  xpath=//*[@id="data_list"]/tr[1]/td[2]			zm自动化-			20
    \    ${name}    get text    xpath=//*[@id="data_list"]/tr[1]/td[3]/span    #获取投放状态
    \    log    ${name}
    \    exit for loop if    '${name}'=='开启'
    \    table cell should contain    xpath=//*[@id="fix_table_list"]     2     3     暂停
    \    click element    xpath=//*[@id="data_list"]/tr[1]/td[12]/a[4]    #点击删除
    \    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/table/tbody/tr[2]/td[2]/div/table/tbody/tr[3]/td/div/button[1]    20    #等待页面显示
    \    click button    xpath=/html/body/div[1]/div/table/tbody/tr[2]/td[2]/div/table/tbody/tr[3]/td/div/button[1]    #点击确定
    \    Wait Until Element Is Visible    xpath=/html/body/div[1]/div/table/tbody/tr[2]/td[2]/div/table/tbody/tr[3]/td/div/button    20    #等待页面显示
    \    click button    xpath=/html/body/div[1]/div/table/tbody/tr[2]/td[2]/div/table/tbody/tr[3]/td/div/button    #点击确定
	
*** Variables ***
${item}			set global variable			0	
	
	
	
	
	
	
	
	
	