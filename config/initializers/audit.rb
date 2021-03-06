# The audit class is part of audited plugin
# we reopen here to add search functionality
require 'audited'

# Re-opened AuditorInstanceMethods to audit 1-0-* associations
Audited::Auditor::AuditedInstanceMethods.send(:prepend, AuditAssociations::AssociationsChanges)

ApplicationRecord.send(:extend, AuditAssociations::AssociationsDefinitions)

# Audit includes Taxonomix which already relies on DSL provided by audited gem
Audit = Audited::Audit
Audit.send(:include, AuditExtensions)
