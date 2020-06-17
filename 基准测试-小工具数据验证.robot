*** Settings ***
Library                Selenium2Library
Library                MyLibrary
Resource			   HCkeywords.txt

*** Test Cases ***
小工具-地域包管理
        [Tags]         zhongming    
        登录
        click element		xpath=//*[@id="menu_723"]			#进入小工具
		click element 		css=[class="cate-link"]				#进入地域包
		wait2	
		input text			css=input[type="text"][placeholder="地域ID/名称"]		省份-北京天津
		wait2
		click element		css=#search
		wait until element contains				xpath=//*[@id="data_list"]/tr/td[2]				省份-北京天津			20
		${area}				get text			xpath=//*[@id="data_list"]/tr/td[2]
		should contain         ${area}         省份-北京天津
		[Teardown]    Selenium2Library.Close Browser

小工具-魔百和设备标签管理
		[Tags]         zhongming    
        登录
        click element		xpath=//*[@id="menu_723"]				#进入小工具
		click element		css=a[class="cate-link"][href="/index.php/gnome_admin/tools/ottDevTag"]		#进入魔百和设备标签页面
		wait2
		input text			css=#keywords			设备			#输入搜索数据
		wait2
		click element		css=#search								#点击搜索按钮
		Wait Until Element Contains				css=tbody[id="data_list"][class="data-body"]			10			#显示等待
		${tagname}			get text			css=#data_list		#获取表格数据
		should contain		${tagname}			设备				#判断查询内容是否匹配
		[Teardown]    Selenium2Library.Close Browser				
		
小工具-IP包管理
		[Tags]         zhongming    
        登录
        click element		xpath=//*[@id="menu_723"]				#进入小工具
		click element		css=a[href="/index.php/gnome_admin/tools/ipPackage"][class="cate-link"]			#进入IP包管理页面
		Wait Until Element Contains			    css=tbody[id="data_list"][class="data-body"]			10				#显示等待
		input text			css=input[placeholder="模糊搜索名称及ID"][id="keywords"]			上海包测试勿动
		wait2
		click element		css=#search			#点击搜索按钮
		Wait Until Element Contains			    css=tbody[id="data_list"][class="data-body"]				10
		${ip_name}			get text			css=tbody[id="data_list"][class="data-body"]			#获取ip包名
		should contain		${ip_name}			 上海包测试勿动		#判断搜索结果是否正确
		[Teardown]    Selenium2Library.Close Browser	

小工具-政企包管理
		[Tags]         zhongming    
        登录
        click element		xpath=//*[@id="menu_723"]				#进入小工具
        click element		css=a[href="/index.php/gnome_admin/tools/statePack"][class="cate-link"]		#进入政企包管理页面
		Wait Until Element Contains 		css=tr[class="tr-odd"]			政企名称		20			#显示等待
		input text			css=input[id="keywords"][placeholder="政企ID/名称"]				自动化测试政企包勿动	#输入搜索数据
		wait2
		click element		css=#search			#点击搜索按钮	
		Wait Until Element Contains 		css=tbody[id="data_list"][class="data-body"]			政企包		20			#显示等待
		${ecname}			get text		xpath=//*[@id="page"]/form/p[1]/b[1]		#获取表格数据
		should contain		${ecname}		1		#判断搜索结果是否正确
		[Teardown]    Selenium2Library.Close Browser	

小工具-人群包管理
		[Tags]         zhongming    
        登录
        click element		xpath=//*[@id="menu_723"]				#进入小工具		
		wait until element is visible 		css=a[href="/index.php/gnome_admin/investment/redirection/index"]			10
		click element			css=a[href="/index.php/gnome_admin/investment/redirection/index"]			#点击进入人群包管理页面
		wait2
		input text			css=input[placeholder="模糊搜索ID、包名称"][id="keywords"]			自动化测试包（勿动）
		wait2
		click element		css=a[id="search"]
		wait until element contains			xpath=//*[@id="data_list"]/tr/td[2]				自动化测试包（勿动）			10
		${name}			get text			xpath=//*[@id="data_list"]/tr/td[2]	
		run keyword if 			'${name}'=='自动化测试包（勿动'			log			数据正确
		...						ELSE									log			数据错误
		[Teardown]    Selenium2Library.Close Browser

小工具-标签管理
		[Tags]         zhongming    
        登录
        click element		xpath=//*[@id="menu_723"]				#进入小工具		
		wait until element is visible			css=a[href="/index.php/gnome_admin/tools/labels"] 		 10
		click element			css=a[href="/index.php/gnome_admin/tools/labels"]			#进入标签管理页面
		wait2
		input text			css=#keywords			咪咕			#输入标签搜索条件
		wait2
		click element		css=#search			#点击搜索按钮
		wait until element is visible			xpath=//*[@id="data_list"]/tr[1]/td[2]				10
		${tagname}				get text			xpath=//*[@id="data_list"]/tr[1]/td[2]
		run keyword if 			'${tagname}'=='咪咕'			log			数据正确
		...			ELSE		log			数据错误
		[Teardown]    Selenium2Library.Close Browser

小工具-热门城市管理
		[Tags]         zhongming    
        登录
        click element		xpath=//*[@id="menu_723"]				#进入小工具
		wait until element is visible			css=a[href="/index.php/gnome_admin/tools/hotCities"]			10
		click element 		css=a[href="/index.php/gnome_admin/tools/hotCities"]
		wait until element is visible		 css=input[placeholder="支持省份、城市模糊搜索"][id="keywords"]				10
		input text			css=input[placeholder="支持省份、城市模糊搜索"][id="keywords"]			上海
		wait2
		click element		css=#search
		wait until element contains			xpath=//*[@id="data_list"]/tr/td[1]/span			上海市			20
		${provite}			get text		xpath=//*[@id="data_list"]/tr/td[1]/span
		run keyword if 		'${provite}'=='上海市'			log			数据正确
		...			ELSE		log				数据错误
		[Teardown]    Selenium2Library.Close Browser

小工具-广告位创意预览查询
		[Tags]         zhongming    
        登录
        click element		xpath=//*[@id="menu_723"]				#进入小工具
		wait until element is visible			css=a[href="/index.php/gnome_admin/tools/adunitOverview/index"] 			10
		click element 		css=a[href="/index.php/gnome_admin/tools/adunitOverview/index"]			
		wait until element contains			css=#add			新建创意预览			10
		click element		css=#date
		wait until element is visible			css=select[class="yearselect"]			20
		select from list by value			css=select[class="yearselect"]				2020
		select from list by value			css=select[class="monthselect"]				5	
		click element 			css=td[data-title="r1c2"]
		click element 			css=td[data-title="r1c2"]
		click element 			css=button[class="applyBtn btn btn-sm btn-primary"]
		[Teardown]    Selenium2Library.Close Browser
		
		
*** Keywords ***

wait2
		sleep		   2
