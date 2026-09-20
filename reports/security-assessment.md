
# Azure Storage Security Assessment

## Assessment Summary

Environment: Local Terraform configuration
Scanner: Checkov 3.3.19
Cloud deployment: None

## Finding SEC-001: Anonymous Blob Access

Affected resource:
azurerm_storage_account.insecure

Checkov policy:
CKV2_AZURE_47

### Risk

The configuration permits storage containers
to enable anonymous blob access.

This could expose data if a container is
configured for public access.

### Remediation

Changed:

    allow_nested_items_to_be_public = true

To:

    allow_nested_items_to_be_public = false

### Validation

Insecure configuration: FAILED
Corrected configuration: PASSED

The selected security check validated
the remediation.

## Finding SEC-002: HTTPS Enforcement

The insecure configuration disables
HTTPS-only traffic.

Remediation:

    https_traffic_only_enabled = true

The corrected configuration passed
CKV_AZURE_3 in the broader scan.

## Broader Assessment

Passed: 7
Failed: 8
Skipped: 0

The remaining findings concern:

- Public network access restrictions
- Storage Queue logging
- Replication requirements
- Shared Key authorization
- Private endpoint configuration
- SAS expiration policy
- Soft-delete protection
- Customer-managed encryption keys

These findings remain under investigation.

## Limitations

Testing was performed through static analysis.

No Azure resources were deployed.
No runtime security testing was performed.

A successful individual check does not
establish that the entire infrastructure
is secure.