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
        return"任务已完成";
    }else if (k_status == 3){
        return"截至时间已过";
    }
}

function appraiseGrade(grade) {
    if (grade == 1){
        return"很差";
    }else if (grade == 2){
        return"比较差";
    }else if (grade == 3){
        return"一般";
    }else if(grade ==4){
        return"比较好";
    }else if (grade == 5){
        return "很好";
    }
}

function typeToString(type) {
    var result = "";
    if (type == "中通") {
        result = "zhongtong";
    }
    if (type == "韵达") {
        result = "yunda";
    }
    if (type == "圆通") {
        result = "yuantong";
    }
    if (type == "百世快递") {
        result = "huitongkuaidi";
    }
    if (type == "申通") {
        result = "shentong";
    }
    if (type == "万象物流") {
        result = "wanxiangwuliu";
    }
    if (type == "EMS物流") {
        result = "ems";
    }
    return result;
}
