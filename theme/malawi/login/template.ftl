<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false showAnotherWayIfPresent=true>
<!DOCTYPE html>
<html lang="${locale.currentLanguageTag!'en'}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>${msg("loginTitle",(realm.displayName!''))}</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />

    <#if properties.stylesCommon?has_content>
        <#list properties.stylesCommon?split(' ') as style>
            <link href="${url.resourcesCommonPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>

    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>
</head>

<body class="adf-login-body ${bodyClass}">
    <div class="adf-login-wrapper">
        <div class="adf-login-card">

            <!-- Logo and Title -->
            <div class="adf-login-header">
                <div class="adf-logo">
                    <img src="${url.resourcesPath}/img/logo.svg" alt="${realm.displayName!''}" onerror="this.style.display='none'" />
                    <span class="adf-logo-text">${realm.displayName!'ADFinance'}</span>
                </div>
                <h1 class="adf-title"><#nested "header"></h1>
                <#if displayRequiredFields>
                    <p class="adf-subtitle">${msg("requiredFields")}</p>
                </#if>
            </div>

            <!-- Locale Switcher -->
            <#if realm.internationalizationEnabled && locale.supported?size gt 1>
                <div class="adf-locale">
                    <select onchange="window.location=this.value">
                        <#list locale.supported as l>
                            <option value="${l.url}" <#if l.label == locale.current>selected</#if>>${l.label}</option>
                        </#list>
                    </select>
                </div>
            </#if>

            <!-- Alert Messages -->
            <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
                <div class="adf-alert adf-alert-${message.type}">
                    ${kcSanitize(message.summary)?no_esc}
                </div>
            </#if>

            <!-- Show username (for multi-step flows) -->
            <#if auth?has_content && auth.showUsername() && !auth.showResetCredentials()>
                <div class="adf-attempted-username">
                    <span>${auth.attemptedUsername}</span>
                    <a href="${url.loginRestartFlowUrl}" title="${msg("restartLoginTooltip")}">
                        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M1 4v6h6M23 20v-6h-6"/><path d="M20.49 9A9 9 0 005.64 5.64L1 10m22 4l-4.64 4.36A9 9 0 013.51 15"/></svg>
                    </a>
                </div>
            </#if>

            <!-- Page-specific form content -->
            <#nested "form">

            <#if auth?has_content && auth.showTryAnotherWayLink() && showAnotherWayIfPresent>
                <form id="kc-select-try-another-way-form" action="${url.loginAction}" method="post">
                    <input type="hidden" name="tryAnotherWay" value="on"/>
                    <a href="#" class="adf-link" onclick="document.forms['kc-select-try-another-way-form'].submit();return false;">${msg("doTryAnotherWay")}</a>
                </form>
            </#if>

            <#nested "socialProviders">

            <#if displayInfo>
                <div class="adf-info">
                    <#nested "info">
                </div>
            </#if>

        </div>
    </div>
</body>
</html>
</#macro>
