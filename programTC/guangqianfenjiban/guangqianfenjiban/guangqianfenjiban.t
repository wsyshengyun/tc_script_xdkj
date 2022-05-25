


变量 线程ID = 0
var flg_check = 1





功能 hotkey_stop_热键()
    //这里添加你要执行的代码
    stop_bofang()
    
结束

function _close_door()
    move_click(1419,786)
    sleep(500)
    _send_key_from_title("设备信息")

   
end

function _send_key_from_title(title)
    var hwd = windowfind(title)
    if(hwd)
//        windowsendkeypress(hwd,13)
        windowactivate(hwd)
        keypress(13)  //回车键
    end
    sleep(100)
end


function _close_window_from_title(title)
    var hwd = windowfind(title)
    if(hwd)
        windowclose(hwd)
    end
    sleep(100)
end

function bofang()
        //关掉车辆登记窗口
    _close_window_from_title("报警信息登记")

    
    var jj = active()
    if(jj == 0)
        //        消息框(jj)
        return 
    end
    //    消息框(jj)
    //最大化
    //344 193  空白
    //右键1, 移动, 点击菜单,呼叫所有广播
    mousemove(344,193)
    sleep(50)
    mouserightclick(1)
    sleep(500)
    mousemoverelative(38,8)   //菜单选项一级:广播操作
    sleep(500)
    mousemoverelative(208, 12)  //菜单选项二级:呼叫所有
    sleep(50)
    mouseleftclick() //点击 呼叫所有
    
    //点击电脑声音
    //    move_click(662,452)
    //    move_click(670,540)   //确认播放
    if(flg_check)
        select_PC()
    else
        select_MIC()
    end
    
    
end

function stop_bofang()
    
		//关掉door图标
    _close_door()
	sleep(300)
    
    
    active()
    mousemove(344,193)  //选择某个点
    sleep(50)
    mouseleftclick()
    sleep(100)
    mouserightclick()
    sleep(400)
    mousemoverelative(38,8)  //菜单选项一级:广播操作
    sleep(400)
    mousemoverelative(208,32)  //菜单选项二级:挂断所有广播
    sleep(50)
    mouseleftclick()
    move_click(682,503)   //弹出对话框,确认,挂断所有
end


function select_PC()
    // 662 452  电脑声音
    //670 540  确认播放
    //点击电脑声音
    move_click(662,452)
    move_click(670,540)   //确认播放
end



function select_MIC()
    move_click(661,423)   //单选框  MIC
    move_click(661,423)   //单选框  MIC
    sleep(1000)
    move_click(670,540)   //确认 按钮
end


function move_click(a,b)
    mousemove(a,b)
    sleep(50)
    mouseleftclick()
end




function active()
    // 激活界面
    var title = "高速公路紧急电话广播系统"
    var hwd = windowfind(title)
    if(hwd)
        windowactivate(hwd)
        return 1
    else
        return 0
    end
    
end

功能 hot_start_热键()
    //这里添加你要执行的代码
    //    active()
    bofang()
结束








//从这里开始执行
功能 执行()
    //从这里开始你的代码
    消息框("这个是热键执行的代码")
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


功能 guangqianfenjiban_初始化()
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
    //    标签设置文本("标签2",提示内容)
结束






功能 check_pc_点击()
    //这里添加你要执行的代码
    flg_check = checkgetstate("check_pc")
    //    messagebox(flg_check)
    
结束
