Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010005.outbound.protection.outlook.com [52.101.46.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A539F39792C
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 01:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693699; cv=fail; b=UXCrIzYPZmuy3J8Yq9xk3VivVI6C6HwyUP8GIjz0UQeP+ntfpUk1IeNC2tkp4Gve7857jzcMirts6lLpiNDt9k8StSZnEw0JwlINlUNzGrcWi8EYbyttNY3PbfQpvsZP10LCcymzGe+Ry8YntQH48LEsyo3sBSFVNlyIDVhCHQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693699; c=relaxed/simple;
	bh=9MiImp9GsATsK1F14NbXhsMwkr4iNJvW/PZdQPUtaqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IanXrNFJHDALwa61nLRqiMq+ZGoV6h1FxjaZAKeoCOJbaZe6ywqWK46yL3R/hEVSG0KtAawTaqeOClSDHigtfaD2kiKBQVh4ng8MxrJQd7CwtkxN+aYHcmZQW+fzwa3V3Ch1ux5yILLZ1jITelBSzyt4lV8+3Bwx1ZMaKvJkiBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mIoppwZp; arc=fail smtp.client-ip=52.101.46.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mIoppwZp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l64vd6uQFpQceLGu88XCzoj0pprPW0Y6oBn4pQUOkL/XfCnW9flMwNdiu+zacnv3POlWOEfZJq/Nqro3n0HJBp9e9r8Xd0vz/9MyOojoOW5m3bk+aO6Sh8ZBLLxhJyLgDiULRxQasp6hHRZnZqr80xfoWSYLrPQO0ifPpzc1DMk2J7SQRcMinA5TwgI14tp+0pIMOZUxqOgELJQIsPjh/xcc/Kupuf+irC8dmNkqbYgEJZmAwYtDFG9tjlBnG21TkS6Yk1Qpe/29A6j+1keJwvQtwODDJOkjm4IeUvTmLRMB65pVEFALDjvh5JcyOpkVNKdqaCSUc5rJs0xFKvruvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZSoa8LPMjCI1keFj+PyNL5C/EAIvh3bmPLVUx71Ognc=;
 b=TU3yUz/WqggEEC2zmz2jJkROlzQUtzEC1v7mN5SspYe+UeJjxYsrRuKNQnKd75li5uU52CXrGukxM5/Rv5xd3Q1Bgyt+T7juHsCLpWdi/tU8LpVfE41CMhERDsgWarIy6VziclOz54h5ACD8rIgpzCkuCIzy571VUSyz9TuYB9k2JJ/nwNJFCR5fkM6vArDuBO5I6HCgplET0kI2bXIoDecmx74dNBuInhsIGBWq3/M9/Y00ynzoHkBKWaypoFvepjHK7DlNz6PvTYsxIuX4kqnOrswD1Q9Rkl6SaJ3Lw6Z2Y9J4zJcYwMqXWTm65/EXJuF75kJO7MN30lEV2SWTqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZSoa8LPMjCI1keFj+PyNL5C/EAIvh3bmPLVUx71Ognc=;
 b=mIoppwZpDZacq4DeSfnJERZk4ZPuFAbFz8A1GHWkpsMNleH6IUDKrBF4ZhxJbznN13QsxaUMynQ9+1ceXeWF6Ca/KWon5ccGWdwMiffM+tWRq0+vDwsSWgiohRdxtOEIQA6NPo0dmBVkyPd5whCZjUxbiiTCaFo5LILjiwYA/TsUn8+AL06I+hhC/2MVicI6wI8+cExmsWjVSPhm7g8PNJmKmhEOHGNa7qPgR4VpbfO0vfRBjOf2D8nthJOUCjb3BxehiXpf7hls5B7ePBj8HDN+qpjkc5d0n3lWEnZuHUlFFr0Mt9oXnqji7jMXgiKpMn7AWiHVK6znImfua0BcFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA0PR12MB8349.namprd12.prod.outlook.com (2603:10b6:208:407::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 01:07:49 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 01:07:48 +0000
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
Subject: [PATCH v3 19/33] gpu: nova-core: gsp: rename the static configuration type
Date: Thu, 17 Sep 2026 18:07:05 -0700
Message-ID: <20260918010719.1176945-20-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918010719.1176945-1-jhubbard@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0034.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::9) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA0PR12MB8349:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f5a422b-12e0-4039-a103-08df15214170
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|18002099003|22082099003|56012099006|3023799007|11063799006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	0tZqWbs92AazVOCUzjkDDDdW7ehwql9p7TIv5sr2JCdui3SWzfMj7oiqMzL5ec3DPK1SnY7FST0mSFNDY/LbRDuZoVkwJPxebqpbdr6wLZEWcGF10FNXAgMRObq037590RAzhwQKOnvfL0ZwZ8XluL8GwQzW4//YcII4fcGygjLrOFKVgkl9Sbl/kxUu9/+iyw7D4Sni5pg7/A3ulNGhmp2opCTWfSsmN1nq20/+jYRhti7fPkA4V8B722BS8kKrfID6rIgb89GXUgntxQYUEkUxeNoNg8CSV1PmxPe6eVVvoMs1VMd5CK4au4zNGW43JHBfinGVInStcudC5AlUJa2Yfoox27HipAIyds8Bp052CJzgzgFxfQgjiI8ogpyHHhXC1Lx64rZe13sxm6HEDCpi66FMxIube0d87FuqtzcseUTBuy0yTeATQLeinS+3U/cArYEr0w6JlO0ziwS0cB7SiBxkLtIespG4xXn59NZiSMO659jf99oMaUvrQ5gCpZrcnwuJZQqxGycOKCP9G+0JhKqHs0ce+7MkdSMI1/VcZy+kHhUJ/q05MtRhdon3Ipci02nkc+28iQmlyPnz9vqnFtbn1I4lKwma9xOMK8AyKfqf2Y2DHIGWOYUZ88LDZTlGLJcDHrXggMAIchz3r05Ge68ad0dExWBi6bqsZtU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(18002099003)(22082099003)(56012099006)(3023799007)(11063799006)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?h/l5rhp6CsZJycAcG5FzQcDrQD8MONbz0sCxj+JsNj++/O7Sr5iE8DCfG7yL?=
 =?us-ascii?Q?2eo1AsMA/lsEbTxmOMf7g/WOfsx62d3POpxDAwhIKHLH8C/OFVHiTwRa0ouq?=
 =?us-ascii?Q?LFPLCgtj+dOLvxdpVvcS+thfWe68JWpmR4JqqtMZYkMHQiOxp9cFznF1i9LK?=
 =?us-ascii?Q?uBARBkzjGQlJB1s12S9iR+5wo080bdTEfER7uU1Sg+SiJrYXPizbQgsLQVZU?=
 =?us-ascii?Q?rNCBZhAuCQqgtC+MbvGLWoIvYyyGVUZg/pVAlQBXI7+zks3/lPsNVUCxksik?=
 =?us-ascii?Q?LqMv7NtIdqB0+KXU87CCOf7lHCH4ivMLZc5oHYrHjAwr94SO7oAGYMACOq5B?=
 =?us-ascii?Q?xc3iI4kJg3IH+C5aF4FCylHaS+LdBN7ZNFVwF3hoRRyk2eBNamCJlpdkpiUB?=
 =?us-ascii?Q?XrHdRo3YM9DPScpQKRNX/K9xAUe55SmjMQh5dAHLr1bk/UPI5hvXtbOq/Vwb?=
 =?us-ascii?Q?5mw3LDpIqtAShfdEzppiEbbNT22gSA0GoJW0fnxVsHbfMWaFHJ/B8bKYB91B?=
 =?us-ascii?Q?GUhQjHvhiUirszVcae5Xca2DT4jyrmoczVap3dIkY61GxkHVCBRxSdFctsXf?=
 =?us-ascii?Q?9qcyd5jp6gbQ1UOVz6VOgUN19I+mejNCSTjprbWgaJFOJ5Dg9lWWEasOyK7H?=
 =?us-ascii?Q?WvDxUzY9hZw+Q3fBCj495NdDnaXsE98ErGbFvEttjFQ2Pb+H2oMJWf7AxOIg?=
 =?us-ascii?Q?QU/bSOTREBM4aHyqWogl7zSx32kX5QIJ9/wX1hf/2LUTo4h7VyCG2kD48S8I?=
 =?us-ascii?Q?6EUue2WY2xanu6obuYNQqmKeLuCJuualD9NUC9IwWbvoH2zR9HGhrD1PHdxx?=
 =?us-ascii?Q?QzCnedaD4ovHd7CzM15D1NGzdRFeBG+7Ld0FLzWQcLFSEWbhXkyosae7skXE?=
 =?us-ascii?Q?UOLcPMOd237kTSWiHMi0LGk1eJqurW88tuSJDKW1P8aK464/ilPZHnALS6oW?=
 =?us-ascii?Q?vpYwt3xllPd6aOVkSyP3WUq93ZrUYHfjtBFajHNnOnOGiO4XFH0bG3sgvGUj?=
 =?us-ascii?Q?z4uJ5ZG/9IUo7iszXO7SVrjR/GicaCMdM05uUlhyQ87DldY8am+pnV/QGjU1?=
 =?us-ascii?Q?tUEQNybj5CMbCUQKNHxss+3eZleLQ7xJrTyQI5ume6c01bdbyvLAH+f0yPYf?=
 =?us-ascii?Q?hxoRp2K7St/dQNVWYjGEPU7gVEztAqFNfeOa/zYTTK7CRbVYF+KMc24k0EUT?=
 =?us-ascii?Q?bB/5fDogh7e7OzLmJlttUc26vdOZwXlxyvum3aBdNsbUUyO/2XsEZjk6ChQf?=
 =?us-ascii?Q?BJWwVctPfFp95e7RFYv+i1j2Vx0f2tBjJxhbhxa3NlMiY4DcaVDDvtzg/dQt?=
 =?us-ascii?Q?IpF5hK9OdmXO9nKqRlJ7tTBupjQPAEJOiSdsXA91B538K9P5YCE8i0gWO5be?=
 =?us-ascii?Q?QrKPiuGqx3S7JxYsvhb0rHiQz67xubWZEbK5GAZoIheic6u6E0y7rd9t9fKT?=
 =?us-ascii?Q?8EI/0wLLUaHhMxOgGmRKCX84+ZouygACLqCY4hP6sqpasfhDcQBf7qkIzEk7?=
 =?us-ascii?Q?Nj4v2lPR3z6v8KY4J9ONNCFCutEZ4D3901Yz7Su0SGzkQplSP2TlZcGqJdpg?=
 =?us-ascii?Q?1gBiIAJ5+yyDfnFkI7V9YscDnBFQ1upxpwhjeoG3ajD9GBrqZVExeoBupX+9?=
 =?us-ascii?Q?GPZMxlw0jXHvy9gjq5PzKyvxdRPb6oa9MCqa+jdD+zThd6IuJ97hIAUz9PcF?=
 =?us-ascii?Q?6u6JVgt4Pz/4H9EK4aTront/juAB9ty/vc3twQF80pVBBHJWEBF5deBo887u?=
 =?us-ascii?Q?Uf/nbSTKcg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f5a422b-12e0-4039-a103-08df15214170
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:07:48.7019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P3TueNLDDXmsQC4k7k8weMELXhExFDTVW4FlYA6sGl4fEDjds0bMUPtTii2zb1W+YJeT+/0kMSN71ERBYgvmAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8349

The following patches fill the type that holds GSP-RM's static GPU
configuration from the r000 GSP_INIT reply, where no command fetches
the configuration.

The type was named after the r570 command that fetched it.

Name the type after its contents.

No functional changes.

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs          |  4 ++--
 drivers/gpu/nova-core/gsp.rs          |  2 +-
 drivers/gpu/nova-core/gsp/commands.rs | 12 ++++++------
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 9e0570e97cfe..e7f1458330b4 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -34,7 +34,7 @@
     fsp::Fsp,
     gsp::{
         self,
-        commands::GetGspStaticInfoReply,
+        commands::GspStaticInfo,
         Gsp,
         GspBootContext, //
     },
@@ -314,7 +314,7 @@ pub(crate) struct Gpu<'gpu> {
     #[pin]
     _gsp_irq: GspIrq<'gpu>,
     /// Static GPU information as provided by the GSP.
-    gsp_static_info: GetGspStaticInfoReply,
+    gsp_static_info: GspStaticInfo,
     /// GPU memory manager owning memory management resources.
     ///
     /// Must be kept declared *before* `gsp_resources`, so that its components are dropped while
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index c9b7498639b7..6e7a057188c5 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -221,7 +221,7 @@ pub(crate) fn new(
     }
 
     /// Query the GSP for the static GPU information.
-    pub(crate) fn get_static_info(&self) -> Result<commands::GetGspStaticInfoReply> {
+    pub(crate) fn get_static_info(&self) -> Result<commands::GspStaticInfo> {
         self.cmdq.send_command(commands::GetGspStaticInfo)
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index a01ab14299c6..b3b28e397ebd 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -197,7 +197,7 @@ pub(crate) fn wait_gsp_init_done(cmdq: &Cmdq<'_>) -> Result {
 impl CommandToGsp for GetGspStaticInfo {
     const FUNCTION: MsgFunction = MsgFunction::GetGspStaticInfo;
     type Command = fw::commands::GspStaticConfigInfo;
-    type Reply = GetGspStaticInfoReply;
+    type Reply = GspStaticInfo;
     type InitError = Infallible;
 
     fn init(&self) -> impl Init<Self::Command, Self::InitError> {
@@ -206,7 +206,7 @@ fn init(&self) -> impl Init<Self::Command, Self::InitError> {
 }
 
 /// The reply from the GSP to the [`GetGspStaticInfo`] command.
-pub(crate) struct GetGspStaticInfoReply {
+pub(crate) struct GspStaticInfo {
     gpu_name: [u8; 64],
     /// BAR1 Page Directory Entry base address.
     pub(crate) bar1_pde_base: u64,
@@ -216,7 +216,7 @@ pub(crate) struct GetGspStaticInfoReply {
     pub(crate) total_fb_end: u64,
 }
 
-impl MessageFromGsp for GetGspStaticInfoReply {
+impl MessageFromGsp for GspStaticInfo {
     const FUNCTION: MsgFunction = MsgFunction::GetGspStaticInfo;
     type Message = fw::commands::GspStaticConfigInfo;
     type InitError = Error;
@@ -231,7 +231,7 @@ fn read(
         }
         let total_fb_end = msg.total_fb_end().ok_or(EINVAL)?;
 
-        Ok(GetGspStaticInfoReply {
+        Ok(GspStaticInfo {
             gpu_name: msg.gpu_name_str(),
             bar1_pde_base: msg.bar1_pde_base(),
             usable_fb_regions,
@@ -240,7 +240,7 @@ fn read(
     }
 }
 
-/// Error type for [`GetGspStaticInfoReply::gpu_name`].
+/// Error type for [`GspStaticInfo::gpu_name`].
 #[derive(Debug)]
 pub(crate) enum GpuNameError {
     /// The GPU name string does not contain a null terminator.
@@ -251,7 +251,7 @@ pub(crate) enum GpuNameError {
     InvalidUtf8(Utf8Error),
 }
 
-impl GetGspStaticInfoReply {
+impl GspStaticInfo {
     /// Returns the name of the GPU as a string.
     ///
     /// Returns an error if the string given by the GSP does not contain a null terminator or
-- 
2.55.0

