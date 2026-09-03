Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010058.outbound.protection.outlook.com [52.101.193.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1839836E473
	for <nova-gpu@lists.linux.dev>; Thu,  3 Sep 2026 03:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788405342; cv=fail; b=Xds8mSuARnOAE+kgHvdNSJroh76TwSGst3yLSM03za5LFpJjScM8YWvur4vqTGNqkfka/Osx0D3Qk8vGtjtTICluvsdeyOoA9JNmUwjg3lOxe27kfirDokKkHkP9W2Gn8xiT3bvMLRDgusDSeK7FXPVvw5WWqvXquDisPpl99Uw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788405342; c=relaxed/simple;
	bh=vVc533YQoWpovNGqf5uesjdH2wWdmDLpn3RFzGHOExE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YQckpyFvMcLG79soOu5OBjN/C3n2V6Y2+03c1ka0mMPiH0v2agzWMxPMst6+r9/GCoGrOMj61MYei40Q2YbZZ4u7EQg1tqL77as1EegRoe+mfpwBhpQiWKL6oFeZuzPtBV0CYyGZxJR3vRILYcYie5qOlxWxQqNgWH1czJHGqks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lqCaBNUy; arc=fail smtp.client-ip=52.101.193.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lqCaBNUy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SuaurlpJrwzIli1nJBttySKaY+/WJ4m1RPtqoF9DZsr6UJtUv06LNNm4FA+M9MCYYW3lPdydwqSGsObBncUs8R56MPQlOEb30CAfCj+ZOONk1HRMYzw4I6GcYfc1Ce5ZyYXq1Eg42H89IYnGro6tMDZxTzz+UBgG8qdjRpn+J0YejkEnOMd2QzB7mGGJCCsF43XN+Opiq3PD6RGHXapCzw7NzraTLB9kBKe54K948oGCZQEXsZcQ808fnUhGTHq8k7KILqV4edpBMKT3cBhHQcxZYHQigNo9gu2dl3Stq5eLVxZfk/e7h02CnXnmzU7oMbkdtmltEERI69CIB6alrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Tsj0ijUjA5Fsg4HJ0I3dhbG6JZzOHS6YVWeH9jDtoU=;
 b=dwBz28Akz4NdxUsl+EznYCEs5nBiOCp2C8Uedx1+5Z6ldBIvaffm5wHvNUHtQarGPqF7wz2RN1WHdnmTczIZ74d04tZMz7IFRG+nrHwG558YSuo0AH2AZSu+U83gHGHSUh3VyUYb2Wwhu5KaF+CgU3b9AijEK2gter2kw5meWikphtv4iCk/7uU4NiHhT3uHE0JT7qhq0h1UwFVAuQlobX4G0V9OhKVmE2dqnTTZqq97G6Hs+KpXscrK3qrmdrjwMj0OKKVwwAgCgEeIZAJyejA+Gd3aE1SAlbEPUqDNilRNTbv8bhyKvz103zTufUNqmlE0f+Ap7uAUSGOsq/xPAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Tsj0ijUjA5Fsg4HJ0I3dhbG6JZzOHS6YVWeH9jDtoU=;
 b=lqCaBNUyacdvnQSrf4AppgF91lF04uKUz3smt5gNepQa0/UiBiXlWPKmvlCX4gg7njSMScX4hss7BkJUqH1hs55QB7A70IhHHYPUEAW/fe8Kf16iN59PS5+ispkz7Wz6MuEiZrG4kDXBlqqrsxx/neUztmqMSnQbWYrWIKIbKXN2e3FHx7MwF9exA+fyWPaSbGR3r74zH+J4kwZ2lYkVT/i05pzICtwoDQiDwNxlyoqHajGVK5jj7IGtkOezDHnlcWjIgPrMoogELZ1ATZONyanKg6UFR5KaQ/VCweJ5oIHFXVcelalzRRN67HrQ6yot0ijwhDlU0zhYyajpBEXs0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ2PR12MB9138.namprd12.prod.outlook.com (2603:10b6:a03:565::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Thu, 3 Sep 2026 03:15:33 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 03:15:33 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	nova-gpu@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v3 10/14] gpu: nova-core: bound a GSP wait by a single deadline
Date: Wed,  2 Sep 2026 20:15:09 -0700
Message-ID: <20260903031514.1515905-11-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903031514.1515905-1-jhubbard@nvidia.com>
References: <20260903031514.1515905-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0120.namprd05.prod.outlook.com
 (2603:10b6:a03:334::35) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ2PR12MB9138:EE_
X-MS-Office365-Filtering-Correlation-Id: 689a8b37-8ef7-46f8-ba8f-08df09699bde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|18002099003|22082099003|56012099006|3023799007|10067099003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
	KRyT3AErNFcZeXH17D4SLE1s/ld/GcSMdMkhwW2nNZp3eLGN7zaIJOqstGz1R7SWPWejsoOQgByL2dHtnGi3NlZZPd7KYpybCApYp0G92nX3rSoKqs7F9uO1AUJWu+5TbZfVgiVjmqXGXrnyaa+4dKjFywOTRm0VnZrcDNRyt9Be6TU9UtST2oUjXOLpkMMBEDUXuhFk2l3y0FOycQS44UbJL+cJbMcgHNgqeBRQBHh9+iGQVszdpDoHeN6OpTVoP3Vll7FB5u+3nhqz41wI7emBawYP0BBCczLwFoyEQUxTHVplEruBrRYAGRpuWyw6vFdByd4EDPDX6PCNAFPMHlWmw3BWH10U1tZnsYoMR52HezslWDC7IpdUoj94N27QkI812wGHD8ZIFhsXtlaPAj4L3BwgoDxxhdDQ0DZuSusRu1dmUzh2PwXSqvX0gzetOC4ezQZLCF2z3v5VUoyVPPlUMxYv2d2shNW/imXupNmtxEAsPWqNJshEPpvsG1WtAGpnd43qQRXgff/eSZDHRWoeSudU4pDCQ4U7JG9ZAUfDGkX9yRnIiDf76ev5VIKXQs+dQJvmFogvCYyalC4LUGX2Op8nq6p9YIMH2v49YdHGDC4rZ09GcrkTpgqEfvKAcPly4k2OhHdJXuJuq3gtQtV8DTOSDd8Lys05+FU3LYI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(18002099003)(22082099003)(56012099006)(3023799007)(10067099003)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Itva7d9TsrRdUMPDs6ZTpBQaOH55+IQthQl4HcOu+qwSNa4gM+R3zb8mYsef?=
 =?us-ascii?Q?1/kJytL9Uwrgc7IJ0QHA6IsMQjilJYS8cWEMr9fjv8ym5qWdtG73+ytOjGEe?=
 =?us-ascii?Q?5pebNCHp++3J2KOhF6DUE+d8Qt1GyLIHvEtGYqqaNb/v6LdPWIPSDKjc8xz7?=
 =?us-ascii?Q?5TDN2zHSHkkhN6gxwsi0wY+zUx3ZB+u8dRXV3lSqya6qHfx6RJ8NESuICu14?=
 =?us-ascii?Q?6IjZlaGnfc7YEC7BybILgJrNGhUVdE2B7ljcgXG+U3f47XnlmAhKeVRb+NKj?=
 =?us-ascii?Q?saF4JnUZXllSgmUg8VmYtsBiEnGKjt91p/ny8A57SrG2Nr900W54JSBfS2CF?=
 =?us-ascii?Q?siXU7oqWS1v3f4m9EJFgcz+znx8QYWrd1kxTwsA4CsNULhfMKRKU7pBPURPo?=
 =?us-ascii?Q?+qPWjiCpC+vPm/J58ouXusOafIs3G5YDXgvHsIXnCeUH1gkszRVaTR/BZuoN?=
 =?us-ascii?Q?p+kwIquWDTLVJVupsGLkUgT2REx3zybL7bhQ9jbWsDxdowcnZEbihRL4v85w?=
 =?us-ascii?Q?H75cVnfw+4GTeFC0zleOeEJZ75IClbjOlMDPRH6Jyb2juWRZlxdGWVAJb5gI?=
 =?us-ascii?Q?BI11RhTU928rzAt/gwVZu80cVo3pDkFKj23gXniGprY5Mrzelq6opNV63DbK?=
 =?us-ascii?Q?jKmerICo6uehBCGLRo6F3RVsTK6fmGgwbq9crvrkVCf4eNnxavBtHVyGJ32V?=
 =?us-ascii?Q?hCuqC2oM+sQqetnwfr1lLm/4TC6jC5h8gJ3GgGLKGep2wQSSQW0MKV6miaOD?=
 =?us-ascii?Q?YMQ+eSvcyFyDYjRXBjL/6GKL2m7zG4WAts62ftpGkKNb3KZD5sGImWfpH3SU?=
 =?us-ascii?Q?+NK1T7tj6aolAMd5ZFQ90C/6jR2M6qRkxy0aJcU5oESSOkAT1qr5XSIMUpo1?=
 =?us-ascii?Q?quG3BGxbRkJXFb5HO9IrToaX13b6Xtsv5NerSafH3y+FNOnHDsnnd0N9joab?=
 =?us-ascii?Q?g3xQua1W0Nr5HmT48ikyDMEQMO1hP3ioy6F9xgDuF4b6y4g2R/ZjMVl5bp5q?=
 =?us-ascii?Q?8bPNyIp8wYwUVYTWDjJUkaLsKHLqcUWeLAfHSsldLZDxhI8TvbzyP6ADcwG2?=
 =?us-ascii?Q?XTBwrYy1nLI/J7hgokOpkpmljD4RKDRSGwiY0EDWmDeTeIPNUXseVP7jbsjB?=
 =?us-ascii?Q?gtud/R/KvE2TEy+2mOXO5XXQOp8nolQvNRTlMZe/JuhvZltJN9OpTP/wtXEy?=
 =?us-ascii?Q?58Z4yC+Rf6gSKFSiqOHBZsR2ujwpjlr8wad3pyflO5D7grJHN6NS6sDRaJZj?=
 =?us-ascii?Q?CoukZYNswtC9MwcXLgbAP5yzp5MTgcTZtTCzM88UcJ3lObckVkAAqzOukE9B?=
 =?us-ascii?Q?165fjIykMnRrgVzMwZRaQKfWuR/3kfXe1NWB6tEzdy7KpfRFehlXUpeYN02d?=
 =?us-ascii?Q?rf0cDQcB2taC/SO5OfXmTCyd4ZUpiYTogtb4bRAlceDTnsFOU3pL/AhivRD/?=
 =?us-ascii?Q?+a4C6MxsEzvurRh/oJLyzd2PqluhrIkcW0iNznJ+wwbPXOQACXLLkfo9tc89?=
 =?us-ascii?Q?lqwTx3M+z2dCVF2KqdNP+xhoiVsWgtWWStRlQlinaJLydC6HgSLJUbwKGe7c?=
 =?us-ascii?Q?5mr7hLoaObULWKJQsC9pu2BsHrXGAqxNyhSCOlJaQ1HN6awZIhBjD90KfH+D?=
 =?us-ascii?Q?OYeptQXiTle8FuIHW7fNPiDmwUr4Gzn2MuxX+s8RYxMru286fGFR4HZmsnuc?=
 =?us-ascii?Q?oFZlkdLZM9FX2C4g4SN5pComRyNAfMgJ/AGie0Lu18VaV7tlpoDrWqWMICym?=
 =?us-ascii?Q?rI5j6UYoiA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 689a8b37-8ef7-46f8-ba8f-08df09699bde
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 03:15:30.2393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BWbez0FkrrSVB46nYIdtosIcQX+Dzy8yPKkFD7O3imjWllpFZ9ReEJTOcsUqfeu9nAZsUikpUQ81EFGJojM/yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9138

The GSP posts unsolicited events on the same queue it posts replies on,
so a caller waiting for one message logs whatever else arrives first and
reads again.

Each of those reads started a fresh five-second timeout, so a steady
stream of events extended the wait without bound. The wait also released
the queue lock between reads, so a command sent from another thread
could consume the awaited event and leave the waiter to time out.

Compute one absolute deadline when the wait begins and pass the time
remaining to each read, and hold the queue lock across the whole wait,
so the wait is bounded however many events arrive first and no other
caller can take the event it waits for.

GSP boot waits for two unsolicited events. Move that loop into a helper
so both take the same bound.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs      | 50 +++++++++++++++++++++-----
 drivers/gpu/nova-core/gsp/commands.rs  |  8 +----
 drivers/gpu/nova-core/gsp/sequencer.rs |  8 +----
 3 files changed, 44 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index ce4d6a111e68..a0f995faaee5 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -33,7 +33,11 @@
         },
         Mutex, //
     },
-    time::Delta,
+    time::{
+        Delta,
+        Instant,
+        Monotonic, //
+    },
     transmute::{
         AsBytes,
         FromBytes, //
@@ -569,8 +573,9 @@ fn notify_gsp(bar: Bar0<'_>) {
     ///
     /// # Errors
     ///
-    /// - `ETIMEDOUT` if space does not become available to send the command, or if the reply is
-    ///   not received within the timeout.
+    /// - `ETIMEDOUT` if space does not become available to send the command, or if the reply does
+    ///   not arrive within [`Self::RECEIVE_TIMEOUT`] of the send, however many events arrive
+    ///   while waiting.
     /// - `EIO` if the variable payload requested by the command has not been entirely
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
     ///
@@ -585,8 +590,13 @@ pub(crate) fn send_command<M>(&self, bar: Bar0<'_>, command: M) -> Result<M::Rep
         let mut inner = self.inner.lock();
         inner.send_command(bar, command)?;
 
+        let deadline = Instant::<Monotonic>::now() + Self::RECEIVE_TIMEOUT;
         loop {
-            match inner.receive_msg::<M::Reply>(Self::RECEIVE_TIMEOUT) {
+            let remaining = deadline - Instant::<Monotonic>::now();
+            if remaining.is_negative() {
+                break Err(ETIMEDOUT);
+            }
+            match inner.receive_msg::<M::Reply>(remaining) {
                 Ok(reply) => break Ok(reply),
                 Err(ERANGE) => continue,
                 Err(e) => break Err(e),
@@ -611,15 +621,39 @@ pub(crate) fn send_command_no_wait<M>(&self, bar: Bar0<'_>, command: M) -> Resul
         self.inner.lock().send_command(bar, command)
     }
 
-    /// Receive a message from the GSP.
+    /// Waits for an unsolicited GSP event of type `M`, logging any other event that arrives
+    /// first.
+    ///
+    /// The queue is locked for the whole wait, for up to [`Self::RECEIVE_TIMEOUT`], so a
+    /// concurrent command cannot consume the awaited event.
     ///
-    /// See [`CmdqInner::receive_msg`] for details.
-    pub(crate) fn receive_msg<M: MessageFromGsp>(&self, timeout: Delta) -> Result<M>
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if the event does not arrive within [`Self::RECEIVE_TIMEOUT`] of the call,
+    ///   however many other events arrive while waiting.
+    /// - `EIO` if the queue is poisoned or a message fails framing or checksum validation (see
+    ///   [`CmdqInner::wait_for_msg`]).
+    ///
+    /// Error codes returned by [`MessageFromGsp::read`] are propagated as-is.
+    pub(crate) fn await_msg<M: MessageFromGsp>(&self) -> Result<M>
     where
         // This allows all error types, including `Infallible`, to be used for `M::InitError`.
         Error: From<M::InitError>,
     {
-        self.inner.lock().receive_msg(timeout)
+        let mut inner = self.inner.lock();
+
+        let deadline = Instant::<Monotonic>::now() + Self::RECEIVE_TIMEOUT;
+        loop {
+            let remaining = deadline - Instant::<Monotonic>::now();
+            if remaining.is_negative() {
+                break Err(ETIMEDOUT);
+            }
+            match inner.receive_msg::<M>(remaining) {
+                Ok(msg) => break Ok(msg),
+                Err(ERANGE) => continue,
+                Err(e) => break Err(e),
+            }
+        }
     }
 }
 
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index ffc25fd8c47b..61fe93db9e7e 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -188,13 +188,7 @@ fn read(
 
 /// Waits for GSP initialization to complete.
 pub(crate) fn wait_gsp_init_done(cmdq: &Cmdq) -> Result {
-    loop {
-        match cmdq.receive_msg::<GspInitDone>(Cmdq::RECEIVE_TIMEOUT) {
-            Ok(_) => break Ok(()),
-            Err(ERANGE) => continue,
-            Err(e) => break Err(e),
-        }
-    }
+    cmdq.await_msg::<GspInitDone>().map(|_| ())
 }
 
 /// The `GetGspStaticInfo` command.
diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index bcad1421953a..e2f1da129d8f 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -343,13 +343,7 @@ pub(crate) fn run(
         libos: &'a Coherent<[LibosMemoryRegionInitArgument]>,
         bootloader_app_version: u32,
     ) -> Result {
-        let seq_info = loop {
-            match cmdq.receive_msg::<GspSequence>(Cmdq::RECEIVE_TIMEOUT) {
-                Ok(seq_info) => break seq_info,
-                Err(ERANGE) => continue,
-                Err(e) => return Err(e),
-            }
-        };
+        let seq_info = cmdq.await_msg::<GspSequence>()?;
 
         let sequencer = GspSequencer {
             bar: ctx.bar,
-- 
2.55.0

