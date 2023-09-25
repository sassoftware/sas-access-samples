


<!DOCTYPE html>
<html class="with-top-bar" lang="en">
<head prefix="og: http://ogp.me/ns#">
<meta charset="utf-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="width=device-width, initial-scale=1" name="viewport">
<title>SAS Viya/JDBC/Denodo/README.md · master · Deven Jain / Sas Access Samples · GitLab</title>
<script>
//<![CDATA[
window.gon={};gon.api_version="v4";gon.default_avatar_url="https://gitlab.sas.com/assets/no_avatar-849f9c04a3a0d0cea2424ae97b27447dc64a7dbfae83c036c45b403392f0e8ba.png";gon.max_file_size=100;gon.asset_host=null;gon.webpack_public_path="/assets/webpack/";gon.relative_url_root="";gon.user_color_scheme="white";gon.markdown_surround_selection=true;gon.markdown_automatic_lists=true;gon.recaptcha_api_server_url="https://www.recaptcha.net/recaptcha/api.js";gon.recaptcha_sitekey=null;gon.gitlab_url="https://gitlab.sas.com";gon.revision="6d091758c4b";gon.feature_category="source_code_management";gon.gitlab_logo="/assets/gitlab_logo-2957169c8ef64c58616a1ac3f4fc626e8a35ce4eb3ed31bb0d873712f2a041a0.png";gon.secure=true;gon.sprite_icons="/assets/icons-3591e1b0dc5b9091969f4b703f7bdaffa0ca7b2c7953b0f3a7e7dc1e71c3e43d.svg";gon.sprite_file_icons="/assets/file_icons/file_icons-6489590d770258cc27e4698405d309d83e42829b667b4d601534321e96739a5a.svg";gon.emoji_sprites_css_path="/assets/emoji_sprites-e1b1ba2d7a86a445dcb1110d1b6e7dd0200ecaa993a445df77a07537dbf8f475.css";gon.gridstack_css_path="/assets/lazy_bundles/gridstack-e5c76ea24b3464e028ac36d40754127d8a0a4ad4d46d3f8244f6ce926675aac2.css";gon.test_env=false;gon.disable_animations=false;gon.suggested_label_colors={"#cc338b":"Magenta-pink","#dc143c":"Crimson","#c21e56":"Rose red","#cd5b45":"Dark coral","#ed9121":"Carrot orange","#eee600":"Titanium yellow","#009966":"Green-cyan","#8fbc8f":"Dark sea green","#6699cc":"Blue-gray","#e6e6fa":"Lavender","#9400d3":"Dark violet","#330066":"Deep violet","#36454f":"Charcoal grey","#808080":"Gray"};gon.first_day_of_week=0;gon.time_display_relative=true;gon.ee=false;gon.jh=false;gon.dot_com=false;gon.uf_error_prefix="UF";gon.pat_prefix="glpat-";gon.use_new_navigation=true;gon.keyboard_shortcuts_enabled=true;gon.diagramsnet_url="https://embed.diagrams.net";gon.version="16.4.0";gon.current_user_id=3178;gon.current_username="dfxvir";gon.current_user_fullname="Vincent Rejany";gon.current_user_avatar_url="https://secure.gravatar.com/avatar/7d4654ee3c7b8bab822687774ebf77be?s=80\u0026d=identicon";gon.features={"usageDataApi":true,"securityAutoFix":false,"sourceEditorToolbar":false,"vscodeWebIde":true,"unbatchGraphqlQueries":true,"serverSideFrecentNamespaces":false,"removeMonitorMetrics":true,"gitlabDuo":false,"customEmoji":false,"highlightJsWorker":false,"explainCodeChat":false};
//]]>
</script>
<script>
//<![CDATA[
window.uploads_path = "/dejain/sas-access-samples/uploads";



//]]>
</script>
<script>
//<![CDATA[
var gl = window.gl || {};
gl.startup_calls = {"/dejain/sas-access-samples/-/blob/master/SAS%20Viya/JDBC/Denodo/README.md?format=json\u0026viewer=rich":{}};
gl.startup_graphql_calls = [{"query":"query getBlobInfo(\n  $projectPath: ID!\n  $filePath: String!\n  $ref: String!\n  $refType: RefType\n  $shouldFetchRawText: Boolean!\n) {\n  project(fullPath: $projectPath) {\n    __typename\n    id\n    repository {\n      __typename\n      empty\n      blobs(paths: [$filePath], ref: $ref, refType: $refType) {\n        __typename\n        nodes {\n          __typename\n          id\n          webPath\n          name\n          size\n          rawSize\n          rawTextBlob @include(if: $shouldFetchRawText)\n          fileType\n          language\n          path\n          blamePath\n          editBlobPath\n          gitpodBlobUrl\n          ideEditPath\n          forkAndEditPath\n          ideForkAndEditPath\n          codeNavigationPath\n          projectBlobPathRoot\n          forkAndViewPath\n          environmentFormattedExternalUrl\n          environmentExternalUrlForRouteMap\n          canModifyBlob\n          canCurrentUserPushToBranch\n          archived\n          storedExternally\n          externalStorage\n          externalStorageUrl\n          rawPath\n          replacePath\n          pipelineEditorPath\n          simpleViewer {\n            fileType\n            tooLarge\n            type\n            renderError\n          }\n          richViewer {\n            fileType\n            tooLarge\n            type\n            renderError\n          }\n        }\n      }\n    }\n  }\n}\n","variables":{"projectPath":"dejain/sas-access-samples","ref":"master","refType":"","filePath":"SAS Viya/JDBC/Denodo/README.md","shouldFetchRawText":false}}];

if (gl.startup_calls && window.fetch) {
  Object.keys(gl.startup_calls).forEach(apiCall => {
   gl.startup_calls[apiCall] = {
      fetchCall: fetch(apiCall, {
        // Emulate XHR for Rails AJAX request checks
        headers: {
          'X-Requested-With': 'XMLHttpRequest'
        },
        // fetch won’t send cookies in older browsers, unless you set the credentials init option.
        // We set to `same-origin` which is default value in modern browsers.
        // See https://github.com/whatwg/fetch/pull/585 for more information.
        credentials: 'same-origin'
      })
    };
  });
}
if (gl.startup_graphql_calls && window.fetch) {
  const headers = {"X-CSRF-Token":"5cj0jB0l5-RK03MSOoHf8sgQQQ2y43mnTUGn3PKsojqAxDRHzmvyC-MTbHS-dJxq3lMg3OstLL4h2Z2TD8r5CA","x-gitlab-feature-category":"source_code_management"};
  const url = `https://gitlab.sas.com/api/graphql`

  const opts = {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      ...headers,
    }
  };

  gl.startup_graphql_calls = gl.startup_graphql_calls.map(call => ({
    ...call,
    fetchCall: fetch(url, {
      ...opts,
      credentials: 'same-origin',
      body: JSON.stringify(call)
    })
  }))
}


//]]>
</script>

<link rel="prefetch" href="/assets/webpack/monaco.f9f068b7.chunk.js">
<link rel="stylesheet" href="/assets/themes/theme_light_gray-3709fdfdb1600922d90063efdcf592c5e03aeccf4bfff84771ee72cd6ea73a58.css" />

<link rel="stylesheet" href="/assets/application-cfc4d03e10ba8e1d144a4508f036f477fa5281690eca7258d5ef069d98614b41.css" media="all" />
<link rel="stylesheet" href="/assets/page_bundles/tree-7eb97b0bf23760737864cc9c5cd5c9f23c3de24178d1b9393cea9f64caca3bcd.css" media="all" />
<link rel="stylesheet" href="/assets/application_utilities-2531e4e6ef42e4af0a1b836590e0b362055984d2fa233ae3c5b07d7c4a2761fd.css" media="all" />


<link rel="stylesheet" href="/assets/fonts-171e1863d044918ea3bbaacf2a559ccaac603904aa851c3add5b714fa7066468.css" media="all" />
<link rel="stylesheet" href="/assets/highlight/themes/white-0163ec1ff3033e0ebaf2e7700680941596e39d73535518445a42947430b7d452.css" media="all" />


<link rel="preload" href="/assets/application_utilities-2531e4e6ef42e4af0a1b836590e0b362055984d2fa233ae3c5b07d7c4a2761fd.css" as="style" type="text/css">
<link rel="preload" href="/assets/application-cfc4d03e10ba8e1d144a4508f036f477fa5281690eca7258d5ef069d98614b41.css" as="style" type="text/css">
<link rel="preload" href="/assets/highlight/themes/white-0163ec1ff3033e0ebaf2e7700680941596e39d73535518445a42947430b7d452.css" as="style" type="text/css">





<script src="/assets/webpack/runtime.eff18e81.bundle.js" defer="defer"></script>
<script src="/assets/webpack/main.bc595428.chunk.js" defer="defer"></script>
<script src="/assets/webpack/commons-pages.search.show-super_sidebar.83680b0a.chunk.js" defer="defer"></script>
<script src="/assets/webpack/super_sidebar.ad64ba02.chunk.js" defer="defer"></script>
<script src="/assets/webpack/graphql.4f7311f8.chunk.js" defer="defer"></script>
<script src="/assets/webpack/shortcutsBundle.a7516c66.chunk.js" defer="defer"></script>
<script src="/assets/webpack/commons-pages.groups.boards-pages.groups.details-pages.groups.show-pages.projects-pages.projects.act-f342ac1d.5500a430.chunk.js" defer="defer"></script>
<script src="/assets/webpack/commons-pages.admin.application_settings-pages.admin.application_settings.ci_cd-pages.admin.applicat-20fae03e.679c0629.chunk.js" defer="defer"></script>
<script src="/assets/webpack/commons-pages.admin.runners.show-pages.groups.achievements-pages.groups.crm.contacts-pages.groups.cr-556468c7.e6aae721.chunk.js" defer="defer"></script>
<script src="/assets/webpack/commons-pages.projects.blob.show-pages.projects.show-pages.projects.snippets.show-pages.projects.tre-c684fcf6.daf4e3ac.chunk.js" defer="defer"></script>
<script src="/assets/webpack/commons-pages.projects.blob.show-pages.projects.forks.new-pages.projects.show-pages.projects.tree.show.0fec036f.chunk.js" defer="defer"></script>
<script src="/assets/webpack/commons-pages.groups.show-pages.projects.blob.show-pages.projects.show-pages.projects.tree.show.5b3dfc72.chunk.js" defer="defer"></script>
<script src="/assets/webpack/commons-pages.projects.blob.show-pages.projects.show-pages.projects.tree.show.d41c95f0.chunk.js" defer="defer"></script>
<script src="/assets/webpack/commons-pages.projects.blob.show-pages.projects.tree.show-treeList.95a48aaf.chunk.js" defer="defer"></script>
<script src="/assets/webpack/pages.projects.blob.show.0d535ed1.chunk.js" defer="defer"></script>
<meta content="object" property="og:type">
<meta content="GitLab" property="og:site_name">
<meta content="SAS Viya/JDBC/Denodo/README.md · master · Deven Jain / Sas Access Samples · GitLab" property="og:title">
<meta content="GitLab Community Edition" property="og:description">
<meta content="https://gitlab.sas.com/assets/twitter_card-570ddb06edf56a2312253c5872489847a0f385112ddbcd71ccfa1570febab5d2.jpg" property="og:image">
<meta content="64" property="og:image:width">
<meta content="64" property="og:image:height">
<meta content="https://gitlab.sas.com/dejain/sas-access-samples/-/blob/master/SAS%20Viya/JDBC/Denodo/README.md" property="og:url">
<meta content="summary" property="twitter:card">
<meta content="SAS Viya/JDBC/Denodo/README.md · master · Deven Jain / Sas Access Samples · GitLab" property="twitter:title">
<meta content="GitLab Community Edition" property="twitter:description">
<meta content="https://gitlab.sas.com/assets/twitter_card-570ddb06edf56a2312253c5872489847a0f385112ddbcd71ccfa1570febab5d2.jpg" property="twitter:image">

<meta name="csrf-param" content="authenticity_token" />
<meta name="csrf-token" content="Qt61Gf65K94p_D8IZJ4YAIr0961f6MiXbVrfX8TgR2cn0nXSLfc-MYA8IG7ga1uYnLeWfAYmnY4BwuUQOYYcVQ" />
<meta name="csp-nonce" />
<meta name="action-cable-url" content="/-/cable" />
<link href="/-/manifest.json" rel="manifest">
<link rel="icon" type="image/png" href="/assets/favicon-72a2cad5025aa931d6ea56c3201d1f18e68a8cd39788c7c80d5b2b82aa5143ef.png" id="favicon" data-original-href="/assets/favicon-72a2cad5025aa931d6ea56c3201d1f18e68a8cd39788c7c80d5b2b82aa5143ef.png" />
<link rel="apple-touch-icon" type="image/x-icon" href="/assets/apple-touch-icon-b049d4bc0dd9626f31db825d61880737befc7835982586d015bded10b4435460.png" />
<link href="/search/opensearch.xml" rel="search" title="Search GitLab" type="application/opensearchdescription+xml">




<meta content="GitLab Community Edition" name="description">
<meta content="#ececef" name="theme-color">
</head>

<body class="ui-light-gray tab-width-8 gl-browser-chrome gl-platform-windows" data-find-file="/dejain/sas-access-samples/-/find_file/master" data-namespace-id="60392" data-page="projects:blob:show" data-page-type-id="master/SAS Viya/JDBC/Denodo/README.md" data-project="sas-access-samples" data-project-id="54803">

<script>
//<![CDATA[
gl = window.gl || {};
gl.client = {"isChrome":true,"isWindows":true};


//]]>
</script>



<div class="layout-page hide-when-top-nav-responsive-open page-with-super-sidebar">
<aside class="js-super-sidebar super-sidebar super-sidebar-loading" data-command-palette="{&quot;project_files_url&quot;:&quot;/dejain/sas-access-samples/-/files/master?format=json&quot;,&quot;project_blob_url&quot;:&quot;/dejain/sas-access-samples/-/blob/master&quot;}" data-force-desktop-expanded-sidebar="" data-root-path="/" data-sidebar="{&quot;is_logged_in&quot;:true,&quot;context_switcher_links&quot;:[{&quot;title&quot;:&quot;Your work&quot;,&quot;link&quot;:&quot;/&quot;,&quot;icon&quot;:&quot;work&quot;},{&quot;title&quot;:&quot;Explore&quot;,&quot;link&quot;:&quot;/explore&quot;,&quot;icon&quot;:&quot;compass&quot;}],&quot;current_menu_items&quot;:[{&quot;id&quot;:&quot;project_overview&quot;,&quot;title&quot;:&quot;Sas Access Samples&quot;,&quot;icon&quot;:null,&quot;avatar&quot;:null,&quot;entity_id&quot;:54803,&quot;link&quot;:&quot;/dejain/sas-access-samples&quot;,&quot;pill_count&quot;:null,&quot;link_classes&quot;:&quot;shortcuts-project rspec-project-link&quot;,&quot;is_active&quot;:false},{&quot;title&quot;:&quot;Manage&quot;,&quot;icon&quot;:&quot;users&quot;,&quot;avatar&quot;:null,&quot;avatar_shape&quot;:&quot;rect&quot;,&quot;entity_id&quot;:null,&quot;link&quot;:&quot;/dejain/sas-access-samples/activity&quot;,&quot;is_active&quot;:false,&quot;pill_count&quot;:null,&quot;items&quot;:[{&quot;id&quot;:&quot;activity&quot;,&quot;title&quot;:&quot;Activity&quot;,&quot;icon&quot;:null,&quot;avatar&quot;:null,&quot;entity_id&quot;:null,&quot;link&quot;:&quot;/dejain/sas-access-samples/activity&quot;,&quot;pill_count&quot;:null,&quot;link_classes&quot;:&quot;shortcuts-project-activity&quot;,&quot;is_active&quot;:false},{&quot;id&quot;:&quot;members&quot;,&quot;title&quot;:&quot;Members&quot;,&quot;icon&quot;:null,&quot;avatar&quot;:null,&quot;entity_id&quot;:null,&quot;link&quot;:&quot;/dejain/sas-access-samples/-/project_members&quot;,&quot;pill_count&quot;:null,&quot;link_classes&quot;:null,&quot;is_active&quot;:false},{&quot;id&quot;:&quot;labels&quot;,&quot;title&quot;:&quot;Labels&quot;,&quot;icon&quot;:null,&quot;avatar&quot;:null,&quot;entity_id&quot;:null,&quot;link&quot;:&quot;/dejain/sas-access-samples/-/labels&quot;,&quot;pill_count&quot;:null,&quot;link_classes&quot;:null,&quot;is_active&quot;:false}],&quot;separated&quot;:false},{&quot;title&quot;:&quot;Plan&quot;,&quot;icon&quot;:&quot;planning&quot;,&quot;avatar&quot;:null,&quot;avatar_shape&quot;:&quot;rect&quot;,&quot;entity_id&quot;:null,&quot;link&quot;:&quot;/dejain/sas-access-samples/-/issues&quot;,&quot;is_active&quot;:false,&quot;pill_count&quot;:null,&quot;items&quot;:[{&quot;id&quot;:&quot;project_issue_list&quot;,&quot;title&quot;:&quot;Issues&quot;,&quot;icon&quot;:null,&quot;avatar&quot;:null,&quot;entity_id&quot;:null,&quot;link&quot;:&quot;/dejain/sas-access-samples/-/issues&quot;,&quot;pill_count&quot;:&quot;0&quot;,&quot;link_classes&quot;:&quot;shortcuts-issues has-sub-items&quot;,&quot;is_active&quot;:false},{&quot;id&quot;:&quot;boards&quot;,&quot;title&quot;:&quot;Issue boards&quot;,&quot;icon&quot;:null,&quot;avatar&quot;:null,&quot;entity_id&quot;:null,&quot;link&quot;:&quot;/dejain/sas-access-samples/-/boards&quot;,&quot;pill_count&quot;:null,&quot;link_classes&quot;:&quot;shortcuts-issue-boards&quot;,&quot;is_active&quot;:false},{&quot;id&quot;:&quot;milestones&quot;,&quot;title&quot;:&quot;Milestones&quot;,&quot;icon&quot;:null,&quot;avatar&quot;:null,&quot;entity_id&quot;:null,&quot;link&quot;:&quot;/dejain/sas-access-samples/-/milestones&quot;,&quot;pill_count&quot;:null,&quot;link_classes&quot;:null,&quot;is_active&quot;:false},{&quot;id&quot;:&quot;project_wiki&quot;,&quot;title&quot;:&quot;Wiki&quot;,&quot;icon&quot;:null,&quot;avatar&quot;:null,&quot;entity_id&quot;:null,&quot;link&quot;:&quot;/dejain/sas-access-samples/-/wikis/home&quot;,&quot;pill_count&quot;:null,&quot;link_classes&quot;:&quot;shortcuts-wiki&quot;,&quot;is_active&quot;:false}],&quot;separated&quot;:false},{&quot;title&quot;:&quot;Code&quot;,&quot;icon&quot;:&quot;code&quot;,&quot;avatar&quot;:null,&quot;avatar_shape&quot;:&quot;rect&quot;,&quot;entity_id&quot;:null,&quot;link&quot;:&quot;/dejain/sas-access-samples/-/merge_requests&quot;,&quot;is_active&quot;:true,&quot;pill_count&quot;:null,&quot;items&quot;:[{&quot;id&quot;:&quot;project_merge_request_list&quot;,&quot;title&quot;:&quot;Merge requests&quot;,&quot;icon&quot;:null,&quot;avatar&quot;:null,&quot;entity_id&quot;:null,&quot;link&quot;:&quot;/dejain/sas-access-samples/-/merge_requests&quot;,&quot;pill_count&quot;:&quot;0&quot;,&quot;link_classes&quot;:&quot;shortcuts-merge_requests&quot;,&quot;is_active&quot;:false},{&quot;id&quot;:&quot;files&quot;,&quot;title&quot;:&quot;Repository&quot;,&quot;icon&quot;:null,&quot;avatar&quot;:null,&quot;entity_id&quot;:null,&quot;link&quot;:&quot;/dejain/sas-access-samples/-/tree/master&quot;,&quot;pill_count&quot;:null,&quot;link_classes&quot;:&quot;shortcuts-tree&quot;,&quot;is_active&quot;:true},{&quot;id&quot;:&quot;branches&quot;,&quot;title&quot;:&quot;Branches&quot;,&quot;icon&quot;:null,&quot;avatar&quot;:null,&quot;entity_id&quot;:null,&quot;link&quot;:&quot;/dejain/sas-access-samples/-/branches&quot;,&quot;pill_count&quot;:null,&quot;link_classes&quot;:null,&quot;is_active&quot;:false},{&quot;id&quot;:&quot;commits&quot;,&quot;title&quot;:&quot;Commits&quot;,&quot;icon&quot;:null,&quot;avatar&quot;:null,&quot;entity_id&quot;:null,&quot;link&quot;:&quot;/dejain/sas-access-samples/-/commits/master?ref_type=heads&quot;,&quot;pill_count&quot;:null,&quot;link_classes&quot;:&quot;shortcuts-commits&quot;,&quot;is_active&quot;:false},{&quot;id&quot;:&quot;tags&quot;,&quot;title&quot;:&quot;Tags&quot;,&quot;icon&quot;:null,&quot;avatar&quot;:null,&quot;entity_id&quot;:null,&quot;link&quot;:&quot;/dejain/sas-access-samples/-/tags&quot;,&quot;pill_count&quot;:null,&quot;link_classes&quot;:null,&quot;is_active&quot;:false},{&quot;id&quot;:&quot;graphs&quot;,&quot;title&quot;:&quot;Repository graph&quot;,&quot;icon&quot;:null,&quot;avatar&quot;:null,&quot;entity_id&quot;:null,&quot;link&quot;:&quot;/dejain/sas-access-samples/-/network/master?ref_type=heads&quot;,&quot;pill_count&quot;:null,&quot;link_classes&quot;:&quot;shortcuts-network&quot;,&quot;is_active&quot;:false},{&quot;id&quot;:&quot;compare&quot;,&quot;title&quot;:&quot;Compare revisions&quot;,&quot;icon&quot;:null,&quot;avatar&quot;:null,&quot;entity_id&quot;:null,&quot;link&quot;:&quot;/dejain/sas-access-samples/-/compare?from=master\u0026to=master&quot;,&quot;pill_count&quot;:null,&quot;link_classes&quot;:null,&quot;is_active&quot;:false},{&quot;id&quot;:&quot;project_snippets&quot;,&quot;title&quot;:&quot;Snippets&quot;,&quot;icon&quot;:null,&quot;avatar&quot;:null,&quot;entity_id&quot;:null,&quot;link&quot;:&quot;/dejain/sas-access-samples/-/snippets&quot;,&quot;pill_count&quot;:null,&quot;link_classes&quot;:&quot;shortcuts-snippets&quot;,&quot;is_active&quot;:false}],&quot;separated&quot;:false},{&quot;title&quot;:&quot;Build&quot;,&quot;icon&quot;:&quot;rocket&quot;,&quot;avatar&quot;:null,&quot;avatar_shape&quot;:&quot;rect&quot;,&quot;entity_id&quot;:null,&quot;link&quot;:&quot;/dejain/sas-access-samples/-/pipelines&quot;,&quot;is_active&quot;:false,&quot;pill_count&quot;:null,&quot;items&quot;:[{&quot;id&quot;:&quot;pipelines&quot;,&quot;title&quot;:&quot;Pipelines&quot;,&quot;icon&quot;:null,&quot;avatar&quot;:null,&quot;entity_id&quot;:null,&quot;link&quot;:&quot;/dejain/sas-access-samples/-/pipelines&quot;,&quot;pill_count&quot;:null,&quot;link_classes&quot;:&quot;shortcuts-pipelines&quot;,&quot;is_active&quot;:false},{&quot;id&quot;:&quot;jobs&quot;,&quot;title&quot;:&quot;Jobs&quot;,&quot;icon&quot;:null,&quot;avatar&quot;:null,&quot;entity_id&quot;:null,&quot;link&quot;:&quot;/dejain/sas-access-samples/-/jobs&quot;,&quot;pill_count&quot;:null,&quot;link_classes&quot;:&quot;shortcuts-builds&quot;,&quot;is_active&quot;:false},{&quot;id&quot;:&quot;pipeline_schedules&quot;,&quot;title&quot;:&quot;Pipeline schedules&quot;,&quot;icon&quot;:null,&quot;avatar&quot;:null,&quot;entity_id&quot;:null,&quot;link&quot;:&quot;/dejain/sas-access-samples/-/pipeline_schedules&quot;,&quot;pill_count&quot;:null,&quot;link_classes&quot;:&quot;shortcuts-builds&quot;,&quot;is_active&quot;:false},{&quot;id&quot;:&quot;artifacts&quot;,&quot;title&quot;:&quot;Artifacts&quot;,&quot;icon&quot;:null,&quot;avatar&quot;:null,&quot;entity_id&quot;:null,&quot;link&quot;:&quot;/dejain/sas-access-samples/-/artifacts&quot;,&quot;pill_count&quot;:null,&quot;link_classes&quot;:&quot;shortcuts-builds&quot;,&quot;is_active&quot;:false}],&quot;separated&quot;:false},{&quot;title&quot;:&quot;Deploy&quot;,&quot;icon&quot;:&quot;deployments&quot;,&quot;avatar&quot;:null,&quot;avatar_shape&quot;:&quot;rect&quot;,&quot;entity_id&quot;:null,&quot;link&quot;:&quot;/dejain/sas-access-samples/-/releases&quot;,&quot;is_active&quot;:false,&quot;pill_count&quot;:null,&quot;items&quot;:[{&quot;id&quot;:&quot;releases&quot;,&quot;title&quot;:&quot;Releases&quot;,&quot;icon&quot;:null,&quot;avatar&quot;:null,&quot;entity_id&quot;:null,&quot;link&quot;:&quot;/dejain/sas-access-samples/-/releases&quot;,&quot;pill_count&quot;:null,&quot;link_classes&quot;:&quot;shortcuts-deployments-releases&quot;,&quot;is_active&quot;:false},{&quot;id&quot;:&quot;packages_registry&quot;,&quot;title&quot;:&quot;Package Registry&quot;,&quot;icon&quot;:null,&quot;avatar&quot;:null,&quot;entity_id&quot;:null,&quot;link&quot;:&quot;/dejain/sas-access-samples/-/packages&quot;,&quot;pill_count&quot;:null,&quot;link_classes&quot;:&quot;shortcuts-container-registry&quot;,&quot;is_active&quot;:false}],&quot;separated&quot;:false},{&quot;title&quot;:&quot;Operate&quot;,&quot;icon&quot;:&quot;cloud-pod&quot;,&quot;avatar&quot;:null,&quot;avatar_shape&quot;:&quot;rect&quot;,&quot;entity_id&quot;:null,&quot;link&quot;:&quot;/dejain/sas-access-samples/-/environments&quot;,&quot;is_active&quot;:false,&quot;pill_count&quot;:null,&quot;items&quot;:[{&quot;id&quot;:&quot;environments&quot;,&quot;title&quot;:&quot;Environments&quot;,&quot;icon&quot;:null,&quot;avatar&quot;:null,&quot;entity_id&quot;:null,&quot;link&quot;:&quot;/dejain/sas-access-samples/-/environments&quot;,&quot;pill_count&quot;:null,&quot;link_classes&quot;:&quot;shortcuts-environments&quot;,&quot;is_active&quot;:false},{&quot;id&quot;:&quot;infrastructure_registry&quot;,&quot;title&quot;:&quot;Terraform modules&quot;,&quot;icon&quot;:null,&quot;avatar&quot;:null,&quot;entity_id&quot;:null,&quot;link&quot;:&quot;/dejain/sas-access-samples/-/infrastructure_registry&quot;,&quot;pill_count&quot;:null,&quot;link_classes&quot;:null,&quot;is_active&quot;:false}],&quot;separated&quot;:false},{&quot;title&quot;:&quot;Monitor&quot;,&quot;icon&quot;:&quot;monitor&quot;,&quot;avatar&quot;:null,&quot;avatar_shape&quot;:&quot;rect&quot;,&quot;entity_id&quot;:null,&quot;link&quot;:&quot;/dejain/sas-access-samples/-/incidents&quot;,&quot;is_active&quot;:false,&quot;pill_count&quot;:null,&quot;items&quot;:[{&quot;id&quot;:&quot;incidents&quot;,&quot;title&quot;:&quot;Incidents&quot;,&quot;icon&quot;:null,&quot;avatar&quot;:null,&quot;entity_id&quot;:null,&quot;link&quot;:&quot;/dejain/sas-access-samples/-/incidents&quot;,&quot;pill_count&quot;:null,&quot;link_classes&quot;:null,&quot;is_active&quot;:false},{&quot;id&quot;:&quot;service_desk&quot;,&quot;title&quot;:&quot;Service Desk&quot;,&quot;icon&quot;:null,&quot;avatar&quot;:null,&quot;entity_id&quot;:null,&quot;link&quot;:&quot;/dejain/sas-access-samples/-/issues/service_desk&quot;,&quot;pill_count&quot;:null,&quot;link_classes&quot;:null,&quot;is_active&quot;:false}],&quot;separated&quot;:false},{&quot;title&quot;:&quot;Analyze&quot;,&quot;icon&quot;:&quot;chart&quot;,&quot;avatar&quot;:null,&quot;avatar_shape&quot;:&quot;rect&quot;,&quot;entity_id&quot;:null,&quot;link&quot;:&quot;/dejain/sas-access-samples/-/value_stream_analytics&quot;,&quot;is_active&quot;:false,&quot;pill_count&quot;:null,&quot;items&quot;:[{&quot;id&quot;:&quot;cycle_analytics&quot;,&quot;title&quot;:&quot;Value stream analytics&quot;,&quot;icon&quot;:null,&quot;avatar&quot;:null,&quot;entity_id&quot;:null,&quot;link&quot;:&quot;/dejain/sas-access-samples/-/value_stream_analytics&quot;,&quot;pill_count&quot;:null,&quot;link_classes&quot;:&quot;shortcuts-project-cycle-analytics&quot;,&quot;is_active&quot;:false},{&quot;id&quot;:&quot;contributors&quot;,&quot;title&quot;:&quot;Contributor statistics&quot;,&quot;icon&quot;:null,&quot;avatar&quot;:null,&quot;entity_id&quot;:null,&quot;link&quot;:&quot;/dejain/sas-access-samples/-/graphs/master?ref_type=heads&quot;,&quot;pill_count&quot;:null,&quot;link_classes&quot;:null,&quot;is_active&quot;:false},{&quot;id&quot;:&quot;ci_cd_analytics&quot;,&quot;title&quot;:&quot;CI/CD analytics&quot;,&quot;icon&quot;:null,&quot;avatar&quot;:null,&quot;entity_id&quot;:null,&quot;link&quot;:&quot;/dejain/sas-access-samples/-/pipelines/charts&quot;,&quot;pill_count&quot;:null,&quot;link_classes&quot;:null,&quot;is_active&quot;:false},{&quot;id&quot;:&quot;repository_analytics&quot;,&quot;title&quot;:&quot;Repository analytics&quot;,&quot;icon&quot;:null,&quot;avatar&quot;:null,&quot;entity_id&quot;:null,&quot;link&quot;:&quot;/dejain/sas-access-samples/-/graphs/master/charts&quot;,&quot;pill_count&quot;:null,&quot;link_classes&quot;:&quot;shortcuts-repository-charts&quot;,&quot;is_active&quot;:false},{&quot;id&quot;:&quot;model_experiments&quot;,&quot;title&quot;:&quot;Model experiments&quot;,&quot;icon&quot;:null,&quot;avatar&quot;:null,&quot;entity_id&quot;:null,&quot;link&quot;:&quot;/dejain/sas-access-samples/-/ml/experiments&quot;,&quot;pill_count&quot;:null,&quot;link_classes&quot;:null,&quot;is_active&quot;:false}],&quot;separated&quot;:false}],&quot;current_context_header&quot;:&quot;Project&quot;,&quot;support_path&quot;:&quot;https://about.gitlab.com/get-help/&quot;,&quot;display_whats_new&quot;:true,&quot;whats_new_most_recent_release_items_count&quot;:4,&quot;whats_new_version_digest&quot;:&quot;4ecbf57547986d3149a533d5ec774acc5c461a1f1c1675d73c8b48d00bc27827&quot;,&quot;show_version_check&quot;:false,&quot;gitlab_version&quot;:{&quot;major&quot;:16,&quot;minor&quot;:4,&quot;patch&quot;:0,&quot;suffix_s&quot;:&quot;&quot;},&quot;gitlab_version_check&quot;:{&quot;latest_stable_versions&quot;:[],&quot;latest_version&quot;:&quot;16.4.0&quot;,&quot;severity&quot;:&quot;success&quot;,&quot;critical_vulnerability&quot;:false,&quot;details&quot;:&quot;&quot;},&quot;search&quot;:{&quot;search_path&quot;:&quot;/search&quot;,&quot;issues_path&quot;:&quot;/dashboard/issues&quot;,&quot;mr_path&quot;:&quot;/dashboard/merge_requests&quot;,&quot;autocomplete_path&quot;:&quot;/search/autocomplete&quot;,&quot;search_context&quot;:{&quot;project&quot;:{&quot;id&quot;:54803,&quot;name&quot;:&quot;Sas Access Samples&quot;},&quot;project_metadata&quot;:{&quot;mr_path&quot;:&quot;/dejain/sas-access-samples/-/merge_requests&quot;,&quot;issues_path&quot;:&quot;/dejain/sas-access-samples/-/issues&quot;},&quot;code_search&quot;:true,&quot;ref&quot;:&quot;master&quot;,&quot;scope&quot;:null,&quot;for_snippets&quot;:null}},&quot;panel_type&quot;:&quot;project&quot;,&quot;shortcut_links&quot;:[{&quot;title&quot;:&quot;Milestones&quot;,&quot;href&quot;:&quot;/dashboard/milestones&quot;,&quot;css_class&quot;:&quot;dashboard-shortcuts-milestones&quot;},{&quot;title&quot;:&quot;Snippets&quot;,&quot;href&quot;:&quot;/dashboard/snippets&quot;,&quot;css_class&quot;:&quot;dashboard-shortcuts-snippets&quot;},{&quot;title&quot;:&quot;Activity&quot;,&quot;href&quot;:&quot;/dashboard/activity&quot;,&quot;css_class&quot;:&quot;dashboard-shortcuts-activity&quot;},{&quot;title&quot;:&quot;Groups&quot;,&quot;href&quot;:&quot;/dashboard/groups&quot;,&quot;css_class&quot;:&quot;dashboard-shortcuts-groups&quot;},{&quot;title&quot;:&quot;Projects&quot;,&quot;href&quot;:&quot;/dashboard/projects&quot;,&quot;css_class&quot;:&quot;dashboard-shortcuts-projects&quot;},{&quot;title&quot;:&quot;Create a new issue&quot;,&quot;href&quot;:&quot;/dejain/sas-access-samples/-/issues/new&quot;,&quot;css_class&quot;:&quot;shortcuts-new-issue&quot;}],&quot;name&quot;:&quot;Vincent Rejany&quot;,&quot;username&quot;:&quot;dfxvir&quot;,&quot;avatar_url&quot;:&quot;https://secure.gravatar.com/avatar/7d4654ee3c7b8bab822687774ebf77be?s=80\u0026d=identicon&quot;,&quot;has_link_to_profile&quot;:true,&quot;link_to_profile&quot;:&quot;/dfxvir&quot;,&quot;logo_url&quot;:null,&quot;status&quot;:{&quot;can_update&quot;:true,&quot;busy&quot;:null,&quot;customized&quot;:null,&quot;availability&quot;:&quot;&quot;,&quot;emoji&quot;:null,&quot;message_html&quot;:null,&quot;message&quot;:null,&quot;clear_after&quot;:null},&quot;settings&quot;:{&quot;has_settings&quot;:true,&quot;profile_path&quot;:&quot;/-/profile&quot;,&quot;profile_preferences_path&quot;:&quot;/-/profile/preferences&quot;},&quot;user_counts&quot;:{&quot;assigned_issues&quot;:0,&quot;assigned_merge_requests&quot;:0,&quot;review_requested_merge_requests&quot;:0,&quot;todos&quot;:1,&quot;last_update&quot;:1695632990891},&quot;can_sign_out&quot;:true,&quot;sign_out_link&quot;:&quot;/users/sign_out&quot;,&quot;issues_dashboard_path&quot;:&quot;/dashboard/issues?assignee_username=dfxvir&quot;,&quot;todos_dashboard_path&quot;:&quot;/dashboard/todos&quot;,&quot;create_new_menu_groups&quot;:[{&quot;name&quot;:&quot;In this project&quot;,&quot;items&quot;:[{&quot;text&quot;:&quot;New issue&quot;,&quot;href&quot;:&quot;/dejain/sas-access-samples/-/issues/new&quot;,&quot;component&quot;:null,&quot;extraAttrs&quot;:{&quot;data-track-label&quot;:&quot;new_issue&quot;,&quot;data-track-action&quot;:&quot;click_link&quot;,&quot;data-track-property&quot;:&quot;nav_create_menu&quot;,&quot;data-testid&quot;:&quot;create_menu_item&quot;,&quot;data-qa-create-menu-item&quot;:&quot;new_issue&quot;}}]},{&quot;name&quot;:&quot;In GitLab&quot;,&quot;items&quot;:[{&quot;text&quot;:&quot;New project/repository&quot;,&quot;href&quot;:&quot;/projects/new&quot;,&quot;component&quot;:null,&quot;extraAttrs&quot;:{&quot;data-track-label&quot;:&quot;general_new_project&quot;,&quot;data-track-action&quot;:&quot;click_link&quot;,&quot;data-track-property&quot;:&quot;nav_create_menu&quot;,&quot;data-testid&quot;:&quot;create_menu_item&quot;,&quot;data-qa-create-menu-item&quot;:&quot;general_new_project&quot;}},{&quot;text&quot;:&quot;New group&quot;,&quot;href&quot;:&quot;/groups/new&quot;,&quot;component&quot;:null,&quot;extraAttrs&quot;:{&quot;data-track-label&quot;:&quot;general_new_group&quot;,&quot;data-track-action&quot;:&quot;click_link&quot;,&quot;data-track-property&quot;:&quot;nav_create_menu&quot;,&quot;data-testid&quot;:&quot;create_menu_item&quot;,&quot;data-qa-create-menu-item&quot;:&quot;general_new_group&quot;}},{&quot;text&quot;:&quot;New snippet&quot;,&quot;href&quot;:&quot;/-/snippets/new&quot;,&quot;component&quot;:null,&quot;extraAttrs&quot;:{&quot;data-track-label&quot;:&quot;general_new_snippet&quot;,&quot;data-track-action&quot;:&quot;click_link&quot;,&quot;data-track-property&quot;:&quot;nav_create_menu&quot;,&quot;data-testid&quot;:&quot;create_menu_item&quot;,&quot;data-qa-create-menu-item&quot;:&quot;general_new_snippet&quot;}}]}],&quot;merge_request_menu&quot;:[{&quot;name&quot;:&quot;Merge requests&quot;,&quot;items&quot;:[{&quot;text&quot;:&quot;Assigned&quot;,&quot;href&quot;:&quot;/dashboard/merge_requests?assignee_username=dfxvir&quot;,&quot;count&quot;:0,&quot;userCount&quot;:&quot;assigned_merge_requests&quot;,&quot;extraAttrs&quot;:{&quot;data-track-action&quot;:&quot;click_link&quot;,&quot;data-track-label&quot;:&quot;merge_requests_assigned&quot;,&quot;data-track-property&quot;:&quot;nav_core_menu&quot;,&quot;class&quot;:&quot;dashboard-shortcuts-merge_requests&quot;}},{&quot;text&quot;:&quot;Review requests&quot;,&quot;href&quot;:&quot;/dashboard/merge_requests?reviewer_username=dfxvir&quot;,&quot;count&quot;:0,&quot;userCount&quot;:&quot;review_requested_merge_requests&quot;,&quot;extraAttrs&quot;:{&quot;data-track-action&quot;:&quot;click_link&quot;,&quot;data-track-label&quot;:&quot;merge_requests_to_review&quot;,&quot;data-track-property&quot;:&quot;nav_core_menu&quot;,&quot;class&quot;:&quot;dashboard-shortcuts-review_requests&quot;}}]}],&quot;projects_path&quot;:&quot;/dashboard/projects&quot;,&quot;groups_path&quot;:&quot;/dashboard/groups&quot;,&quot;gitlab_com_but_not_canary&quot;:false,&quot;gitlab_com_and_canary&quot;:false,&quot;canary_toggle_com_url&quot;:&quot;https://next.gitlab.com&quot;,&quot;current_context&quot;:{&quot;namespace&quot;:&quot;projects&quot;,&quot;item&quot;:{&quot;id&quot;:54803,&quot;name&quot;:&quot;Sas Access Samples&quot;,&quot;namespace&quot;:&quot;Deven Jain / Sas Access Samples&quot;,&quot;webUrl&quot;:&quot;/dejain/sas-access-samples&quot;,&quot;avatarUrl&quot;:null}},&quot;pinned_items&quot;:[&quot;project_issue_list&quot;,&quot;project_merge_request_list&quot;],&quot;update_pins_url&quot;:&quot;/-/users/pins&quot;,&quot;is_impersonating&quot;:false,&quot;stop_impersonation_path&quot;:&quot;/admin/impersonation&quot;,&quot;track_visits_path&quot;:&quot;/-/track_namespace_visits&quot;}" data-toggle-new-nav-endpoint="/-/profile/preferences"></aside>
<div data-version-digest="4ecbf57547986d3149a533d5ec774acc5c461a1f1c1675d73c8b48d00bc27827" id="whats-new-app"></div>

<div class="content-wrapper">
<div class="mobile-overlay"></div>

<div class="alert-wrapper gl-force-block-formatting-context">
<div class="gl-alert js-new-navigation-callout gl-alert-info" data-dismiss-endpoint="/-/users/callouts" data-feature-id="new_navigation_callout" role="alert">
<svg class="s16 gl-alert-icon" data-testid="information-o-icon"><use href="/assets/icons-3591e1b0dc5b9091969f4b703f7bdaffa0ca7b2c7953b0f3a7e7dc1e71c3e43d.svg#information-o"></use></svg>
<button class="gl-button btn btn-icon btn-sm btn-default btn-default-tertiary js-close gl-dismiss-btn " aria-label="Dismiss" type="button"><svg class="s16 gl-icon gl-button-icon " data-testid="close-icon"><use href="/assets/icons-3591e1b0dc5b9091969f4b703f7bdaffa0ca7b2c7953b0f3a7e7dc1e71c3e43d.svg#close"></use></svg>

</button>
<div class="gl-alert-content" role="alert">
<h4 class="gl-alert-title">
Welcome to a new navigation experience
</h4>
<div class="gl-alert-body">
<p>
For the next few releases, you can go to your avatar at any time to turn the new navigation on and off.
Read more about the <a href="https://gitlab.com/groups/gitlab-org/-/epics/9044#whats-different" target="_blank" rel="noopener noreferrer">changes</a>, the <a href="https://about.gitlab.com/blog/2023/05/01/gitlab-product-navigation/" target="_blank" rel="noopener noreferrer">vision</a>, and the <a href="https://about.gitlab.com/blog/2023/05/15/overhauling-the-navigation-is-like-building-a-dream-home/" target="_blank" rel="noopener noreferrer">design</a>.
</p>

</div>
<div class="gl-alert-actions">
<a class="gl-button btn btn-md btn-confirm gl-alert-action" data-track-action="click_button" data-track-label="banner_nav_learn_more" href="/help/tutorials/left_sidebar/index"><span class="gl-button-text">
Learn more

</span>

</a><a data-track-action="click_button" data-track-label="banner_nav_provide_feedback" class="gl-button btn btn-md btn-default " href="https://gitlab.com/gitlab-org/gitlab/-/issues/409005"><span class="gl-button-text">
Provide feedback

</span>

</a>
</div>
</div>
</div>





<div class="gl-broadcast-message broadcast-banner-message banner js-broadcast-notification-47 green" data-testid="banner-broadcast-message" role="alert">
<div class="gl-broadcast-message-content">
<div class="gl-broadcast-message-icon">
<svg class="s16" data-testid="bullhorn-icon"><use href="/assets/icons-3591e1b0dc5b9091969f4b703f7bdaffa0ca7b2c7953b0f3a7e7dc1e71c3e43d.svg#bullhorn"></use></svg>
</div>
<div class="gl-broadcast-message-text js-broadcast-message-preview">
<h2 class="gl-sr-only">
Admin message
</h2>
<p>Gitlab update to v16.4.0 on Friday 9/22/2023</p>
<p>See: Change Request <a href="https://sas.service-now.com/task.do?sysparm_query=number=CHG0584524" rel="nofollow noreferrer noopener" target="_blank">https://sas.service-now.com/task.do?sysparm_query=number=CHG0584524</a></p>
</div>
</div>
<button class="gl-button btn btn-icon btn-sm btn-default btn-default-tertiary gl-close-btn-color-inherit gl-broadcast-message-dismiss js-dismiss-current-broadcast-notification" aria-label="Close" data-id="47" data-expire-date="2023-09-27T03:00:50Z" type="button"><svg class="s16 gl-icon gl-button-icon gl-text-white" data-testid="close-icon"><use href="/assets/icons-3591e1b0dc5b9091969f4b703f7bdaffa0ca7b2c7953b0f3a7e7dc1e71c3e43d.svg#close"></use></svg>

</button>
</div>



















<div class="top-bar-fixed container-fluid" data-testid="top-bar">
<div class="top-bar-container gl-display-flex gl-align-items-center gl-gap-2">
<button class="gl-button btn btn-icon btn-md btn-default btn-default-tertiary js-super-sidebar-toggle-expand super-sidebar-toggle gl-ml-n3" title="Expand sidebar" aria-controls="super-sidebar" aria-expanded="false" aria-label="Navigation sidebar" type="button"><svg class="s16 gl-icon gl-button-icon " data-testid="sidebar-icon"><use href="/assets/icons-3591e1b0dc5b9091969f4b703f7bdaffa0ca7b2c7953b0f3a7e7dc1e71c3e43d.svg#sidebar"></use></svg>

</button>
<nav aria-label="Breadcrumbs" class="breadcrumbs" data-qa-selector="breadcrumb_links_content" data-testid="breadcrumb-links">
<ul class="list-unstyled breadcrumbs-list js-breadcrumbs-list">
<li><a href="/dejain">Deven Jain</a><svg class="s8 breadcrumbs-list-angle" data-testid="chevron-lg-right-icon"><use href="/assets/icons-3591e1b0dc5b9091969f4b703f7bdaffa0ca7b2c7953b0f3a7e7dc1e71c3e43d.svg#chevron-lg-right"></use></svg></li> <li><a href="/dejain/sas-access-samples"><span class="breadcrumb-item-text js-breadcrumb-item-text">Sas Access Samples</span></a><svg class="s8 breadcrumbs-list-angle" data-testid="chevron-lg-right-icon"><use href="/assets/icons-3591e1b0dc5b9091969f4b703f7bdaffa0ca7b2c7953b0f3a7e7dc1e71c3e43d.svg#chevron-lg-right"></use></svg></li>

<li data-qa-selector="breadcrumb_current_link" data-testid="breadcrumb-current-link">
<a href="/dejain/sas-access-samples/-/blob/master/SAS%20Viya/JDBC/Denodo/README.md">Repository</a>
</li>
</ul>
<script type="application/ld+json">
{"@context":"https://schema.org","@type":"BreadcrumbList","itemListElement":[{"@type":"ListItem","position":1,"name":"Deven Jain","item":"https://gitlab.sas.com/dejain"},{"@type":"ListItem","position":2,"name":"Sas Access Samples","item":"https://gitlab.sas.com/dejain/sas-access-samples"},{"@type":"ListItem","position":3,"name":"Repository","item":"https://gitlab.sas.com/dejain/sas-access-samples/-/blob/master/SAS%20Viya/JDBC/Denodo/README.md"}]}

</script>
</nav>



</div>
</div>

</div>
<div class="container-fluid container-limited project-highlight-puc">
<main class="content" id="content-body" itemscope itemtype="http://schema.org/SoftwareSourceCode">
<div class="flash-container flash-container-page sticky" data-qa-selector="flash_container">
</div>




<div class="js-signature-container" data-signatures-path="/dejain/sas-access-samples/-/commits/52708ee821f646f0cd7b14aae094dd590180b33d/signatures?limit=1"></div>

<div class="tree-holder gl-pt-4" id="tree-holder">
<div class="nav-block">
<div class="tree-ref-container">
<div class="tree-ref-holder gl-max-w-26">
<div data-project-id="54803" data-project-root-path="/dejain/sas-access-samples" data-ref="master" data-ref-type="" id="js-tree-ref-switcher"></div>
</div>
<ul class="breadcrumb repo-breadcrumb">
<li class="breadcrumb-item">
<a href="/dejain/sas-access-samples/-/tree/master">sas-access-samples
</a></li>
<li class="breadcrumb-item">
<a href="/dejain/sas-access-samples/-/tree/master/SAS%20Viya">SAS Viya</a>
</li>
<li class="breadcrumb-item">
<a href="/dejain/sas-access-samples/-/tree/master/SAS%20Viya/JDBC">JDBC</a>
</li>
<li class="breadcrumb-item">
<a href="/dejain/sas-access-samples/-/tree/master/SAS%20Viya/JDBC/Denodo">Denodo</a>
</li>
<li class="breadcrumb-item">
<a href="/dejain/sas-access-samples/-/blob/master/SAS%20Viya/JDBC/Denodo/README.md"><strong>README.md</strong>
</a></li>
</ul>
</div>
<div class="tree-controls gl-children-ml-sm-3"><a class="gl-button btn btn-md btn-default shortcuts-find-file" rel="nofollow" href="/dejain/sas-access-samples/-/find_file/master"><span class="gl-button-text">
Find file

</span>

</a><a class="gl-button btn btn-md btn-default js-blob-blame-link" href="/dejain/sas-access-samples/-/blame/master/SAS%20Viya/JDBC/Denodo/README.md"><span class="gl-button-text">
Blame
</span>

</a><a class="gl-button btn btn-md btn-default " href="/dejain/sas-access-samples/-/commits/master/SAS%20Viya/JDBC/Denodo/README.md"><span class="gl-button-text">
History
</span>

</a><a class="gl-button btn btn-md btn-default js-data-file-blob-permalink-url" href="/dejain/sas-access-samples/-/blob/52708ee821f646f0cd7b14aae094dd590180b33d/SAS%20Viya/JDBC/Denodo/README.md"><span class="gl-button-text">
Permalink
</span>

</a></div>
</div>

<div class="info-well d-none d-sm-block">
<div class="well-segment">
<ul class="blob-commit-info">
<li class="commit flex-row js-toggle-container" id="commit-52708ee8">
<div class="avatar-cell d-none d-sm-block">
<a href="/dejain"><img alt="Deven Jain&#39;s avatar" src="https://secure.gravatar.com/avatar/d1e425b171d3a6603423e61c2d92be7a?s=80&amp;d=identicon" class="avatar s40 d-none d-sm-inline-block" title="Deven Jain"></a>
</div>
<div class="commit-detail flex-list gl-display-flex gl-justify-content-space-between gl-align-items-center gl-flex-grow-1 gl-min-w-0">
<div class="commit-content" data-qa-selector="commit_content">
<a class="commit-row-message item-title js-onboarding-commit-item " href="/dejain/sas-access-samples/-/commit/52708ee821f646f0cd7b14aae094dd590180b33d">Fixed CLasspath</a>
<span class="commit-row-message d-inline d-sm-none">
&middot;
52708ee8
</span>
<div class="committer">
<a class="commit-author-link js-user-link" data-user-id="13628" href="/dejain">Deven Jain</a> authored <time class="js-timeago" title="Jul 27, 2023 4:19pm" datetime="2023-07-27T16:19:48Z" data-toggle="tooltip" data-placement="bottom" data-container="body">Jul 27, 2023</time>
</div>

</div>
<div class="commit-actions flex-row">

<div class="js-commit-pipeline-status" data-endpoint="/dejain/sas-access-samples/-/commit/52708ee821f646f0cd7b14aae094dd590180b33d/pipelines?ref=master"></div>
<div class="commit-sha-group btn-group d-none d-sm-flex">
<div class="label label-monospace monospace">
52708ee8
</div>
<button class="gl-button btn btn-icon btn-md btn-default " title="Copy commit SHA" aria-label="Copy commit SHA" aria-live="polite" data-toggle="tooltip" data-placement="bottom" data-container="body" data-category="primary" data-size="medium" data-clipboard-text="52708ee821f646f0cd7b14aae094dd590180b33d" type="button"><svg class="s16 gl-icon gl-button-icon " data-testid="copy-to-clipboard-icon"><use href="/assets/icons-3591e1b0dc5b9091969f4b703f7bdaffa0ca7b2c7953b0f3a7e7dc1e71c3e43d.svg#copy-to-clipboard"></use></svg>

</button>

</div>
</div>
</div>
</li>

</ul>
</div>

</div>
<div data-ahead-compare-path="/dejain/sas-access-samples/-/compare/master...master?from_project_id=54531" data-behind-compare-path="/dae/sas-access-samples/-/compare/master...master?from_project_id=54803" data-can-sync-branch="false" data-project-path="dejain/sas-access-samples" data-selected-branch="master" data-source-default-branch="master" data-source-name="Data and Analytics Engineering / Sas Access Samples" data-source-path="/dae/sas-access-samples" id="js-fork-info"></div>
<div class="blob-content-holder js-per-page" data-blame-per-page="1000" id="blob-content-holder">
<div data-blob-path="SAS Viya/JDBC/Denodo/README.md" data-original-branch="master" data-project-path="dejain/sas-access-samples" data-ref-type="" data-resource-id="gid://gitlab/Project/54803" data-target-branch="master" data-user-id="gid://gitlab/User/3178" id="js-view-blob-app">
<div class="gl-spinner-container" role="status"><span aria-label="Loading" class="gl-spinner gl-spinner-md gl-spinner-dark gl-vertical-align-text-bottom!"></span></div>
</div>
</div>

</div>

<script>
//<![CDATA[
  window.gl = window.gl || {};
  window.gl.webIDEPath = '/-/ide/project/dfxvir/sas-access-samples/edit/master/-/SAS%20Viya/JDBC/Denodo/README.md'


//]]>
</script>

</main>
</div>


</div>
</div>



<script>
//<![CDATA[
if ('loading' in HTMLImageElement.prototype) {
  document.querySelectorAll('img.lazy').forEach(img => {
    img.loading = 'lazy';
    let imgUrl = img.dataset.src;
    // Only adding width + height for avatars for now
    if (imgUrl.indexOf('/avatar/') > -1 && imgUrl.indexOf('?') === -1) {
      const targetWidth = img.getAttribute('width') || img.width;
      imgUrl += `?width=${targetWidth}`;
    }
    img.src = imgUrl;
    img.removeAttribute('data-src');
    img.classList.remove('lazy');
    img.classList.add('js-lazy-loaded');
    img.dataset.testid = 'js_lazy_loaded_content';
  });
}

//]]>
</script>
<script>
//<![CDATA[
gl = window.gl || {};
gl.experiments = {};


//]]>
</script>

</body>
</html>

