package com.cg.crud.utils;

import java.util.HashMap;
import java.util.Map;

/**
 * @program: SSM-CRUD->Msg
 * @description: 通用的返回信息
 * @author: cg
 * @create: 2020-01-03 11:45
 **/

public class Msg {

    /**
     * 状态码 0:成功 1:失败 2:异常
     */
    private int code;

    /**
     * 提示信息
     */
    private String message;

    /**
     * 用户要返回的数据
     */
    private Map<String, Object> data = new HashMap<>();

    public Msg add(String key, Object value) {
        this.data.put(key, value);
        return this;
    }

    public static Msg success() {
        Msg msg = new Msg();
        msg.setCode(0);
        msg.setMessage("处理成功");
        return msg;
    }

    public static Msg error() {
        Msg msg = new Msg();
        msg.setCode(1);
        msg.setMessage("处理失败");
        return msg;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Map<String, Object> getData() {
        return data;
    }

    public void setData(Map<String, Object> data) {
        this.data = data;
    }
}
