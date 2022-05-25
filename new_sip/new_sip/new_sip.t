变量 线程ID = 0
var b_check_update = 1









//从这里开始执行
功能 执行()
    //从这里开始你的代码
    update()
结束

function update()
    _login()
    
    _move_click(687,197)
    sleep(1000)
    _move_click(732,333)
    sleep(1000)
    mousemove(557,279)
    
    sleep(300)
    mouseleftdclick(1)
    sleep(500)
//    keypress(13)  //enter
    sleep(500)
    _move_click(954,341)
    
end

function config()
    _login() 
    _move_click(547,189) 
    sleep(1000)
    _move_click(791,423)  //打开选择文件窗口对话框
    sleep(500)
    mousemove(578,242)  //鼠标移动到文件上面
    
    
    sleep(300)
    mouseleftdclick(1)  //双击文件 选中
    sleep(500)
//    keypress(13)  //enter  回车关闭对话框
    sleep(500)
    _move_click(987,424)   //点击配置
    
end

function login_and_set()
    _login()
    _move_click(83,397)     // 本地 
    sleep(1000)
    
    //相机设置
    _move_click(560,203)   //相机TAble
    sleep(500)
    _move_click(545,321)   //"内部"
    sleep(500)
    _move_click(534,362)   //"外接"
    sleep(500)
    _move_click(679,345)   //"确定"
    
    sleep(1500)
    _move_click(101,412)
    sleep(800)
    _move_click(429,185)
    sleep(500)
    _move_click(310,482)
    sleep(500)
    _move_click(333,817)
    sleep(500)
    _move_click(526,819) 
    sleep(500)
end

function _login()
    _move_click(931,539)   //admin 
    keysendstring("admin")
    sleep(100)
    keypress(9)  //tab
    sleep(100)
    keysendstring("admin")
    sleep(100)
    keypress(9)  //tab
    sleep(100 )
    
    _move_click(941,595)
    sleep(100)
    _move_click(937,632)
    sleep(100)
    _move_click(937,618)
    
    sleep(2500)  //enter url
    
end




function start()
    _move_click(931,539)   //admin 
    keysendstring("admin")
    sleep(100)
    keypress(9)  //tab
    sleep(100)
    keysendstring("admin")
    sleep(100)
    keypress(9)  //tab
    sleep(100 )
    
    _move_click(941,595)
    sleep(100)
    _move_click(937,632)
    sleep(100)
    _move_click(937,618)
    
    sleep(2500)  //enter url
    
    _move_click(83,397)     // 本地 
    sleep(1000)
    _move_click(532,427)   //视频
    sleep(500)
    _move_click(527,449)   //音频
    sleep(500)
    _move_click(900,427)
    sleep(500)
    _move_click(902,454)    //音频
    sleep(500)
    _move_click(691,877)   //提交
    sleep(3000)
    
    //相机设置
    _move_click(560,203)
    sleep(500)
    _move_click(545,321)
    sleep(500)
    _move_click(534,362)
    sleep(500)
    _move_click(679,345)
    
    //    keypress(40) //down
    //    sleep(100)
    //    keypress(9)   //tab
    //    sleep(50)
    //    keypress(13)  //enter
    
    
end

function _move_click(a, b )
    mousemove(a, b )
    sleep(50)
    mouseleftclick(1)
end




//启动_热键操作
功能 启动_热键()
    如果(线程ID == 0)
        线程ID=线程开启("执行","")
    否则
        消息框("脚本正在执行中,请先停止再启动.")
    结束
    
结束

//终止热键操作
功能 终止_热键()
    如果(线程ID != 0)
        线程关闭(线程ID)
        线程ID = 0        
    结束    
结束

功能 启动_失去焦点()
    //这里添加你要执行的代码
    热键销毁("启动")
    热键注册("启动")
结束


功能 终止_失去焦点()
    //这里添加你要执行的代码
    热键销毁("终止")
    热键注册("终止")
结束


功能 保存配置_点击()
    //这里添加你要执行的代码
    变量 键值 = 0,功能键 = 0
    热键获取键码("启动",键值,功能键)
    文件写配置("热键","启动键值",键值,"D:\\Main.ini")
    文件写配置("热键","启动功能键",功能键,"D:\\Main.ini")
    
    热键获取键码("终止",键值,功能键)
    文件写配置("热键","终止键值",键值,"D:\\Main.ini")
    文件写配置("热键","终止功能键",功能键,"D:\\Main.ini")
结束


功能 new_sip_初始化()
    //这里添加你要执行的代码
    变量 键值 = 0,功能键 = 0
    键值 = 文件读配置("热键","启动键值","D:\\Main.ini")
    功能键 = 文件读配置("热键","启动功能键","D:\\Main.ini")
    如果(键值 != "")
        热键设置键码("启动",键值,功能键)
        热键注册("启动")
    结束
    
    键值 = 文件读配置("热键","终止键值","D:\\Main.ini")
    功能键 = 文件读配置("热键","终止功能键","D:\\Main.ini")
    如果(键值 != "")
        热键设置键码("终止",键值,功能键)
        热键注册("终止")
    结束
    
    
结束


功能 check_update_点击()
    //这里添加你要执行的代码
    b_check_update = checkgetstate("check_update")
    
结束


功能 热键0_热键()
    //这里添加你要执行的代码
    config()
结束


功能 热键1_热键()
    //这里添加你要执行的代码
    login_and_set()
    
结束
