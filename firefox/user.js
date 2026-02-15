/* 
 * perplexa/user.js
 * inspired by arkenfox/user.js
 */

/* Disable about:config warning
 * FF73-86: chrome://global/content/config.xhtml ***/
user_pref("browser.aboutConfig.showWarning", false); // HTML version [FF71+]

/* Disable Studies
 * [SETTING] Privacy & Security>Firefox Data Collection & Use>Allow Firefox to install and run studies ***/
user_pref("app.shield.optoutstudies.enabled", false);

/* Disable sending additional analytics to web servers
 * [1] https://developer.mozilla.org/docs/Web/API/Navigator/sendBeacon ***/
user_pref("beacon.enabled", false);

/* Do not restore default Firefox bookmarks */
user_pref("browser.bookmarks.restore_default_bookmarks", false);

/* Do not show mobile bookmarks */
user_pref("browser.bookmarks.showMobileBookmarks", false);

/* Disable or isolate 3rd-party cookies and site-data
 * 0 = Accept cookies and site data
 * 1 = (Block) All third-party cookies
 * 2 = (Block) All cookies
 * 3 = (Block) Cookies from unvisited websites
 * 4 = (Block) Cross-site tracking cookies (default)
 * 5 = (Isolate All) Cross-site cookies (TCP: Total Cookie Protection / dFPI: dynamic FPI) [1] (FF86+)
 * Option 5 with FPI (FIRST PARTY ISOLATION) enabled is ignored and not shown, and option 4 used instead
 * [NOTE] You can set cookie exceptions under site permissions or use an extension
 * [NOTE] Enforcing category to custom ensures ETP related prefs are always honored
 * [SETTING] Privacy & Security>Enhanced Tracking Protection>Custom>Cookies
 * [1] https://blog.mozilla.org/security/2021/02/23/total-cookie-protection/ ***/
user_pref("network.cookie.cookieBehavior", 5);

/* Use custom content blocking policy for Firefox's tracking protection and disable VPN banner */
user_pref("browser.contentblocking.category", "custom");
user_pref("browser.contentblocking.report.hide_vpn_banner", true);

/* Disable personalized Extension Recommendations in about:addons and AMO [FF65+]
 * [NOTE] This pref has no effect when Health Reports are disabled
 * [SETTING] Privacy & Security>Firefox Data Collection & Use>Allow Firefox to make personalized extension recommendations
 * [1] https://support.mozilla.org/kb/personalized-extension-recommendations ***/
user_pref("browser.discovery.enabled", false);

/* Disable adding downloads to the system's "recent documents" list ***/
user_pref("browser.download.manager.addToRecentDocs", false);

/* Disable Activity Stream telemetry and stuff ***/
user_pref("browser.newtabpage.activity-stream.feeds.discoverystreamfeed", false);
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
user_pref("browser.newtabpage.activity-stream.showSearch", false);
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
user_pref("browser.newtabpage.activity-stream.telemetry", false);
user_pref("browser.newtabpage.activity-stream.telemetry.structuredIngestion.endpoint", "");
user_pref("browser.newtabpage.activity-stream.telemetry.ut.events", false);
user_pref("browser.newtabpage.activity-stream.topSitesRows", 4);

/* disable websites overriding Firefox's keyboard shortcuts [FF58+]
 * 0 (default) or 1=allow, 2=block
 * [SETTING] to add site exceptions: Ctrl+I>Permissions>Override Keyboard Shortcuts ***/
user_pref("permissions.default.shortcuts", 2);

/* remove special permissions for certain mozilla domains [FF35+]
 * [1] resource://app/defaults/permissions ***/
user_pref("permissions.manager.defaultsUrl", "");

/* Disable PingCentre telemetry (used in several System Add-ons) [FF57+]
 * Currently blocked by 'datareporting.healthreport.uploadEnabled' (see 0340) ***/
user_pref("browser.ping-centre.telemetry", false);

/* disable referrer and storage access for resources injected by content scripts [FF139+] ***/
   // user_pref("privacy.antitracking.isolateContentScriptResources", true);

/* disable CSP Level 2 Reporting [FF140+] ***/
user_pref("security.csp.reporting.enabled", false);

/* Disable media cache from writing to disk in Private Browsing
 * [NOTE] MSE (Media Source Extensions) are already stored in-memory in PB
 * [SETUP-WEB] ESR78: playback might break on subsequent loading (1650281) ***/
user_pref("browser.privatebrowsing.forceMediaMemoryCache", true);
user_pref("media.memory_cache_max_size", 65536);

/* Disable Mozilla promotion offers in private browsing */
user_pref("browser.privatebrowsing.promoEnabled", false);
user_pref("browser.privatebrowsing.promoTitleEnabled", false);
user_pref("browser.privatebrowsing.vpnpromourl", "");

/* Disable SB checks for downloads (remote)
 * To verify the safety of certain executable files, Firefox may submit some information about the
 * file, including the name, origin, size and a cryptographic hash of the contents, to the Google
 * Safe Browsing service which helps Firefox determine whether or not the file should be blocked ***/
user_pref("browser.safebrowsing.downloads.remote.enabled", false);
user_pref("browser.safebrowsing.downloads.remote.url", "");

/* Set startup page [SETUP-CHROME]
 * 0=blank, 1=home, 2=last visited page, 3=resume previous session
 * [SETTING] General>Startup>Restore previous session ***/
user_pref("browser.startup.page", 3);

/* Do not warn when closing tabs */
user_pref("browser.tabs.warnOnClose", false);

/* Always show Bookmarks Bar
 * Omit Other Bookmarks in favor of added Bookmarks Menu in Bookmarks Toolbar Items */
user_pref("browser.toolbars.bookmarks.showOtherBookmarks", false);
//user_pref("browser.toolbars.bookmarks.visibility", "always");

/* Disable UITour backend so there is no chance that a remote page can use it ***/
user_pref("browser.uitour.enabled", false);
user_pref("browser.uitour.url", "");

/* Disable location bar domain guessing
 * domain guessing intercepts DNS "hostname not found errors" and resends a
 * request (e.g. by adding www or .com). This is inconsistent use (e.g. FQDNs), does not work
 * via Proxy Servers (different error), is a flawed use of DNS (TLDs: why treat .com
 * as the 411 for DNS errors?), privacy issues (why connect to sites you didn't
 * intend to), can leak sensitive data (e.g. query strings: e.g. Princeton attack),
 * and is a security risk (e.g. common typos & malicious sites set up to exploit this) ***/
user_pref("browser.fixup.alternate.enabled", false);

/* Display all parts of the url in the location bar ***/
user_pref("browser.urlbar.trimURLs", false);

/* Don't prioritize search results in URL bar */
user_pref("browser.urlbar.showSearchSuggestionsFirst", false);

/* Disable Health Reports
 * [SETTING] Privacy & Security>Firefox Data Collection & Use>Allow Firefox to send technical... data ***/
user_pref("datareporting.healthreport.uploadEnabled", false);

/* Disable new data submission, master kill switch [FF41+]
 * If disabled, no policy is shown or upload takes place, ever
 * [1] https://bugzilla.mozilla.org/1195552 ***/
user_pref("datareporting.policy.dataSubmissionEnabled", false);

/* Enable WebGPU support*/
user_pref("dom.webgpu.enabled", true);

/* Enforce disabling of Web Compatibility Reporter [FF56+]
 * Web Compatibility Reporter adds a "Report Site Issue" button to send data to Mozilla ***/
user_pref("extensions.webcompat-reporter.enabled", false); // [DEFAULT: false]

/* Enable shims for content-blocked resourcces
 * [1] https://support.mozilla.org/gn/kb/smartblock-enhanced-tracking-protection ***/
user_pref("extensions.webcompat.enable_shims", true);
user_pref("extensions.webcompat.perform_injections", true);
user_pref("extensions.webcompat.perform_ua_overrides", true);

/* Enable Fission Process Isolation ***/
user_pref("fission.autostart", true);
user_pref("fission.experiment.enrollmentStatus", 3);
user_pref("fission.experiment.startupEnrollmentStatus", 3);

/* Enable AVIF and JPEG XL image format support ***/
user_pref("image.avif.enabled", true);
user_pref("image.jxl.enabled", true);

/* Set third-party cookies (if enabled) to session-only
 * [NOTE] .sessionOnly overrides .nonsecureSessionOnly except when .sessionOnly=false and
 * .nonsecureSessionOnly=true. This allows you to keep HTTPS cookies, but session-only HTTP ones
 * [1] https://feeding.cloud.geek.nz/posts/tweaking-cookies-for-privacy-in-firefox/ ***/
user_pref("network.cookie.thirdparty.nonsecureSessionOnly", true);
user_pref("network.cookie.thirdparty.sessionOnly", true);

/* Disable DNS prefetching
 * [1] https://developer.mozilla.org/docs/Web/HTTP/Headers/X-DNS-Prefetch-Control ***/
user_pref("network.dns.disablePrefetch", true);

/* Disable link-mouseover opening connection to linked server
 * [1] https://news.slashdot.org/story/15/08/14/2321202/how-to-quash-firefoxs-silent-requests ***/
user_pref("network.http.speculative-parallel-limit", 0);

/* Disable predictor / prefetching ***/
user_pref("network.predictor.enabled", false);

/* Disable link prefetching as hinted by a webpage ***/
user_pref("network.prefetch-next", false);

/* Enable buttons */
user_pref("pref.downloads.disable_button.edit_actions", false);
user_pref("pref.privacy.disable_button.cookie_exceptions", false);
user_pref("pref.privacy.disable_button.tracking_protection_exceptions", false);
user_pref("security.disable_button.openCertManager", false);

/* 4501: enable RFP
 * [SETUP-WEB] RFP can cause some website breakage: mainly canvas, use a canvas site exception via the urlbar
 * RFP also has a few side effects: mainly timezone is UTC0, and websites will prefer light theme
 * [NOTE] pbmode applies if true and the original pref is false
 * [1] https://bugzilla.mozilla.org/418986 ***/
// resistFingerprinting overrides fingerprintingProtection, so these must be disabled
user_pref("privacy.resistFingerprinting", false); // [FF41+]
user_pref("privacy.resistFingerprinting.pbmode", false);
// At least one of these two must be enabled
user_pref("privacy.fingerprintingProtection", true);
user_pref("privacy.fingerprintingProtection.pbmode", true);
user_pref("privacy.fingerprintingProtection.overrides", "+AllTargets,-CSSPrefersColorScheme");

/* 4503: disable mozAddonManager Web API [FF57+]
 * [NOTE] To allow extensions to work on AMO, you also need 2662
 * [1] https://bugzilla.mozilla.org/buglist.cgi?bug_id=1384330,1406795,1415644,1453988 ***/
user_pref("privacy.resistFingerprinting.block_mozAddonManager", true);

/* Enable First Party Isolation [FF51+]
 * May break cross-domain logins and site functionality until perfected
 * [1] https://bugzilla.mozilla.org/buglist.cgi?bug_id=1260931,1299996 ***/
user_pref("privacy.firstparty.isolate", true);

/* Enable Enhanced Tracking Protection (ETP) in all windows
 * [SETTING] Privacy & Security>Enhanced Tracking Protection>Custom>Tracking content
 * [SETTING] to add site exceptions: Urlbar>ETP Shield
 * [SETTING] to manage site exceptions: Options>Privacy & Security>Enhanced Tracking Protection>Manage Exceptions ***/
user_pref("privacy.trackingprotection.enabled", true);
user_pref("privacy.trackingprotection.socialtracking.enabled", true);

/* Enable Container Tabs ***/
user_pref("privacy.userContext.extension", "@testpilot-containers");

/* Enable global mute toggle kill switch ***/
user_pref("privacy.webrtc.globalMuteToggles", true);

/* Sync config ***/
user_pref("services.sync.declinedEngines", "");
user_pref("services.sync.deletePwdFxA", true);

/* Sync custom preferences ***/
user_pref("services.sync.engine.prefs.modified", true);
user_pref("services.sync.prefs.dangerously_allow_arbitrary", true);

/* Sync interval and threshold ***/
user_pref("services.sync.syncInterval", 600000);
user_pref("services.sync.syncThreshold", 300);

/* Disable auto-filling username & password form fields
 * Can leak in cross-site forms *and* be spoofed
 * [NOTE] Username & password is still available when you enter the field
 * [SETTING] Privacy & Security>Logins and Passwords>Autofill logins and passwords
 * [1] https://freedom-to-tinker.com/2017/12/27/no-boundaries-for-user-identities-web-trackers-exploit-browser-login-managers/ ***/
user_pref("signon.autofillForms", false);

/* Disable saving passwords
 * [NOTE] This does not clear any passwords already saved
 * [SETTING] Privacy & Security>Logins and Passwords>Ask to save logins and passwords for websites ***/
user_pref("signon.rememberSignons", false);

/* Disable Telemetry Coverage
 * [1] https://blog.mozilla.org/data/2018/08/20/effectively-measuring-search-in-firefox/ ***/
user_pref("toolkit.coverage.endpoint.base", "");
user_pref("toolkit.coverage.opt-out", true);
user_pref("toolkit.telemetry.coverage.opt-out", true);

/* Disable telemetry
 * the pref (.unified) affects the behaviour of the pref (.enabled)
 * IF unified=false then .enabled controls the telemetry module
 * IF unified=true then .enabled ONLY controls whether to record extended data
 * so make sure to have both set as false
 * [NOTE] FF58+ 'toolkit.telemetry.enabled' is now LOCKED to reflect prerelease
 * or release builds (true and false respectively) [2]
 * [1] https://firefox-source-docs.mozilla.org/toolkit/components/telemetry/telemetry/internals/preferences.html
 * [2] https://medium.com/georg-fritzsche/data-preference-changes-in-firefox-58-2d5df9c428b5 ***/
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.enabled", false); // see [NOTE]
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false);
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.pioneer-new-studies-available", false);
user_pref("toolkit.telemetry.reportingpolicy.firstRun", false);
user_pref("toolkit.telemetry.server", "data:,");
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);
user_pref("network.trr.confirmation_telemetry_enabled", false);
user_pref("privacy.trackingprotection.origin_telemetry.enabled", false);

