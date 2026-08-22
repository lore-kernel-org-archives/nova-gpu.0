Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010046.outbound.protection.outlook.com [52.101.56.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA859284B2F
	for <nova-gpu@lists.linux.dev>; Sat, 22 Aug 2026 01:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787363723; cv=fail; b=c3cyViCGs9y+wfU+oCSgxcxks6KDPvlkynlKoIF7Y2GD6Ns1UxbHh9TpjdhVzBEtXpBwcAe0yOr4hcNIVCx55kBiIHMlgocPbMDzawcNLWe5wsMRDzMVqs2iB87OdfeAnqKT7C4iQp+KKEMBYRdNhJT0zfPRhGR9kC11Kobtx1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787363723; c=relaxed/simple;
	bh=CtrwGIiR4eNjHUdfzoLawLVw1g8fr3HqezPEZRQ6RWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s+hpjezCcdSWEBtGdZBf23xhaLn/NS+ndPKvOK7e60rPJGl3hY6K5Ie6HMGMp/phYjRBmiv+o49xuZF9Kpxt+HTQsLfEHzrEFPbAOEW58vKMxUB+iLcJGTd3pzroNBFVMz9cMhgItpGRQvjo4cYpmNJ0fz7t2YwP/qUBi0Yi7OU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hQNXwJXj; arc=fail smtp.client-ip=52.101.56.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hQNXwJXj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aJpnzcqyQCNk+eNR8dqnyLP6mC7LC/6tqj3rghgWONYf/LU26MgXRuMoFcqSMfDvYAb1ZxHtrJzp4jbazkbMftEmDqYScTjSfv8sGLQTHq2hinbVYPtQ+q8xwT6E52SWhykotcByQtX90nCGbJUOo+8iKCApWrbjsyNXqRwclhfmPi96MqSiWY4LdmDbk0+cJVDashB+SrQJDPJLicvacNefd+EPkHN6VxGJ6R5B/PNb1gdJVpxQ8QkaVwxDKiKiX35dME0bjqOk8kQkheFy0XODT8YJNtxER6XEPsizL9bLQ6CSgnGcqwY1YughzdmUYvbGrBr/dQHNminOc5pPug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bTyN7QkCFJBcPC7sqfmWmL8Xnc5ACV5f2pJfyFBo3pk=;
 b=YPvzt42XKqxQGft8J0sSWUNzCKPaMiXyKFS/oGPoyiZbSIqAJ85JGmxje9SuWfTCTzxFlz52zgmjl/R+9HSLlJ6lDBf5lg8gcEv6Omn6t8uH2kqibK5IXhsHqP+ak/bmSqJBJEVdx/2ELv49OAt8hAm513lbJOtI9qup9MYSHY0UuGOhnvJ6HvSQ2K1tvTUG9PznWYHXUXCrK2ysLMQRFdl5Y7x+afpDuALKXIviucQ9kFATHqqbvEKSs8tCQB1IqH4kn4AatooIvmtQJkn2R9Gi+DdQdhUeOIng0/PC0i6W3UZOVZBaXkLDO3uqiWNCrTHMNDfIYVerkWgGGIy0mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTyN7QkCFJBcPC7sqfmWmL8Xnc5ACV5f2pJfyFBo3pk=;
 b=hQNXwJXj3YnrA7FgpcwLmIrn92w29CBnauwr5IvRc8p3pQCuqW4Swi2tLke7cQ2ON19xraRPZzexGlFD/uquRZXjYiAgXAkWuoGzubm4mBzLl3X9NOkTkMlSqngRsKMyDjL3GnNcNy97198FmnzxQdG8gX1qjxWp8GUu6LEkLpIkjlr7OBZdU81ZwdG/ep7le/pn2hXZwVT9cUx5ynAGpkrIlDlfydOzHFxnpSoHrNEU+pHYAY/vGsd0AkxYhFZxREzQp1AW45Hi5HIMqYlseku9OCHps6PA55iPfZGDvekxG9pFQd+Z+DDIjaMDkUYcYlw8MzR4mGa/CdcLxm9c1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB5834.namprd12.prod.outlook.com (2603:10b6:208:379::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sat, 22 Aug
 2026 01:55:11 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.010; Sat, 22 Aug 2026
 01:55:11 +0000
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
Subject: [PATCH v2 05/31] gpu: nova-core: add Falcon helpers for r000 LOAD_EXEC events
Date: Fri, 21 Aug 2026 18:54:22 -0700
Message-ID: <20260822015448.238214-6-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822015448.238214-1-jhubbard@nvidia.com>
References: <20260822015448.238214-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0012.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::17) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB5834:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f43778c-cd86-4301-94cc-08defff0668f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|3023799007|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	uftFViDA9vIKQ6amuEemd6b9tGbHRlFNa8/L9+6pet8l8L4OaewC1fOXNik/2rpDf2n18znrIIBxmFV+7i6YU591oEjpU4+92g0eVClPBjFHI1x4kKc9ArlQGFOIwfXMOEZeI3ruhYRNuv6BIXxAsMUFEpVwgBjx04nkPeoQJ2/W7LrKkVIffn16AiDbi+VEfUEXoDTF9EHrjc3wZ9Xc8tkF/zGPvPO04xdDk3+tO4Kr7g0MVN2FwP94tJqpFqa5ZzpvBtSQX7rmGDkHxg2BxC1Pzq4xJ79kZX9kJgPNHihsHR8t+JKzcneiQl/6jy/wggmShfCr4YdlXjO5hCMhQItwcqgEFs+e8H+kJuV7WnrVxoHL3jsxKlcKWdM0KKocn0C9D2vAM4cAlfoXZ3Ckm3hAoxp3V1/aPWXzFygwrDxjmYzlXgr4nmfyLcaqARrlqfvOZmRQgJtkrxFYZjEzqhQFuZuTOHfV/9O1elxwWqrcWTHaF7d26oTpHR+q2C8VHhA5SJ+qYcDRbeKuSa2DtgjS/pdDHZaiSMRIp0FbrjVCmlrn+f/XZGpfBKz1QcoAQFk6PGa+vE7CUKjmVlQphYZSLxhnbRIbYtNgGYl1niFOBwc3KYiIeoRhTQY+XV4CCw7y5mlsUGM4FkCjXvknv5+ZngVHveo+uA/g1N7nAUU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(3023799007)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Pb4p+pkWGCYPcmtGKOB/pQPkkf6AimbKEwkeew0yugSsO4Znt2A1pTNV1M7H?=
 =?us-ascii?Q?IV1Jv6WnI8oFIQzpbH5YnviAW7ElK1Bw1TPa/G6XboP19YveC4/vFIKYrxHa?=
 =?us-ascii?Q?F4PSt6DioQSiAaNfJwWQcL5wJ7//jeoufkaxFGqeybhCtoNmbss+NRuDYT6S?=
 =?us-ascii?Q?7zR45wq3vb22vWiOxm0VkijI7XqgQIjngVIhBeuGOahcR0h55aUaq+W2Djyn?=
 =?us-ascii?Q?cDzPUnEx2cSwlczM5SL3jcxcqawGBx8gJq3hU2DeP5/Qi6YqaEuzWKQMatL8?=
 =?us-ascii?Q?BDDr8DNFI94/xUoe3WL2XUOmUN89URMnG2TwHZQFcLyE1fWkqopn3u0YEkCY?=
 =?us-ascii?Q?OZv0+LhAzfQvPRK4EjIWyXG47lfK/PwIT0IDsI/umDI7v7wcf/gC89+YM3aE?=
 =?us-ascii?Q?nhD4AR1kOzZtUrsc4cJP63jtqttVk2XDFJU0fAFdQkRfCOfiKyCSnwRkfW2E?=
 =?us-ascii?Q?UFazuaRa7C37VFXgLHxMSFvcE7wxozaPil/dh9SH//zFjG4aMeQkeSppM/Xt?=
 =?us-ascii?Q?2VrJL9N7sB7FweOAzasMAjMx9mVn8SbbFyn+tzD9sHLHTXGXaJCwDzJH3lZQ?=
 =?us-ascii?Q?YoMQluGYYo8dJWBHyqldWEtJ3qLbcy+3zViNPhaKBxWX5oVtXqbAykx2yS+m?=
 =?us-ascii?Q?cgi3HypsoVq1FOGKV5G5z+36TE7MHYZhDeahJJstEDPeH7rVH/NnHTW3URaZ?=
 =?us-ascii?Q?k6LaqBSduDbRpt5r6ucoL6ys8sYvOhNUAYnndOZ+4E82tF6cncVW1Twb0u7A?=
 =?us-ascii?Q?2dJP2IG5W89Somaaxby6AxreC5PiQBnnsuAyQWpc7AIl5Vr9WEtjm7e7KXaK?=
 =?us-ascii?Q?GklySLhbNIo0G54qenF+aQgwoXPJmg5uGJnaTw3ighabzfdJZbHUHSL5peat?=
 =?us-ascii?Q?s1VAlgDfuqYwDr6RxvV/ZdVFkgifIqHbYOjQXZYritfzHnZT8Mht6+u9+vfo?=
 =?us-ascii?Q?kKxEpz2seAnJ20Gwcfw2gOOAWz7sYZs5V2Nvcu08X7M7COYPDXF9b/uP9HS6?=
 =?us-ascii?Q?IxH5Ox333uegHgnb3L3s1NpgwXbz9neqgZylB7lZhMSigf31QELHJ/hUzzpc?=
 =?us-ascii?Q?eTy5EGvZvoqJVpYRn3Ai7pEf2HbHEI2XJf49fJCOiV/rotp9t5ATgWWDhyp1?=
 =?us-ascii?Q?gA4pFH/qdI+jj9KU1ZJiz4JU00O0P/Qnd2yQAmspHG9dkxslOJlCexUbEOTI?=
 =?us-ascii?Q?bQI/3DzYQtlsMByZFt4+Y6KMduigyFIv8HRZuRyHIRYouaEpbCO/r9gRxu9p?=
 =?us-ascii?Q?IiPKh8Ybz2Bj3Iw2gpSpoluAzJb0AxhMP3+5CHBog0jZ4caLLkOJgBVy4V0q?=
 =?us-ascii?Q?Xo131IVAXueZp1/phmYDfLhH4mjJrpMXY+YYPOZYZYyI4H4367cxVZujBcTT?=
 =?us-ascii?Q?gf8/dICqq9QK5LAX/7kRGQ3zlrET2rHQEHcGeiJc1Yp5btLxiW98IWC5noIf?=
 =?us-ascii?Q?oBVeYtV4TWwjb4LJWlB3U2VkMezqlCCy83OzeNdsTkmE4r8wRmo807fJdaPy?=
 =?us-ascii?Q?MpmIgRU+8dv8TzJ3o36b0CBO8mlMjuG1wpZHwMa3KTNrJC3eTrs1UtaE5YEJ?=
 =?us-ascii?Q?tsIITxiZa2Dy3JGFhB8rsWEG9r1HzPG4l/1UdJYcI0/epbs2Qfn7KUtxTpQ/?=
 =?us-ascii?Q?WIVZ/Z8sl5jERLt53i7xopBO+bPn3daZbgnRe9NclczoTrBPSYmwLD6VOI47?=
 =?us-ascii?Q?z9FI9boXqMjKvPaNCe5wBHFKUx1Q0ytukNUvYQ7BAeAA2ss6w39b8OKDK33p?=
 =?us-ascii?Q?u8kfTZpGAw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f43778c-cd86-4301-94cc-08defff0668f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 01:55:11.5075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bpLQoyvDoRujwHsetxKlRz9SQKTL+CruSXGPMiJ6o6u5DrsBMd2gUIhoCiDXOg+SVmLVJObeBlGnV8fXyAHo5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5834

The r000 LOAD_EXEC events provide addresses for images that the driver
must copy into GSP Falcon IMEM and DMEM. The existing Falcon DMA path
creates its source buffer from a FalconFirmware object, so it cannot use
those addresses. The protocol also reports GSP RISC-V suspension through
MAILBOX0 bit 31 rather than CPUCTL.halted.

Add Falcon operations for DMA from event-provided addresses and for the
RISC-V suspend indication.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 139 +++++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs   |   2 +-
 2 files changed, 139 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 65cb12d26e2b..249d440c14c5 100644
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
@@ -592,6 +605,112 @@ fn dma_wr(
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
+    /// - `EOVERFLOW` if a per-block source or destination offset exceeds `u32`.
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
+                regs::NV_PFALCON_FALCON_DMATRFMOFFS::zeroed()
+                    .try_with_offs(dst_offset.checked_add(pos).ok_or(EOVERFLOW)?)?,
+            );
+            self.bar.write(
+                WithBase::of::<E>(),
+                regs::NV_PFALCON_FALCON_DMATRFFBOFFS::zeroed()
+                    .with_offs(src_offset.checked_add(pos).ok_or(EOVERFLOW)?),
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
@@ -647,6 +766,24 @@ pub(crate) fn wait_till_halted(&self) -> Result<()> {
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

