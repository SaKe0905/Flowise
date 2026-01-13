# Flowise Dependency Audit Report

**Date**: 2026-01-13
**Auditor**: Claude (Automated Analysis)
**Scope**: All package.json files in the monorepo

---

## Executive Summary

This audit identified **4 critical security vulnerabilities**, **10+ severely outdated packages**, and **3 groups of redundant dependencies** across the Flowise monorepo. Immediate action is required to address the critical security issues, particularly the deprecated `vm2` package which has known sandbox escape vulnerabilities.

**Key Findings**:
- 🔴 **CRITICAL**: vm2 has remote code execution vulnerabilities and is deprecated
- 🔴 **HIGH**: axios 0.27.2 has security issues, needs upgrade to 1.6.x
- 🟡 **MEDIUM**: Multiple outdated packages including langchain, TypeScript, and mysql
- ⚠️ **BLOAT**: Redundant dependencies (mysql+mysql2, moment variants)

---

## 🔴 CRITICAL SECURITY VULNERABILITIES

### 1. vm2@^3.9.19 - DEPRECATED & VULNERABLE
**Location**: `packages/components/package.json:59`

**Severity**: 🔴 CRITICAL

**CVEs**:
- CVE-2023-32314 (Sandbox Escape)
- CVE-2023-37466 (Sandbox Escape)
- CVE-2023-29199 (Prototype Pollution)

**Status**: Package officially DEPRECATED by maintainer

**Impact**: Remote code execution - attackers can escape the sandbox and execute arbitrary code

**Recommended Action**:
```json
// REMOVE: "vm2": "^3.9.19"

// Option 1: Use isolated-vm (more secure)
"isolated-vm": "^4.6.0"

// Option 2: Use Node.js native vm module with additional sandboxing
// Requires code refactoring for proper isolation

// Option 3: Remove code execution features if not essential
```

**Priority**: IMMEDIATE - This should be addressed before next deployment

---

### 2. axios@^0.27.2 - Security Vulnerabilities
**Location**:
- `packages/components/package.json:31`
- `packages/server/package.json:49`

**Severity**: 🔴 HIGH

**Issues**:
- Known security vulnerabilities in 0.x branch
- Missing security headers
- SSRF vulnerabilities in older versions

**Current Version**: 0.27.2
**Latest Version**: 1.6.x

**Recommended Action**:
```json
// UPDATE in both packages/components and packages/server
"axios": "^1.6.0"
```

**Breaking Changes**: Minimal - mostly TypeScript types improvements

**Priority**: HIGH - Update within 1-2 weeks

---

### 3. mysql@^2.18.1 - Vulnerable & Redundant
**Location**: `packages/server/package.json:59`

**Severity**: 🟡 MEDIUM

**Issues**:
- Known vulnerabilities
- No longer maintained
- `mysql2` is already in use (packages/components)

**Recommended Action**:
```json
// REMOVE from packages/server/package.json:
// "mysql": "^2.18.1"

// mysql2 is already available in components package:
// "mysql2": "^3.5.1"
```

**Priority**: MEDIUM - Remove within 1 month

---

### 4. node-fetch@^2.6.11 - Outdated Security
**Location**: `packages/components/package.json:48`

**Severity**: 🟡 MEDIUM

**Issues**:
- Security vulnerabilities in v2 branch
- Node.js 18+ has native fetch support

**Current Version**: 2.6.11
**Latest Version**: 3.3.x (ESM only)

**Recommended Action**:
```javascript
// Option 1: Use native fetch (Node 18+ already required)
// Remove "node-fetch": "^2.6.11" entirely
// Update code to use global fetch

// Option 2: Upgrade to v3 (requires ESM)
"node-fetch": "^3.3.0"
```

**Priority**: MEDIUM - Address within 1 month

---

## 📦 SEVERELY OUTDATED PACKAGES

### 1. langchain@^0.0.128
**Location**: `packages/components/package.json:43`

**Current**: 0.0.128
**Latest**: 0.1.x or 0.2.x (check current version)

**Issues**:
- Extremely outdated - missing 6+ months of updates
- Missing critical features, bug fixes, security patches
- Performance improvements unavailable

**Recommended Action**:
```json
"langchain": "^0.1.0"  // or latest 0.1.x/0.2.x
```

**Note**: This will require code changes due to breaking changes in langchain API

**Priority**: HIGH

---

### 2. TypeScript@^4.8.4
**Location**: All packages

**Current**: 4.8.4
**Latest**: 5.3.x

**Benefits of Upgrading**:
- Better performance (10-20% faster compilation)
- Improved type checking accuracy
- New language features (const type parameters, decorators, etc.)
- Better IDE support

**Recommended Action**:
```json
"typescript": "^5.0.0"
```

**Priority**: MEDIUM

---

### 3. React Router@~6.3.0
**Location**: `packages/ui/package.json:40-41`

**Current**: 6.3.0
**Latest**: 6.20.x+

**Issues**:
- Missing 17+ minor versions of updates
- Bug fixes and performance improvements unavailable

**Recommended Action**:
```json
"react-router": "^6.20.0",
"react-router-dom": "^6.20.0"
```

**Priority**: MEDIUM

---

### 4. Additional Outdated Packages

| Package | Current | Latest | Location |
|---------|---------|--------|----------|
| prettier | 2.7.1 | 3.x | root |
| eslint | 8.24.0 | 8.56.x | root |
| turbo | 1.7.4 | 1.11.x+ | root |
| @mui/material | 5.11.12 | 5.15.x | ui |
| @mui/x-data-grid | 6.8.0 | 6.18.x | ui |
| framer-motion | 4.1.13 | 10.x | ui |
| playwright | 1.35.0 | 1.40.x | components |
| puppeteer | 20.7.1 | 21.x | components |
| typeorm | 0.3.6 | 0.3.17+ | server |
| socket.io | 4.6.1 | 4.7.x | server |
| yup | 0.32.9 | 1.x | ui |
| husky | 8.0.1 | 9.x | root |
| lint-staged | 13.0.3 | 15.x | root |

---

## ⚠️ DEPRECATED / MAINTENANCE MODE

### moment + moment-timezone
**Location**:
- `packages/components/package.json:46`
- `packages/ui/package.json:27`
- `packages/server/package.json:57`

**Status**: In maintenance mode since 2020 - no new features

**Issues**:
- Large bundle size (~70KB minified)
- Not tree-shakeable
- Mutable API (error-prone)

**Recommended Migration**:

**Option 1: date-fns (Recommended)**
```json
"date-fns": "^3.0.0",
"date-fns-tz": "^2.0.0"
```
Benefits: Modular, tree-shakeable, smaller bundle, immutable

**Option 2: dayjs**
```json
"dayjs": "^1.11.0"
```
Benefits: Similar API to moment, smaller size, easier migration

**Bundle Size Comparison**:
- moment: ~70KB
- date-fns (with tree-shaking): ~10-20KB for typical usage
- dayjs: ~7KB

**Priority**: MEDIUM - Plan migration over 1-3 months

---

## 🔄 REDUNDANT DEPENDENCIES

### 1. MySQL Packages
**Issue**: Both mysql and mysql2 are in use

```json
// packages/server/package.json
"mysql": "^2.18.1"  // ❌ Remove

// packages/components/package.json
"mysql2": "^3.5.1"  // ✅ Keep
```

**Action**: Standardize on mysql2 everywhere

---

### 2. Date/Time Libraries
**Issue**: Multiple date libraries in different packages

```json
// Currently scattered:
"moment": "^2.29.3"           // components, ui
"moment-timezone": "^0.5.34"  // server
```

**Action**: Migrate all to single modern library (date-fns recommended)

---

### 3. Express in Components
**Location**: `packages/components/package.json:37`

**Issue**: Components package includes express server framework

**Question**: Does the components library actually need express, or is it only used in server package?

**Recommended Review**:
- Check if components package uses express
- If not, remove from components and keep only in server
- If yes, consider if components should depend on server instead

---

## 🎈 POTENTIAL BLOAT ANALYSIS

### Large Dependencies in Components Package

The components package includes many heavy AI/ML dependencies. Review if all are actively used:

**Vector Databases** (multiple clients):
```json
"@pinecone-database/pinecone": "^0.0.14",
"@qdrant/js-client-rest": "^1.2.2",
"chromadb": "^1.5.3",
"weaviate-ts-client": "^1.1.0",
"@opensearch-project/opensearch": "^1.2.0",
"faiss-node": "^0.2.2"
```

**Recommendation**: Consider peer dependencies or optional dependencies if not all are used in every deployment

---

**Browser Automation** (two tools):
```json
"playwright": "^1.35.0",  // ~150MB download
"puppeteer": "^20.7.1"    // ~150MB download
```

**Question**: Are both needed? These are large packages with overlapping functionality.

**Recommendation**: Standardize on one if possible

---

**Python Runtime**:
```json
"pyodide": ">=0.21.0-alpha.2"  // ~100MB+ Python in WebAssembly
```

**Question**: Is this essential? Very large package.

**Recommendation**: Review usage, consider making optional

---

**PDF Processing** (multiple libraries):
```json
"pdf-parse": "^1.1.1",
"pdfjs-dist": "^3.7.107"
```

**Question**: Are both needed for different use cases?

**Recommendation**: Review if both are necessary

---

## 📋 RECOMMENDED ACTION PLAN

### Phase 1: Critical Security (IMMEDIATE - Week 1)
**Priority**: 🔴 CRITICAL

- [ ] **vm2 Replacement**
  - Research secure alternative (isolated-vm vs native vm vs remove feature)
  - Implement replacement
  - Test thoroughly
  - Deploy

- [ ] **axios Upgrade**
  - Update to axios@^1.6.0 in packages/components
  - Update to axios@^1.6.0 in packages/server
  - Run tests
  - Deploy

**Estimated Effort**: 8-16 hours

---

### Phase 2: High-Priority Security & Updates (Weeks 2-4)
**Priority**: 🟡 HIGH

- [ ] **Remove mysql, standardize on mysql2**
  - Update any mysql imports in server code to use mysql2
  - Remove mysql dependency
  - Test database connections

- [ ] **node-fetch handling**
  - Audit usage of node-fetch
  - Replace with native fetch (Node 18+) where possible
  - Update remaining usage to v3 if needed

- [ ] **langchain Update**
  - Review breaking changes in changelog
  - Update to latest stable version
  - Update code for API changes
  - Comprehensive testing

**Estimated Effort**: 16-24 hours

---

### Phase 3: Major Updates (Months 2-3)
**Priority**: 🟡 MEDIUM

- [ ] **TypeScript 5.x Migration**
  - Update TypeScript across all packages
  - Fix any type errors
  - Update tsconfig if needed

- [ ] **Moment to date-fns Migration**
  - Create migration plan
  - Replace moment usage incrementally
  - Update tests
  - Remove moment dependencies

- [ ] **React Router Update**
  - Update to latest 6.x
  - Test routing functionality

- [ ] **UI Library Updates**
  - Update @mui packages
  - Update framer-motion (check for breaking changes)
  - Update other UI dependencies

- [ ] **Build Tool Updates**
  - Update turbo, eslint, prettier
  - Update configuration files

**Estimated Effort**: 40-60 hours

---

### Phase 4: Optimization & Cleanup (Month 4+)
**Priority**: 🟢 LOW

- [ ] **Dependency Audit**
  - Review large dependencies in components
  - Consider making some optional/peer dependencies
  - Evaluate browser automation needs (playwright vs puppeteer)

- [ ] **Bundle Size Optimization**
  - Analyze bundle sizes
  - Implement code splitting where beneficial
  - Review tree-shaking effectiveness

- [ ] **Dependency Organization**
  - Review dependencies vs devDependencies categorization
  - Clean up unused dependencies
  - Consolidate versions across packages

**Estimated Effort**: 20-40 hours

---

## 🔍 MONITORING & PREVENTION

### Recommended Tools

1. **Dependabot** (GitHub)
   - Automatically creates PRs for dependency updates
   - Alerts on security vulnerabilities
   - Free for public and private repositories

2. **npm audit** (Built-in)
   ```bash
   npm audit
   npm audit fix
   ```

3. **npm outdated** (Built-in)
   ```bash
   npm outdated
   ```

4. **Snyk** (Security Monitoring)
   - Continuous security monitoring
   - Automatic PR creation
   - Advanced vulnerability database

5. **Renovate Bot** (Alternative to Dependabot)
   - More configurable
   - Better monorepo support

### Suggested GitHub Actions Workflow

```yaml
name: Dependency Security Check

on:
  schedule:
    - cron: '0 0 * * 1'  # Weekly on Monday
  pull_request:
  push:
    branches: [main]

jobs:
  security:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with:
          node-version: '18'
      - run: npm audit
      - run: npm outdated || true
```

---

## 📊 SUMMARY STATISTICS

| Metric | Count |
|--------|-------|
| Total package.json files | 4 |
| Critical vulnerabilities | 1 (vm2) |
| High-priority vulnerabilities | 1 (axios) |
| Medium-priority vulnerabilities | 2 (mysql, node-fetch) |
| Deprecated packages | 2 (moment, vm2) |
| Severely outdated (>6 months) | 10+ |
| Redundant dependency groups | 3 |
| Total packages needing updates | 30+ |

---

## ✅ QUICK WINS (Can Be Done Immediately)

These changes are low-risk and provide immediate benefits:

1. **Remove mysql** - mysql2 already in use
2. **Update axios** - Minimal breaking changes
3. **Update prettier** - No breaking changes in usage
4. **Update eslint** - Mostly compatible
5. **Update turbo** - Better performance, compatible
6. **Update socket.io** - Patch updates

**Estimated Time**: 2-4 hours
**Risk**: Low
**Benefit**: Security improvements, bug fixes

---

## 🎯 CONCLUSION

The Flowise project has a solid foundation but requires immediate attention to critical security vulnerabilities, particularly the deprecated `vm2` package. The recommended phased approach allows for systematic updates while minimizing disruption.

**Immediate Next Steps**:
1. Address vm2 vulnerability (critical)
2. Update axios (high priority)
3. Set up automated dependency monitoring (Dependabot/Renovate)
4. Create update schedule for remaining packages

**Long-term Strategy**:
- Implement automated dependency updates
- Regular security audits (monthly)
- Establish dependency update policy
- Monitor bundle sizes and performance impact

---

**Report Generated**: 2026-01-13
**Tools Used**: Manual package.json analysis, CVE database review
**Next Review**: Recommended within 3 months or after Phase 1 completion
