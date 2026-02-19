<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>

    <#if section = "header">
        ${msg("loginAccountTitle")}

    <#elseif section = "form">
        <p class="adf-subtitle">${msg("loginAccountSubtitle")}</p>

        <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">

            <#if !usernameHidden??>
                <div class="adf-form-group">
                    <label for="username" class="adf-label">
                        <#if !realm.loginWithEmailAllowed>${msg("username")}
                        <#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}
                        <#else>${msg("email")}
                        </#if>
                        <span class="adf-required">*</span>
                    </label>
                    <div class="adf-input-wrapper">
                        <span class="adf-input-icon">
                            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#9ca3af" stroke-width="1.5"><rect x="2" y="4" width="20" height="16" rx="2"/><path d="M22 7l-10 7L2 7"/></svg>
                        </span>
                        <input tabindex="1" id="username" name="username"
                               value="${(login.username!'')}"
                               type="text" autofocus autocomplete="off"
                               placeholder="${msg('emailPlaceholder')}"
                               class="adf-input <#if messagesPerField.existsError('username','password')>adf-input-error</#if>"
                               aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>" />
                    </div>
                    <#if messagesPerField.existsError('username','password')>
                        <span class="adf-error-message" aria-live="polite">
                            ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                        </span>
                    </#if>
                </div>
            </#if>

            <div class="adf-form-group">
                <label for="password" class="adf-label">
                    ${msg("password")} <span class="adf-required">*</span>
                </label>
                <div class="adf-input-wrapper">
                    <span class="adf-input-icon">
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#9ca3af" stroke-width="1.5"><rect x="3" y="11" width="18" height="11" rx="2"/><path d="M7 11V7a5 5 0 0110 0v4"/></svg>
                    </span>
                    <input tabindex="2" id="password" name="password"
                           type="password" autocomplete="off"
                           placeholder="${msg('passwordPlaceholder')}"
                           class="adf-input <#if usernameHidden?? && messagesPerField.existsError('username','password')>adf-input-error</#if>"
                           aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>" />
                    <button type="button" class="adf-toggle-password" tabindex="-1" onclick="togglePassword()" aria-label="Toggle password visibility">
                        <svg id="eye-icon" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#9ca3af" stroke-width="1.5"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/></svg>
                    </button>
                </div>
                <#if usernameHidden?? && messagesPerField.existsError('username','password')>
                    <span class="adf-error-message" aria-live="polite">
                        ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                    </span>
                </#if>
            </div>

            <#if realm.resetPasswordAllowed>
                <div class="adf-forgot-password">
                    <a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a>
                </div>
            </#if>

            <div class="adf-form-group">
                <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                <button tabindex="4" name="login" id="kc-login" type="submit" class="adf-btn-primary">
                    ${msg("doLogIn")}
                </button>
            </div>
        </form>

        <script>
            function togglePassword() {
                var pwd = document.getElementById('password');
                pwd.type = pwd.type === 'password' ? 'text' : 'password';
            }
        </script>

    <#elseif section = "socialProviders">
        <#if realm.password && social.providers??>
            <div class="adf-social-divider">
                <span>or</span>
            </div>
            <div class="adf-social-providers">
                <#list social.providers as p>
                    <a id="social-${p.alias}" class="adf-btn-social" href="${p.loginUrl}">
                        <#if p.iconClasses?has_content>
                            <i class="${p.iconClasses!}" aria-hidden="true"></i>
                        </#if>
                        ${p.displayName!}
                    </a>
                </#list>
            </div>
        </#if>

    <#elseif section = "info">
        <div class="adf-footer-text">
            <span>${msg("noAccount")} <a href="${url.registrationUrl}" class="adf-link-accent">${msg("doRegister")}</a></span>
        </div>
    </#if>

</@layout.registrationLayout>
