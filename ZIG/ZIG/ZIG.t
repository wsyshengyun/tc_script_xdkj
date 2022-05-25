变量 线程ID = 0

var title = "ZigBee-CEL"
var title_get_info = "ZigBeeCfg"
var con1 = "0x1003"
var con2 = "Channel 15 (2425MHz)"

function _move_click(a, b )
    mousemove(a, b )
    sleep(100)
    mouseleftclick()
end

function _move_dclick(a, b )
    mousemove(a, b )
    sleep(100)
    mouseleftdclick()
end


function window_move_00(a)
    var hwd = windowfind(title)
    if(hwd)
        windowactivate(hwd)
        sleep(50)
        windowsetpos(hwd, 0, 0)
    end
end

function _get_info()
    _move_click(597,618)
    sleep(400)
    var hwd = windowfind(title_get_info)
    if(hwd)
        keypress(13)
    end
end
function _set_config()
//    sleep(500)
    _move_dclick(694,618)
    sleep(400)
    var hwd = windowfind(title_get_info)
    if(hwd)
        keypress(13)
    end
end
function _set_content()
    _move_dclick(693,268)
    sleep(300)
    keysendstring(con1)
    
    _move_click(830,404) 
    sleep(500)
    _move_click(737,467)
    
end


function start()
    window_move_00(title)
    _get_info() 
    sleep(400)
    _set_content() 
    sleep(400)
    _set_config()
end





//从这里开始执行
功能 执行()
    //从这里开始你的代码
    //    消息框("这个是热键执行的代码")
    start()
结束
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


功能 ZIG_初始化()
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
    
    变量 提示内容 = "鼠标移动到热键控件里,使得热键控件具有输入焦点,之后输入自己的热键,点击保存配置按钮,那么修改后的热键就会立即生效."
    标签设置文本("标签2",提示内容)
结束
