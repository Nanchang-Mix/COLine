package com.yuanlrc.base.constant;

import java.util.Arrays;
import java.util.List;

/**
 * 系统运行时的常量
 * @author Administrator
 *
 */
public class RuntimeConstant {

	//后台登录拦截器无需拦截的url
	public static List<String> loginExcludePathPatterns = Arrays.asList(
			"/home/**",
			"/system/login",
			"/admin/css/**",
			"/admin/fonts/**",
			"/admin/js/**",
			"/admin/images/**",
			"/error",
			"/webSocket/**",
			"/upload/upload_photo",
			"/upload/upload_file",
			"/download/download_file",
			"/photo/view",
			"/system/auth_order",
			"/cpacha/generate_cpacha"
		);
	//后台权限拦截器无需拦截的url
	public static List<String> authorityExcludePathPatterns = Arrays.asList(
			"/home/**",
			"/system/login",
			"/system/auth_order",
			"/system/index",
			"/system/no_right",
			"/admin/css/**",
			"/admin/fonts/**",
			"/admin/js/**",
			"/admin/images/**",
			"/error",
			"/cpacha/generate_cpacha",
			"/system/logout",
			"/system/update_userinfo",
			"/system/update_pwd",
			"/webSocket/**",
			"/upload/upload_photo",
			"/upload/upload_file",
			"/download/download_file",
			"/photo/view"
		);
	//前台登录拦截器无需拦截的url
	public static List<String> homeLoginExcludePathPatterns = Arrays.asList(
			"/admin/**",
			"/home/index/**",
			"/system/auth_order",
			"/home/css/**",
			"/home/fonts/**",
			"/home/js/**",
			"/home/images/**",
			"/home/layer/**",
			"/home/plugins/**",
			"/home/audio/**",
			"/system/**",
			"/error",
			"/webSocket/**",
			"/photo/view",
			"/download/download_file",
			"/upload/upload_photo",
			"/cpacha/generate_cpacha"
	);
	//前台全局拦截器无需拦截的url
	public static List<String> homeGlobalExcludePathPatterns = Arrays.asList(
			"/admin/**",
			"/home/index/**",
			"/system/auth_order",
			"/home/css/**",
			"/home/fonts/**",
			"/home/js/**",
			"/home/images/**",
			"/home/layer/**",
			"/home/plugins/**",
			"/home/audio/**",
			"/system/**",
			"/error",
			"/webSocket/**",
			"/photo/view",
			"/upload/upload_photo",
			"/download/download_file",
			"/cpacha/generate_cpacha"
	);
}
