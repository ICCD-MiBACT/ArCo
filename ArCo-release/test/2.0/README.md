# Cross-domain pattern documentation
Complete documentation on ArCo cross-domain patterns. Every folder contains a specific pattern described by:
- updated pattern diagram
- deprecated pattern diagram
- toy dataset for testing
- corresponding ICCD tag mapping (if available)
- testing suite (if available)

## Testing
The testing task was carried out with [OWLUnit](https://github.com/luigi-asprino/owl-unit), a java software for the eXtreme Design testing methodology, involving:
- Competency Question verification
- Error Provocation
- Inference Verification

OWLUnit execution:
java -jar OWLUnit-0.3.2.jar -c https://raw.githubusercontent.com/ICCD-MiBACT/ArCo/DEV-1.3.0/ArCo-release/test/2.0/Pattern/XX/XX/testcase_XX.ttl
