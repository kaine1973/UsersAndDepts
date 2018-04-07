package rk.model;

public class MessageModel {

    public Integer code = 200;
    public String msg = "操作成功";

    public MessageModel() {
    }

    public MessageModel(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }
}
