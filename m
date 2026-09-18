Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010019.outbound.protection.outlook.com [52.101.193.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8993947A4
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 01:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693697; cv=fail; b=p5meLEPhJMK5aPvoJRs3R49oZdlpqQPbmSomUXCqN5WE828I4lI1tD0hqFdARxxoc9OWPwdgkN9LNuy7OI8uN5FB8sq13dZD+CWyIkvkPdcQqzlGiE5XALNCumEthYa4RGvRaUmGCuounKHFKfN854zA6P5j41v1MuO4aHbq0N4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693697; c=relaxed/simple;
	bh=KWv6O+4j27O8M77YkeX4PDZS40RNpgIu8y7Buhg7F34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O8uMi2febvoiUKAWEkRT9NCLpg5GG88N64WPaDptlmmFnJzD+xlI6BURk1+qlIFTkDcakmPQGhOV37XACgehIEsbzBSee+fQDZ0Np7JpbR3+ch+5KXEqqozr8S/JnJZacGggLV0H5yMSkTyD37fKX+txxN/1MvgGgdHI1H79cbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Wih+4YvX; arc=fail smtp.client-ip=52.101.193.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Wih+4YvX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jiwjxidNRoH7py6bDTglSx3pjPmVF7fjiR7NJo76zMwB8iGwPsbIXHsTLpBUAydMQbONk3376pug6AgWJ7P7cfkAama3LPHjkeOcZh8V1ZVd2oot8ddtR5mJOpvZIbUFAFPm9llrZzaY1mC5FLmBP2QEW77cLICEaw3QAWnsL7JqDa+YqUpTUqrY6o5mH3Mq1xuQDc9PkD9P9wqg8FaekXmTIHMvoKforrT699aR14W/Bu5OewSDXzUX43xbx/ChomCVgpdSklEqRlaMh+B0UZMIL82mXx7r2PNsasoC4g2Q7jpPWc1mt13Yk5L0E+xahaJ56szKFC1MpNVUkKvIqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BAh8DshN86gsARVBuO91wtn8T8nlDymymNUdEIqea5g=;
 b=YFK/qXOwx2Z5fNtF0dwhFMRoDGBm9+bDNrDhrMM8B8aIEQz5yWc3NPbA2W+SWhOw3o1sajW2/C4iGTnR0F7CavYHiRuM0bUVrlc1Yvwz9U0TlAXeKxZMCIarwRf2Lwntftxpg/yWaxPd4EoAPkGh7xY54OFau6L6bgVsb43Bbjq4N9aNM8KTZ7NW5ZQVnSiw/AhS1S7F50K8xOCvfVWbwelv/ny3CkG64zme0OH2O3VbBm/Efp2jwC39Iwb0Ts8duOlnLF4GNH/jwJJQpVIkjFDCZZFMyH2tJFyNzx+v093OQx4c5tMyJSRuNEONb+Oul2D2XZO84LiJ+1vsPrp83w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BAh8DshN86gsARVBuO91wtn8T8nlDymymNUdEIqea5g=;
 b=Wih+4YvX2Ko3ZQjfTw2fURq1MvtZafwk2TGmclKXHN0oE+wAybjVAhDW+OE1J7tpXomgHABLWfxL+BrVjW3cgVCFqVnXMSPzutpB+GABuW5NHoC+yQehlkNG+zPl3UMKmY+NtDI+3R2csTzTR/t9wtLMWZh+6l0BcW04FZkNw5uGP1hwDWy9RThs5oQKdtXVLi/ZuubOd03AWoGrirGTs8V/7Ff0CvJ/l7PVJj/1B9s1TIA1qWQeXZHlRZorrCZbTu8n8SVFrUTAa6rCOy2fbUafuCDuV/Yzb+kD7dyOhcjbiLFe1+hnb1C8BlriTaJecjLDG+qM9qwhge+VVt7+nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5888.namprd12.prod.outlook.com (2603:10b6:8:7b::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.13; Fri, 18 Sep 2026 01:07:43 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 01:07:43 +0000
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
Subject: [PATCH v3 15/33] gpu: nova-core: add the r000 load-and-execute HS binary handler
Date: Thu, 17 Sep 2026 18:07:01 -0700
Message-ID: <20260918010719.1176945-16-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918010719.1176945-1-jhubbard@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0023.namprd10.prod.outlook.com
 (2603:10b6:a03:255::28) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: 59a9ca1a-5ada-42e7-2c81-08df15213e74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|10067099003|3023799007|56012099006|6133799003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	KaC0SE243WQpQHFOMsFA4A0hJTCUGLfkg15CT3c6NQbsBp/pdlkjZdWRSwpqB0Nd8nkhYSUOn/aHnL2X7kfmG3Epsj/henneFqPKygRE0s8UgWdN2b6LIC5q2YtTvn4c0SxQEBGCo+ugZPeFdJKrtpdctWqBwBPQ6BXpGVzGp6zpJakUzSNA19aoC/y+Z4ARLiWoc0beygvOfUJuNPsBn7ZerfZ1QN48CK6G/qGyvUtpX+ajY0ib3QRqJuiTwGLgrk+3av1ko93CIYEX9Vot+X+UxHxYCGeGd5tK6/BZzevtKMERJLr/oOEExCYzgYroUqxFkJB1yFSwvwgXIOE409AbvQnmxPXjVv1Jx8PiOx29BwDigLIE8qJ6tcmH0aBLSEaaBciXiRUO2Hbgv4+iFk4zOHMedzdu5m5If+jS2j2Ng7bqPsqJrsDOVWaClfZyZ0QmlbvgBPLCMMiFWYyzOJ5OpxnrsOakCjO/F98lI7muvr9lIZ4KwgvFEYcLnBIjAAm1ncbWG+yTHZyq60CywbpwhRnQOe0J4cweNeTXrindFR0ImIcaQrZduknj3kBtxN7lrP/AwdldJyUWeGrJwgRCzyNtjGvIXCddY/B16sQ1h+5K4YkkGkSoiitg18tOITeYS2NR9ia/yEwu2wiQMnVpa+gz4T2fM8wmSNoMDSA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(10067099003)(3023799007)(56012099006)(6133799003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t+5PWf5oSVfrTy4MOHF+EIhnbG9n+cgH+GOMTKLPVVnNoqgZmWQ3SRs1ipcM?=
 =?us-ascii?Q?JRczTbXwXmyP4pOpTyc3z0CQla4uakw4/uFuOX8o+jog2okzKaE/Pwgl7caL?=
 =?us-ascii?Q?vpRCtqJZeZPnahGhFQHBrzsmKHKhvQY9QuBKSXN9f/mcpzzQ+6z1P8fPns7q?=
 =?us-ascii?Q?cl3mZQfP+gIL79J0dzJwrI3YtMWYVLv+LwZRTKdXwQAcKfJj6DG5DhJliwbu?=
 =?us-ascii?Q?RT8wCbD/IOOuHgIjJkoX+WWYBJIHGfsGBQD9OU869N0YSkVjePL09JnvUsTo?=
 =?us-ascii?Q?cPal0sa7B6xPrkCdvTHwgW+8qHv+dVsigR0HphwalaD4VUHFpmG3fPtiHQ1q?=
 =?us-ascii?Q?MJpi/YmqIw7h6nD6E37LFqS4gYmhYMu+g1/zq4y2pJGa42+lXYR5MjUKKVuq?=
 =?us-ascii?Q?hi953ohyO3Ic1r06LZLm6tSGvxyuSzZUo8mhY3FO0zmWwX4AoTRW26y1mB5A?=
 =?us-ascii?Q?X6X6n4Btx4LAvutTubRxsN44oMyFo3DGq4k35fiWMMG9nq67rwRPh/Wqhnun?=
 =?us-ascii?Q?edR/fXAVxtoabT084kq3Eo4PV2YixiCwGrsmYvkiLm9C5N9c6nHhqs08p5tc?=
 =?us-ascii?Q?l6MWqBXHKghJKC9s1daVGFD/Y5VAOI/CDjmrDBiJ5kJ0O8GA1IRVqnG+NKYD?=
 =?us-ascii?Q?ldO+PNsCY9mRosyR/3k4sPhGEOTzKnsr3bdTzhZRGb/uXOUUbiWtAwmqqJhg?=
 =?us-ascii?Q?7KvrMEFnTEfAa0wkesnwhgyF1u2ER4PKMUwh7WX1amvjBzQwGS/mMeTT+Gpt?=
 =?us-ascii?Q?3ZBRoPEmBfQHd4G0mk9x7Q9HerTETipLTYfTvI2ZQkCS0dv7PgxQeLDcFoLs?=
 =?us-ascii?Q?/+VSuMttfpMH2PTyfYjvPMFSv5gh/OmUfk+wmgD9QgGTgKcUzu85JXVejUlf?=
 =?us-ascii?Q?LXuw2Lq9KJXvXgokMEUfPSHX9lfQNfdr70SRJoNol1lq1SVyg+SWeumajIJf?=
 =?us-ascii?Q?QxqaEeKk2l39cbDkQBuF/1Bskzh3GyDnTPbmq0vIMO7pVYaNiLP4cn/PVFFE?=
 =?us-ascii?Q?nXFqAzxh8Xw6vvUwW3DedLJGzTQIWHZg2wyple8wZKGzzKonIibIcHBJzY3Z?=
 =?us-ascii?Q?MVKosHJ1LWq+55OD0+g5v8GI0hbXIC5xgoVQeUYzrV+6uqlSwnO2UaOH6r7B?=
 =?us-ascii?Q?Qlbb8+RY7A8cYpzq1ox35yU3azCo0dP2pTB75+SL8s4WZaCSqz8HWxwqPSEw?=
 =?us-ascii?Q?ORnJE1sSEkAxZ4XzzXbCcrMMT0osYpsXrqClOHHu4mtsEb9m+goOAnP+QVwH?=
 =?us-ascii?Q?3LD81HmyBH4I8yw7LzFwp13aRp+5H2VVTzmYPSKLMZu6ZHBViHzWhevGBUwE?=
 =?us-ascii?Q?D4Q5Bg2bvavg/ACsTCT3f0zQrRAqw5uEoDM7RiQaxtCBirrioyCjDI8RFwue?=
 =?us-ascii?Q?kDhkmWWFz6SvIyvIgxveemKDVUgDbeG31q/FGwCtWV90zhNGj6DQOC+RLavr?=
 =?us-ascii?Q?iBhaPvFtfBtxscYPeN6G8nay+PUsSYMAuITRiENroRCs89NQ1NYmTYdJUDPh?=
 =?us-ascii?Q?EOvUyr+e3fiRI2zcqQPs6jU0UM1dGwvUmhvjXE5xXH8/kb2WJj05Zj47Vkae?=
 =?us-ascii?Q?YeYh3VmHx3o+YtJMAG30XseSg2XZgsdHXLY7uySV1EukBtfXYtYlLpDs1hs6?=
 =?us-ascii?Q?urZcUhhqvUBguTu1vAb6gFbdM/MFmQPgoAFL/wUBBbCrJ6EABunaLc2QEDFQ?=
 =?us-ascii?Q?IhmJlNXsrNcboYvEjAeaLUVgPIQEL3W9XXM2BQ8dc6d4iDoelCl23npk1QwB?=
 =?us-ascii?Q?yJMXZTFrEQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59a9ca1a-5ada-42e7-2c81-08df15213e74
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:07:43.7792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pauBsduiwD+La3VVhmJfvMO2wObr2fV6gDXiKL2B38/WE/aGgqRfORho4unNmFxNLZn35ZvytAgHmJ+IJm7Wpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5888

On GA102 and later, GSP-RM sends the driver a load-and-execute event
during boot that requests the driver to run a Heavy-Secured (HS) binary
on the GSP falcon. GSP-RM has placed the binary in the framebuffer, and
the event carries the binary's addresses. Once the binary has halted,
SEC2 restarts GSP-RM, in what Open RM calls the core resume.

Add the handler and the core resume. The handler copies the binary into
the falcon through an FBIF (framebuffer interface) aperture that it
programs for the load, starts the binary and waits for it to halt.

Put the falcons, the device and the boot parameters that the handler and
the core resume share into one context struct.

Assisted-by: LLM
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs     |  51 +++++-
 drivers/gpu/nova-core/falcon/gsp.rs |  10 +-
 drivers/gpu/nova-core/gsp/boot.rs   | 257 +++++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs       |   2 +
 drivers/gpu/nova-core/sbuffer.rs    |   1 -
 5 files changed, 311 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 2a0fe86153aa..8ad28dce955e 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -44,6 +44,10 @@
 /// Alignment (in bytes) of falcon memory blocks.
 pub(crate) const MEM_BLOCK_ALIGNMENT: usize = 256;
 
+/// `MAILBOX0` value that means "the falcon binary has not started". A binary that runs replaces
+/// it with its own status.
+pub(crate) const FLCN_ERR_BINARY_NOT_STARTED: u32 = 0xfe;
+
 /// DMEM virtual address value that means "no virtual address assigned".
 const FLCN_DMEM_VA_INVALID: u32 = 0xffff_ffff;
 
@@ -156,7 +160,6 @@ pub(crate) enum FalconDmaSrcOffset {
 impl FalconDmaSrcOffset {
     /// Returns the source offset of a DMEM image at virtual address `dmem_va`, or the start of the
     /// source when `dmem_va` is `FLCN_DMEM_VA_INVALID`.
-    #[expect(dead_code)]
     pub(crate) fn from_dmem_va(dmem_va: u32) -> Self {
         if dmem_va == FLCN_DMEM_VA_INVALID {
             Self::Offset(0)
@@ -192,6 +195,17 @@ pub(crate) enum FalconFbifMemType with From<Bounded<u32, 1>> {
     }
 }
 
+bounded_enum! {
+    /// Engine ID that the falcon's framebuffer interface (FBIF) tags a DMA transfer with.
+    #[derive(Debug, Copy, Clone)]
+    pub(crate) enum FalconFbifEngineIdFlag with From<Bounded<u32, 1>> {
+        /// The BAR2 engine ID of PCI function 0.
+        Bar2Fn0 = 0,
+        /// The falcon's own engine ID.
+        Own = 1,
+    }
+}
+
 const PFALCON_REGION_SIZE: usize = SZ_4K;
 const PFALCON2_REGION_SIZE: usize = SZ_4K;
 
@@ -394,7 +408,7 @@ pub(crate) struct Falcon<'a, E: FalconEngine> {
     bar: Bar0<'a>,
     // TODO: make private
     pub(crate) pfalcon: Mmio<'a, PFalconRegisters>,
-    pfalcon2: Mmio<'a, PFalcon2Registers>,
+    pub(crate) pfalcon2: Mmio<'a, PFalcon2Registers>,
 }
 
 impl<'a, E: FalconEngine + 'static> Falcon<'a, E> {
@@ -628,6 +642,37 @@ fn dma_wr(
         Ok(())
     }
 
+    /// Programs FBIF context DMA slot `ctx_dma` with the value that `configure` returns, runs `f`,
+    /// and restores the slot once `f` has returned `Ok`.
+    ///
+    /// The slot keeps the programmed value if `f` fails, since a falcon that `f` started and that
+    /// has not halted may still be reading through the aperture.
+    ///
+    /// # Errors
+    ///
+    /// - `EINVAL` if `ctx_dma` is not a context DMA slot that the falcon has.
+    ///
+    /// Errors from `f` are propagated as-is.
+    pub(crate) fn with_fbif_transcfg<R>(
+        &self,
+        ctx_dma: u32,
+        configure: impl FnOnce(regs::NV_PFALCON_FBIF_TRANSCFG) -> regs::NV_PFALCON_FBIF_TRANSCFG,
+        f: impl FnOnce() -> Result<R>,
+    ) -> Result<R> {
+        // The location type is not `Copy`, so each register access builds its own.
+        let transcfg =
+            || regs::NV_PFALCON_FBIF_TRANSCFG::try_at(usize::from_safe_cast(ctx_dma)).ok_or(EINVAL);
+
+        let saved = self.pfalcon.read(transcfg()?);
+        self.pfalcon.update(transcfg()?, configure);
+
+        let result = f()?;
+
+        self.pfalcon.update(transcfg()?, |_| saved);
+
+        Ok(result)
+    }
+
     /// Transfers `len` bytes from `src_addr` into this falcon's `target_mem`.
     ///
     /// `src_addr` is a GPU physical address reached through the FBIF aperture, so the caller must
@@ -639,7 +684,6 @@ fn dma_wr(
     ///   not 256-byte aligned.
     /// - `ERANGE` if `src_addr` does not fit the `DMATRFBASE` register pair.
     /// - `EOVERFLOW` if a per-block source or destination offset exceeds `u32`.
-    #[expect(dead_code)]
     pub(crate) fn raw_dma_transfer(
         &self,
         ctx_dma: u32,
@@ -788,7 +832,6 @@ pub(crate) fn is_processor_suspended(&self) -> bool {
     /// # Errors
     ///
     /// - `ETIMEDOUT` if the core has not suspended within two seconds.
-    #[expect(dead_code)]
     pub(crate) fn wait_for_processor_suspend(&self) -> Result {
         read_poll_timeout(
             || Ok(self.is_processor_suspended()),
diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
index dfa08bc6867c..70f7d55f9b59 100644
--- a/drivers/gpu/nova-core/falcon/gsp.rs
+++ b/drivers/gpu/nova-core/falcon/gsp.rs
@@ -115,15 +115,19 @@ pub(crate) fn retrigger_intr(bar: Bar0<'_>, chipset: Chipset) {
 }
 
 impl<'a> Falcon<'a, Gsp> {
-    /// Checks if GSP reload/resume has completed during the boot process.
-    pub(crate) fn check_reload_completed(&self, timeout: Delta) -> Result<bool> {
+    /// Waits until the Boot Sequence Interface (BSI) reports that the GSP reload has completed.
+    ///
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if the reload has not completed within `timeout`.
+    pub(crate) fn check_reload_completed(&self, timeout: Delta) -> Result {
         read_poll_timeout(
             || Ok(self.bar.read(regs::NV_PGC6_BSI_SECURE_SCRATCH_14)),
             |val| val.boot_stage_3_handoff(),
             Delta::ZERO,
             timeout,
         )
-        .map(|_| true)
+        .map(|_| ())
     }
 
     /// Returns whether the RISC-V branch privilege lockdown bit is set.
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 8518248c9732..3cfb21964250 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -2,24 +2,230 @@
 // SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
 use kernel::{
-    io::poll::read_poll_timeout,
+    device,
+    io::{
+        poll::read_poll_timeout,
+        register::Array,
+        Io, //
+    },
     prelude::*,
     time::Delta,
+    transmute::{
+        AsBytes,
+        FromBytes, //
+    },
     types::ScopeGuard, //
 };
 
 use crate::{
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
+        FalconModSelAlgo,
+        FLCN_ERR_BINARY_NOT_STARTED, //
     },
     firmware::gsp::GspFirmware,
     gsp::{
         cmdq::Cmdq,
         commands, //
     },
+    regs,
+    sbuffer::SBufferIter, //
 };
 
+/// The falcons, device and boot parameters that the load-and-execute event handlers share.
+struct LoadExecContext<'a, 'gpu> {
+    gsp_falcon: &'a Falcon<'gpu, Gsp>,
+    sec2_falcon: &'a Falcon<'gpu, Sec2>,
+    dev: &'a device::Device,
+    /// GSP bootloader application version.
+    bootloader_app_version: u32,
+    /// DMA address of the LIBOS init arguments.
+    libos_dma_handle: u64,
+}
+
+impl LoadExecContext<'_, '_> {
+    /// Waits until GSP-RM has suspended the RISC-V core, then resets the GSP falcon and its DMA
+    /// registers.
+    ///
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if the core has not suspended within two seconds.
+    ///
+    /// Errors from the falcon reset are propagated as-is.
+    fn reset_gsp_falcon_after_suspend(&self) -> Result {
+        let Self {
+            gsp_falcon, dev, ..
+        } = *self;
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
+        gsp_falcon.dma_reset();
+
+        Ok(())
+    }
+
+    /// Runs the core resume, in which SEC2 restarts GSP-RM after a load-and-execute binary has
+    /// halted on the GSP falcon.
+    ///
+    /// # Errors
+    ///
+    /// - `EIO` if SEC2 reports a failure, or if the GSP is not running RISC-V afterwards.
+    /// - `ETIMEDOUT` if SEC2 does not complete the reload within two seconds.
+    fn core_resume(&self) -> Result {
+        let Self {
+            gsp_falcon,
+            sec2_falcon,
+            dev,
+            ..
+        } = *self;
+
+        gsp_falcon.reset()?;
+
+        gsp_falcon.write_mailboxes(
+            Some(self.libos_dma_handle as u32),
+            Some((self.libos_dma_handle >> 32) as u32),
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
+        gsp_falcon.write_os_version(self.bootloader_app_version);
+
+        if !gsp_falcon.is_riscv_active() {
+            dev_err!(dev, "GSP RISC-V not active after core resume\n");
+            return Err(EIO);
+        }
+
+        Ok(())
+    }
+
+    /// Runs a Heavy-Secured (HS) binary on the GSP falcon, as a `GMCAPI_CMD_EXEC_HS_BINARY` event
+    /// requests, and then restarts GSP-RM.
+    ///
+    /// GSP-RM has placed the binary in the framebuffer, and the falcon's boot ROM (BROM) verifies
+    /// the binary's signature before the binary runs.
+    ///
+    /// # Errors
+    ///
+    /// - `EINVAL` if the payload is shorter than the parameter block, or the ucode id does not
+    ///   fit the BROM register field.
+    /// - `ETIMEDOUT` if the RISC-V core does not suspend within two seconds, or the GSP falcon does
+    ///   not halt within two seconds of starting the binary.
+    ///
+    /// Errors from [`Self::core_resume`] are propagated as-is.
+    #[expect(dead_code)]
+    fn handle_load_exec_hs_binary(&self, payload_0: &[u8], payload_1: &[u8]) -> Result {
+        let Self {
+            gsp_falcon, dev, ..
+        } = *self;
+        let params = read_params::<HsBinaryParams>(payload_0, payload_1)?;
+
+        self.reset_gsp_falcon_after_suspend()?;
+
+        gsp_falcon.with_fbif_transcfg(
+            HsBinaryParams::CTX_DMA,
+            |v| {
+                v.with_target(FalconFbifTarget::LocalFb)
+                    .with_mem_type(FalconFbifMemType::Physical)
+                    .with_engine_id_flag(FalconFbifEngineIdFlag::Bar2Fn0)
+            },
+            || {
+                if params.ucode_imem_size > 0 {
+                    gsp_falcon.raw_dma_transfer(
+                        HsBinaryParams::CTX_DMA,
+                        params.imem_phys_addr,
+                        FalconMem::ImemSecure,
+                        FalconDmaSrcOffset::Va(params.ucode_imem_va),
+                        params.ucode_imem_pa,
+                        params.ucode_imem_size,
+                    )?;
+                }
+
+                if params.ucode_dmem_size > 0 {
+                    gsp_falcon.raw_dma_transfer(
+                        HsBinaryParams::CTX_DMA,
+                        params.dmem_phys_addr,
+                        FalconMem::Dmem,
+                        FalconDmaSrcOffset::from_dmem_va(params.ucode_dmem_va),
+                        params.ucode_dmem_pa,
+                        params.ucode_dmem_size,
+                    )?;
+                }
+
+                gsp_falcon.pfalcon2.write(
+                    Array::at(0),
+                    regs::NV_PFALCON2_FALCON_BROM_PARAADDR::zeroed()
+                        .with_value(params.hs_sig_dmem_addr),
+                );
+                gsp_falcon.pfalcon2.write_reg(
+                    regs::NV_PFALCON2_FALCON_BROM_ENGIDMASK::zeroed()
+                        .with_value(params.engine_id_mask),
+                );
+                gsp_falcon.pfalcon2.write_reg(
+                    regs::NV_PFALCON2_FALCON_BROM_CURR_UCODE_ID::zeroed()
+                        .with_ucode_id(u8::try_from(params.ucode_id).map_err(|_| EINVAL)?),
+                );
+                gsp_falcon.pfalcon2.write_reg(
+                    regs::NV_PFALCON2_FALCON_MOD_SEL::zeroed().with_algo(FalconModSelAlgo::Rsa3k),
+                );
+
+                gsp_falcon.pfalcon.write_reg(
+                    regs::NV_PFALCON_FALCON_BOOTVEC::zeroed().with_value(params.ucode_imem_va),
+                );
+
+                let (mbox0, _) = gsp_falcon
+                    .boot(Some(FLCN_ERR_BINARY_NOT_STARTED), None)
+                    .inspect_err(|_| {
+                        dev_err!(
+                            dev,
+                            "Timeout waiting for HS binary to halt (mbox0={:#x})\n",
+                            gsp_falcon.read_mailbox0()
+                        );
+                    })?;
+                dev_dbg!(dev, "HS binary halted with mbox0={:#x}\n", mbox0);
+
+                Ok(())
+            },
+        )?;
+
+        self.core_resume()
+    }
+}
+
 impl<'gsp> super::Gsp<'gsp> {
     /// Attempt to boot the GSP.
     ///
@@ -140,3 +346,50 @@ pub(crate) fn unload(
         res.inspect(|()| dev_info!(dev, "GSP successfully unloaded\n"))
     }
 }
+
+/// Reads the parameter block of type `T` from the start of an event payload, which the ring may
+/// have split in two.
+///
+/// # Errors
+///
+/// - `EINVAL` if the payload is shorter than `T`.
+fn read_params<T: FromBytes + AsBytes + Zeroable>(payload_0: &[u8], payload_1: &[u8]) -> Result<T> {
+    let mut params = T::zeroed();
+
+    SBufferIter::new_reader([payload_0, payload_1]).read_exact(params.as_bytes_mut())?;
+
+    Ok(params)
+}
+
+/// Payload of a `GMCAPI_CMD_EXEC_HS_BINARY` event.
+///
+/// GSP-RM has written the code to `imem_phys_addr` and the data to `dmem_phys_addr` in the
+/// framebuffer before it sends the event.
+#[repr(C)]
+#[derive(Debug, Copy, Clone, Zeroable)]
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
+impl HsBinaryParams {
+    /// Context DMA slot through which the binary is loaded.
+    const CTX_DMA: u32 = 0;
+}
+
+// SAFETY: This struct only contains integer types for which all bit patterns are valid.
+unsafe impl FromBytes for HsBinaryParams {}
+
+// SAFETY: This struct only contains integer types, laid out without padding.
+unsafe impl AsBytes for HsBinaryParams {}
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index feb37de69be5..ec8e05dc3351 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -18,6 +18,7 @@
         DmaTrfCmdSize,
         FalconCoreRev,
         FalconCoreRevSubversion,
+        FalconFbifEngineIdFlag,
         FalconFbifMemType,
         FalconFbifTarget,
         FalconMem,
@@ -286,6 +287,7 @@ pub(crate) fn usable_fb_size(self) -> u64 {
     }
 
     pub(crate) NV_PFALCON_FBIF_TRANSCFG(u32)[8] @ 0x00000600 {
+        16:16   engine_id_flag => FalconFbifEngineIdFlag;
         2:2     mem_type => FalconFbifMemType;
         1:0     target ?=> FalconFbifTarget;
     }
diff --git a/drivers/gpu/nova-core/sbuffer.rs b/drivers/gpu/nova-core/sbuffer.rs
index 3a41d224c77a..b8c01104c255 100644
--- a/drivers/gpu/nova-core/sbuffer.rs
+++ b/drivers/gpu/nova-core/sbuffer.rs
@@ -146,7 +146,6 @@ fn get_slice(&mut self, len: usize) -> Option<&'a [u8]> {
 
     /// Ideally we would implement `Read`, but it is not available in `core`.
     /// So mimic `std::io::Read::read_exact`.
-    #[expect(unused)]
     pub(crate) fn read_exact(&mut self, mut dst: &mut [u8]) -> Result {
         while !dst.is_empty() {
             match self.get_slice(dst.len()) {
-- 
2.55.0

