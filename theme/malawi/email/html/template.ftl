<#macro emailLayout>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--[if mso]><noscript><xml><o:OfficeDocumentSettings><o:PixelsPerInch>96</o:PixelsPerInch></o:OfficeDocumentSettings></xml></noscript><![endif]-->
</head>
<body style="margin:0;padding:0;background-color:#f5f5f5;font-family:-apple-system,BlinkMacSystemFont,'Segoe UI','Inter',Roboto,sans-serif;">
    <table role="presentation" width="100%" cellpadding="0" cellspacing="0" style="background-color:#f5f5f5;">
        <tr>
            <td align="center" style="padding:32px 16px;">
                <table role="presentation" width="520" cellpadding="0" cellspacing="0" style="max-width:520px;width:100%;background:#ffffff;border-radius:12px;overflow:hidden;box-shadow:0 1px 3px rgba(0,0,0,0.06);">

                    <!-- Header -->
                    <tr>
                        <td style="padding:28px 36px 20px 36px;border-bottom:1px solid #f0f0f0;">
                            <table role="presentation" width="100%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="font-size:18px;font-weight:700;color:#1f2937;font-family:-apple-system,BlinkMacSystemFont,'Segoe UI','Inter',Roboto,sans-serif;">
                                        <span style="color:#f59e0b;margin-right:6px;">&#10022;</span> ${realmName}
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <!-- Body -->
                    <tr>
                        <td style="padding:32px 36px;font-size:15px;line-height:1.7;color:#374151;font-family:-apple-system,BlinkMacSystemFont,'Segoe UI','Inter',Roboto,sans-serif;">
                            <#nested>
                        </td>
                    </tr>

                    <!-- Footer -->
                    <tr>
                        <td style="padding:24px 36px;border-top:1px solid #f0f0f0;">
                            <table role="presentation" width="100%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="font-size:14px;font-weight:600;color:#1f2937;font-family:-apple-system,BlinkMacSystemFont,'Segoe UI','Inter',Roboto,sans-serif;">
                                        <span style="color:#f59e0b;margin-right:4px;">&#10022;</span> ${realmName}
                                    </td>
                                    <td align="right" style="font-size:0;">
                                        <!-- X / Twitter -->
                                        <a href="#" style="display:inline-block;margin-left:8px;text-decoration:none;">
                                            <span style="display:inline-block;width:28px;height:28px;line-height:28px;text-align:center;background:#f3f4f6;border-radius:50%;font-size:13px;color:#6b7280;">&#120143;</span>
                                        </a>
                                        <!-- Facebook -->
                                        <a href="#" style="display:inline-block;margin-left:8px;text-decoration:none;">
                                            <span style="display:inline-block;width:28px;height:28px;line-height:28px;text-align:center;background:#f3f4f6;border-radius:50%;font-size:13px;color:#6b7280;">f</span>
                                        </a>
                                        <!-- Instagram -->
                                        <a href="#" style="display:inline-block;margin-left:8px;text-decoration:none;">
                                            <span style="display:inline-block;width:28px;height:28px;line-height:28px;text-align:center;background:#f3f4f6;border-radius:50%;font-size:13px;color:#6b7280;">&#9737;</span>
                                        </a>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                </table>
            </td>
        </tr>
    </table>
</body>
</html>
</#macro>

<#-- Reusable orange CTA button -->
<#macro ctaButton url label>
<table role="presentation" cellpadding="0" cellspacing="0" style="margin:24px 0;">
    <tr>
        <td style="background:#f59e0b;border-radius:8px;">
            <a href="${url}" target="_blank" style="display:inline-block;padding:12px 28px;font-size:14px;font-weight:600;color:#ffffff;text-decoration:none;font-family:-apple-system,BlinkMacSystemFont,'Segoe UI','Inter',Roboto,sans-serif;">${label}</a>
        </td>
    </tr>
</table>
</#macro>
