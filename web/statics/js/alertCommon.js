/**
 * Created by lenovo on 2017/10/6.
 */

function mine(msg) {
    if (msg != null && msg != "null") {
        alert(msg);
    }
}

function status(k_status) {
    if (k_status == 0){
        return"未领取";
    }else if (k_status == 1){
        return"已领取";
    }else if (k_status == 2){
        return"任务已接受";
    }else if (k_status == 3){
        return"截至时间已过";
    }
}
