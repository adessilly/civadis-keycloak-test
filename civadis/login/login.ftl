<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo displayWide=(realm.password && social.providers??); section>
    <#if section = "header">
        ${msg("doLogIn")}
    <#elseif section = "form">
    <div id="kc-form" <#if realm.password && social.providers??>class="${properties.kcContentWrapperClass!}"</#if>>
      <div id="kc-form-wrapper" <#if realm.password && social.providers??>class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}"</#if>>
        <#if realm.password>
            <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">

                    <div class="input-wrapper">

                        <#if usernameEditDisabled??>
                            <input tabindex="1" type="text" id="username" name="username" autocomplete="off" placeholder="${msg('username')}" value="${(login.username!'')}" class="ui-inputtext ui-widget" disabled>
                        <#else>
                            <input tabindex="1" type="text" id="username" name="username" autocomplete="off" placeholder="${msg('username')}" value="${(login.username!'')}" class="ui-inputtext ui-widget" autofocus autocomplete="off" />  
                        </#if>
                        
                        <i class="fa fa-user"></i>
                    </div>

                    <div class="input-wrapper">
                        <input tabindex="2" type="password" name="password" autocomplete="off" placeholder="${msg('password')}" class="ui-inputtext ui-widget">
                        <i class="fa fa-lock"></i>
                        <div class="${properties.kcFormOptionsWrapperClass!}">
                            <#if realm.resetPasswordAllowed>
                                <span><a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                            </#if>
                        </div>
                    </div>



                <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                    <div id="kc-form-options">
                        <#if realm.rememberMe && !usernameEditDisabled??>

                            <div class="checkbox">
                                <label class="container" for="rememberMe">
                                    <#if login.rememberMe??>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked> ${msg("rememberMe")}
                                        <span class="checkmark"></span>
                                    <#else>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe")}
                                        <span class="checkmark"></span>
                                    </#if>
                                </label>
                            </div>
                        </#if>
                        </div>
                        

                  </div>

                <div class="button-container">
                    <button tabindex="4" name="login" id="kc-login" type="submit" class="btn-connexion">
                        <span class="ui-button-text ui-c">${msg("doLogIn")}</span>
                    </button>
                </div>

            </form>
        </#if>
        </div>
        <#if realm.password && social.providers??>
            <div id="kc-social-providers" class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}">
                <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 4>${properties.kcFormSocialAccountDoubleListClass!}</#if>">
                    <#list social.providers as p>
                        <li class="${properties.kcFormSocialAccountListLinkClass!}"><a href="${p.loginUrl}" id="zocial-${p.alias}" class="zocial ${p.providerId}"> <span>${p.displayName}</span></a></li>
                    </#list>
                </ul>
            </div>
        </#if>
      </div>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
            <div id="kc-registration">
                <span><i class="fa fa-user-plus"></i>&nbsp;${msg("noAccount")}&nbsp;&nbsp;<a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
            </div>
        </#if>
    </#if>

</@layout.registrationLayout>
