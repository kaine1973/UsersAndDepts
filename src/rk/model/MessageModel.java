package rk.model;

public class MessageModel {

    public Integer code = 200;
    public String msg = "操作成功";

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public MessageModel() {
    }

    public MessageModel(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }
}
