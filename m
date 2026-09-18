Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010005.outbound.protection.outlook.com [52.101.46.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFC73A8744
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 01:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693723; cv=fail; b=D5bDcfAwj8Rhj5vz9f1LBaYjQqPGttKvpDG8KzdWXHA19AojyT/ZIHaaN7wORo9QEbelL2zM0I7+gy45BLIBqoK+ngx+IziWVoD0ge35srALLf2oqZ6foBDXm1ePObom9jNVwHXKjZPRWPUZLLI/CWbQ2lINy1NwOi4r+TJTShw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693723; c=relaxed/simple;
	bh=PIWS+bvZXPffFhk3EtyMOkC75jPXTyckjzrb3z6JPZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l7+Qr5jtmBQiQnH+MqAwbDu4jQGJeYAn4F2lx8Cul/UCVVPH4JVKugs5NwzbXEk+v+HK5OlxZ/6S4Nxgcld4vgyncZFAwVthqylSSno+br2oDM6XTyrs1w0DJjKEWibTdfoNV4q4RvsEG4Cn3x/WmzZfsapGn4sY2vsEPaqz31c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mbcjuyc7; arc=fail smtp.client-ip=52.101.46.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mbcjuyc7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gn1i88bvc1BIQIDp4jwkXUGJpiRLfz9tlnDYxtDbpCOOLCPRKpwCbDzVTNfvFA+O+6m/su1RsC+ACnk/oBTFGu89i1SCHuTr9n+XFPhclXaka8KI8za+68cVYsnKLSlo5vQBEMfxf2okoOyZC+72ymwMFVNR/Nr1+Mk9Jw5JqYE32btNC5qNPhGJin0f77k6intKKy5zMKc/s1w3uhPnG1IPfSfxkbzYx0xqYJm3WPXdaHWLedBNrEq66f4cZzIAhzUr63KIkVGYsqLCOiwR+SiFlOjTZINJZHFfmxu0gpjVpV8GEB+5csQ5VypmoE8bkaUquG1kJIAei1gZIq0jig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Yutjo/VL9eK4snlhBpsCsbHKWUQ64bIamenjL49MgM=;
 b=FtP9zuFgckAP8TG7a8V5d/1ln5Jhzmb7DxapuEitMJQx+QAH0keZYSYWOw1S/WT1UAWqp9Sz92FYJvb91SVdA+U8CX9ySasU0j5wUltwVty5SIpmnVdCwbROnUysq95HOue5OxE/Lq03u9hcxX3oI1BcGkdKqUMGqNhjBuBZMVtgW30KiWJLA7f2WUZCp7+ZC5bKddP7EBb+fclzwkMT4DbjE5o8Nk89rd4ZBrZ8QVqZyM390/Mdd3MZgFo01blzirIzfl85xEBWaNcgwq48JAjCdYA5OaYC2aKuyYvIraEjd8hr2qunbRAgNzBwiMyMPShLo7hTz9N6ptTZolLaHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Yutjo/VL9eK4snlhBpsCsbHKWUQ64bIamenjL49MgM=;
 b=mbcjuyc7t/yQtm9AZAln4nW/gV23zPBCC2VVg1IJDDr+ewuDD1D9+8BpgpjMN1TyG3BOcoR9/25N5MhzGZe/rcRtcl9wGvv5J0SL1NkO5ux8gN/4Te+oStuVD1p6Jw+3FiG/eONCc26PL2j5VZf+BW6D2NLioZGIppeTQqTnrEtBdAGc4d82oMEIFRWgZXtso9ubyKNcg/leeEDbr98HoR65R82QCZf+dzYcYcO29AeSPLV8z0XkgDTlQt8MVP2oXd5JpfqbJrCF85lkrr8QCW4uYJ4XwNTjpw6JrLorFBnDdxE8jWhKcV0D6veeMDAL+kB+5+ZbKZ7bn1jzctTDcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA0PR12MB8349.namprd12.prod.outlook.com (2603:10b6:208:407::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 01:08:16 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 01:08:15 +0000
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
Subject: [PATCH v3 23/33] gpu: nova-core: add LIBOS3 log buffers and state monitor buffer
Date: Thu, 17 Sep 2026 18:07:09 -0700
Message-ID: <20260918010719.1176945-24-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918010719.1176945-1-jhubbard@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0076.namprd05.prod.outlook.com
 (2603:10b6:a03:332::21) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA0PR12MB8349:EE_
X-MS-Office365-Filtering-Correlation-Id: b98e657b-41e7-48df-68f4-08df15214420
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|18002099003|22082099003|56012099006|3023799007|11063799006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	YEzzj6hX75DzqgIovOwIhRobI2n+o1kuJWaftkXfbTilXkW0cV48s0jsYNs5E/itG+yyZ98iJXzrrkReOT6/d2sY6BrKmXFSBMrSg7IxqmQyQgw3h2wwTgls/KAxcTDbqsKtCeAO6Q1DjvLF3Wg9U0mneImvaxAhRRgkndEWfWlxK5pxXQjxozujq3qgAruO2+mfLmXKexSTu+Uwc2vO9+ymOQV2ucA4NHaAAjMG+9ssIKGLI3LgkajgNv44b93dbiHLWlstPQeC84EPPl3/wcomXhs19dLUwfhq/acqGe0HmF5FdXt50Yc3v5YX/N+MGXc8v2cdSpmOPNyy27u2IOKSusny53XkSN8uX2pWz+Dx8Y/V3AdZhhAq1PfEZjJrbUZD2kSSMhfHoJ9Mf+IO6gdekM04gi8TQCBEvWWQWLWKvyq9G1cKY+yrSF8kwVfoK9u5+12/G4/VOxgzZFRBreOqckgwtfb7+ra1nwOllQcTeU1NwEXu9XUW1KKklF4lfz91Z6M64QJO2vHefnz6bLmJ+BL97IO8FJPNLs1orWmGksRUIdBKGN+I9EqAd1CszB8gPa8VPEoNfrNQhGckSe7dKvSwCDeCdO86nGyGGHbuCws9US0/5e58T3+X/xW7ZQSVGuweHoMjOwluHRiOvadW8c78DuJmqRnkyCLXISY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(18002099003)(22082099003)(56012099006)(3023799007)(11063799006)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cT6pt+2O26QDGu4IL3N4qE3SYi9IKEJAYqyYy4owGIkvXI/USd8Rpt3833Ve?=
 =?us-ascii?Q?Rm7Ti5VW0yEa6vOGwyPe6Txty38oMkGSOMEsEvCzynZamJrCPnEBnd0fNP5X?=
 =?us-ascii?Q?beEvske+8+nCQVoK649dGsGSDMof8TWvr9Pui8dlEPBlzxiiAisHf4J6Elj3?=
 =?us-ascii?Q?CIvyAuWp8ZvsYMXBFCyicyL0AM2R241sZ9O38UeJKP/smEe2kffLCp2JlZnv?=
 =?us-ascii?Q?LM5XDclyTFFv0PMjny8qAkbbo3tFlHXcqTWGrx7iZUebVsuwuAZ5UmYCQYGw?=
 =?us-ascii?Q?/wb7xC7fkDTaCfnoLL7NQdCZi3vro/7e+ISngRKRKZBYixnMYhV+SToalaQ6?=
 =?us-ascii?Q?klINojCjpXYqFyErYe4fCNM1QVqHQb2SE7ipHqsbErk7n+biMkYjPm5CVlLz?=
 =?us-ascii?Q?1TURMazec+ikRfAjDd200w9g5wm73bJusaTZXlyK06QnWwJbrkNVR3PLsRfR?=
 =?us-ascii?Q?KFx0WDbS3umK8AfDjLw1GUN22kffPDw3bmJA5LzzFJBkGPH0+37hmayc5dvG?=
 =?us-ascii?Q?kk5mkBBTNyvvshqqysv08VUVkwcEKdVsLxnY9OWdC0bzifNu8q8YZxwHHFMk?=
 =?us-ascii?Q?l5ID4HqwsUFVcmbfkhXd/5G35bxky43sfxuJRmVpC1T1NrFDtxp/TbaGMxsb?=
 =?us-ascii?Q?lu5wD25MYFAAPqGNHvJ1WkwkERI0jop1ra7FSCMsc8tG/dVLQDRPayj8iapE?=
 =?us-ascii?Q?OKz2fvZHghTNlTmdk4znGj8OcvkKSwxGNyxa/odhHUV7XIOb03B8fayxgFiU?=
 =?us-ascii?Q?8C9b0cVyR0ZWcsN8NkVxXYO3D/A0L85iR6iWh+p6QxHfFajLLQZ54p0CzwGk?=
 =?us-ascii?Q?P5JsHGiO+Vywu2N8JSu6Jh39vfMJ0+CNVruPtgK2mWha46ozXG9iyvBjNreb?=
 =?us-ascii?Q?w3sowg+HY81/miyiev8i90xMiN/iKGn7hZRSGcSYtgCpEugYRYyGTQfb9Tb4?=
 =?us-ascii?Q?QfgA5wMmZj3NzIEawB3Y+zyxQXZRq5z42WvLqQ2odZNIXEYcXv7niiJRbi+9?=
 =?us-ascii?Q?oBj7Lnl/EMbAOU8FU2H3DVgzIckpe+koAlHQFfbEvMXym29emhJDhexOlso6?=
 =?us-ascii?Q?URB01JGjpIYcYlERY0VEJixrrFHWfc1a5VvmM+fm4FhP4iFV8lS+KP7jkE9h?=
 =?us-ascii?Q?1YysgVJI+/bi3ih5AXrMVPW9TpGDyJSWpe1AjyMQY0wPVRM6nCWfBZqJZ1A5?=
 =?us-ascii?Q?mG19vI6nWkgGKxTH4U8FBHcmciU1nzKEKKa0XFNC3sb85mOGS/Bqh1IpGfJk?=
 =?us-ascii?Q?OZnmXhyl9kbUiIiv8J6WH3YKxOxhaPqE2qzu/z0uTz4Z1pQt/IMwttFLpjGt?=
 =?us-ascii?Q?UuJC/ajoeNOxLiMyk2RepTj3KRBkJ2RVuv/ipHdPCBIo5OwasyU4rAfB+lXA?=
 =?us-ascii?Q?Bhjdqp8k5Oda6SX0pbcYt22qIaOadzMe8OvF4DuffyXMKihxm2+7SJcqbETV?=
 =?us-ascii?Q?4eQjcUFCrCIShOY/gzYKZpoEsElyXIjN45BUIMCpLd4uIjP0UdP1qqYPLi3r?=
 =?us-ascii?Q?uSMO0IgXfrE2kDnDJomK3+7E17NcBTeIybMwODkXkjDwosbC4oLFv2/l1+fL?=
 =?us-ascii?Q?qRFn0SdH91sRcT3m5c5SMQsi2S73/8j887t46boX5jcKR/LuW6cYefmeElAK?=
 =?us-ascii?Q?C/z9ybFemOHrcAnVb8iUIelup0Mi2HC+8G3iuxv7d5jlUpG7LlwzLe4quVZq?=
 =?us-ascii?Q?JgU8A8HnXO8cnSgac/6Ng8wiSB2qghMDM+O1j5hsQiT9hJRL8V+y9uXGs5VF?=
 =?us-ascii?Q?DpIZXOwLrg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b98e657b-41e7-48df-68f4-08df15214420
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:07:53.2210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IKdlCWIQ/vRzNtkogSkM6BsXFqA/7jRWQSo3dB6S/Uf1S2KHnbflfbVYeROyo33lMt9Gd+EVQpQ7XZ9B7Bxmnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8349

GSP-RM runs on LIBOS, and each LIBOS task logs into a buffer that the
driver provides and names in the init argument array. The r000 firmware
runs LIBOS3, which has six logging tasks, and LIBOS3 also expects one
more page, the state monitor buffer, in which GSP-RM reports its own
state.

Nova-core allocated log buffers for three of the six tasks, and no state
monitor buffer.

Allocate the three missing log buffers and the state monitor buffer,
name every log buffer in the init argument array, and give each new log
a debugfs file next to the existing ones. The switch to r000 passes the
state monitor buffer to GSP-RM.

Assisted-by: LLM
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs | 129 ++++++++++++++++++++++++++---------
 1 file changed, 98 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 90b4c3380f11..a8aec431b0b1 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -80,7 +80,6 @@ pub(crate) fn dev(&self) -> &'gpu device::Device<device::Bound> {
 
 /// Number of GSP pages to use in a RM log buffer.
 const RM_LOG_BUFFER_NUM_PAGES: usize = 0x10;
-const LOG_BUFFER_SIZE: usize = RM_LOG_BUFFER_NUM_PAGES * GSP_PAGE_SIZE;
 
 /// Array of page table entries, as understood by the GSP bootloader.
 #[repr(C)]
@@ -116,9 +115,19 @@ fn init(view: CoherentView<'_, Self>, start: DmaAddress) -> Result<()> {
 /// then pp points to index into the buffer where the next logging entry will
 /// be written. Therefore, the logging data is valid if:
 ///   1 <= pp < sizeof(buffer)/sizeof(u64)
-struct LogBuffer<'a>(Coherent<'a, [u8; LOG_BUFFER_SIZE]>);
+struct LogBuffer<'a, const NUM_PAGES: usize>(Coherent<'a, [[u8; GSP_PAGE_SIZE]; NUM_PAGES]>);
 
-impl<'a> LogBuffer<'a> {
+/// A log buffer at the default size, [`RM_LOG_BUFFER_NUM_PAGES`] pages.
+///
+/// Matches the registry defaults for the init, interrupt, RM and MNOC tasks
+/// (`NV_REG_STR_RM_GSP_LOG_BUFFER_SIZE_TASK_*_DEFAULT`).
+type TaskLogBuffer<'a> = LogBuffer<'a, RM_LOG_BUFFER_NUM_PAGES>;
+
+/// A single-page log buffer, the size of the logs of the root task and of the RM state monitor
+/// task.
+type SmallLogBuffer<'a> = LogBuffer<'a, 1>;
+
+impl<'a, const NUM_PAGES: usize> LogBuffer<'a, NUM_PAGES> {
     /// Creates a new `LogBuffer` mapped on `dev`.
     fn new(dev: &'a device::Device<device::Bound>) -> Result<Self> {
         let obj = Self(Coherent::zeroed(dev, GFP_KERNEL)?);
@@ -127,22 +136,90 @@ fn new(dev: &'a device::Device<device::Bound>) -> Result<Self> {
 
         let pte_view = io_project!(
             obj.0,
-            [build: size_of::<u64>()..][build: ..RM_LOG_BUFFER_NUM_PAGES * size_of::<u64>()]
+            [build: 0][build: size_of::<u64>()..][build: ..NUM_PAGES * size_of::<u64>()]
         )
-        .try_cast::<PteArray<RM_LOG_BUFFER_NUM_PAGES>>()?;
+        .try_cast::<PteArray<NUM_PAGES>>()?;
         PteArray::init(pte_view, start_addr)?;
 
         Ok(obj)
     }
 }
 
+/// The log buffers to which GSP-RM writes its debug output, one per LIBOS3 task.
 struct LogBuffers<'a> {
-    /// Init log buffer.
-    loginit: LogBuffer<'a>,
-    /// Interrupts log buffer.
-    logintr: LogBuffer<'a>,
-    /// RM log buffer.
-    logrm: LogBuffer<'a>,
+    /// Init task.
+    loginit: TaskLogBuffer<'a>,
+    /// Interrupt task.
+    logintr: TaskLogBuffer<'a>,
+    /// RM task.
+    logrm: TaskLogBuffer<'a>,
+    /// MNOC task.
+    logmnoc: TaskLogBuffer<'a>,
+    /// Root task.
+    logroot: SmallLogBuffer<'a>,
+    /// RM state monitor task.
+    logrmon: SmallLogBuffer<'a>,
+}
+
+impl<'a> LogBuffers<'a> {
+    /// Number of log buffers.
+    const COUNT: usize = 6;
+
+    /// Allocates the six log buffers, mapped on `dev`.
+    fn new(dev: &'a device::Device<device::Bound>) -> Result<Self> {
+        Ok(Self {
+            loginit: TaskLogBuffer::new(dev)?,
+            logintr: TaskLogBuffer::new(dev)?,
+            logrm: TaskLogBuffer::new(dev)?,
+            logmnoc: TaskLogBuffer::new(dev)?,
+            logroot: SmallLogBuffer::new(dev)?,
+            logrmon: SmallLogBuffer::new(dev)?,
+        })
+    }
+
+    /// Fills the first [`Self::COUNT`] entries of `libos` with the log buffers, under the names
+    /// that GSP-RM looks them up by.
+    fn init_arguments(
+        &self,
+        libos: &mut CoherentBox<'_, [LibosMemoryRegionInitArgument]>,
+    ) -> Result {
+        libos.init_at(
+            0,
+            LibosMemoryRegionInitArgument::new("LOGINIT", &self.loginit.0),
+        )?;
+        libos.init_at(
+            1,
+            LibosMemoryRegionInitArgument::new("LOGINTR", &self.logintr.0),
+        )?;
+        libos.init_at(
+            2,
+            LibosMemoryRegionInitArgument::new("LOGRM", &self.logrm.0),
+        )?;
+        libos.init_at(
+            3,
+            LibosMemoryRegionInitArgument::new("LOGMNOC", &self.logmnoc.0),
+        )?;
+        libos.init_at(
+            4,
+            LibosMemoryRegionInitArgument::new("LOGROOT", &self.logroot.0),
+        )?;
+        libos.init_at(
+            5,
+            LibosMemoryRegionInitArgument::new("LOGRMON", &self.logrmon.0),
+        )?;
+
+        Ok(())
+    }
+
+    /// Exposes each log buffer as a binary file in `dir`, under the lowercase form of its name.
+    fn register_debugfs<'data>(&'data self, dir: &debugfs::ScopedDir<'data, '_>) {
+        dir.read_binary_file(c"loginit", &self.loginit.0);
+        dir.read_binary_file(c"logintr", &self.logintr.0);
+        dir.read_binary_file(c"logrm", &self.logrm.0);
+        dir.read_binary_file(c"logmnoc", &self.logmnoc.0);
+        dir.read_binary_file(c"logroot", &self.logroot.0);
+        dir.read_binary_file(c"logrmon", &self.logrmon.0);
+    }
 }
 
 /// GSP runtime data.
@@ -158,6 +235,8 @@ pub(crate) struct Gsp<'gsp> {
     pub(crate) cmdq: Cmdq<'gsp>,
     /// RM arguments.
     rmargs: Coherent<'gsp, GspArgumentsPadded>,
+    /// Buffer in which GSP-RM reports its own state.
+    rm_state_monitor: Coherent<'gsp, [u8; GSP_PAGE_SIZE]>,
 }
 
 impl<'gsp> Gsp<'gsp> {
@@ -168,17 +247,12 @@ pub(crate) fn new(
     ) -> impl PinInit<Self, Error> + 'gsp {
         pin_init::pin_init_scope(move || {
             let dev = pdev.as_ref();
+            let log_buffers = LogBuffers::new(dev)?;
 
-            let loginit = LogBuffer::new(dev)?;
-            let logintr = LogBuffer::new(dev)?;
-            let logrm = LogBuffer::new(dev)?;
-
-            // Initialise the logging structures. The OpenRM equivalents are in:
-            // _kgspInitLibosLoggingStructures (allocates memory for buffers)
-            // kgspSetupLibosInitArgs_IMPL (creates pLibosInitArgs[] array)
             Ok(try_pin_init!(Self {
                 cmdq <- Cmdq::new(dev, bar),
                 rmargs: Coherent::init(dev, GFP_KERNEL, GspArgumentsPadded::new(&cmdq))?,
+                rm_state_monitor: Coherent::zeroed(dev, GFP_KERNEL)?,
                 libos: {
                     let mut libos = CoherentBox::zeroed_slice(
                         dev,
@@ -186,20 +260,15 @@ pub(crate) fn new(
                         GFP_KERNEL,
                     )?;
 
-                    libos.init_at(0, LibosMemoryRegionInitArgument::new("LOGINIT", &loginit.0))?;
-                    libos.init_at(1, LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0))?;
-                    libos.init_at(2, LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0))?;
-                    libos.init_at(3, LibosMemoryRegionInitArgument::new("RMARGS", rmargs))?;
+                    log_buffers.init_arguments(&mut libos)?;
+                    libos.init_at(
+                        LogBuffers::COUNT,
+                        LibosMemoryRegionInitArgument::new("RMARGS", rmargs),
+                    )?;
 
                     libos.into()
                 },
                 logs <- {
-                    let log_buffers = LogBuffers {
-                        loginit,
-                        logintr,
-                        logrm,
-                    };
-
                     #[allow(static_mut_refs)]
                     // SAFETY: `DEBUGFS_ROOT` is created before driver registration and cleared
                     // after driver unregistration, so no probe() can race with its modification.
@@ -211,9 +280,7 @@ pub(crate) fn new(
                         .expect("DEBUGFS_ROOT not initialized");
 
                     log_parent.scope(log_buffers, dev.name(), |logs, dir| {
-                        dir.read_binary_file(c"loginit", &logs.loginit.0);
-                        dir.read_binary_file(c"logintr", &logs.logintr.0);
-                        dir.read_binary_file(c"logrm", &logs.logrm.0);
+                        logs.register_debugfs(dir)
                     })
                 },
             }))
-- 
2.55.0

