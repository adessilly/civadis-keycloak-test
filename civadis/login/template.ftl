<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayWide=false>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">

    <title>CIVADIS - Login</title>

    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css">
    <link rel="stylesheet" type="text/css" href="${url.resourcesPath}/css/login.css">
    <link rel="stylesheet" type="text/css" href="${url.resourcesPath}/css/checkbox.css">    

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title>${msg("loginTitle",(realm.displayName!''))}</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>
</head>

<body class="${properties.kcBodyClass!}">
  <div class="${properties.kcLoginClass!}">

    <div class="login-body">


        <div class="login-panel ui-fluid animated fadeIn">
            <div class="ui-g">
                <div class="ui-g-12 logo-container">
                    <img src="${url.resourcesPath}/img/civadis/civadis-dark.svg" class="logo">
                    <img src="${url.resourcesPath}/img/civadis/icon-login.svg" class="login-icon">
                    <h2 class="animated fadeInDown slow">Authentification</h2>
                </div>
                <div class="ui-civadis-gradiant">
                    <div class="animated fadeInRight"></div>
                    <div class="animated fadeInLeft"></div>
                    <div class="animated fadeInRight"></div>
                    <div class="animated fadeInLeft"></div>
                </div>


                <div class="login-content">

                    <#if displayMessage && message?has_content>
                        <div class="alert alert-${message.type}">
                            <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                            <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                            <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                            <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                            <span class="kc-feedback-text">${kcSanitize(message.summary)?no_esc}</span>
                        </div>
                    </#if>
        
                    <#if displayInfo>
                        <div id="kc-info" class="${properties.kcSignUpClass!}">
                            <div id="kc-info-wrapper" class="${properties.kcInfoAreaWrapperClass!}">
                                <#nested "info">
                            </div>
                        </div>
                    </#if>

                    <#nested "form">

                </div>


            </div>
        </div>
    
        <div class="login-panel ui-fluid shadow-paper"></div>
    
    </div>    
</body>
</html>
</#macro>
