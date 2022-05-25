






//==================windows============================================================
function find_window_and_acv(title)
    var jb = windowfind("",title)
    windowactivate(jb)
end

function find_window_and_acv_from_title_class(title, clsname)
    var jb = windowfind(title, clsname)
    windowactivate(jb)
    return jb
end





//==================mouse============================================================
function move_top_right()
    var x,y
    sysgetscreen(x,y)
    mousemove(x-10,0)
end

function move_click(a,b)
    鼠标移动(a,b)
    等待(50)
    鼠标左键单击(1)
    sleep(50)
end