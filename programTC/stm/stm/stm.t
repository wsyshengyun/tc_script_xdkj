变量 线程ID = 0
//从这里开始执行
var error_thread_id = 0

var vk_space = 32
var vk_right = 39
var vk_left = 37
var vk_0_0 = 96

功能 执行()
    //从这里开始你的代码
    //消息框("这个是热键执行的代码")
    //    start_thread_error()
    start()
    
    
    
结束

function start()
    pro_start()
    while(true)
        var vk = keywait()
        if(vk == vk_right)
            pro_start()
        end
    end
end


function check_error_window()
    sleep(50)
    var jb = windowfind("Error")
    if(jb)
        mousemove(0,0)
        终止_热键()
    end
end

function end_error_thread()
    if(error_thread_id!=0)
        threadclose(error_thread_id)
        error_thread_id=0
    end
end
function pro_start()
    
    变量 窗口句柄=窗口查找("STM32 ST-LINK Utility")
    等待(50)
    窗口激活(窗口句柄)
    //消息框(窗口句柄)
    
    //连接
    等待(100)
    鼠标移动(606,217)
    等待(200)
    鼠标相对移动(90,69)
    鼠标左键单击(1)
    等待(100)
    
    
    //开始
    等待(6000)
    鼠标移动(606,217)
    等待(50)
    鼠标相对移动(187,64)
    鼠标左键单击(1)
    等待(500)
    键盘按键(9,1)
    等待(200)
    键盘按键(13,1)
    
    //取消
    等待(10000)
    鼠标移动(606,217)
    等待(50)
    鼠标相对移动(124,69)
    等待(50)
    鼠标左键单击(1)
    等待(200)
    
    鼠标移动(0,0)   
end


function start_thread_error()
    if(error_thread_id == 0)
        error_thread_id = threadbegin("check_error_window", "")
    else
        messagebox("var error_thread_id,start...")
    end
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
    end_error_thread()
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


功能 stm_初始化()
    //这里添加你要执行的代码
    //设置托盘(123,真)
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
