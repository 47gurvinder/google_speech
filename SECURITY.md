# Security Policy

## Supported versions

Security fixes are provided for the latest published major version of `google_speech_gdx_plus`. Users should reproduce a report against the latest release before submitting it when practical.

## Reporting a vulnerability

Please do not open a public issue for a suspected vulnerability. Use [GitHub's private vulnerability reporting](https://github.com/47gurvinder/google_speech/security/advisories/new) or contact the maintainer through [gurwinderdevx.com](https://gurwinderdevx.com).

Include the affected version, impact, reproduction steps, and any suggested mitigation. Do not include live service-account credentials, access tokens, personal data, or private audio samples.

You should receive an acknowledgement within seven days. Disclosure timing will be coordinated after the report has been validated and a remediation is available.

## Credential safety

This package can authenticate to Google Cloud. Applications must not embed production service-account private keys or long-lived tokens in distributable Flutter assets. Prefer short-lived credentials issued by a trusted backend.
