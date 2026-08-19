Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010003.outbound.protection.outlook.com [52.101.46.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6B53C7692
	for <nova-gpu@lists.linux.dev>; Wed, 19 Aug 2026 03:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787111592; cv=fail; b=q6a4bIFEpoNtoo5dqay1EcSlfCoqrMg7bBa9+a2CWSjoAu1AJwPH3XdCcGmSe55e54kweeFAgyNSPRUh/7U/G00jbvQxrFnblsStlvTh47U1PlPpXAmPzFn3JX+STFJyBpocaZ1zoSEswr35ycM6RHjJGB0nczLGkZaBTy1bT9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787111592; c=relaxed/simple;
	bh=agpEqgl6DPo0wE/tz2D+APuahbBxZCczkheQLwFq29I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QYvhJwW0a8+tDKDc/2/upZoE89u9yWPvvvUqlfR/O7vfhHX66YgwNQVVZjfJJTMojVtq9V09JH6As8m6YUWtgQfdY7XGCDhE2z/pguSL+Q1Bzkrtb8tAX0xOGXE6H5IXFGZKm0NUJjdO3EmEOP/F36fAn2I06tCk/e+FlJhKaw0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sV3QeZyu; arc=fail smtp.client-ip=52.101.46.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sV3QeZyu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=apx31LBCalaqsH6E97QnnIax51e8oU/JKLgTwAXAFgqwveiZz0SnH26IClNf9RDHhuDvLb5m4o86f71vc/sohRYZYQYjrRGz6KBr6hiS4m0AeAfn5JU0rcQZffC9CZWgWXoJMhcmAOUbg1fax8gghXg8IQQBVK7WitXpk79OQEgoAJfXRVpGnVyDiwlZOFgZBLqQ0eYlYjkgh3vP/kpBuoKbHU45cSw/yueVs93acn4xkXEzE/QpYvhGv1kAzmIsYvrBP5Sxhb8otzempp/cyAmIcWjpJ59dFFhbyUMYegOwU9rQfgbvtHhuFuaEWTPr9oQux+WgOKF6+eYVFh1qTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qll5G/fhaRNI8RvM9UjjNbCW3EgEd8uFiyB/9xf7iMs=;
 b=HUXA8Jjn2J8/OiSqOJA1ctgdeHHVXWDu/6icmzojEYHQ0w4RWN8d+yyFu8xh7mhpz6jvqneR61IpaMVVdtod1a9bVaw6xNEeQhV5yrDeyfSqOHofoJdc7T4QWxrDoCWYI5tqZCBjehiX2GUeG6voXHp9dxnIjbOpxXxga7dNoZ+NqJbX4Oq1tbRgVoMOCubxCJNEH21092V/XfvXkSlgOPbY6R3WU0wz2TQfmX+LbTmCLNrrbHpI+ItSyt4EtA82PF0MU99N6TWaNAs/RHuLSJXbDFzwytoZpZRkpnVPUk9sqZbWkh+Vwy+SgilHsXB6j0/sh009LN+PDAnNkHPBpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qll5G/fhaRNI8RvM9UjjNbCW3EgEd8uFiyB/9xf7iMs=;
 b=sV3QeZyul594MiAg90e7fJNhtFcexFOTqN1eWrdvPOIuy2EH/6Ca67gJ7qeVMBIdkBXQdFuepe3hDFtEDiR2HyyXdU55n/ONsjD+Q679xlQturUl4tgEWA5QA130DxxZsaa8Cgtw+4XaZbMMH+hW6+jc9T/c4dEaiFPR+zWRKVgavCE9RZ4CBmkfGJe+B4RKzxCID73iEmGy87746dTn53V5wKEGtom/Tf9sB2dv91yxuCrPLZJhHf93FUNYs+sS8jHETYvd8drUXZNquYzOLXhXtK5TGOhhBSjnEw5/JFfGQO6FbXM4Rdr+O2oV3jPXzsCQa8PDOq8lBhD8Gum6jQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB6287.namprd12.prod.outlook.com (2603:10b6:8:94::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.17; Wed, 19 Aug 2026 03:52:45 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 03:52:45 +0000
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
Subject: [PATCH 19/27] gpu: nova-core: handle the r000 load-and-execute HS binary event
Date: Tue, 18 Aug 2026 20:52:12 -0700
Message-ID: <20260819035221.336390-20-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260819035221.336390-1-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0059.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::34) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB6287:EE_
X-MS-Office365-Filtering-Correlation-Id: 524d4ecd-c6c5-4271-0a24-08defda553ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|366016|6133799003|3023799007|56012099006|10067099003|11063799006|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	pR1LjrpPOq4oxoNR+pMhK5m2cy7f6k1xk1qiz6CX+5aco6R0vdPXz2IYwxRk/+DCZ7JQ2TbdS/T6xeCHPRBq4j6mXByRXqW5dRrENCyC+CgsZhlhCrVIjUpDFS75AmTYF+Brhl9UhEFnSj4CdXQE6zJUH1Ig3HBFiJfPx9QIwxXIGlxFcp6xwHINm/EQUdfxbbE8idfEqBS/nzeHB3uEQyklwNutIGUuIGH1vdep0ggSHXA8r6Ws/fVPT1XCrsVLFxtMTwiYUlntLtDm/DTndoxqneZ1NH0vNtWXYFaSXsHIH9n/zhyYrhDlvkR7PPl3YTw3IHY6lKyuIdmofEQePCkUff88xi80a4+orSDc/1M0qVKYHRwRuuOW9Sm/3SZWtmp+lwZdw0/BY9NYjdzAgnkGPGeyArp5/O/7TBvSn6LgIrTk3il7PVjYQEsk9CjHSz5jn1vwKmAaN9m9k81tzmqyrVba7ebCh2ysw/LjHDpEOvYyUEL+P+N8s9l3KO9seXNzxcyrAuZ0OGse9mump09NelYzLRJ6HiDkUTe1xo5wGdtOBOOZvcxqeiC2FfdlvG4Y8tXqFbA/d5Ts2FYC3IhWi03/2g3KgvbWo3IA3cxO7lNXb1hnZJnuYUmP6KnXvtVPudMwOgHr3N5r4vTAWgg3y8HnNbKNIWiGaG2FTuk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(366016)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9x4wQZ2FNqY5n4R0MILuOd0KEDINCj9Tq+g+ZEoK7ZIORgEG+68nFtMTzkr8?=
 =?us-ascii?Q?TpnVxLgixJkAyViOnIRgK86IG01C2dvZKldDqnJLuvKo5ikZ/SL8HHWps29C?=
 =?us-ascii?Q?i2Wc8Ug/gRZSCybMwtit1VhcwjatFu/lho0aVhcSKH6/DMP5PIgcfRTIaBH8?=
 =?us-ascii?Q?qgV/hwZ5Olh7gysMV20MJ/TAOXE7/YvC90riVUn1KBTF4k/lUA+ib8egHFOf?=
 =?us-ascii?Q?jo8tHr8W1jNTgSCOuXrxaocSHdwehk90ltIllQe1LimfRt90EkuTqtSI39fq?=
 =?us-ascii?Q?+6RxbUaIte/URzzNPa3nK6xKwo0fKGUpdgk/UzWjQI/UClPPih9qDrs9iyDQ?=
 =?us-ascii?Q?WDbyqL6+n8cbd+yyiZA3TWmCdBKv5xW2Yer93gPIIzyCx9G4Y8Iz9V1pGdoF?=
 =?us-ascii?Q?wV4qcwMcRyywyZOz7OwsRVlY8ize+huXWZN56KRP4QWSosapPuLxWiKebtCB?=
 =?us-ascii?Q?qiRB3NF0VDMGzPXtiZcUVge2gsPurVtAB7PCH696XppajpDl6mYNS9i6K9t3?=
 =?us-ascii?Q?saJzJPHwu5mXgVPTzflZKfyu+ZCXAo5KF5OjIldIzKXIug2FIvEVDkIq98mW?=
 =?us-ascii?Q?rcRHAfFB9X0ijzvjYEwD/u9itJa5K8ufl1NIdyCLEiEMimkJ4ghqj1B/v2ea?=
 =?us-ascii?Q?3pN+uYfSR3MMxZhLMJhmonV9ALoWFEzLvYCIhHsFZKckbaK2yOgS6dcR52ml?=
 =?us-ascii?Q?YACc0HFrHHU0+vYp6u3vqZ5dxBMwWl9Omp25Ztrm+AxCZXGYE3k0EJV5U+IS?=
 =?us-ascii?Q?PNKdjDrfzZJ1177X4d6bRiTaoSnN077vR3q4UovzzjUi6Vb6ebj+qAh25TOg?=
 =?us-ascii?Q?BGHwAUZStCrjwL+O/D7U4P0dzOUuWGbfyPesgMBogtFv5gt3Job9oMpu89GH?=
 =?us-ascii?Q?EmVqPGbtXQIKiFKHCmsU64Taj4pams13V9E5qpkKEc+IfkHtwdKH1Iawb0nj?=
 =?us-ascii?Q?viDiViXw+vmPEX5Lje84352dkrPw62KNRzE1vdKryuLGGIPXygiDF1N9IOCg?=
 =?us-ascii?Q?T/bVaNsfWZ2sl/rLyNaoaEsS9XvofbSNvDFzTo8PhutBQtrp8ORc1w5zmkmC?=
 =?us-ascii?Q?n77o1QqIHxubwRCoUdNcbP0yN/o8hCOb+mBGJPqDHdr/D0gcWVyLUdn0v+sL?=
 =?us-ascii?Q?n0OEMiKmwZpDLKuxQO3wVTSfNPq6mNpGXPswvsbJu4cFLHCvJ2ybJGu5d2O5?=
 =?us-ascii?Q?2z5dZnzABsTUelc9/6gAvfHSF0UfnINHvHNJgWNFuV/mnMMl/U1sdtmDp2Z+?=
 =?us-ascii?Q?1TqJfYHlIq7AS3EwgoxeBIGEj/bwYBpp5vjyXjCK2w4MWgR2EZdVo35gw4/+?=
 =?us-ascii?Q?Cxr+hA0LVamnyZUgj+AjVTxZdc79cukHlvb04ES4575eKVNtLkQT4U/dDtC5?=
 =?us-ascii?Q?k2ThqpEki/SMVWfdRa2fiUPnJ7zT8dwNe32PkAgV0o63ztXWFtmHXY7UGkZV?=
 =?us-ascii?Q?rarM+Y2Rhp/ffx3OdLOIL2H+r/AfIm5E/QUCMgvVJS9UGVpRDrJwRc4R/Kf4?=
 =?us-ascii?Q?akpXL1GYyYHENQYGVc35jteCqW/g9YnmB8U2xhLL1UecjdMxlGgIidy/6z7b?=
 =?us-ascii?Q?8TajKyjkVtrjq2zX6e0nkeB4P3/gHQ5ORa1BOiHr/dGHT4GNpZhGCLJhGe+S?=
 =?us-ascii?Q?HGFwQ64AwvshFyuDhz0FE09NQs5Q2bfHISj+k6nbGeB8Y/hEe+nXAxPu1opv?=
 =?us-ascii?Q?89N9d1ulCiMETxT0aCTFpIDnxuODre8qoQlDqDqVeU0Ahv++4UcfnB9P527T?=
 =?us-ascii?Q?0KJCeFMI3Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 524d4ecd-c6c5-4271-0a24-08defda553ca
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 03:52:45.1602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DG6NGqwTVlxz7itItp7rUxsaIu5u3KwBGs+fCJXBuj4kIBZdujhV8lckY28hl+APGvMXtmIC1D/RAyHslwyskw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6287

The r000 GSP boot protocol asks the driver to run a high-security binary
on the GSP falcon, and sends the framebuffer addresses of its code and
data in the event payload.

Nova-core has no handler for that event. It also has no way to restart
GSP-RM afterwards, which every load-and-execute event needs.

Add the handler. It DMAs the image into falcon memory, programs the BROM
registers that make the falcon verify the PKC signature, runs the binary,
and resumes GSP-RM. Write FLCN_ERR_BINARY_NOT_STARTED to MAILBOX0 before
starting, which Open RM does so a binary that never runs is
distinguishable from one that succeeded, and which also clears the
suspend bit the next event polls.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs   |   7 +-
 drivers/gpu/nova-core/gsp/boot.rs | 229 +++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs     |   1 +
 3 files changed, 232 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index b8013d2eb582..87cb6cf4f79d 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -140,7 +140,6 @@ pub(crate) enum FalconMem {
 }
 
 /// Source offset of a raw falcon DMA transfer, added to the DMA base address.
-#[expect(dead_code)]
 #[derive(Copy, Clone)]
 pub(crate) enum FalconDmaSrcOffset {
     /// Byte offset from the DMA base address.
@@ -636,7 +635,6 @@ fn dma_wr(
     ///   256 bytes, or if a [`FalconDmaSrcOffset::DmemVa`] source offset is paired with an IMEM
     ///   target.
     /// - `ERANGE` if `src_addr` does not fit the `DMATRFBASE` register pair.
-    #[expect(dead_code)]
     pub(crate) fn raw_dma_transfer(
         &self,
         ctx_dma: u8,
@@ -782,7 +780,10 @@ pub(crate) fn wait_till_halted(&self) -> Result<()> {
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
index a64313dca0a1..ae2aca5d935a 100644
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
 
@@ -13,13 +19,20 @@
     driver::Bar0,
     falcon::{
         gsp::Gsp,
-        Falcon, //
+        sec2::Sec2,
+        Falcon,
+        FalconDmaSrcOffset,
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
@@ -86,6 +99,182 @@ pub(crate) fn boot(
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
+    #[allow(clippy::too_many_arguments)]
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
+                    .with_engine_id_flag(true)
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
index 5501c36a56af..88bb60c8a259 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -353,6 +353,7 @@ pub(crate) fn usable_fb_size(self) -> u64 {
     }
 
     pub(crate) NV_PFALCON_FBIF_TRANSCFG(u32)[8] @ PFalconBase + 0x00000600 {
+        3:3     engine_id_flag => bool;
         2:2     mem_type => FalconFbifMemType;
         1:0     target ?=> FalconFbifTarget;
     }
-- 
2.55.0

