package com.qiang.common.bean;

/**
 * ���ص�ҳ��˵Ľ���࣬���ڷ����Ƿ�����ɹ�����Ϣ
 * @author Administrator
 *
 */
public class ControllerResult {

	public static final String RESULT_SUCCESS = "success";
	public static final String RESULT_FAIL = "fail";
	
	private String result;
	private String message;
	
	public ControllerResult() {
		
	}
	
	ControllerResult(String result, String message) {
		this.result = result;
		this.message = message;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	public static ControllerResult setSuccessResult(String message) {
		return new ControllerResult(RESULT_SUCCESS, message);
	}
	
	public static ControllerResult setFailResult(String message) {
		return new ControllerResult(RESULT_FAIL, message);
	}
}
