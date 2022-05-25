变量 线程ID
//从这里开始执行
功能 执行()
    //从这里开始你的代码
结束
//启动_热键操作
功能 启动_热键()
    线程ID=线程开启("执行","")
结束

//终止热键操作
功能 终止_热键()
    线程关闭(线程ID)
结束

function dianji()
    
    mousemove(748,435) 
    sleep(50)
    mouseleftclick(1)
end

function find_class()
    var classname = "TsuiTitleBar"
    var jb = windowfind(classname=classname)
    if(jb)
        windowsetpos(jb,0,0)
    end
 end

功能 热键0_热键()
	//这里添加你要执行的代码
	find_class()
	dianji()
	
结束
    