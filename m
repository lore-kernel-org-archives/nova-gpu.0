Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012064.outbound.protection.outlook.com [52.101.53.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D31137F8AF
	for <nova-gpu@lists.linux.dev>; Sat,  8 Aug 2026 03:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786158694; cv=fail; b=SGhhnU6LS7KLhcJOQ1dSU59gu+vh6ZZTZG+CRQ+gXpp0aO+pg2jqe4Ioq+2yjq4/QZNnz8OpZsXngs8bHRHDvEWaCVOIB9JEELNt6PF/rwvwEVrp4EscMX+PFdYc+m6NleaqTBtQZyDmpoDu8dXcSvaGKJpDsdOlBsgUo0GAsNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786158694; c=relaxed/simple;
	bh=KMf8CGs+ritcMe8nOsf/RUcnZ0lItMcGiIDLGHNFyOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CVJM4LR1TiV/e7ujG7AQlxNsTJq4feZKcIqsb3P0qRWkNKyHRBkwmVR6mtCPxW4iRXwp+PTgW4GFZY/mHPez49Uh6ToGmmGz8gB1rZ3tzgfPcHG2rZ2nM9c9u2OD5BMU+COJprDw2UBb+ZeQZjmmkbl7oK9FGF1sfQ77aPhLq/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SV6yFMlu; arc=fail smtp.client-ip=52.101.53.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SV6yFMlu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PnUGHZoBq0fCtuNCbQpjnp6XnfGIX8OtjYrzUFXAPFarMmIGMmB8ahpDGl74DyVfOGqB5BRTyVqLDV6LWb2TjMtw5P1w3YhnXsPXHXgu273QyzfGoC8IWoDrqc9EHuwihEsgcauRwZeaxW8tsYk6Gln2zTGB66/9yoaaWjUu5LktUZRbLpgRMWTSfvchhF1X/zwYFiPj1nKB84N51U47+GQJNHdIp4UmmpEtkygWmsKyVndrpd8Btn8aqFRgC3PmWgpTDMd0ZcCfcKL+ioFbqdBlOSbVQP7qQzOI7k7cdOz5LvOK3dY3HO7gbIp732AIOUyt+QbiYGpT9/gCR0hasQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AMKUuJEGQkZDOQTYiJtatdTjcCjJVi1EjbX26h5Rc94=;
 b=CeIfOGgfV5eTurdb3IY/lFufPxaei4M4ASyxG3DhMPfsDAHkqxS0johH+2sSz6FS4AIXuIMx0F/v3yPIPR1y894SL0AO5h6fnIln17IjyoiM0akvd0NwG+8RJxPfqZgZYgKZzHrJudSdUzNvnMqih1UlHrlHvnSkNfMo9OrREoMdxZ6QIdVfWbf93OnPX1/5cbVl+owLQAVpvF+k+E6cP5IWOOLaOSYGtYoTBKHv/7MjFoGZEIrUoUUk/WSc6opB9m/fRz0n5z9AU4Ww//LCezdGeq9Zs5LH2o84WhFehIYkum2fXAdOe5yzxZPyHq3iWP+ZCGzOo3P+yXjjM+bkYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMKUuJEGQkZDOQTYiJtatdTjcCjJVi1EjbX26h5Rc94=;
 b=SV6yFMlu6dm2sS7LzQfX8E2Ho2MoqbE/cK9H+6lLJmaaqzJNmUaDJgdnQ7DywVED+fVpMiJQ5COLnpamSak72IXvnalEkHNftO2qgHdiDcWZ6cii0qi5Yb0emjIzzxYHkqRgLn+/TEFi6Db8ENYLMf8qcuEPQSEFmexKSSwpB5yofaZb3kfXqfjJ5nVDpzgv19TIH25F/euqLTpXaElQwYsqXXzX+PEJtW05AD5RPktMJx5z7XP2P6cQVkPvIZMPB/BquM/LsBFmquabhX55PwFvSStzma+ageksaucI9UpDxWApGVisc4LyJTMEjrX3wGn9WzS8wFiTa9ouYNyF/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH2PR12MB4198.namprd12.prod.outlook.com (2603:10b6:610:7e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.21; Sat, 8 Aug 2026 03:11:24 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0292.022; Sat, 8 Aug 2026
 03:11:24 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>,
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
Subject: [PATCH 02/17] rust: pci: expose the whole interrupt vector allocation
Date: Fri,  7 Aug 2026 20:11:04 -0700
Message-ID: <20260808031120.363869-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260808031120.363869-1-jhubbard@nvidia.com>
References: <20260808031120.363869-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0338.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::13) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH2PR12MB4198:EE_
X-MS-Office365-Filtering-Correlation-Id: 654c80f8-6f40-4677-cd79-08def4fabaa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|7416014|10067099003|6133799003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	UE2ABUtGi3lLyxZW8E/tDJANJEeURLuCyIEL92tPZaidMe7HYup1yeuQOluMo1ixCeiIBD8xWZn60UwF0WmOgenOw6mP6VfBTCKR6N1FHauuZ6CE4GTKp2QgufcNWXdV2GEAiq7GyUkVDwr71OPk6P+AdGwI4s3maAjYkdCia4GyShE6b2QB/XpnfIoP60KxoIJN2U0sXTwCufAUFck1OimBOMdSyXx85e74EfMhVBkYclRCp8lvoFG7KgDOXmOg2H8QEsjpiFQHQe9rvz2ivVH6qgI8ZDAIdJqRaykn8AfgG0X+zCdJN/0Tcj9wtEy0sMc0Zq9CresFm5nGiaH9nb2DNS02AxY2GjuphKKJ4RXFmNrIOsydBLBfGtV8tz3U4lmHWJZ9chyHdwDPZTspRXsSChS+dZ8iir+hFQF4ei83jCM+h9PRSE3kmyESpjC5p5aK5/4nIuLZnEossAythURG3p1P8lmxvfWaxKA5n2mCBOk2f9LGpRpp8IQtmbHc0I5SUDYb5MOw+vDbOZhOfy7dc+mXUOoVzTeiWSJF8OyQ9uS+xidwnwTKX5Fi3Rd28J3N0xHwmDVvfJsJGAsXv3izE0ZY9xdJv4hB1Bwz1xCisxw1yiNMxMItpqBXjd+A5Zggh9KarljtND9Xi2e1Oup8VLGtZ8qzTHNqDOZCFCI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(7416014)(10067099003)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k50XHko8lNeqT486E4pI01gpwyVWO1WF75TR9mhYHLBzbQ186UR/5qYI/uux?=
 =?us-ascii?Q?V6o4EBTfRDO3SpGuVLRCTw99R8/c8p8kGybSskBRjOQODu4Xf56IXBZpkK91?=
 =?us-ascii?Q?UIjhigfaov1ezKVLV/KAYAP1GBDWJDAAfYuCosJj9ny2Fvwy64QI3Hb8N3pt?=
 =?us-ascii?Q?TRdAcuGEwDX3s3jHA9vKK5u+I/LL7arFPPEAOB9ybgW30Cfq8YV5rfkSsO4P?=
 =?us-ascii?Q?QJv5ZHFlob+4m32JKTYcn/hYYA5XxIpMTBphodcXSP66lmgTvfoFEL30T6OM?=
 =?us-ascii?Q?FNqo0HS2nGtr7w8Y3ZLpltUCX7fAR16sSTX+XFgbQscfH33iA9383l8jrFK8?=
 =?us-ascii?Q?ea/OZcz/nSFtbPy6be4bWNnDTXqXZzO78l02Dg+ab9xnSlYuxsBv/ImObQoA?=
 =?us-ascii?Q?DX9k2NrK2s/zLIcAyPcnwyNXqoz9Vg1bggCt++ku7jnrPDMxLGaBNIYKQMv9?=
 =?us-ascii?Q?PpolVfg1GxM5e1AhzAih8AuUbkcesogA7eXgMVkUaVl0YZx15/qF1cQq3Fcp?=
 =?us-ascii?Q?GH376WEn0k0CZYdesY8WvtQZwNwMpUYvoCCnRXy+h3MRrfibHjns5D3D0WKc?=
 =?us-ascii?Q?CFc9arEB3/uAi1DaesnxMv92kJaqHEyl2hgnGBGtgz2j3eFgh8mt0zo2dAbb?=
 =?us-ascii?Q?lo1YbFgFePhuhNYf6mE8GUqMrExnqBZ95ZbdBHSYQUPDp5FUClNq+XRz9Mpv?=
 =?us-ascii?Q?kQ6ShfGeS9uyhEtMWUpr5ALbOQapRSN6S8oq2cndphMhA6FZC/7rapqbmDXx?=
 =?us-ascii?Q?cZH1xRIUFx1f5QYYQ6TSIcxeQwNkvvHXATW0cUaneM6kOYsVE95JvtU/xzkA?=
 =?us-ascii?Q?gtRRLmYgp/0DfN7ljSVtdCCnDWhyK/fHR13vClYr9D4xX4JVuu+JVePhiEkn?=
 =?us-ascii?Q?AUz3QoBbc9hB1ubLUiUUX1Xi77Q8WUD9XvZx+pRezDh1pofsZJBeOH8L2HWK?=
 =?us-ascii?Q?5cS6N1WdL0J4WDuUAUZKNykM+2KjNNsGoYS3aBMP+aAIoYgxoX2rucZuBKyy?=
 =?us-ascii?Q?3xz+JvH7XJ6hhGxx+XIqKD2XIFBGzSZGzttmLDVTDtfRMBm+Rzzddoi1SQII?=
 =?us-ascii?Q?bOxjKvg7XFnJgA7quL/jPK7h8nIU/92K6+KuHX+JWLUYnqg3ZcvhfKjRP9Qh?=
 =?us-ascii?Q?kdHgM/st0rK0aXbhNao+MajWypy0sZly8x3NtDdp1xAOCpj7bg0Uk58oqn/D?=
 =?us-ascii?Q?P21EWUkrOyRRKK3I+1wvT99cTkk1iJTyz3D89BgjPSjrX5P2FwY0MmRiLoa3?=
 =?us-ascii?Q?uaCxMxVrLj878sXOqlG0qsBbQCXomGq9nq0qiSfKiIz0xlchqQ8gGZoahAHy?=
 =?us-ascii?Q?nUP6g9zjX70u8kTwUVn2MCk1ln1UqBgKdD2vtJNjOFChq8/fuIq+/rZvw5PF?=
 =?us-ascii?Q?M7DCuXnXPts1PDSFbI+bItzIHXjwL7TUYW74LXx7+whNzdVVRxRo5mhfFzXd?=
 =?us-ascii?Q?0Le2tVMK0kRybtrXBls3m8Xx0W6+S09hpMuXbE6wOaeobfZclMaAvpy2wabX?=
 =?us-ascii?Q?u28hQ002r5Um5BqMTHMELp7TTT2nth/3d2o2vvsWQrwUXG98ShQgA63vGmMo?=
 =?us-ascii?Q?/KWgoS0JSV69IFVVkfx6WO29DdN789/JZfkrodkk7H2qoMWGUGJ61Gc80cfs?=
 =?us-ascii?Q?8BopG87j/swxqyzD8vbhMlArfeWUaN7J2DnZKkiBkvEG6kk5iZXD5dkXpT0U?=
 =?us-ascii?Q?ZGneVPoRnrqNLA6+mEwdFFcEe9v4P12VLKNvNXZ3lQShpDBz0OT8lZWpki1p?=
 =?us-ascii?Q?jcCbid68iQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 654c80f8-6f40-4677-cd79-08def4fabaa0
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2026 03:11:24.4617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ft/n+Cep7zMS34150S1wh+dWLY+cX0E46Bjsa15SQA2zQZkL48uBy2k7/a18wmHR0IjPcbcbdOJdy2gcg1UeeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4198

A PCI driver that allocates several interrupt vectors registers one
handler per vector, so it needs the number of vectors the PCI core
allocated and access to each vector. The Rust abstraction discarded the
count and returned only the first and last vector.

Return a handle to the allocation. The handle reports how many vectors
there are, and resolves a vector index to the Linux IRQ number a handler
is registered on.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 rust/kernel/pci.rs     |   1 +
 rust/kernel/pci/irq.rs | 123 ++++++++++++++++++++++++-----------------
 2 files changed, 74 insertions(+), 50 deletions(-)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 9f19ccd5905c..2f58b284efff 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -49,6 +49,7 @@
     Normal, //
 };
 pub use self::irq::{
+    IrqAllocation,
     IrqType,
     IrqTypes,
     IrqVector, //
diff --git a/rust/kernel/pci/irq.rs b/rust/kernel/pci/irq.rs
index fea484dcf9cf..66723a43491b 100644
--- a/rust/kernel/pci/irq.rs
+++ b/rust/kernel/pci/irq.rs
@@ -17,7 +17,7 @@
     str::CStr,
     sync::aref::ARef, //
 };
-use core::ops::RangeInclusive;
+use core::num::NonZero;
 
 /// IRQ type flags for PCI interrupt allocation.
 #[derive(Debug, Clone, Copy)]
@@ -71,44 +71,72 @@ const fn as_raw(self) -> u32 {
     }
 }
 
-/// Represents an allocated IRQ vector for a specific PCI device.
+/// A Linux IRQ number belonging to one PCI device's interrupt allocation.
 ///
-/// This type ties an IRQ vector to the device it was allocated for,
-/// ensuring the vector is only used with the correct device.
+/// [`IrqAllocation::vector`] resolves a vector index to one of these, and
+/// [`Device::request_irq`] or [`Device::request_threaded_irq`] registers a handler on it.
+///
+/// # Invariants
+///
+/// `irq` is a Linux IRQ number of `dev`.
 #[derive(Clone, Copy)]
 pub struct IrqVector<'a> {
     dev: &'a Device<Bound>,
-    index: u32,
+    irq: u32,
 }
 
-impl<'a> IrqVector<'a> {
-    /// Creates a new [`IrqVector`] for the given device and index.
-    ///
-    /// # Safety
-    ///
-    /// - `index` must be a valid IRQ vector index for `dev`.
-    /// - `dev` must point to a [`Device`] that has successfully allocated IRQ vectors.
-    unsafe fn new(dev: &'a Device<Bound>, index: u32) -> Self {
-        Self { dev, index }
+impl<'a> From<IrqVector<'a>> for IrqRequest<'a> {
+    fn from(vector: IrqVector<'a>) -> Self {
+        // SAFETY: By the type invariant, `irq` is a Linux IRQ number of `dev`.
+        unsafe { IrqRequest::new(vector.dev.as_ref(), vector.irq) }
     }
+}
 
-    /// Returns the raw vector index.
-    fn index(&self) -> u32 {
-        self.index
-    }
+/// An allocation of PCI interrupt vectors for a device.
+///
+/// [`Device::alloc_irq_vectors`] allocates the vectors and returns this handle. The vectors are
+/// numbered `0..count`, and [`Self::vector`] resolves one of those indices to the Linux IRQ
+/// number that delivers it.
+///
+/// # Invariants
+///
+/// `dev` has an allocation of `count` interrupt vectors.
+#[derive(Clone, Copy)]
+pub struct IrqAllocation<'a> {
+    dev: &'a Device<Bound>,
+    count: NonZero<u32>,
 }
 
-impl<'a> TryInto<IrqRequest<'a>> for IrqVector<'a> {
-    type Error = Error;
+impl<'a> IrqAllocation<'a> {
+    /// Returns the number of vectors that were allocated.
+    ///
+    /// This is at least the `min_vecs` that [`Device::alloc_irq_vectors`] was asked for.
+    pub fn count(&self) -> NonZero<u32> {
+        self.count
+    }
 
-    fn try_into(self) -> Result<IrqRequest<'a>> {
-        // SAFETY: `self.as_raw` returns a valid pointer to a `struct pci_dev`.
-        let irq = unsafe { bindings::pci_irq_vector(self.dev.as_raw(), self.index()) };
+    /// Resolves the vector at `index` to the Linux IRQ number that delivers it.
+    ///
+    /// # Errors
+    ///
+    /// - `EINVAL` if `index` is outside the allocation.
+    /// - The error `pci_irq_vector()` returns if the PCI core has no IRQ number for `index`.
+    pub fn vector(&self, index: u32) -> Result<IrqVector<'a>> {
+        if index >= self.count.get() {
+            return Err(EINVAL);
+        }
+
+        // SAFETY: `self.dev.as_raw()` is a valid pointer to a `struct pci_dev`.
+        let irq = unsafe { bindings::pci_irq_vector(self.dev.as_raw(), index) };
         if irq < 0 {
             return Err(crate::error::Error::from_errno(irq));
         }
-        // SAFETY: `irq` is guaranteed to be a valid IRQ number for `&self`.
-        Ok(unsafe { IrqRequest::new(self.dev.as_ref(), irq as u32) })
+
+        // INVARIANT: `pci_irq_vector` returned a Linux IRQ number of `dev`.
+        Ok(IrqVector {
+            dev: self.dev,
+            irq: irq as u32,
+        })
     }
 }
 
@@ -128,13 +156,13 @@ impl IrqVectorRegistration {
     /// Allocate and register IRQ vectors for the given PCI device.
     ///
     /// Allocates IRQ vectors and registers them with devres for automatic cleanup.
-    /// Returns a range of valid IRQ vectors.
+    /// Returns a handle to the allocated IRQ vectors.
     fn register<'a>(
         dev: &'a Device<Bound>,
         min_vecs: u32,
         max_vecs: u32,
         irq_types: IrqTypes,
-    ) -> Result<RangeInclusive<IrqVector<'a>>> {
+    ) -> Result<IrqAllocation<'a>> {
         // SAFETY:
         // - `dev.as_raw()` is guaranteed to be a valid pointer to a `struct pci_dev`
         //   by the type invariant of `Device`.
@@ -145,20 +173,19 @@ fn register<'a>(
         };
 
         to_result(ret)?;
-        let count = ret as u32;
 
-        // SAFETY:
-        // - `pci_alloc_irq_vectors` returns the number of allocated vectors on success.
-        // - Vectors are 0-based, so valid indices are [0, count-1].
-        // - `pci_alloc_irq_vectors` guarantees `count >= min_vecs > 0`, so both `0` and
-        //   `count - 1` are valid IRQ vector indices for `dev`.
-        let range = unsafe { IrqVector::new(dev, 0)..=IrqVector::new(dev, count - 1) };
+        // `pci_alloc_irq_vectors` returns the number of vectors it allocated.
+        let count = NonZero::new(ret as u32).ok_or(EINVAL)?;
+
+        // INVARIANT: `pci_alloc_irq_vectors` allocated `count` vectors for `dev`, numbered
+        // from 0.
+        let vectors = IrqAllocation { dev, count };
 
         // INVARIANT: The IRQ vector allocation for `dev` above was successful.
         let irq_vecs = Self { dev: dev.into() };
         devres::register(dev.as_ref(), irq_vecs, GFP_KERNEL)?;
 
-        Ok(range)
+        Ok(vectors)
     }
 }
 
@@ -185,12 +212,8 @@ pub unsafe fn request_irq<'a, T: crate::irq::Handler + 'a>(
         name: &'static CStr,
         handler: impl PinInit<T, Error> + 'a,
     ) -> impl PinInit<irq::Registration<'a, T>, Error> + 'a {
-        pin_init::pin_init_scope(move || {
-            let request = vector.try_into()?;
-
-            // SAFETY: Caller guarantees the Registration will not be leaked.
-            Ok(unsafe { irq::Registration::<T>::new(request, flags, name, handler) })
-        })
+        // SAFETY: Caller guarantees the Registration will not be leaked.
+        unsafe { irq::Registration::<T>::new(vector.into(), flags, name, handler) }
     }
 
     /// Returns a [`kernel::irq::ThreadedRegistration`] for the given IRQ vector.
@@ -206,12 +229,8 @@ pub unsafe fn request_threaded_irq<'a, T: crate::irq::ThreadedHandler + 'a>(
         name: &'static CStr,
         handler: impl PinInit<T, Error> + 'a,
     ) -> impl PinInit<irq::ThreadedRegistration<'a, T>, Error> + 'a {
-        pin_init::pin_init_scope(move || {
-            let request = vector.try_into()?;
-
-            // SAFETY: Caller guarantees the Registration will not be leaked.
-            Ok(unsafe { irq::ThreadedRegistration::<T>::new(request, flags, name, handler) })
-        })
+        // SAFETY: Caller guarantees the Registration will not be leaked.
+        unsafe { irq::ThreadedRegistration::<T>::new(vector.into(), flags, name, handler) }
     }
 
     /// Allocate IRQ vectors for this PCI device with automatic cleanup.
@@ -232,8 +251,7 @@ pub unsafe fn request_threaded_irq<'a, T: crate::irq::ThreadedHandler + 'a>(
     ///
     /// # Returns
     ///
-    /// Returns a range of IRQ vectors that were successfully allocated, or an error if the
-    /// allocation fails or cannot meet the minimum requirement.
+    /// Returns the IRQ vector allocation, or an error if `min_vecs` vectors cannot be allocated.
     ///
     /// # Examples
     ///
@@ -248,6 +266,11 @@ pub unsafe fn request_threaded_irq<'a, T: crate::irq::ThreadedHandler + 'a>(
     ///     .with(pci::IrqType::Msi)
     ///     .with(pci::IrqType::MsiX);
     /// let vectors = dev.alloc_irq_vectors(4, 16, msi_only)?;
+    ///
+    /// // Resolve every allocated vector to the IRQ number a handler is registered on.
+    /// for index in 0..vectors.count().get() {
+    ///     let _vector = vectors.vector(index)?;
+    /// }
     /// # Ok(())
     /// # }
     /// ```
@@ -256,7 +279,7 @@ pub fn alloc_irq_vectors(
         min_vecs: u32,
         max_vecs: u32,
         irq_types: IrqTypes,
-    ) -> Result<RangeInclusive<IrqVector<'_>>> {
+    ) -> Result<IrqAllocation<'_>> {
         IrqVectorRegistration::register(self, min_vecs, max_vecs, irq_types)
     }
 }
-- 
2.55.0

