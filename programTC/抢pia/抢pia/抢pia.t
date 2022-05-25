变量 线程ID





function move_click(a,b) 
    mousemove(a,b)  
    sleep(50)
    mouseleftclick(1)
    sleep(50)
    
end


function start()
    move_click( 1431,416)  //点 显示可预订的全部车次
end

function search()
    move_click(1450,268)
end


function tijiao()
    move_click(509,450)  //姓名,我
    sleep(100)
    move_click(1016,711) //提交订单
    sleep(500)
    mousemove(1021,575)   //确认
end


//从这里开始执行
功能 执行()
    //从这里开始你的代码
    start()
结束


//启动_热键操作
功能 启动_热键()
    线程ID=线程开启("执行","")
结束

//终止热键操作
功能 终止_热键()
    线程关闭(线程ID)
结束




功能 up_热键()
    //这里添加你要执行的代码
    tijiao()
    
结束


功能 right_热键()
    //这里添加你要执行的代码
    search()
    
结束
