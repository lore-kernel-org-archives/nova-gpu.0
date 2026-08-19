Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012060.outbound.protection.outlook.com [40.93.195.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59BC30F7FF
	for <nova-gpu@lists.linux.dev>; Wed, 19 Aug 2026 03:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787111560; cv=fail; b=Bu0a5ZnBjMhwvNOA9/d/eaKZY+GZujzI7zn04AKV6puCQSw/seiidChy4Xc+E8skt+6r7FoBvdYTXp6n1EAjvS2ymGy90DNtKOOpypTxla+MB4R+9ywRqBtA/KbWU+zxMUWUAunwqx70C3GV8rd2t3/l420WMID5OW5YnRcogkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787111560; c=relaxed/simple;
	bh=uoOI0KSD0brLOskzg2aWfbSuPf7kpFny5gvfXN/pGlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G3YiFhPJuoh5hkEwZ7iFdXadBNvqGTB05ZT4FX68Lfz9vzP27f0oWWqKaYAQuQ7IFa+vtp4uTr5wqjtPJ7OcvV/B+l+h9/1ujxIpNZuipaGuq3yk2z+ohQ5soTf/N+plRzulTSohOJyoA0v+/GvFTPZ5KVyiX3+IJ/FEiMCUMkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hm+7mTkd; arc=fail smtp.client-ip=40.93.195.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hm+7mTkd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E82J24gKprgJczDldlGvEQaucEcZDoGhb+fjj+z9fniEYrippFwgGJtXST8L5j7Xd9D56yRRLhShPQcPxegMa65XqXwJET8E2PI0vd9UaD9y8CGJrESEujbJMD8u7Rsxt1IDnyYUQoD8fOFGYCl8gwj8S/nFIp5a5ux7w2C/OyWxvXoLCwh4Q5HiCdhFS5Gzekml/+hO3t6/5NmEWTYs5efUHDKo0oT5ebJKaWAQQOFqblgQ5b776SSYPelhfnnWJPICdtUjjd0nO/C59f5Tf/BWq94ChfNWXOU7tRQSjTCQCIm6zweeQ+Xx0YENPjsupz0Z/F4tBsuGsY+81QTsbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6scmp4fTiX72Rm9Eo/03CqwzQeCiFJXTko5s8SvOKo=;
 b=DDPc7uxQxdblyWGE/sB3iaqpOEEZoUpnXPRrKc9O+2rbsbN+DWx2+mf51J3zBpshteAFoRC0/OYe9dRLa98VUv/LjEYjHO0WyJsAKPpQw09vGJi4i2JKalg64JjohrufZZZpRSwLxTY8ZOsjhLAWJCBS7xNVIe0NA0C1Q4rhEOHV8DfkAcwTUHI1Bh5x4B2gjHL4mFOY5Zzxcl8ZbC2NyqXmsUvxDAgexWy9lHU9fxbX5vmcwLVU4u090rWcqC1Y4TQXQRRRrItww0tAb506MM/Wckp34dW5cI9w/Kj5GMekeOtX9x5xceoZTiYSze9ggcEbkHSyupdJ2S7bd1o5zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F6scmp4fTiX72Rm9Eo/03CqwzQeCiFJXTko5s8SvOKo=;
 b=hm+7mTkdqgHIUNfJKk1K7Tq0ib3hprLOZ9VzoDM5LMcI88K/rHTnL+rkAXwjQQWiiyoqrZEsLUOdZzSz+xS/Ay5EtTNWkeUcrbOCNLFJX7TBhLWQsnsJA720u67zCLeKMwW+gvhR657IO8ZInPI1jC+49pXt5DL6MrCK9lIoIt9xgCPPZ+ziHl0MQVfrT7McnUlIQ+lm6mx6P9PeTJ8PR8Di3kDm4R8KIEhArVe8TvVVedR8wZuM69K//prAm+/DMZHTRi8KhaX5RknK0UP0DwtQK0BViLOu/P0c59HNf86XI46aAK0fp0WoQ4//+nW0VKT6KLMnT24yX06JdZ0rCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB6287.namprd12.prod.outlook.com (2603:10b6:8:94::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.17; Wed, 19 Aug 2026 03:52:27 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 03:52:27 +0000
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
Subject: [PATCH 04/27] gpu: nova-core: add Falcon helpers for r000 LOAD_EXEC events
Date: Tue, 18 Aug 2026 20:51:57 -0700
Message-ID: <20260819035221.336390-5-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260819035221.336390-1-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0225.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::20) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB6287:EE_
X-MS-Office365-Filtering-Correlation-Id: d7994103-9df5-4c70-ad88-08defda54960
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|366016|3023799007|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IrzyuoQNxwMZJSyYY0lVHhDRrBJ2lAXu94SDK98JHGs6HDF7ALFMQSh1hKzdVIjpsrVkjs73I1Bvf3VCO+PL06ljdZtr4WBuuD8i3WXKVtbxIjWu6dE6lea0efxMn3ZGmv8J4wKASq9mRWqWp0Oro8+xpsvxuzBv1c516eof6fHFgtO0RSJrx6VBnBziqXEOs6E7zfCioErkfWi0+ROTdzMjdA3xWpBJN4hFbm7VNnZzQ95lxW90gkBniy7FzKmhiQuOcN80NQHF/zUSHohNa74z9fg5oYAHUqa1p7mvZQXVfJX+vIbebKcSCxPZOIOmIJOxH0wBW683u2wqqgJn7B1Rg8viUDrU78VrX+zzGSQYQ/7lBPYKNlJ7PG25IWH2cqBbqdag404CqJT0imjD1XgGOEhYbUxxU1TycbD3xFslKm99TXoUnb4500foYAoCUOxNdmSH2TvxEv+hBgVL6AwfICuwV/3MdaabODu888+GFpqkux39+EeQVowiOWlucGhP+xvPDk0LtAqSP76qNN14xAcXLeT7y61+iyYZwtBCx+x2u08946iriQr2QXLyv0lR/tngnpwwsohOmsr1EZ1PsYGv090k5u4Bez1ZW24IT6dQefVuFdLMxrIg5Rr4pG7M1nsLs/CxvcGDy/HXnmqFfDcRZvxS/115ck7PZJc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(366016)(3023799007)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XcWiU/eTYyNcA+6Rcg+4AoxfGqBKh3inY/Hicz0zRadAG1/VgI+iUj/9858L?=
 =?us-ascii?Q?YSJgBx7X6g0vP2M7fLuWmDVEu8f2FIk3DKJgMspvNPqKhq67T2WyGhsRSDAJ?=
 =?us-ascii?Q?jBsQXobt2aBW8sng+YRF6vW2edXZk6VNwFFmAUkrSYiiu82a5xubX7G6xbQ0?=
 =?us-ascii?Q?BSUVkJx/NQWdQba48FPqeGsJDx4T9Op/PBY8zqxtthQRWqpnau5heniqjtaB?=
 =?us-ascii?Q?VxW+PnihKhU+EiQ4g95RUFOHVWFFOPRo+hUt+5W9r3G31U+H26ztjtsmRSuV?=
 =?us-ascii?Q?ujJxiF2xdA/l+gaaZ4EYIS6+lkWCKS3odqMI7zwu59vLAzG2NZNq83lxWbhE?=
 =?us-ascii?Q?4bhajnLJkuDMUpiT6SCqj97TNyCTHhe0TstAX9bT1MQC+CBDuGj22hi37w3R?=
 =?us-ascii?Q?XVvvfH6qOrsaURgJP1H8IYy8Qeq/Dy5J/dAOQO5T3K1PCPbeV9Sfzsfcfvg2?=
 =?us-ascii?Q?Mz4axSYiubkHG4Ay35ONgiJiv8BJbKaDrtveJWQFC28ODOM0nJsQdhcGxroK?=
 =?us-ascii?Q?SoHriGR6NipldFzALHJiPytlFqqBk/vzY4f23DwbEDTdcYp00f0BAzBR/IKX?=
 =?us-ascii?Q?4lAyRW996ICnvKonaleJ21pFnLHKhdh4QP5tY78o/nT/oEZ6MXWi5GpHuvPr?=
 =?us-ascii?Q?wSiHXWB7KWjN4ZBEwXFfKmS6+WePLZqmbZn540caWLmlqiM1hgHLM8unJ6yR?=
 =?us-ascii?Q?v3JRPxIKz88AoEKJTvnuWewPSzcLgl8dLXm5UOMMWb09EPIe3sg+vKiDeEF/?=
 =?us-ascii?Q?JF4jiuPWu9MDvKT1zqz5Y+YXrdfXJBevcDtqFDk4M1sEHTUJw77wG7PbQwe5?=
 =?us-ascii?Q?duyxNbPxeBEpO6zTQefFdSXNHoCMOj1pjBfTe6VAvJl9+7oodEeLlR6ahsrX?=
 =?us-ascii?Q?+YvHCiGRegi1tupyxsXDJG+XbmH2v8k4Go+BKZCEiuRJtlePIw4+FQ+FbF5f?=
 =?us-ascii?Q?HoReR9ifXzcrS2hH5WZao0aPg8SU7OAaKdc7Mv8Y3ivCBdGyz4bjBb7rJNuF?=
 =?us-ascii?Q?ucpXglaiy8Rfssa5sUPbhbQ2rc0C7R4zaOxlSjumvQpEpSwGWuXxfof4/lS+?=
 =?us-ascii?Q?VO91qSakgLMnONn73SJDhYf8p4e3l0Z/0w0FMkdyBhuyEOgi5JXtrp7yeAmD?=
 =?us-ascii?Q?nR96onHT76cCgv4YCghLCP4K8PCMkJ+ukBXInIAf1ONpMaXkHdxxN/wzxZx/?=
 =?us-ascii?Q?vz/Dl4672MI9hhWrNUxWUup9X4vE4h7jZoIrJq8YmJRAVeslebOy2lgG6Sgz?=
 =?us-ascii?Q?u9L4VnFBCCZdSvszDnopnN436MfL1NzePxlQxZwz/ipv8rK7eeCRfHYnBKhu?=
 =?us-ascii?Q?6lJhufhfGzP5PVhv2DR1Y9MCUjIRoJEO869XYJkxgBnI8LxpizPiVtacZvHj?=
 =?us-ascii?Q?WMAUJ9YoaEQtT20PI0UT5+/8RkHzjz04rhWrxLV0ufcrv1BqJ4U6kekQw3xP?=
 =?us-ascii?Q?HE2ckxjvzB9xo5W2kgg5JI9zIzj863rSgURPZJleLT6jMEibmDjZmtCn74Xl?=
 =?us-ascii?Q?jlxbAr+jbhMVhFaqGPtRMe1Lkh3+B+3R1SNqXvqq/kNlsW3F2/TTOG0AWWto?=
 =?us-ascii?Q?Z/EqdPTIHR+mwIY/xy7DAIHxSOJyW6OpwfJS7+bIniBjHRjrRlLn0MxQ9HnB?=
 =?us-ascii?Q?9+U67t0Qu9VCvAkH5rt2zgqhVnKzavYwRVXkfe2msbfKhViFKKHyySxAG879?=
 =?us-ascii?Q?Q4jZ0Y4u7kX21xIN/sda+H3DKD9pm+dp9/uqAvncLjScZ74YKCyRvsQ3gcdU?=
 =?us-ascii?Q?uEc0W1gQRA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7994103-9df5-4c70-ad88-08defda54960
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 03:52:27.7311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YzHk8XiAAkHjUTl5eu6DQP2WDztI674mge+Q4TDrjsrpiiljBZ94/lQNDrQKBBnasiSch1EPe+LAFmWtJbb5zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6287

The r000 LOAD_EXEC events provide addresses for images that the driver
must copy into GSP Falcon IMEM and DMEM. The existing Falcon DMA path
creates its source buffer from a FalconFirmware object, so it cannot use
those addresses. The protocol also reports GSP RISC-V suspension through
MAILBOX0 bit 31 rather than CPUCTL.halted.

Add Falcon operations for DMA from event-provided addresses and for the
RISC-V suspend indication.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 136 +++++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs   |   2 +-
 2 files changed, 136 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 65cb12d26e2b..20a288050c37 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -133,12 +133,25 @@ pub(crate) enum FalconMem {
     /// Secure Instruction Memory.
     ImemSecure,
     /// Non-Secure Instruction Memory.
-    #[expect(unused)]
+    #[expect(dead_code)]
     ImemNonSecure,
     /// Data Memory.
     Dmem,
 }
 
+/// Source offset of a raw falcon DMA transfer, added to the DMA base address.
+#[expect(dead_code)]
+#[derive(Copy, Clone)]
+pub(crate) enum FalconDmaSrcOffset {
+    /// Byte offset from the DMA base address.
+    Offset(u32),
+    /// DMEM virtual address. The DMA engine also tags each loaded block with this value, so the
+    /// falcon reaches the data through its DMEM VA. The caller must bias the DMA base address so
+    /// that base plus this value addresses the first byte of the image. Only valid with
+    /// [`FalconMem::Dmem`].
+    DmemVa(u32),
+}
+
 bounded_enum! {
     /// Defines the Framebuffer Interface (FBIF) aperture type.
     /// This determines the memory type for external memory access during a DMA transfer, which is
@@ -592,6 +605,109 @@ fn dma_wr(
         Ok(())
     }
 
+    /// Perform a raw DMA transfer from a physical address to falcon IMEM or DMEM.
+    ///
+    /// Used by the GSP boot event handlers where the firmware provides the source
+    /// address directly (in GPU physical address space, routed through the FBIF
+    /// aperture). The caller must configure the FBIF TRANSCFG register
+    /// corresponding to `ctx_dma` before calling this method.
+    ///
+    /// A [`FalconDmaSrcOffset::DmemVa`] source offset also sets `DMATRFCMD.SET_DMTAG`, and
+    /// requires `target_mem` to be [`FalconMem::Dmem`].
+    ///
+    /// # Errors
+    ///
+    /// - `EINVAL` if `ctx_dma` is not a valid context DMA slot, if `src_addr` is not aligned to
+    ///   256 bytes, or if a [`FalconDmaSrcOffset::DmemVa`] source offset is paired with an IMEM
+    ///   target.
+    /// - `ERANGE` if `src_addr` does not fit the `DMATRFBASE` register pair.
+    #[expect(dead_code)]
+    pub(crate) fn raw_dma_transfer(
+        &self,
+        ctx_dma: u8,
+        src_addr: u64,
+        target_mem: FalconMem,
+        src: FalconDmaSrcOffset,
+        dst_offset: u32,
+        len: u32,
+    ) -> Result {
+        const DMA_LEN: u32 = num::usize_into_u32::<{ MEM_BLOCK_ALIGNMENT }>();
+        const NUM_CTXDMA_SLOTS: u8 = 8;
+
+        if ctx_dma >= NUM_CTXDMA_SLOTS {
+            dev_err!(self.dev, "raw DMA: ctx_dma {} out of range\n", ctx_dma);
+            return Err(EINVAL);
+        }
+
+        if src_addr % u64::from(DMA_LEN) > 0 {
+            dev_err!(
+                self.dev,
+                "raw DMA: source address {:#x} not 256B-aligned\n",
+                src_addr
+            );
+            return Err(EINVAL);
+        }
+
+        if src_addr >> 40 > u64::from(regs::NV_PFALCON_FALCON_DMATRFBASE1::BASE_MASK) {
+            dev_err!(
+                self.dev,
+                "raw DMA: source address {:#x} does not fit DMATRFBASE\n",
+                src_addr
+            );
+            return Err(ERANGE);
+        }
+
+        let (src_offset, set_dmtag) = match src {
+            FalconDmaSrcOffset::Offset(offset) => (offset, false),
+            // `SET_DMTAG` applies to DMEM only.
+            FalconDmaSrcOffset::DmemVa(_) if target_mem != FalconMem::Dmem => return Err(EINVAL),
+            FalconDmaSrcOffset::DmemVa(va) => (va, true),
+        };
+
+        let num_transfers = len.div_ceil(DMA_LEN);
+
+        self.bar.write(
+            WithBase::of::<E>(),
+            regs::NV_PFALCON_FALCON_DMATRFBASE::zeroed().with_base(
+                // CAST: `as u32` is used on purpose since we do want to strip the upper bits,
+                // which will be written to `NV_PFALCON_FALCON_DMATRFBASE1`.
+                (src_addr >> 8) as u32,
+            ),
+        );
+        self.bar.write(
+            WithBase::of::<E>(),
+            regs::NV_PFALCON_FALCON_DMATRFBASE1::zeroed().try_with_base(src_addr >> 40)?,
+        );
+
+        let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::zeroed()
+            .with_size(DmaTrfCmdSize::Size256B)
+            .try_with_ctxdma(u32::from(ctx_dma))?
+            .with_falcon_mem(target_mem)
+            .with_set_dmtag(set_dmtag);
+
+        for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
+            self.bar.write(
+                WithBase::of::<E>(),
+                regs::NV_PFALCON_FALCON_DMATRFMOFFS::zeroed().try_with_offs(dst_offset + pos)?,
+            );
+            self.bar.write(
+                WithBase::of::<E>(),
+                regs::NV_PFALCON_FALCON_DMATRFFBOFFS::zeroed().with_offs(src_offset + pos),
+            );
+
+            self.bar.write(WithBase::of::<E>(), cmd);
+
+            read_poll_timeout(
+                || Ok(self.bar.read(regs::NV_PFALCON_FALCON_DMATRFCMD::of::<E>())),
+                |r| r.idle(),
+                Delta::ZERO,
+                Delta::from_secs(2),
+            )?;
+        }
+
+        Ok(())
+    }
+
     /// Perform a DMA load into `IMEM` and `DMEM` of `fw`, and prepare the falcon to run it.
     fn dma_load<F: FalconFirmware<Target = E> + FalconDmaLoadable>(&self, fw: &F) -> Result {
         // DMA object with firmware content as the source of the DMA engine.
@@ -647,6 +763,24 @@ pub(crate) fn wait_till_halted(&self) -> Result<()> {
         Ok(())
     }
 
+    /// Wait until the GSP processor has suspended.
+    ///
+    /// The RISC-V GSP signals suspension by setting bit 31 (`0x8000_0000`) in `MAILBOX0`, rather
+    /// than through `CPUCTL.halted`.
+    #[expect(dead_code)]
+    pub(crate) fn wait_for_processor_suspend(&self) -> Result<()> {
+        const INTERRUPT_PROCESSOR_SUSPENDED: u32 = 0x8000_0000;
+
+        read_poll_timeout(
+            || Ok(self.read_mailbox0()),
+            |val| (*val & INTERRUPT_PROCESSOR_SUSPENDED) != 0,
+            Delta::ZERO,
+            Delta::from_secs(2),
+        )?;
+
+        Ok(())
+    }
+
     /// Start the falcon CPU.
     pub(crate) fn start(&self) -> Result<()> {
         match self
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 01fde2c5e5a6..5d265b5788e3 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -264,7 +264,7 @@ pub(crate) fn usable_fb_size(self) -> u64 {
     }
 
     pub(crate) NV_PFALCON_FALCON_DMATRFCMD(u32) @ PFalconBase + 0x00000118 {
-        16:16   set_dmtag;
+        16:16   set_dmtag => bool;
         14:12   ctxdma;
         10:8    size ?=> DmaTrfCmdSize;
         5:5     is_write => bool;
-- 
2.55.0

