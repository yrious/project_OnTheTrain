package com.kh.onthetrain.member.api;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
 
@Component
public class NaverLoginBo {
	private final static String REDIRECT_URI = "http://localhost:8088/onthetrain/login/naver";
	private final static String SESSION_STATE = "n_oauth_state";
	// 프로필 조회 API URL
	private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";
	
	@Value("${key.naverClientId}")
	private String CLIENT_ID;

	@Value("${key.naverClientSecret}")
	private String CLIENT_SECRET;
	
	// 네이버 로그인 URL 생성
	public String getAuthorizationUrl(HttpSession session) {
		
		// 세션 유효성 검증을 위하여 난수 생성, session에 저장
		String state = generateRandomString();
		setSession(session,state);        
 
		// Scribe에서 제공하는 인증 URL 생성 기능을 이용하여 Url 생성
		OAuth20Service oauthService = new ServiceBuilder()                                                   
				.apiKey(CLIENT_ID)
				.apiSecret(CLIENT_SECRET)
				.callback(REDIRECT_URI)
				.state(state) 
				.build(NaverLoginApi.instance());
		return oauthService.getAuthorizationUrl();
	}
	
 
    // 네이버아이디로 Callback 처리 및  AccessToken 획득 Method
	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException{
 
		// Callback으로 전달받은 세선검증용 난수값과 세션에 저장되어있는 값이 일치하는지 확인
		String sessionState = getSession(session);
		System.out.println("세션state"+sessionState);
		System.out.println("세션" + getSession(session));
		
		// access토큰 획득
		if(StringUtils.pathEquals(sessionState, state)){
			OAuth20Service oauthService = new ServiceBuilder()
					.apiKey(CLIENT_ID)
					.apiSecret(CLIENT_SECRET)
					.callback(REDIRECT_URI)
					.state(state)
					.build(NaverLoginApi.instance());
 
            //Scribe에서 제공하는 AccessToken 획득 기능
            OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
            System.out.println(accessToken);
            return accessToken;
        }
        return null;
        }
	
	// Access Token을 이용하여 사용자 정보 받아오기
	public String getUserInfo(OAuth2AccessToken oauthToken) throws IOException{
		
		OAuth20Service oauthService = new ServiceBuilder()
				.apiKey(CLIENT_ID)
				.apiSecret(CLIENT_SECRET)
				.callback(REDIRECT_URI).build(NaverLoginApi.instance());
		
		// 로그인 사용자 정보를 읽어온다.
		OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
		oauthService.signRequest(oauthToken, request);
		Response response = request.send();
 		
		return response.getBody();
	}
 
    // 세션 유효성 검증을 위한 난수 생성기
    private String generateRandomString() {
        return UUID.randomUUID().toString();
    }
 
    // 세션 데이터 저장
    private void setSession(HttpSession session,String state){
        session.setAttribute(SESSION_STATE, state);     
    }
 
    // 세션 데이터 가져오기
    private String getSession(HttpSession session){
        return (String) session.getAttribute(SESSION_STATE);
    }
}