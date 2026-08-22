Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011055.outbound.protection.outlook.com [52.101.57.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E322E313523
	for <nova-gpu@lists.linux.dev>; Sat, 22 Aug 2026 01:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787363768; cv=fail; b=nTzY1+2uJ5j5J1NRm5yTMpVgCwqtD2Brdwu+GNc6/RfflhxD8dc644GMRqb1nIF6g+Bdr8ovB+aGVV6jWJJ3Os2+dwJ/4cRsgTpQ2IuA5h1xa4I00GgnTRLAh/bSXo5jQC359JK01y4yTTYYYOgowkmV+twZkynso7WsokHHd2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787363768; c=relaxed/simple;
	bh=V0qcdup9V+S+Jrv6ZOQE1DYVwFYtZzwoXL/rSjdij58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ho/Ec9kkVzHQyGdQypK/muk6PLaEoQwE5exGlIXcYoGzJti2tPVS2MouIaffNnIOzZhEYviorfWS6Kgbtzr5oenFHahweafoIc0Iimlb5t/C8y4O4BqYZaZdVfFjKWqm28wvYlbCH21fRtnJst9mcePy1s3O5AvbQgVn48BlMEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=slkCuE+t; arc=fail smtp.client-ip=52.101.57.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="slkCuE+t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gTuuZFerOm8qC2W6G5lNPo/EaMwGSqtWIEA7BVn+jOwAm6R+iDdTEFadRvp/EvFZXFdwyq35VDtt9U1E1s0xqkMTlBMiOnVVmWl1LNuDq4yJhragWPqoIC69tiZQnvpvMXMj+gQ+mr0+bglXi/xpNrmFoUhQNqaJBeE4V/BEFR7h1YQqKRrLgEh3C1oH5yriMotHz7LKY3gvNqIJnYlSPfvNyqqDvutdmjL59NJKxr7+R8aiwjn6pvNiebj0cgdKdXnNvhuXxWNGRDo7r+oaIwuxK7et5dq3rJGbKHnPWyIHpH3aDSQjgJL61jwxPQd3Q1P8AZPnhOQK8ktIjoLxxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCm0BY9QYU4VVPwiGL8RLGyGzsp534vTGcas6v6NP+8=;
 b=oDm/7Bp83eT3CDJCFBDwa8JgGNp0SaSxCxDpGAlgoOMmQ3/pZxlejAeaV9d62PumRnU5gxTHmyY6lgUIFEys8yrqDxk+5bmB7wtskOtLEe0eCBS5r1F8CUY00e1ornEyrJpREEcMoh0YJPPRXX63QHsrB9Lu01HdK87QgykgUhP0j6x+YDMRZXfbydTLq984wpa7+XetS2hFnIr3G3f+VK2SqG1QmaiMJu5CTX/vXujAmhVJk5xUPgoQ7dla5kV5oN2JUMt3XDQTE0KyPVgTp3cXqefWUHfdglp3eBjNZcISH/P3fAEbF0YvLEFM8L9NGUSprKsc1rwnrqTBJzf6YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KCm0BY9QYU4VVPwiGL8RLGyGzsp534vTGcas6v6NP+8=;
 b=slkCuE+t7gHvN3mkekG4Lb7PjkEfDW30D3IqJwxQCT1c00Dj3igR3ECGGCktPAfVquYkfeE1Bc1TP9lylVDIVq+jfygoxPaP/LGrfhGWnfp5PbNMZwvLV1h+K6uvxj8h7DehTcwO+yM55bNDIy7I1MTvddSjE9rW+kvLUgbEjTXqQx3UD+g5HhvnFoY8+4xGv1fYb7yU9ThA2kU/ZMkFvC5BJHjXRIqEMI6YA0lrO4lZrAqwPmsSuwafPATuQj1XC8N7un8V8ig2wWZA1m8BYY33jxK42MJPgCstC5hQAw1A83mo7ITNJc1mJ0juj67LRG30gKvac0gGH62Ahn8Jhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB6603.namprd12.prod.outlook.com (2603:10b6:208:3a1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Sat, 22 Aug
 2026 01:55:56 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.010; Sat, 22 Aug 2026
 01:55:56 +0000
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
Subject: [PATCH v2 20/31] gpu: nova-core: handle the r000 load-and-execute HS binary event
Date: Fri, 21 Aug 2026 18:54:37 -0700
Message-ID: <20260822015448.238214-21-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822015448.238214-1-jhubbard@nvidia.com>
References: <20260822015448.238214-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::16) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f4c5eaf-7d2f-4d2d-060c-08defff08133
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|366016|376014|1800799024|6133799003|10067099003|56012099006|11063799006|5023799004|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Vrw8QoAw4RqtoNIZzDaed72XdeKimXGmim4qBsqTRduPHT5hBybfeFHNEjKBLMuunt/cZ6mSsl2Y3ET6DbhIgj3jP5iaschg+oPZM9vy3dRHipNJJz0Zr9s1kTA40K0cW4AHTKC86P9DIQNkno6JP0/LWRIXNwr7R+JE2ASeUENxKui4MS9TvZ6wR1qa1pm5wirbd92iTItfR1pIfdgMooeWGYfhAWVDhoeZkrearMM298kyP/zWRJbhPrEzoqhTGU5bK8b948x5CO+NCDwALXKTaGU43eUiwcu7iNVBj4+8asbtuhPbtedGl7EkLeGYd8KFjfAn62MbkgTlNFus8EJq5Dg6f7+Sj4vsiDHLYC82y9tXR2WxBNK3v8S1b/hvpL7ZgLDrKsB/LQei7hrgCW1z7eZ9B3OXoiw7n9uFvKBhI0P8AFCDz7Sc/CBwadV76uD5rov/I+rfTvO2haSSPeeKzf+JgZDD/koIu3xY0r6NNUZWHRu49J/pSKJ6T6qWQeTFtZAdzen8qbBFL6zDU7w6mUdWGxT4xim4qp8G9aqmqh2c1CrAO23n0d+fTX9B5mpc7TTuqlfqGKIvcCU3hurjbablVeMqlsHyJn3YGd7SWonYVd3atn65TNQZolAli7SLHqwdSe+Q699kASgpiqPoB5eMXHigkDbnRm9y21s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(366016)(376014)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(5023799004)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Kn5AwWU6QEg+P0yqAFouXFWG63T7WZJiZPDhqWE7N4yV06gqUaya1SjyDvP6?=
 =?us-ascii?Q?VBJe2Q2YLJp9OYP6nc1iEjl2cIu/hoZveBlYv9u71/0MtD4WAsL7K0DerB6a?=
 =?us-ascii?Q?XcZx5Nx4b6udrDUW1ZDdlNfAyrebuoRaL2pm98HijIaC5vOcErk0kFaAw4IC?=
 =?us-ascii?Q?U9RJkeDhL7PIerjHLRQc+HM2zEIqmuvPHEjXB5h+x+I4bDej0uurGRzx+bBX?=
 =?us-ascii?Q?8a/brUqfQBzwDMGDzIQ7g0stIZcKDS/biUmB471ZNFxHLPvjWaY/1wSWICUH?=
 =?us-ascii?Q?uxR3cuPM4bjpUzICu0hvb7J/kRNM+NzLBvubgdbJWDcR5Mn0pWUwrQVwp4tm?=
 =?us-ascii?Q?z6p14A0th1ZQe2xHaCHi6HKVJtvZs6nYSRF6tLIn1/gsQ+fTrEo0sS7g49nT?=
 =?us-ascii?Q?G0Um68BMTU+fQ+QcYXqp7LlJZzFoRIecKgJ0nZ+vdj5w5yC899Y8fFhhMr9M?=
 =?us-ascii?Q?CLz/geypwWPPm7khQ8OnlSIhvVp0qprgB3IOimOHi8LQbc6XwMFGMf6MBhwy?=
 =?us-ascii?Q?+/qz9LhdlbW7zWyZlnMlRL/8NciW/M4FyBDrVmxt0gamVYwq1m5hS8mXKzv9?=
 =?us-ascii?Q?9b4sdWVFiBTsF78n/9xcMRf/+nVMZzKFe+8lSnI8tvQBk65SYtuuvJflz8GC?=
 =?us-ascii?Q?iphPNSnT8B2sq6RyFvEpKy6+I7XvEF8tXiJAv9/aeJlE8E9dlEUZJw5PZelu?=
 =?us-ascii?Q?x3A3gzty+F+S2iKS82eEfGeZhMjjcLzrSxDnchLuZEsgtrYqQp9IOdbbo1XU?=
 =?us-ascii?Q?lcH9tr/sF13tK38i2xjUJhrVeED0PTcT4CJi5yRPoyO6yRiD4sjBfcpt7rpa?=
 =?us-ascii?Q?GIWqHhvOpKYRDdJsaIRTTcMtlZEJrGobw48ZQhWbu6KzLQtkmpDl+0Ej2qAe?=
 =?us-ascii?Q?fZstMLR2ynpKsrgmZz/IwEQS6JY2cwQL2ubRypI8qHNmX9Pd0LVfjHFgbN4Z?=
 =?us-ascii?Q?S55Z2L20tukMMAGISCyaL9H/Wg6HncIhGnUJ85vpRdnVgmnGFMwdw8aX7E/v?=
 =?us-ascii?Q?QoXzs572NbJQgfqPSJbs1XOlD9I0xACfQPNNi1lpPnWJ0WkLuSEhO3gtQbBs?=
 =?us-ascii?Q?T6b7DV5g5lQiXhTMotH/PimEo5acnkRCkSIZjbLFnWGvZMNvMMtsLv/l692V?=
 =?us-ascii?Q?C5p0N+eaP3YUMBiN6xmUOa0bu/5CYspvvwhSzZcrtWedaqJnwDRvgG8o7ZGW?=
 =?us-ascii?Q?7IOgOPrDkipuDxAKrSVv5R/LTnSpyLlQ2vFfRGZxRzNZOxeo9ecczCJKXVW+?=
 =?us-ascii?Q?YcEFdzHsnkA6d43WTfYopeAfXe6+QhfKij9VbInnoRBhqgylQrxyBZU0+Ufz?=
 =?us-ascii?Q?zbMaESzqJH5KKWfNrc6w3y4PAdeJDmw7cFWscTziIyreUlI4l9tkjkl+Ma6u?=
 =?us-ascii?Q?WRCXb5CnaviL+yiQBGjAJtTggJ4a9po8kgMy+rW1XW9fOzdnFD8AKED9QT+G?=
 =?us-ascii?Q?gTZZf4rrXZ7ckOw8p6l599IO7Wtk9y7k1zKLO89bu5Unpwz8v5HCJODNFMuf?=
 =?us-ascii?Q?alrtfhklqaOlWEPnB83WVcr/oXH8DJieLh/jImMXZTFt4UQRmsCOrRxuNgvm?=
 =?us-ascii?Q?oLrLYTflmCRAxW5z2dAL6MH2JNGh2J/69GqlsQS5erPqsYtRGCeURyznJH49?=
 =?us-ascii?Q?u82VfZscN1qeBtVdNdZzymKe8vgEOoOVypIEPCNXB4LNc9nOZ7roVHN6I16b?=
 =?us-ascii?Q?jeE86MhaCgR9OnWvbiuKCFMQMJlDiFqT8oB0uTKwpzjrAG7cY1ls03Ua9f3A?=
 =?us-ascii?Q?DzieB/+QDw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f4c5eaf-7d2f-4d2d-060c-08defff08133
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 01:55:55.9627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ilVUuvh5LT3as/H2aOoJp1a/+VVulPVKYK8EjkLWGyn24ffxbTDCTsE81UvFDqCDJ1SuBRwcIKTOV3rk3WWyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6603

The r000 GSP boot protocol asks the driver to run a high-security binary
on the GSP falcon, and sends the framebuffer addresses of its code and
data in the event payload.

Nova-core has no handler for that event. It also has no way to restart
GSP-RM afterwards, which every load-and-execute event needs.

Add the handler. It DMAs the image into falcon memory, programs the BROM
registers that make the falcon verify the PKC signature, runs the binary,
and resumes GSP-RM. The aperture it loads through is context DMA slot 0,
set to local framebuffer, physical addressing and the BAR2 function 0
engine ID. Write FLCN_ERR_BINARY_NOT_STARTED to MAILBOX0 before
starting, which Open RM does so a binary that never runs is
distinguishable from one that succeeded, and which also clears the
suspend bit the next event polls.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs   |  18 ++-
 drivers/gpu/nova-core/gsp/boot.rs | 229 +++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs     |   2 +
 3 files changed, 244 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 644703c14924..43226ce16284 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -140,7 +140,6 @@ pub(crate) enum FalconMem {
 }
 
 /// Source offset of a raw falcon DMA transfer, added to the DMA base address.
-#[expect(dead_code)]
 #[derive(Copy, Clone)]
 pub(crate) enum FalconDmaSrcOffset {
     /// Byte offset from the DMA base address.
@@ -178,6 +177,17 @@ pub(crate) enum FalconFbifMemType with From<Bounded<u32, 1>> {
     }
 }
 
+bounded_enum! {
+    /// Engine ID a falcon DMA transfer is tagged with on its way through the FBIF.
+    #[derive(Debug, Copy, Clone)]
+    pub(crate) enum FalconFbifEngineIdFlag with From<Bounded<u32, 1>> {
+        /// Function 0's BAR2 engine ID.
+        Bar2Fn0 = 0,
+        /// The falcon's own engine ID.
+        Own = 1,
+    }
+}
+
 /// Type used to represent the `PFALCON` registers address base for a given falcon engine.
 pub(crate) struct PFalconBase(());
 
@@ -637,7 +647,6 @@ fn dma_wr(
     ///   target.
     /// - `ERANGE` if `src_addr` does not fit the `DMATRFBASE` register pair.
     /// - `EOVERFLOW` if a per-block source or destination offset exceeds `u32`.
-    #[expect(dead_code)]
     pub(crate) fn raw_dma_transfer(
         &self,
         ctx_dma: u8,
@@ -785,7 +794,10 @@ pub(crate) fn wait_till_halted(&self) -> Result<()> {
     ///
     /// The RISC-V GSP signals suspension by setting bit 31 (`0x8000_0000`) in `MAILBOX0`, rather
     /// than through `CPUCTL.halted`.
-    #[expect(dead_code)]
+    ///
+    /// Nothing else clears that bit, so the caller must write `MAILBOX0` before starting the
+    /// falcon CPU. A caller that runs this twice without an intervening write sees the first
+    /// suspension both times.
     pub(crate) fn wait_for_processor_suspend(&self) -> Result<()> {
         const INTERRUPT_PROCESSOR_SUSPENDED: u32 = 0x8000_0000;
 
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index dfc5be27384a..c8cb7597e532 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -3,9 +3,15 @@
 
 use kernel::{
     bits,
-    io::poll::read_poll_timeout,
+    device,
+    io::{
+        poll::read_poll_timeout,
+        register::WithBase,
+        Io, //
+    },
     prelude::*,
     time::Delta,
+    transmute::FromBytes,
     types::ScopeGuard, //
 };
 
@@ -13,13 +19,21 @@
     driver::Bar0,
     falcon::{
         gsp::Gsp,
-        Falcon, //
+        sec2::Sec2,
+        Falcon,
+        FalconDmaSrcOffset,
+        FalconFbifEngineIdFlag,
+        FalconFbifMemType,
+        FalconFbifTarget,
+        FalconMem,
+        FalconModSelAlgo, //
     },
     firmware::gsp::GspFirmware,
     gsp::{
         cmdq::Cmdq,
         commands, //
     },
+    regs, //
 };
 
 impl super::Gsp {
@@ -86,6 +100,181 @@ pub(crate) fn boot(
         Ok(unload_guard.dismiss().1)
     }
 
+    /// Restart GSP-RM once a load-and-execute image has run to completion.
+    ///
+    /// Resets the GSP falcon into RISC-V, hands it the libos boot arguments address through its
+    /// mailboxes, and starts SEC2, which is what brings GSP-RM back up. Open RM calls this
+    /// `kgspExecuteCoreResume`.
+    ///
+    /// # Errors
+    ///
+    /// - `EIO` if SEC2 reports a failure, or if the GSP is not running RISC-V afterwards.
+    /// - `ETIMEDOUT` if SEC2 does not complete the reload in time.
+    fn core_resume(
+        gsp_falcon: &Falcon<'_, Gsp>,
+        sec2_falcon: &Falcon<'_, Sec2>,
+        dev: &device::Device,
+        bootloader_app_version: u32,
+        libos_dma_handle: u64,
+    ) -> Result {
+        gsp_falcon.reset()?;
+
+        gsp_falcon.write_mailboxes(
+            Some(libos_dma_handle as u32),
+            Some((libos_dma_handle >> 32) as u32),
+        );
+
+        sec2_falcon.start()?;
+
+        gsp_falcon
+            .check_reload_completed(Delta::from_secs(2))
+            .inspect_err(|_| {
+                let mbox0 = sec2_falcon.read_mailbox0();
+                dev_err!(
+                    dev,
+                    "Timeout waiting for SEC2 to resume GSP-RM (SEC2 mbox0={:#x})\n",
+                    mbox0
+                );
+            })?;
+
+        let sec2_mbox0 = sec2_falcon.read_mailbox0();
+        if sec2_mbox0 != 0 {
+            dev_err!(
+                dev,
+                "SEC2 reported error during core resume: {:#x}\n",
+                sec2_mbox0
+            );
+            return Err(EIO);
+        }
+
+        gsp_falcon.write_os_version(bootloader_app_version);
+
+        if !gsp_falcon.is_riscv_active() {
+            dev_err!(dev, "GSP RISC-V not active after core resume\n");
+            return Err(EIO);
+        }
+
+        Ok(())
+    }
+
+    /// Handle a `GSP_LOAD_EXEC_HS_BINARY` event.
+    ///
+    /// The GSP asks the driver to run a high-security binary that it has already placed in the
+    /// framebuffer. The driver DMAs the image into falcon memory, programs the BROM registers
+    /// that make the falcon verify its PKC signature, runs it, and resumes GSP-RM.
+    ///
+    /// # Errors
+    ///
+    /// - `EINVAL` if the payload is shorter than the parameter block, or the ucode id does not
+    ///   fit the BROM register field.
+    /// - `ETIMEDOUT` if the GSP does not suspend, or the binary does not halt, in time.
+    #[expect(dead_code)]
+    fn handle_load_exec_hs_binary(
+        payload: &[u8],
+        gsp_falcon: &Falcon<'_, Gsp>,
+        sec2_falcon: &Falcon<'_, Sec2>,
+        bar: Bar0<'_>,
+        dev: &device::Device,
+        bootloader_app_version: u32,
+        libos_dma_handle: u64,
+    ) -> Result {
+        let params = HsBinaryParams::from_bytes_prefix(payload).ok_or(EINVAL)?.0;
+
+        gsp_falcon.wait_for_processor_suspend().inspect_err(|_| {
+            dev_err!(
+                dev,
+                "Timeout waiting for GSP suspend (mbox0={:#x})\n",
+                gsp_falcon.read_mailbox0()
+            );
+        })?;
+
+        gsp_falcon.reset()?;
+
+        gsp_falcon.dma_reset();
+        bar.update(
+            regs::NV_PFALCON_FBIF_TRANSCFG::of::<Gsp>().at(usize::from(HS_BINARY_CTX_DMA)),
+            |v| {
+                v.with_target(FalconFbifTarget::LocalFb)
+                    .with_mem_type(FalconFbifMemType::Physical)
+                    .with_engine_id_flag(FalconFbifEngineIdFlag::Bar2Fn0)
+            },
+        );
+
+        if params.ucode_imem_size > 0 {
+            gsp_falcon.raw_dma_transfer(
+                HS_BINARY_CTX_DMA,
+                params.imem_phys_addr,
+                FalconMem::ImemSecure,
+                FalconDmaSrcOffset::Offset(params.ucode_imem_va),
+                params.ucode_imem_pa,
+                params.ucode_imem_size,
+            )?;
+        }
+
+        if params.ucode_dmem_size > 0 {
+            // A valid DMEM virtual address makes the engine tag each loaded block with it, which
+            // is how the binary reaches its data.
+            let src = if params.ucode_dmem_va == FLCN_DMEM_VA_INVALID {
+                FalconDmaSrcOffset::Offset(0)
+            } else {
+                FalconDmaSrcOffset::DmemVa(params.ucode_dmem_va)
+            };
+
+            gsp_falcon.raw_dma_transfer(
+                HS_BINARY_CTX_DMA,
+                params.dmem_phys_addr,
+                FalconMem::Dmem,
+                src,
+                params.ucode_dmem_pa,
+                params.ucode_dmem_size,
+            )?;
+        }
+
+        bar.write(
+            WithBase::of::<Gsp>().at(0),
+            regs::NV_PFALCON2_FALCON_BROM_PARAADDR::zeroed().with_value(params.hs_sig_dmem_addr),
+        );
+        bar.write(
+            WithBase::of::<Gsp>(),
+            regs::NV_PFALCON2_FALCON_BROM_ENGIDMASK::zeroed().with_value(params.engine_id_mask),
+        );
+        bar.write(
+            WithBase::of::<Gsp>(),
+            regs::NV_PFALCON2_FALCON_BROM_CURR_UCODE_ID::zeroed()
+                .with_ucode_id(u8::try_from(params.ucode_id).map_err(|_| EINVAL)?),
+        );
+        bar.write(
+            WithBase::of::<Gsp>(),
+            regs::NV_PFALCON2_FALCON_MOD_SEL::zeroed().with_algo(FalconModSelAlgo::Rsa3k),
+        );
+
+        // Also clears the suspend bit that `wait_for_processor_suspend` polls, so the next
+        // load-and-execute event does not read this one's suspension.
+        gsp_falcon.write_mailboxes(Some(FLCN_ERR_BINARY_NOT_STARTED), None);
+
+        bar.write(
+            WithBase::of::<Gsp>(),
+            regs::NV_PFALCON_FALCON_BOOTVEC::zeroed().with_value(params.ucode_imem_va),
+        );
+
+        gsp_falcon.start()?;
+        gsp_falcon.wait_till_halted().inspect_err(|_| {
+            dev_err!(
+                dev,
+                "Timeout waiting for HS binary to halt (mbox0={:#x})\n",
+                gsp_falcon.read_mailbox0()
+            );
+        })?;
+
+        Self::core_resume(
+            gsp_falcon,
+            sec2_falcon,
+            dev,
+            bootloader_app_version,
+            libos_dma_handle,
+        )
+    }
+
     /// Shut down the GSP and wait until it is offline.
     fn shutdown_gsp(
         cmdq: &Cmdq,
@@ -146,3 +335,39 @@ pub(crate) fn unload(
         res.inspect(|()| dev_info!(dev, "GSP successfully unloaded\n"))
     }
 }
+
+/// Value Open RM leaves in `MAILBOX0` before starting a falcon binary, so a binary that never
+/// runs is distinguishable from one that ran and returned success.
+const FLCN_ERR_BINARY_NOT_STARTED: u32 = 0xfe;
+
+/// `ucode_dmem_va` value meaning the binary has no DMEM virtual address.
+const FLCN_DMEM_VA_INVALID: u32 = 0xffff_ffff;
+
+/// Context DMA slot the HS binary is loaded through. Open RM hardcodes slot 0 for this event and
+/// points it at local framebuffer.
+const HS_BINARY_CTX_DMA: u8 = 0;
+
+/// Parameters for loading and executing an HS (High-Security) binary.
+///
+/// Sent by GSP-RM as the payload of `GSP_LOAD_EXEC_HS_BINARY`. The firmware
+/// code and data are located in framebuffer memory at the given physical addresses.
+#[repr(C)]
+#[derive(Debug, Copy, Clone)]
+struct HsBinaryParams {
+    imem_phys_addr: u64,
+    dmem_phys_addr: u64,
+    _reserved64: [u64; 2],
+    ucode_imem_va: u32,
+    ucode_imem_pa: u32,
+    ucode_imem_size: u32,
+    ucode_dmem_va: u32,
+    ucode_dmem_pa: u32,
+    ucode_dmem_size: u32,
+    hs_sig_dmem_addr: u32,
+    engine_id_mask: u32,
+    ucode_id: u32,
+    _reserved32: [u32; 3],
+}
+
+// SAFETY: This struct only contains integer types for which all bit patterns are valid.
+unsafe impl FromBytes for HsBinaryParams {}
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 5501c36a56af..a3319694ec28 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -19,6 +19,7 @@
         FalconCoreRev,
         FalconCoreRevSubversion,
         FalconEngine,
+        FalconFbifEngineIdFlag,
         FalconFbifMemType,
         FalconFbifTarget,
         FalconMem,
@@ -353,6 +354,7 @@ pub(crate) fn usable_fb_size(self) -> u64 {
     }
 
     pub(crate) NV_PFALCON_FBIF_TRANSCFG(u32)[8] @ PFalconBase + 0x00000600 {
+        16:16   engine_id_flag => FalconFbifEngineIdFlag;
         2:2     mem_type => FalconFbifMemType;
         1:0     target ?=> FalconFbifTarget;
     }
-- 
2.55.0

