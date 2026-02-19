<#import "template.ftl" as layout>
<@layout.mainLayout active='totp' bodyClass='totp'; section>

    <div class="row">
        <div class="col-md-10">
            <h2>${msg("authenticatorTitle")}</h2>
        </div>
    </div>

    <#if totp.enabled>
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th colspan="2">${msg("configuredAuthenticators")}</th>
                </tr>
            </thead>
            <tbody>
                <#list totp.otpCredentials as credential>
                    <tr>
                        <td class="provider">${msg("totp")}: ${credential.id}</td>
                        <td class="action">
                            <form action="${url.totpUrl}" method="post" class="form-inline">
                                <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
                                <input type="hidden" id="submitAction" name="submitAction" value="Delete">
                                <input type="hidden" id="credentialId" name="credentialId" value="${credential.id}">
                                <button id="remove-mobile" class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!}">
                                    ${msg("doRemove")}
                                </button>
                            </form>
                        </td>
                    </tr>
                </#list>
            </tbody>
        </table>
    <#else>

        <hr/>

        <ol>
            <li>
                <p>${msg("totpStep1")}</p>
            </li>
            <li>
                <p>${msg("totpStep2")}</p>
                <p><img src="data:image/png;base64, ${totp.totpSecretQrCode}" alt="QR code" /></p>
                <p><span class="code">${totp.totpSecretEncoded}</span></p>
            </li>
            <li>
                <p>${msg("totpStep3")}</p>
                <p>${msg("totpStep3DeviceName")}</p>
            </li>
        </ol>

        <form action="${url.totpUrl}" class="form-horizontal" method="post">
            <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
            <div class="form-group">
                <div class="col-sm-2 col-md-2">
                    <label for="totp" class="control-label">${msg("authenticatorCode")}</label>
                </div>
                <div class="col-sm-10 col-md-10">
                    <input type="text" class="form-control" id="totp" name="totp" autocomplete="off" autofocus />
                    <input type="hidden" id="totpSecret" name="totpSecret" value="${totp.totpSecret}" />
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-2 col-md-2">
                    <label for="userLabel" class="control-label">${msg("totpDeviceName")}</label>
                </div>
                <div class="col-sm-10 col-md-10">
                    <input type="text" class="form-control" id="userLabel" name="userLabel" autocomplete="off" />
                </div>
            </div>

            <div class="form-group">
                <div id="kc-form-buttons" class="col-md-offset-2 col-md-10 submit">
                    <div>
                        <button type="submit" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" name="submitAction" value="Save">${msg("doSave")}</button>
                        <button type="submit" class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!}" name="submitAction" value="Cancel">${msg("doCancel")}</button>
                    </div>
                </div>
            </div>
        </form>
    </#if>

</@layout.mainLayout>
