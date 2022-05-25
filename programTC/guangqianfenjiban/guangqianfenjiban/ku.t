//如果软件在右下角如何激活？






//==================windows============================================================
function find_and_activate(title)
    var jb = windowfind(title)
    windowactivate(jb)
    return jb
end

function find_activate_from_titleAndclass(title, clsname)
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

//function move_click(a,b)
//    鼠标移动(a,b)
//    sleep(50)
//    鼠标左键单击(1)
//    sleep(50)
//end