变量 线程ID = 0
//从这里开始执行
var soft_title_ip = "网络接口设备管理软件V1.0.6"
var soft_class_ip = "TfmMain"
var del_times_num = 5
var is_look_ip = true
var is_close_spk = false

var star_bofang = false
var star_configip = false
var star_sip_config = false
var stm_able = true
var is_select_mic = false
var is_check_link = true
var is_check_link_run = false
var is_check_v7 = false

//从这里开始执行
功能 执行()
    //从这里开始你的代码
    //    link()
    look_ip_not_clear()
    
结束


//-----------------------------------------------------------------
//初始化
function init_control()
    stm_able = checkgetstate("check_stm")
    is_look_ip = checkgetstate("con_check_lookip")
    is_close_spk = checkgetstate("con_check_close")
    is_select_mic = checkgetstate("con_check_mic")
    is_check_link = checkgetstate("check_link")
    is_check_link_run = checkgetstate("check_link_run")
end

//------------------------------------------------------------------
function stm()
    if(stm_able == false)
        return 0
    end
end


function ceshi()
    超级键盘按键(8,9)
end

function move00()
    sleep(50)
    mousemove(0,0)
end

function get_jb_songjian()
    return 窗口查找("G25松建高速网络广播控制软件V7.08")
end

function get_jb_ip()
    var ip_title = "网络接口设备管理软件V3.1--程序下载软件"
    var ip_jb = 窗口查找(ip_title)
    return ip_jb
end

function bofang()
    if(star_bofang==true)
        return false
    end
    star_bofang = true
    
    if(is_look_ip)
        look_ip()
    end
    
    sleep(50)
    变量 jb_songjian = 窗口查找("G25松建高速网络广播控制软件V7.08")
    windowsetmax(jb_songjian)
    sleep(50)
    窗口激活(jb_songjian)
    等待(300)
    鼠标移动(25,956)
    鼠标右键单击(1)
    
    等待(100)
    鼠标移动(298,855)
    鼠标左键双击(1)
    等待(400)
    
    //弹出
    if(is_select_mic==false)
        鼠标移动(876,542)    //PC声卡
        鼠标左键单击(1)
    end
    
    等待(50)
    鼠标移动(908,635)   //确定点击
    鼠标左键单击(1)  
    
    if(is_close_spk)
        
        var vk = keywait()
        if(vk==110)   //按点号后关闭
            鼠标移动(25,956)  
            鼠标右键单击(1)
        end
        
    end
    
    move00()
    star_bofang = false
end

function config_ip()
    if(star_configip==true)
        return false
    end
    star_configip = true
    
    sleep(300)
    var jb = get_jb_ip()
    windowsetmax(jb)
    sleep(50)
    windowactivate(jb)
    
    move_click(150,63)   // 清空
    等待(200)
    move_click(57,68)   // 开始搜索  停止搜索
    等待(200)
    
    mousemove(44,242)   // 复选框
    sleep(200)
    mouseleftdclick(1)   //选中
    sleep(200)
    
    move_click(156,240)   //第二行ip位置
    //    sleep(300)
    //    mouseleftdclick(1)     //全选IP
    等待(300)
    mousemove(156,242)
    sleep(50)
    mouseleftclick(1)   //取消全选
    sleep(100)
    
    del10()
    //	del_select()
    
    //等待输入
    btn_save()
    sleep(400)
    move_click(419,54)  // click " 保存项目参数"
    sleep(200)
    move_click(150,63)   // 清空
    
    //    sleep(3000)  //等待3秒后再搜索一下
    //    move_click(57,68)   // 开始搜索  停止搜索
    //    move_click(57,68)   // 开始搜索  停止搜索
    sleep(100)
    mousemove(57,68)
    move00()
    star_configip=false
    
end

//删除5个字符,按退格键删除
function del10()
    //    keypress(46)
    sleep(1000)
    //    keypress(8,del_times_num)
    for(var i = 0; i < del_times_num; i++)
        keypress(8)
        //        keydown(8)
        //        sleep(5)
        //        keyup(8)
        sleep(10)
    end
end

function del_select()
    sleep(1000)
    mouseleftdown()
    sleep(1000)
    鼠标相对移动(-15,0)
    mouseleftup()
end


//当输入规定的字符后,点"保存项目参数
function btn_save()
    keywait()
    sleep(50)
    var k_val = keywait()
    while(k_val>95 && k_val<111 || k_val==8)
        sleep(50)
        k_val = keywait()
    end
end


//搜索IP后再清空,查看一下
function look_ip()
    var ip_title = "网络接口设备管理软件V3.1--程序下载软件"
    var ip_jb = 窗口查找(ip_title)
    if(ip_jb)
        窗口激活(ip_jb)
        move_click(150,63)   // 清空
        等待(300)
        move_click(57,68)   // 开始搜索  停止搜索
        等待(200)
        move_click(57,68)  
    end
    
    
    
end

//搜索IP后再清空,查看一下
function look_ip_not_clear()
    var ip_title = "网络接口设备管理软件V1.0.6"
    var ip_jb = 窗口查找(ip_title)
    if(ip_jb)
        窗口激活(ip_jb)
        move_click(151,68)   // 清空
        等待(100)
        move_click(57,68)   // 开始搜索  停止搜索
        sleep(50)
        mousemove(118,223)
    end
    
    
    
end

function look_ip2()
    sleep(200)
    //    变量 jb_songjian = 窗口查找("网络接口设备管理软件V3.1--程序下载软件")
    //    窗口激活(jb_songjian)
    //	messagebox(soft_title_ip)
    var jb = find_window_and_acv_from_title_class(soft_title_ip)
    
    //    var str_ = 窗口找色(jb,81,237, 165,250, "000000", 0.9)
    //    messagebox(str_)
    
end
function move_click(a,b)
    鼠标移动(a,b)
    等待(100)
    鼠标左键单击(1)
    sleep(100)
end

function find_window_and_acv(title)
    var jb = windowfind("",title)
    windowactivate(jb)
end

function find_window_and_acv_from_title_class(title)
    var jb = windowfind(title)
    //    messagebox(jb)
    windowactivate(jb)
    return jb
end

function daoru_config()
    if(star_sip_config==true)
        return false
    end
    star_sip_config = true
    
    
    var title = "Chrome Legacy Window"
    var class_name = "Chrome_WidgetWin_1"
    find_window_and_acv(class_name)
    //    sleep(300)
    //    move_click(357,61)   //地址栏
    //    sleep(200)
    //    mouseleftdclick(1)
    //    sleep(200)
    //    keysendstring("192.168.1.11")
    //    sleep(400)
    //    keypress(13)
    //    sleep(1000)   //等待进入网页
    
    move_click(1057,119)   //点击上侧设置
    sleep(400)
    move_click(490,423)   //点击左侧配置
    sleep(400)
    move_click(1002,347)    //点击导入
    sleep(1000)   //等待弹出文件窗口
    keysendstring("config.cfg")
    sleep(100)
    keypress(13)//回车
    sleep(100)
    keypress(9)//tab
    move_click(993,379)
    sleep(100)
    keypress(13) //回车
    sleep(100)
    //回车  
    move00()
    star_sip_config = false
end


//==============================================================================
function stm_program_input() 
    var jb=窗口查找("STM32 ST-LINK Utility")
    if(jb==0)
        move_top_right()
        return false
    end
    等待(50)
    窗口激活(jb)
    
    //连接
    等待(200)
    鼠标移动(606,217)   //yuandian
    等待(200)
    鼠标相对移动(90,69)
    鼠标左键单击(1)    //btn connect
    等待(100)
    
    
    //开始
    等待(4500)  // long time 
    鼠标移动(606,217) //yuandian
    等待(50)
    鼠标相对移动(187,64)  //btn verify
    鼠标左键单击(1)
    等待(500)
    键盘按键(9,1)   //tab
    等待(200)
    键盘按键(13,1)   //enter
    
    //取消
    等待(9500)   //long time  
    鼠标移动(606,217)
    等待(50)
    鼠标相对移动(124,69)
    等待(50)
    鼠标左键单击(1)
    等待(200)
    
    鼠标移动(0,0)   
end

//==============================================================================


//==================mouse============================================================
function move_top_right()
    var x,y
    sysgetscreen(x,y)
    mousemove(x-10,0)
end

//=======================link=======================================================
function link_press(key_num)
    //    变量 jb_songjian = 窗口查找("SEGGER J-Flash ARM V4.40 - [C:\\Program Files (x86)\\SEGGER\\JLinkARM_V440\\Default.jflash]")
    //    windowsetmax(jb_songjian)
    //    sleep(50)
    //    窗口激活(jb_songjian)
    //    if(jb_songjian==0)
    //        mousemove(0,0)
    //        return
    //    end
    //按键F7  118 
    // f8  119
    // f9 120
    keypress(key_num)
    
    var title = "J-Flash ARM V4.40"
    if(is_check_v7)
        title = "J-Flash V7.55a"
    end
    var jb = windowfind(title)
    var count = 0
    while(1)
        jb = windowfind(title)
        if(jb)
            sleep(300)
            keypress(13)
            break
        elseif(count==20)
            messagebox("link time out")
            break
        end
        sleep(500)
        count++
    end
    //    messagebox(jb)
    
end


function link()
    
    
    link_press(118) // f7
    sleep(200)
    //连接断开
    
    
    //点击菜单"Target"
    if(is_check_v7)
        move_click(103,34)   
    else
        move_click(129,35)
    end
    
    sleep(200)
    
    //点击disconnect
    if(is_check_v7)
        move_click(124,83)
    else
        move_click(165,70)
    end
    
    if(is_check_link_run)		
        //run 
        move_click(129,35)
        sleep(400)
        move_click(216,460)
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


功能 bofang_初始化()
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
    
    //    变量 提示内容 = "鼠标移动到热键控件里,使得热键控件具有输入焦点,之后输入自己的热键,点击保存配置按钮,那么修改后的热键就会立即生效."
    //    标签设置文本("标签2",提示内容)
    init_control()  //初始化 选择框
    设置托盘("bofang",假)
    滑块设置范围("滑块0",0,10)
结束



function config_ip_fenji()
    move_click(44,220)
    mouseleftclick(1)
    sleep(200)
    move_click(342,70)
end

// 导入网页配置
功能 hotkey0_热键()
    //    这里添加你要执行的代码
    if(stm_able && is_check_link==0)
        stm_program_input()
    elseif( stm_able && is_check_link == 1)
        link()
    else
        daoru_config()
    end
    //    config_ip_fenji()
    
结束


功能 hotkey_gai_ip_热键()
    //这里添加你要执行的代码
    config_ip()
    
结束


功能 control_edit_del_num_内容改变()
    //这里添加你要执行的代码
    del_times_num = editgettext("control_edit_del_num")
    
结束


功能 con_check_lookip_点击()
    //这里添加你要执行的代码
    is_look_ip = checkgetstate("con_check_lookip")
结束


功能 hot_key_bofang_热键()
    move_click(342,70)  
结束


功能 btn_reset_点击()
    //这里添加你要执行的代码
    star_bofang = false
    star_configip = false
    star_sip_config = false
    
结束


功能 滑块0_鼠标释放()
    //这里添加你要执行的代码
    var val = 滑块获取位置("滑块0")
    编辑框设置文本("control_edit_del_num",val)
结束


功能 con_check_close_点击()
    //这里添加你要执行的代码
    is_close_spk = checkgetstate("con_check_close")
结束


//stm程序
功能 check_stm_点击()
    //这里添加你要执行的代码
    stm_able = checkgetstate("check_stm")
结束


功能 con_check_mic_点击()
    //这里添加你要执行的代码
    is_select_mic = checkgetstate("con_check_mic")
结束




功能 check_link_点击()
    //这里添加你要执行的代码
    is_check_link = checkgetstate("check_link")
结束


功能 check_link_run_点击()
    //这里添加你要执行的代码
    is_check_link_run = checkgetstate("check_link_run")
结束


功能 check_v7_点击()
    //这里添加你要执行的代码
    is_check_v7 = checkgetstate("check_v7")
结束
