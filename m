Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010046.outbound.protection.outlook.com [52.101.56.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08EF305693
	for <nova-gpu@lists.linux.dev>; Sat, 22 Aug 2026 01:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787363744; cv=fail; b=MGPygGjXTXVxdqnCFYLlmuO1Shs0UGK/TQY/yc7Cr/rIdtNY0egyyit8Q6QzKEnOT7Q5HbAuQ46i4Zi9ZQqdNurkss/3wNH1Pa7TzUbM8nXcU/LY9vqX13DnpUT4j1A8YOBWv5Z7MH8v2qyGgJmxs5iLD6Fe1fqbqhE1lvSSnO4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787363744; c=relaxed/simple;
	bh=i42XxdmBqPuteioKhVqkZLV1C8Vz+qkHrM0yfWXEVTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iNmiEyHeAEOjDIQJesaogzsH2IjX07frZ/0iiHxNYzyEWijX3i+CnMp/J83ZGL9xdCbtAvYePpyc0mrbXPbCJ/YKOUdCaRO/ctW6khxMfqzq4w+BC4jIyTM9rAVViq/tLNhFvVfhIhYsYbrUuvPoWsyTI5myklwcPWjrqNerQgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gAy8B/JQ; arc=fail smtp.client-ip=52.101.56.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gAy8B/JQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yFee8dRgWpVZLXOB0JmxxfBPGoQHmXHN/eEodazSbZsoiitNILXDUVKzlD1Pf517jxOk7iKsFV5chBTmnzCWLez0yZs1YwE44FHI0euUbb8Q38+ITlFUfdG1DSoFcmDXot/0J1yCUCQvN9aEVZF+xLOoEvaOuzHGv7qoytHCNOESfvmr9+sNdjUXJ8+n+7ydd9a2CzoVNJgdCvGE/CxC57aXUeZQjTZ2nEJzmNztHY11m6HR8AFKB542Ux3BnPQKCCsIX4b/XWgfCUipJHZJuoc3tpmygmWp6kxNMIFeR8x/Uq/4oK13ztHbELYBC3nWeKbWYMpiLbplWIVKfEJ8QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WMWyu2xrY+LNRdxml5wN2EQ7Ywe0fnOdm5vST3t8aEw=;
 b=CeU1t1hq814alVJNAUieP14ltcGUG6flzSYlUgINPSF9viXBoexO6ffmZ8wxCJmOZpB78Pp6b/up+/8rja93mAm4CPUa5dFWndcVYuT+SI+fzF1cx5/gGkxuIZ1JdATVhS/YztJpL0r0jXtWXqZs5Z/PW0Ge5aP/YMQIDBA7flH8gicIQNiN4WKyf7+rsQnOo4g6t89duixTfkJVwj1VQbKvGIhZ+glhbDSBc+e5qpkK4xHIyqnhDDvuNucWFIPtxQiPxm2MmGjNKTAFty9JpKbaCslRczgEbOVMwc1N4GVWAqlsJwP7FdgxAcUHMYCikknEIVbGp+3MC4PWPpnFoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WMWyu2xrY+LNRdxml5wN2EQ7Ywe0fnOdm5vST3t8aEw=;
 b=gAy8B/JQqSuAyCMsU8qnlxK1zVD/ZdMVrgt/W4MoTmxwRfQk36t9IbbfT5mJOG1Av+nQ3HsX9J0BK7otDhrTIodbUGyk+lUecMVCUv84Bdi3//gfNWdP+3iO+84nPxXdSftib2o2whr8lOtcM28MweT3+pOL769hRu/X6Vjb31WNHMiGeuiPfWyfa0SkXOJ502wtVChkOHy4WjJWiHuVp9V8bb3ilxcqVPJgECsxCu9jKLyuGB9SIlMbPR1a4Er5aupzeh0qUHPmUW1NnHcUpATjglQBSr/VcwYkuiW+AVUUel/flt8zw7pf2FGDNOt2SOodaEfuQNxPdjtzHQDhvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB5834.namprd12.prod.outlook.com (2603:10b6:208:379::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sat, 22 Aug
 2026 01:55:35 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.010; Sat, 22 Aug 2026
 01:55:35 +0000
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
Subject: [PATCH v2 13/31] gpu: nova-core: gsp: add msgq v2 internals
Date: Fri, 21 Aug 2026 18:54:30 -0700
Message-ID: <20260822015448.238214-14-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822015448.238214-1-jhubbard@nvidia.com>
References: <20260822015448.238214-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0055.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::30) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB5834:EE_
X-MS-Office365-Filtering-Correlation-Id: f66caad8-1b3e-42c9-b98e-08defff074ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|10067099003|56012099006|6133799003|22082099003|18002099003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	v5bVvCl+oHbeSPZa1POIkAR38Pf2Uq1+qWrYRKHVfyBdR97g1qCLBl72uuhviX+o2NfrNCmZovkvTdAA0Iqt5odnp+nMudM1ZVnYmQ5SLrVYvnD5z98WZcx5e5M9sR8WJSC29nLk1ccR+AbEhPOA6sypur5hTKb9pN4hAaZRhfHlJLqzft/5VlixrWwPpIiX3owJ0IcETARJznc09hgwFOEpoccP/yrNZf028blEjlp9pIpbP6MEnoqciKFqSjelEGmxJ3IyGMPwC2EfHslJ2Y7Hcs8x57WNpdnmZswoLX6m0gI5JJoL+fTEKlhODmwqUcHDifWo2wjioaDUqsLpIvORbfg89zqMLeXXlrZTjUB32KYgsS8o/wAgg1+ivGJvkn/qL5PhoR0FqHwBOzGuvyiNX8M5ounnUaDKh8pJhL6KlTFvH6ceUaOhFdRInIzoHmF38rmlKt3UHEMlCen+LXEkcjZ6GqH1Z9MC0owBF8Xz8Wp6bZyEJ/LCp1ikwgfz+dshPoL0Yj2YAWcrixzO05ksbedFf8HUuw3rmxIYIZ/EHy72mTI2Igktm9RziLQsBIdk8ZKf4+v7eWolmVerUq12xMdhBfoxvWU7x6TcllgyYRjukQYHV7mfjqvMUXKSY0V2/MyGzAvCpCaVx0Rs2YZNN4P/cCgXIA+3K5DQJYw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gg8GmzRUPOUehYESx6wYAFf4Bn3XBqUjBGW6XsZVrMI9WEFRZgEyHdXje12V?=
 =?us-ascii?Q?g6mhobMiXSUAPC3CMSaN4S61yU3ltY7nXW3apLE1e9emh5nLNX5E+W88Htdc?=
 =?us-ascii?Q?7bMSawXCUpYvcA8kqYfo7A3Qk2RWSaduR7br2+t3ZyBbBFvg5Civ/39nDK0T?=
 =?us-ascii?Q?uF0yhkoSXnC/XLHHnNknetzvgaK4eakn8geTs6rWoMUzSWBsv8hPb7Z1Tn8y?=
 =?us-ascii?Q?Nok3XvKoXOPHExdwEqWn+0UG6SKQZXNFKWWYwZlhIzdRvudSOXjjUUkSz3VR?=
 =?us-ascii?Q?nlAzPdyg9JZIgYxL+15mTyeVrSjUqU/nDjWYi9C9WL/welMfNPhvKrpNdTQw?=
 =?us-ascii?Q?ng2dibct5SymSr63TKcCC5Tf7RxgQSQK/m4mI3+mG3HQOlS503e6GwnPh5iV?=
 =?us-ascii?Q?BFIJXSLNiRMabjAXAxHigJrtCORpMSrnx8+vqzfQ2eKboa54Jc62KT0ApNb/?=
 =?us-ascii?Q?In4yLWe08W+jnZBCrWnq6PKqSyw7Va6Tx41Z7yyzGhqSn4ZIeq+GLjUJkyuU?=
 =?us-ascii?Q?rvs3EhvAdM5LSEbjbSIu5D+4CT0Gc1HO0+5u5k+ftSAFthV10CSsIdwUKgHM?=
 =?us-ascii?Q?Od6SNn2XVlMgtvNYgx9MY/II65qBJncsfodjRFNweGgUODRdD968ZE7R8B06?=
 =?us-ascii?Q?sT5zxFn0DORuZlGlKTb7LFrOmOUl61FIuXknRFouImm3nkvWABUQwx0FpL2U?=
 =?us-ascii?Q?oezm3Jqy0n5H13Nve5RV6gmEbD/xVumYhL4WiWVuq1wI+jB9uzunu+UeiEgz?=
 =?us-ascii?Q?gj6x9h/zG46o9G/UD5+IjuWcGddIrvT74YpEVPWjAXR0r0IxgaKhlkA54V9x?=
 =?us-ascii?Q?f83BhXT0+qqiq31qOMafZ7Pk4gTa0eeq2Dz6P+3WQZyT+8Jl98lQt3UuKtDD?=
 =?us-ascii?Q?Ts1TRSG9XPWYi5Yv56pPMSKAr8JSdYDTwNZDTdb2hHVT8hLZw/R4mge1SWZQ?=
 =?us-ascii?Q?QCuLhnp/QCC5I6rdITBzWyDFXIKDeKDufj6Pvmupo8eLWtUh7oA810QVkJEd?=
 =?us-ascii?Q?TjlTsHLBDq16Q5jnJhKVPEz6P3KiNFs7oR3iMJnloT6esqdgxy35OfGZZIjT?=
 =?us-ascii?Q?fPWSayhGFgjPDhviDe4+2BZ06qN1CcaKPaKjbzJoQBKQwiwtGjZ6ck3U41gH?=
 =?us-ascii?Q?2D31zuVe6xMXsbKsXRbaQzf0sV9Y9fEF4MBFZZw36fRCIWofOttpfmf/r1/o?=
 =?us-ascii?Q?m2szU5CnwMq+m0OerXd2TQUzvK8Q018VAJS5HkpssNlty/rRFWzHkSTmBOj6?=
 =?us-ascii?Q?GcP95jmjvktcEPLzgL49lVDj+rD6BbTQFJ/kQmSbTdE1VWqOajjyLDFxN+F4?=
 =?us-ascii?Q?kfR4i00xLQCVsAqci46CYzZsWS79SQA3LhdxOiChJ6Ryj6XD3VNPWWYMLYCo?=
 =?us-ascii?Q?Idv/rrEhqRAxRZcsE5NmxNzmd2SlKRcPlCK5zew/aNUsCV4GLz/RnoZ1Ckic?=
 =?us-ascii?Q?Gvl7QnTixtOHGwuSi5psVNnudDiIvXeAcnlhPp/cz/j6ggMlehwxsvxVIYiI?=
 =?us-ascii?Q?bKnhYxWtH66xIGxw881VOTkfUhb27/JnYPxsivW4WZOilu4Y15o84TUqpTuh?=
 =?us-ascii?Q?vSKunkhVPD2dN68FvTUxvl4Zr9CfkO1v0J9AbMav510Y+rD7FyaoGiZDT/7H?=
 =?us-ascii?Q?qX63fbZNw+MpH4UJatoG17qqRJCvUsXmNeBhDd3/LTgYfITmnG3gHDgGIExf?=
 =?us-ascii?Q?qrz54nHFhKUHaqKUd7ixhFpPu1WKEphN4JbV4/k1tgvdvfmpXHdSJqOc9V/k?=
 =?us-ascii?Q?jKUblcgwLA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f66caad8-1b3e-42c9-b98e-08defff074ee
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 01:55:35.5872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cev0IxxnnEeZ/cjnC9jSdfQ9h91KLQiI0XYjt6YmEYEPz0hDHY38WkqmkiY36+zmGg1w0aMixK3h4a/5MWNJcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5834

Msgq v2 moves the four ring pointers out of shared memory into BAR0
registers and treats them as monotonic counters, so head == tail
distinguishes empty from full and the ring uses every slot. The pointers
can also be out of step, because a GSP reset zeroes them while the ring
keeps its contents.

Add the v2 TX header and the v2 ring helpers in parallel to the v0 ones,
so the flip commit can swap call sites without writing new logic. Read
the queue as empty while the read pointer is ahead of the write pointer,
rather than taking the difference as a page count.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 140 ++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/fw.rs   |  36 ++++++++
 2 files changed, 176 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 1eeef2120b6e..a46d8927da1b 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -467,6 +467,146 @@ fn advance_cpu_write_ptr(&mut self, elem_count: u32) {
     }
 }
 
+// Msgq v2 internals.
+//
+// Msgq v2 keeps the four ring pointers in BAR0 registers as monotonic `u32`
+// counters that wrap on overflow. The slot index is `ptr % MSGQ_NUM_PAGES`
+// only at the point of use, and the ring uses every slot (no "leave one
+// empty" rule, since `head == tail` distinguishes empty from full).
+//
+// Register-to-role mapping for queue 0:
+//
+//     CPU TX write/doorbell:  NV_PGSP_QUEUE_HEAD
+//     GSP TX read:            NV_PGSP_QUEUE_TAIL
+//     GSP RX write:           NV_PGSP_MSGQ_HEAD
+//     CPU RX read:            NV_PGSP_MSGQ_TAIL
+//
+// A GSP reset zeroes all four counters while the in-memory ring keeps its
+// contents, so the two ends can be out of step. Between the reset and
+// GSP-RM writing its counter back the read pointer is ahead of the write
+// pointer, which `driver_read_area_v2` reports as an empty ring.
+//
+// TODO: suspend/resume reset-recovery is not implemented. A power cycle
+// loses the driver-side counters as well, so both ends have to be
+// re-established.
+#[expect(dead_code)]
+impl DmaGspMem {
+    fn gsp_write_ptr_v2(bar: Bar0<'_>) -> u32 {
+        *bar.read(regs::NV_PGSP_MSGQ_HEAD).address()
+    }
+
+    fn gsp_read_ptr_v2(bar: Bar0<'_>) -> u32 {
+        *bar.read(regs::NV_PGSP_QUEUE_TAIL).address()
+    }
+
+    fn cpu_read_ptr_v2(bar: Bar0<'_>) -> u32 {
+        *bar.read(regs::NV_PGSP_MSGQ_TAIL).address()
+    }
+
+    fn cpu_write_ptr_v2(bar: Bar0<'_>) -> u32 {
+        *bar.read(regs::NV_PGSP_QUEUE_HEAD).address()
+    }
+
+    fn advance_cpu_read_ptr_v2(bar: Bar0<'_>, count: u32) {
+        let new_rptr = Self::cpu_read_ptr_v2(bar).wrapping_add(count);
+
+        // Order all reads from the message data ahead of the read-pointer
+        // update so the GSP cannot recycle the slots while we are still
+        // looking at them.
+        fence(Ordering::SeqCst);
+
+        bar.write_reg(regs::NV_PGSP_MSGQ_TAIL::zeroed().with_address(new_rptr));
+    }
+
+    fn advance_cpu_write_ptr_v2(bar: Bar0<'_>, count: u32) {
+        let new_wptr = Self::cpu_write_ptr_v2(bar).wrapping_add(count);
+
+        // Order all writes to the message data ahead of the write-pointer
+        // update. Writing the head register doubles as the GSP doorbell.
+        fence(Ordering::SeqCst);
+
+        bar.write_reg(regs::NV_PGSP_QUEUE_HEAD::zeroed().with_address(new_wptr));
+    }
+
+    /// Returns the region of the CPU message queue that the driver is currently allowed to write
+    /// to.
+    ///
+    /// As the message queue is a circular buffer, the region may be discontiguous in memory. In
+    /// that case the second slice will have a non-zero length.
+    fn driver_write_area_v2(
+        &mut self,
+        bar: Bar0<'_>,
+    ) -> (&mut [[u8; GSP_PAGE_SIZE]], &mut [[u8; GSP_PAGE_SIZE]]) {
+        let raw_w = Self::cpu_write_ptr_v2(bar);
+        let raw_r = Self::gsp_read_ptr_v2(bar);
+
+        let used = raw_w.wrapping_sub(raw_r);
+        let avail = num::u32_as_usize(MSGQ_NUM_PAGES.saturating_sub(used));
+        let w_slot = num::u32_as_usize(raw_w % MSGQ_NUM_PAGES);
+
+        // Pointer to the first entry of the CPU message queue.
+        let data = ptr::project!(mut self.0.as_mut_ptr(), .cpuq.msgq.data[build: 0]);
+
+        // SAFETY:
+        // - `data` points to `MSGQ_NUM_PAGES` valid message queue entries.
+        // - We will only access the driver-owned part of the shared memory.
+        // - Per the safety statement of the function, no concurrent access will be performed.
+        let data =
+            unsafe { core::slice::from_raw_parts_mut(data, num::u32_as_usize(MSGQ_NUM_PAGES)) };
+        let (before_w, after_w) = data.split_at_mut(w_slot);
+
+        let in_after = avail.min(after_w.len());
+        let in_before = avail - in_after;
+        (&mut after_w[..in_after], &mut before_w[..in_before])
+    }
+
+    /// Returns the size, in bytes, of the region of the CPU message queue that the driver is
+    /// currently allowed to write to.
+    fn driver_write_area_size_v2(bar: Bar0<'_>) -> usize {
+        let used = Self::cpu_write_ptr_v2(bar).wrapping_sub(Self::gsp_read_ptr_v2(bar));
+        let slots = MSGQ_NUM_PAGES.saturating_sub(used);
+        num::u32_as_usize(slots) * GSP_PAGE_SIZE
+    }
+
+    /// Returns the region of the GSP message queue that the driver is currently allowed to read
+    /// from.
+    ///
+    /// As the message queue is a circular buffer, the region may be discontiguous in memory. In
+    /// that case the second slice will have a non-zero length.
+    fn driver_read_area_v2(
+        &self,
+        bar: Bar0<'_>,
+    ) -> (&[[u8; GSP_PAGE_SIZE]], &[[u8; GSP_PAGE_SIZE]]) {
+        let raw_w = Self::gsp_write_ptr_v2(bar);
+        let raw_r = Self::cpu_read_ptr_v2(bar);
+
+        // A difference wider than the ring means the GSP has been reset and has not yet written
+        // its own counter back, so the read pointer is momentarily ahead of it. Report nothing
+        // readable, which holds the callers in their poll until GSP-RM restores the real value.
+        let pending = raw_w.wrapping_sub(raw_r);
+        let avail = if pending > MSGQ_NUM_PAGES {
+            0
+        } else {
+            num::u32_as_usize(pending)
+        };
+        let r_slot = num::u32_as_usize(raw_r % MSGQ_NUM_PAGES);
+
+        // Pointer to the first entry of the GSP message queue.
+        let data = ptr::project!(self.0.as_ptr(), .gspq.msgq.data[build: 0]);
+
+        // SAFETY:
+        // - `data` points to `MSGQ_NUM_PAGES` valid message queue entries.
+        // - We will only access the driver-owned part of the shared memory.
+        // - Per the safety statement of the function, no concurrent access will be performed.
+        let data = unsafe { core::slice::from_raw_parts(data, num::u32_as_usize(MSGQ_NUM_PAGES)) };
+        let (before_r, after_r) = data.split_at(r_slot);
+
+        let in_after = avail.min(after_r.len());
+        let in_before = avail - in_after;
+        (&after_r[..in_after], &before_r[..in_before])
+    }
+}
+
 /// A command ready to be sent on the command queue.
 ///
 /// This is the type returned by [`DmaGspMem::allocate_command`].
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index d10677e277c5..79a7820ce99f 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -758,6 +758,42 @@ pub(crate) fn set_write_ptr(this: CoherentView<'_, Self>, val: u32) {
 // SAFETY: Padding is explicit and does not contain uninitialized data.
 unsafe impl AsBytes for MsgqTxHeader {}
 
+/// TX header for setting up a message queue with the GSP, msgq v2 layout.
+///
+/// Same wire size as [`MsgqTxHeader`] (32 bytes) with a different field
+/// layout: the v0 `writePtr`, `flags`, and `rxHdrOff` fields are gone, the
+/// `version` `u32` becomes split `versionMajor`/`versionMinor` `u16`s, and
+/// the trailing space holds three reserved `u32`s.
+#[repr(transparent)]
+pub(crate) struct MsgqTxHeaderV2(r000_00::msgqTxHeader);
+
+#[expect(dead_code)]
+impl MsgqTxHeaderV2 {
+    /// Creates a new v2 TX queue header.
+    ///
+    /// # Arguments
+    ///
+    /// * `msgq_size` - Total size of the message queue structure, in bytes.
+    /// * `msg_size` - Size of each message slot, in bytes.
+    /// * `msg_count` - Number of message slots in the ring.
+    /// * `entry_off` - Byte offset from the start of the queue at which the
+    ///   message data array begins.
+    pub(crate) fn new(msgq_size: u32, msg_size: u32, msg_count: u32, entry_off: u32) -> Self {
+        Self(r000_00::msgqTxHeader {
+            versionMajor: 2,
+            versionMinor: 0,
+            size: msgq_size,
+            msgSize: msg_size,
+            msgCount: msg_count,
+            entryOff: entry_off,
+            reserved: [0; 3],
+        })
+    }
+}
+
+// SAFETY: Padding is explicit and does not contain uninitialized data.
+unsafe impl AsBytes for MsgqTxHeaderV2 {}
+
 /// RX header for setting up a message queue with the GSP.
 #[repr(transparent)]
 pub(crate) struct MsgqRxHeader(bindings::msgqRxHeader);
-- 
2.55.0

