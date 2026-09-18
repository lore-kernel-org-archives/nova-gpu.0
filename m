Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010005.outbound.protection.outlook.com [52.101.46.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC583947A4
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 01:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693704; cv=fail; b=k6KdD22Yki9rOJig9jEKPYMbw1TZR5dbbn3EAhtKRJTq1UkvSaSR0RnMLAxWnV/sUFEWvkX59XCmMObIC+ad1gxe1CISETYdxWHKmV/a870KJj8KoQaP7DPBBlPTJnGgWl1e5uy1ET+PWxT8A4ztlh6KjjsxhOTg7riRDs/PJoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693704; c=relaxed/simple;
	bh=Tdn8RXhPRJgScJWRoY76JyXKQD/vdaKq49GgzkI7fHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CAhqafNgJ7qTw36vixQJq7TgviEDPjffKSjVwRingLrsSXLJP0F/Ac/DvBN7FCuqX91LdWn6SS2OBvpR14/hLkx5ejN3YNRdNhglFAa7sCz51t8wmvvW+KFJlm2jQe6wkdSw0lqUq4J2BG/tkBtxE2YWUNFgis38qAbRtr02IKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jKyMfhsY; arc=fail smtp.client-ip=52.101.46.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jKyMfhsY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hHFaahmeqAtMahuPwyYzdYL/iSbpkUhvB1aT0NjJ13zJaB6/JsVWDdzL5R92LNzWh9aMUfE3aS4ehghc5rtiWqScSQIxq9tnTUvLIiJtcO2BWgcJHtsfwPnvP4bbPo9tiUYj0pCbXYCCNo4i8azkurCo0AyBkqcsoPoRAMxX3DTLq3ReKgeuwg3YMol9BvFAJvn8krW6T6EX/xQv+CAhzVqQre9dJvG/DzFHscYElz7f5IMKrS/cQDYgcrlYfTBABepGqOlTY3tV1kqKHe8G86cwbJc77bW0QaP7H/yvv1kx6LkDHCib2DQI6qKsAXK4EA1QXOIBB86ihTY6jYjjUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j01Um1/0B5dW+u2TLwyrRQjSyQO8yX+s9ubWCUTX5CQ=;
 b=tnBmA8A1MVxMc4aE107JB5nss9xjCkobdLWxRkHw4uTWtI3e26xdI5EZBJ7Lts7n/aIslG1MUyBkMxF/iulwP+uNVKmF+UNwkqGyihdKvHwy7vGCCZjV9XZ+TOs7TzKDnZ8xH1jdRMvsHfuLdQTFoR+ZK5HaX8uBQHqX9Un4nmap08fPi8DdQi2wMI9gFJx5jIokweh99lOw6NMPx8gL4TI/FZq0ihvXxR/OhwAip6oxuMr82mUvgGMKYItAd9mi0t1A/6IyzDaMOawR7gAZ5P9o0Eq1AoK34bf2BxPNqSLSJ0zkLlzEFX2ZMQ/Xj34KhpjcqMk396Dhr6FEzVUC+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j01Um1/0B5dW+u2TLwyrRQjSyQO8yX+s9ubWCUTX5CQ=;
 b=jKyMfhsYrwazBmFGvMqSvPkDqsnMzUY05tUVIoScWBxtc7/FbZ6+p6VjAwjN/vNY0VmwSXO8dV3Vc18OMCZNYdjsvB+SYYrFLJ/eQ53FytvwRW/VvUkVAIyps2gzTVO/t552aeDurOe0NJIdJpbmgAQ68TW0zhGv+uocI4pr6OvfOuyQGPwvccsGR/wDSSQGhfytbG2ZpH32f8QcGwxHMUFBmfoBDfq8OiqwO3yUl9uTLp+2lu2kQaB1om3Wx/rpEgTZOMFFZQMBFUqZBhvMbs9T5LXHgLIhe48QIGU1Z6fjJBcurZAe+cgr9P8/DBj+b3HzmIBpqNq8BOUPItw0AQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA0PR12MB8349.namprd12.prod.outlook.com (2603:10b6:208:407::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 01:08:02 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 01:08:02 +0000
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
Subject: [PATCH v3 20/33] gpu: nova-core: gsp: return the static GPU configuration from boot
Date: Thu, 17 Sep 2026 18:07:06 -0700
Message-ID: <20260918010719.1176945-21-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918010719.1176945-1-jhubbard@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0048.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::23) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA0PR12MB8349:EE_
X-MS-Office365-Filtering-Correlation-Id: 79ca9aec-b4da-43e9-3fd6-08df15214207
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|18002099003|22082099003|56012099006|3023799007|11063799006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	0S5E3wsdIkaIqMYoVxGGkg7vLtrPWZHnB+C+PRWWlp8FB0ZgXeM5XGQj3s5l7SkK62/xo4+ZqwFacCZqwhk5mpeVWTiYFCekxd4kG0v7ybbHt245Vy56hPGrFmqHFPG+YzJ72rAs2yKdWs7ixshJjJV+3zErNFRdGILLv8t/pZBMHT6Wc0uqEX6Jy9m/YkzNWA79QlEFHLa+OdTAwEnKbWWT0whXsvqWy9byMt9s6tlgLyKLq9gMxWMPqIYuViMsP1lLkr2vp0cVIITQ5uPYy4Go6iHC86G+g8USKrDrye1aKKsFvzeTT9BpOCPPGELR967IiGQP9CVsDl+Iiptgw019dXFAkQ64bkiW0mu5x6erPtY1H8CIs28QCdy/2JnD4pJmViIg4ZqyYlbSEgKxWJrLQ9ynSWZioVMX/Hm868Fo/8Gprxf7dZlqCrcXftFnZzn8PvEyHnyafFls5TVuecUImqIbEXIfN/lRmQSqz/EkPSb8UUyOODDP2jrY93BcpW87qZHoKW75O5If6c+BGqkMi5m9rbyVuGXBVuIDzc7REe09zrNL2OCxkEJ8XqlG1uBntjtfpoY0oiwC89J2+L8tzbkqEtfezjkkASQz+4dpOuITSx+Uy+OnAP34r6+hEEXl2981LwEWdkW81LxAeQoOxRLEh6BTAU4izNrMNYM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(18002099003)(22082099003)(56012099006)(3023799007)(11063799006)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JLlsw8i+2OEE0xgfD7j1KbjNA/OpqNMVyfUjIxMomTV1SatmBp+npHN12ZxE?=
 =?us-ascii?Q?DmHSBH6V3EN7/06z1zQQMlRoSUI9b+rrdouCMpxi2WNdOkyjudphAZ/1Q3m2?=
 =?us-ascii?Q?zGqo50rlAtVt3i9ZgrSnfbZU5nQ1icJ5dTFPAunjVZoY5ntTiCcomjol47kJ?=
 =?us-ascii?Q?GhkmEqv/lRpbZ198LD1X2/Jpyr4GtrNlnAejxdxqmo3gXbUYoMb3HOyZNU3O?=
 =?us-ascii?Q?Ue8qPgrOj1VanyjgLN9ZuJlBc5/rF/umb4NgH+FIuFxxxlufa+Y3+skD7xGf?=
 =?us-ascii?Q?9nEidQaVpC/IC+yp8T8+G6MkAJNjcv3u5GQxmnyDRRyGS14HsYHTEKzOp13g?=
 =?us-ascii?Q?mwZk4s5tp7H1A78kQb0P47Hsr2QPfqVnyr85vzKnNILh1zdYESJ+CS54nK+4?=
 =?us-ascii?Q?XtmWz71T2hllW7rJgVf2YdDKPSCTFTPXA+Z/6fUQaV4rpiqSBmnoKdc6dE3t?=
 =?us-ascii?Q?R/hWDXfF6Jgg6upsYkEsTWSukZ45tM4H0QLpX/7CsfMeKgOHKo4u7MBcqIeC?=
 =?us-ascii?Q?DY8Um8B6Hxn/4PbIB8fiLU9xkZyS4vA48z6fa4l3RdnbDQhpS2v/CirtJRhu?=
 =?us-ascii?Q?CNq1yAms5mPugjNiAsBlpWCBwjEMC5/ityI071luA94wtZm1mmKIXz0om0V+?=
 =?us-ascii?Q?himvUuxPiI3m3JWfHZLy0SWXW7PaX/h9Fw9o00zbVG3zFxLCh/0pSt/z0L9m?=
 =?us-ascii?Q?SH8WmAXMrpeeHF5k13yso1tU/aVst2no9xtx3IIr1nYWVbyVivVvkrMXfHne?=
 =?us-ascii?Q?iOnhfKHwppXOAO/9zCa8Utr606L4w/4zyxCQw0BeJa4eaWx1xUBfEBsJ2FiG?=
 =?us-ascii?Q?7RHC29zsiJl/cj3u4hbnUrBvjkVWj5mBhDuvS3lf9CMaPC64lsi/8HNRCGsb?=
 =?us-ascii?Q?oYJR1F34tOUezpBqhRr4xOmqr5k4PhwvHTuxEjBTgXYhwHEkMa2oUYQkgygu?=
 =?us-ascii?Q?/KRAsPASC7JZ+76m04Ls+ZQ/u24bmrTVCNJ7sYYQxEEgq2szx9xhihJWlk+u?=
 =?us-ascii?Q?mjt2pSjKptCXEU9TvjisibibsKB3Bq0N4GRjKaGGwWWsiAwyyfsv5jbQghY1?=
 =?us-ascii?Q?/RjUkvWX778wAh0gz/+g1PQzvViF6JP2/LIjbOT2leYgvpJ67McI4pQmGyYt?=
 =?us-ascii?Q?8Y/yFDgsUMQxRg5ZqBMKEcJ1/ryJKhRWXRGNKkYxGc5MQlCADX1zA9Mg0Flg?=
 =?us-ascii?Q?pozma0n86ffgcKX7KRbdGhkIK7APLy8t55g1U9ipPdUzVX43l62ClH6MtZ6W?=
 =?us-ascii?Q?8qKFOAKcN12pplB46ESfujwoFY2RPReMck4WVN0s8uepR1qmNza88UfmDB5Q?=
 =?us-ascii?Q?xSHUd4SeEXweTjpH+YJ/W4gg5DwwBejSbwU4iU1ZhPt0mP+pGHLNcjxqYiMW?=
 =?us-ascii?Q?myGJXWgzlQadPvUebs+uKZe2eYQTBXTiOa75SKGzyDU0y9UXcXnEIgcGpD5D?=
 =?us-ascii?Q?ykEmwrU8ncG6w0iGxtv6szfSSb+PcnfBptzZgx1+4q10F5IPuL4OSC9OpmIx?=
 =?us-ascii?Q?L8cBEyQ7MJi7IsdLI2sj3NnCGFuyJPC4gbUnV3U8fi0zE097PLPaUrdGBCWf?=
 =?us-ascii?Q?ZY/3VX87eZsW1taY12iXhmJDUAMmAcOV9UGHdpmC2IrJTBzHlu2XrogPHyuq?=
 =?us-ascii?Q?xXh/zsv9sZMY0fn9pxr/BPTUsMO8BlAVQtjw4fED2EbEYHLb0VEWVxhc1E9l?=
 =?us-ascii?Q?dWidZN1qJp9OH0r+W03zDfkLHfUe/XNYCpizvY9wd8/KEq1WJBA8AGp8sm4/?=
 =?us-ascii?Q?bhmzOTFHAg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79ca9aec-b4da-43e9-3fd6-08df15214207
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:07:49.7021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mg5vKEObP6NWUVV157sJsHv5k5snOovP3QQi8RHT2R7BTFylqrxIKMge2wSEl0w1Tm4B6Gi/yQZNvHTjPfmCrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8349

Once GSP-RM has started, it reports the static GPU configuration: the
GPU's name, its usable framebuffer regions and its BAR1 page directory.
Everything that the driver builds on top of the GSP depends on that
configuration. In the r000 boot protocol the configuration arrives as
the reply to the request that ends boot, so the boot sequence holds it
when it returns.

Nova-core fetched the configuration in a separate step after boot, once
the interrupt handler was registered, so on r000 the boot sequence would
have had to keep the reply for that step to read.

Return the configuration from the boot sequence together with the unload
bundle, and drop the separate step.

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs          | 44 ++++++++++++++-------------
 drivers/gpu/nova-core/gsp.rs          | 13 +++++---
 drivers/gpu/nova-core/gsp/boot.rs     | 15 ++++++---
 drivers/gpu/nova-core/gsp/commands.rs |  2 +-
 4 files changed, 42 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index e7f1458330b4..0ed0f4722dc5 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -34,7 +34,6 @@
     fsp::Fsp,
     gsp::{
         self,
-        commands::GspStaticInfo,
         Gsp,
         GspBootContext, //
     },
@@ -298,8 +297,15 @@ struct GspResources<'gpu> {
     /// GSP runtime data.
     #[pin]
     gsp: Gsp<'gpu>,
-    /// GSP unload firmware bundle, if any.
-    unload_bundle: Option<gsp::UnloadBundle<'gpu>>,
+    /// The static GPU configuration and the unload bundle that the boot sequence returned.
+    boot_result: gsp::BootResult<'gpu>,
+}
+
+impl GspResources<'_> {
+    /// Returns the static GPU configuration that GSP-RM reported at boot.
+    fn static_info(&self) -> &gsp::commands::GspStaticInfo {
+        &self.boot_result.static_info
+    }
 }
 
 /// Structure holding the resources required to operate the GPU.
@@ -313,8 +319,6 @@ pub(crate) struct Gpu<'gpu> {
     /// before the GSP is unloaded.
     #[pin]
     _gsp_irq: GspIrq<'gpu>,
-    /// Static GPU information as provided by the GSP.
-    gsp_static_info: GspStaticInfo,
     /// GPU memory manager owning memory management resources.
     ///
     /// Must be kept declared *before* `gsp_resources`, so that its components are dropped while
@@ -347,7 +351,7 @@ fn drop(self: Pin<&mut Self>) {
         let this = self.project();
         let device = *this.device;
         let bar = *this.bar;
-        let bundle = this.unload_bundle.take();
+        let bundle = this.boot_result.unload_bundle.take();
 
         let _ = this
             .gsp
@@ -416,10 +420,10 @@ pub(crate) fn new<'a>(
 
                 gsp <- Gsp::new(pdev, bar),
 
-                // This member must be initialized last, so the `UnloadBundle` can never be dropped
-                // from outside of the constructed `GspResources`, ensuring that the unload sequence
-                // is properly run in case of failure.
-                unload_bundle: gsp.boot(GspBootContext {
+                // This member must be initialized last, so that the unload bundle can never be
+                // dropped from outside the constructed `GspResources`, and the unload sequence runs
+                // on a failure.
+                boot_result: gsp.boot(GspBootContext {
                     pdev,
                     bar,
                     chipset: spec.chipset,
@@ -454,9 +458,8 @@ pub(crate) fn new<'a>(
                 gsp_resources.gsp.cmdq.drain()?;
             },
 
-            gsp_static_info: {
-                // Obtain and display basic GPU information.
-                let info = gsp_resources.gsp.get_static_info()?;
+            _: {
+                let info = gsp_resources.static_info();
                 match info.gpu_name() {
                     Ok(name) => dev_info!(dev, "GPU name: {}\n", name),
                     Err(e) => dev_warn!(dev, "GPU name unavailable: {:?}\n", e),
@@ -476,13 +479,12 @@ pub(crate) fn new<'a>(
                             / u64::SZ_1M
                     );
                 }
-
-                info
             },
 
             // Create GPU memory manager owning memory management resources.
             mm: {
-                let usable_vram = gsp_static_info.usable_fb_regions.first().ok_or(ENODEV)?;
+                let info = gsp_resources.static_info();
+                let usable_vram = info.usable_fb_regions.first().ok_or(ENODEV)?;
                 let buddy_params = GpuBuddyParams {
                     base_offset: usable_vram.start,
                     size: usable_vram.end - usable_vram.start,
@@ -493,13 +495,13 @@ pub(crate) fn new<'a>(
                     bar,
                     gsp_resources.spec.chipset,
                     buddy_params,
-                    VramAddress::from_raw(gsp_static_info.total_fb_end),
+                    VramAddress::from_raw(info.total_fb_end),
                 )?
             },
 
             // Create BAR1 user interface for CPU access to GPU virtual memory.
             bar_user: {
-                let pdb_addr = VramAddress::from_raw(gsp_static_info.bar1_pde_base);
+                let pdb_addr = VramAddress::from_raw(gsp_resources.static_info().bar1_pde_base);
                 let bar1_idx = crate::driver::bar1_resource_index(pdev)?;
                 let bar1_size = pdev.resource_len(bar1_idx)?;
                 Arc::pin_init(
@@ -520,14 +522,14 @@ pub(crate) fn new<'a>(
     pub(crate) fn run_selftests(self: Pin<&mut Self>, pdev: &pci::Device<device::Bound>) {
         let this = self.project();
         let dev = pdev.as_ref();
-        let regions = &this.gsp_static_info.usable_fb_regions;
+        let info = this.gsp_resources.static_info();
 
         if let Err(err) = crate::mm::selftest::run(
             dev,
             this.mm,
-            regions,
+            &info.usable_fb_regions,
             this.bar_user,
-            this.gsp_static_info.bar1_pde_base,
+            info.bar1_pde_base,
             this.spec.chipset,
         ) {
             dev_err!(dev, "self-tests failed: {:?}\n", err);
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 6e7a057188c5..90b4c3380f11 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -219,12 +219,15 @@ pub(crate) fn new(
             }))
         })
     }
-
-    /// Query the GSP for the static GPU information.
-    pub(crate) fn get_static_info(&self) -> Result<commands::GspStaticInfo> {
-        self.cmdq.send_command(commands::GetGspStaticInfo)
-    }
 }
 
 /// Opaque bundle required to unload the GSP. Created by [`Gsp::boot`], consumed by [`Gsp::unload`].
 pub(crate) struct UnloadBundle<'a>(KBox<dyn hal::UnloadBundle + 'a>);
+
+/// The results of [`Gsp::boot`]: the static GPU configuration and the unload bundle.
+pub(crate) struct BootResult<'a> {
+    /// The unload bundle for [`Gsp::unload`], if one could be built.
+    pub(crate) unload_bundle: Option<UnloadBundle<'a>>,
+    /// The static GPU configuration, as GSP-RM reported it at the end of boot.
+    pub(crate) static_info: commands::GspStaticInfo,
+}
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index c805b42dd7bc..86a122438d44 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -339,18 +339,18 @@ fn handle_load_exec_hs_binary(&self, payload_0: &[u8], payload_1: &[u8]) -> Resu
 }
 
 impl<'gsp> super::Gsp<'gsp> {
-    /// Attempt to boot the GSP.
+    /// Boots the GSP.
     ///
     /// This is a GPU-dependent and complex procedure that involves loading firmware files from
     /// user-space, patching them with signatures, and building firmware-specific intricate data
     /// structures that the GSP will use at runtime.
     ///
-    /// Upon return, the GSP is up and running, and its unload bundle (to be given as argument to
-    /// [`Self::unload`]) returned.
+    /// Returns, with the GSP running, the static configuration that GSP-RM reported and the
+    /// unload bundle for [`Self::unload`].
     pub(crate) fn boot(
         self: Pin<&mut Self>,
         mut ctx: super::GspBootContext<'_, 'gsp>,
-    ) -> Result<Option<super::UnloadBundle<'gsp>>> {
+    ) -> Result<super::BootResult<'gsp>> {
         let pdev = ctx.pdev;
         let chipset = ctx.chipset;
         let gsp_falcon = ctx.gsp_falcon;
@@ -398,7 +398,12 @@ pub(crate) fn boot(
         // Wait until GSP is fully initialized.
         commands::wait_gsp_init_done(&self.cmdq)?;
 
-        Ok(unload_guard.dismiss().1)
+        let static_info = self.cmdq.send_command(commands::GetGspStaticInfo)?;
+
+        Ok(super::BootResult {
+            unload_bundle: unload_guard.dismiss().1,
+            static_info,
+        })
     }
 
     /// Shut down the GSP and wait until it is offline.
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index b3b28e397ebd..d866297fa0a5 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -205,7 +205,7 @@ fn init(&self) -> impl Init<Self::Command, Self::InitError> {
     }
 }
 
-/// The reply from the GSP to the [`GetGspStaticInfo`] command.
+/// The static GPU configuration, which GSP-RM reports in reply to [`GetGspStaticInfo`].
 pub(crate) struct GspStaticInfo {
     gpu_name: [u8; 64],
     /// BAR1 Page Directory Entry base address.
-- 
2.55.0

