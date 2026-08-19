Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010003.outbound.protection.outlook.com [52.101.46.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568753C279B
	for <nova-gpu@lists.linux.dev>; Wed, 19 Aug 2026 03:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787111577; cv=fail; b=rMPwNfGJbRUB47xCMK1gD0Xq5bkykkWwHyg7EhQIvACOdcDiZsxDJTIB+YGXFTjVSvkU9UHpnE5KyoBSgvpTZvuX539FYHkTcvVTEU/zxBboXgxZ7fvoA/ZY6pDaPlp1kgcpd5ivd8OEGv7s2qb/tILRmGnMqSIe/L9h3DgrKnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787111577; c=relaxed/simple;
	bh=FyBXcphr4WRhOCiR5CKpyQBG5X59LdKwd8a0mLPKEVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fqDV+E3Dgt45WUS2L7az64z9r+mOkSQSG8xZeium4PdJoCkYiCO9BxTpOOQuZ2MgdqbXswqQfW5wP2bgBPuusgSw2+Qs3YiONfPuKa220s07BuyOEbgYv+FMaOTrmU98bRhVoqKUDfrxJ/j4YGjfpinlfiyb9WnTev6DI71KlZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TRV1maOQ; arc=fail smtp.client-ip=52.101.46.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TRV1maOQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D/rbc97kHVMB6sfsOIw/lVCkI1/M2+r5VAURcWf6NJ1VXy3+JF8tfEHn79EVpLdcBbtdYPOlBBG7z/mJrwRI/Ej2aW1Z7aTmErcUwgSQ9YLgj2WqxL8jqGzsYyog9qgQ/+80tncYafULsJIhGZ/+TnyZWwVyFrocn0/6D+IoMPFFFk74ZEfrqMrVQZF5b+DsXP1cWcjx5VDrwrgnGFWy/kiBZ03nz9ZEUe544qD4lky7fxBZZEOokpcp/CcFsA2dXHMZgl1YPvamlJKEZjmWtGUITiTu3Z8PTWiSGW/w7xLRy6US8zwlhBQN/5PxnKIMJpUGVQthaLlXSpAmM2wU5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bILnZB8X9piQI2DwrudHWOkoS70CdUq6b/axgwBNwjY=;
 b=GASYLNY00bwqdUwVJ313q47sTjauPS2YKmAqM6BCMEvRZ5XVXyS9/+H9Lb76yvNO+bX9NbQTbgD/YqtwlMuUmrfr8xAhiq58D1fNhAh4L8n8ofCryZLesRXnRno9l9LmuTInY3Ni4RDQ754LcN1fHQPaE+rJD5/utYHhMF43YM3gZ3kuLcgWpX3YANNMldLW8chAXJCMBE2zooMKOvQeAUsmfDRrQ1iLxECyDKYZBSTRZtAUOcblv9IpLrC01XJDHExSzoQ/4wydApDpIm2nhTqj5CZP4B3iocpfjvb6duEEZy8yTuvv4IX/sVekgTSPj3y4ZTZOCW1009D1ZGGzHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bILnZB8X9piQI2DwrudHWOkoS70CdUq6b/axgwBNwjY=;
 b=TRV1maOQQxrneXIeeVuuorJJqEqVQkhc8kQBInk6H5dM63nztrJ77YBBmUXDhGQCg9vBOoge3TTtrCshyu5kS6Wbrshs+ytWJeIX6uJRSAB1E6HjnO0nAshb1GC6kutPIOi5FvDP4uiadnvPvKS+g0JBfg5p1yLKUOsgc8jFTYVsU06rES/2fhqL08WcDbUFIqtMayxYlYi/7U4izYxoKn6qwrdSccDQrDIt8aj6IlWcXtkBYYCYy0vDZbwrYTe42EPmc2pZfugCZ55caelbs3zd25x0kO5XXlxI1/twHtf4Sdz2k7KxfY0DR/ynnF7emoxlBzYgbujRXr+8vtjLvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB6287.namprd12.prod.outlook.com (2603:10b6:8:94::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.17; Wed, 19 Aug 2026 03:52:37 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 03:52:36 +0000
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
Subject: [PATCH 12/27] gpu: nova-core: gsp: add msgq v2 internals
Date: Tue, 18 Aug 2026 20:52:05 -0700
Message-ID: <20260819035221.336390-13-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260819035221.336390-1-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0141.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::26) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB6287:EE_
X-MS-Office365-Filtering-Correlation-Id: 95ee73a2-ba2a-4889-75fa-08defda54edd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|366016|6133799003|56012099006|10067099003|11063799006|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wIVqZgn8/Wg2RcYSA7gZSctL84guHSeRqqBUsCqxE2ahO9zUTqm75HS07kOVfXP4mxlpkSk49JKH/FZBl8xxUmYIVqad+Gy8dzlkCH16J5kAzFqmxIn0hY0W6Wg0rdASIfY6CAnB3QQ+E0MMckcZxSbOJUsef/hCCO03wEII8v/CjABCV9f0KVFMSHlJEZ5lWgdnp3gYwnPZoUq93VlKKkQh1ON3hpq/KN4eBKgFhVM0sKHIfmUHrZoYvNo1IqJb2LJGuDp/zL2G77epVZhzHwjaYVdcxztRjLMDIvLvOp7erL4XASpUbeUJzqV8ruVLFashXc+URD+jGg2QM7eSquHk8pOYogly3GKK7biv9a+l0EXe4jYXF/WN8B96vkVQ/pLoQDpOX1Eu0BLvCnSeAkrutQJGrNRb9bjH2diXxs3OWTBe51bqgRoZP7aaqpVjqrJcNjfacAqwHDBJANWrItKqwguttAFu1urIYr0u/an3KGd5HjKV7s7MiZVem0ofQBdJ5ab1SF0eh2q9CcwtgXH/PmHmFnGdt5Hf354bNIlKliVjS09VVvkJwbSYRd8fpaQLlkiASulO7nTTyOIFwtwAVoYKQpyICUDjBJ1W3H4s98PLjcF5PSyUQ+j+EPTrNAnKH+kp6nOP+FQx7dqz7aGX8uu9MWe9EiN9rhRvEtY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(366016)(6133799003)(56012099006)(10067099003)(11063799006)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dRLgwMTnc1epSloksJ/LLSVc3vaffFIdRQDEDiA1cNHONlU1YNVCIKrfMm8D?=
 =?us-ascii?Q?0fqrzO0YVBMcuw9yWLBACsO6AOnnDj+D0qYU5LzVAo28hpPJAjeFs6PzXQZX?=
 =?us-ascii?Q?Yc+nBfIvZXzHir6NDHrtEcd0piU2yu1OdtuiTa0h5xh1nQzKuXQcZb8C9Ere?=
 =?us-ascii?Q?st/24i9uUf60aq4aCuksT33n2QoTc1K4J1Q/ygR2G2D+5TlaTx0qfzlQEgMf?=
 =?us-ascii?Q?AegGc6+o8vK7ZG37ZQnRfdXCdQV0thxmShmG5m3QOopsdGZofE6x5xdjJYIs?=
 =?us-ascii?Q?3XPdGMZZ+KlV0Tj3J0/p12AqgaPyYb2lqAh8jlOeTGyDxvyWh8LIzmu8CaMz?=
 =?us-ascii?Q?/P6ADuA77N3xr6cgKGMVJ/yfDnd6gKJqDK9MviXy9fBpqszJ18scNGicyuoB?=
 =?us-ascii?Q?M0gkaqnkllInHkYIwpvHxZIHiEYqfr1YyRUTj471ELENP2nqHiR78tdaatpA?=
 =?us-ascii?Q?dgjSVL0uX3dD4G4h1L6l5mwVQA9eifBuQZgYTboHkfpPyMjr9eMJjJ8e6sFY?=
 =?us-ascii?Q?h+o8z8FXK/b8pRN7H2IrhXu2HdlDYO0tkYlpfyogYKUA/XBQDTlJNR8AbApo?=
 =?us-ascii?Q?6i6FgT3KGUKZ+tNAeEMLZeS92LW8VNqdVdkKBcORHbSrSPLo3+DmRJ0qxivB?=
 =?us-ascii?Q?9iL9wOIK2BviraMJWmUDteCO9s/gGJWVfiC0vTxWxenwC0PnX4sjDtAZd7Sl?=
 =?us-ascii?Q?1+uslCb3FwqnhOiPFCHxnrshATVeNlEYZJehVQkIA9Jaz8YBF+KtDFXlYc1a?=
 =?us-ascii?Q?X+ctJmnKg2TQZjr21X4OAWi8gQ4VkhQz1tHUYmoxpSFGFqeyhmcY8DbU/xqn?=
 =?us-ascii?Q?TpNsumZ0xkZvoSm2ngSWhGRoycfUXxWhXbXXJzr3dDyYtRRJTwr+e25gsX/C?=
 =?us-ascii?Q?YeDRkTq3hHxL5hCnN60d+TxjnpyqEkh+dftdF6rhTbwPDvASnWHVcQTzVRPF?=
 =?us-ascii?Q?VtHNat3Wnw+RX5m6hUV81O2hv7HTXyfN/hSJzY51wsXTd0FWFe4Mo5MKnC53?=
 =?us-ascii?Q?PQL/ds2guQnaD4NFLM84tiG/8mEuueVVrfedWzSQTLBiOxZL21E64qysNtjK?=
 =?us-ascii?Q?0hO20kufU4/16Ozw5WFQwn/ILwfiZD90ydtEB6VcQTHagei/FOEuOXS+lqLf?=
 =?us-ascii?Q?zoWIL6lCewvmVY3oQVY018g6sLqDAUbkorVbU0/L+N1Z8AbcBPCINpaq2C9p?=
 =?us-ascii?Q?8vwAXzrfHEWchNqxMlaLpPXnHNd7NqAX/Q3INGWfSomB3Ij8ZGvKvSlJoQok?=
 =?us-ascii?Q?o/1fRlgo74OmqNzQQpBEdYx3u6/Ny3CbW5QSjcqRsR0GTXIw7sD302kVv3rt?=
 =?us-ascii?Q?dhCBbSAE9E8Od6M23JKiLFrB77ahfKRPXH/IcRxRmVsjaq9BPYFZKV28bxea?=
 =?us-ascii?Q?XHMIG1HJo1kG025BdsfWQko5D8Mdw3K35VIN0TwNFB+b62MayDlPRWpvwANH?=
 =?us-ascii?Q?xaARZxsTVcjHBoRuFTlcJ9xp6WPTbraxYgtL3mWOJ44rTr7e3O1tHiVNdx3u?=
 =?us-ascii?Q?V+uNmxQmnPhSPMpuBSEg/sntc0VD8VWy2ytpMchi+9+e4Iaxgm3h1IBHbRtz?=
 =?us-ascii?Q?NVDHuXq1ueqkX0hUofwLRJFiPNSQAYnwevW3jWAxVSlL23TlfRaHiV/SbXiA?=
 =?us-ascii?Q?CIGa6OmJMfhZPRD64pn24ncj6hBmMbX3Mee4lqhkL1Y/N4wPJnxZNlwMA8wp?=
 =?us-ascii?Q?AaJXefPVGbdwWUm2NtRGHhYMPGfXAgrgrSL6xx+416Zkr6LawGUH4lMgVkrL?=
 =?us-ascii?Q?p0irg/ogCA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ee73a2-ba2a-4889-75fa-08defda54edd
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 03:52:36.8891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zssv/hN+m0DRnx0/IZ+RKrB6o3wQajYfdVoIzlBv8esEir/q/5FvcXK4dn7UDxjq+VAIt+FpuSUDfmzxZ3MESA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6287

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
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 140 ++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/fw.rs   |  36 ++++++++
 2 files changed, 176 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index d3afe3f9bb37..1d86d2927a94 100644
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

