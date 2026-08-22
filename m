Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011055.outbound.protection.outlook.com [52.101.57.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906D230C37A
	for <nova-gpu@lists.linux.dev>; Sat, 22 Aug 2026 01:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787363775; cv=fail; b=pmlu8qLawAxfzzN0sOpCt8Yj72/AnXwg2wgAWPKa8krI/8X7NRLx1L6Y00xhFxBjaiFfxErSqgJKDoIu1FGESY1xT+fi5o2BXeFEqCVDA0hjF8Dr94I1bfznCTiZsDO0X5s7Dltm0CfGFUL5tYjiBCViFjVTq+i+b3AJI9sIEgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787363775; c=relaxed/simple;
	bh=qJttaBWqXId5bqRZJzZzzwg4tGpOCIe+PYcv1RisK28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J0o0JP/1Z1bWZbyp3Zx5buCJii3MwKXEqvKPDByaR4N2BlDbG0eAN9JVMJBCd2Wj5QurHzb1pk7j41cw4yfsD6Yc/kEYzj1e7Ysr/eiMPGEEqXEbvYF84sXrcVjQu4OQGA9Vr90hWZhXcA3dVC6Tw8t5GsOsDmE9RJFodl6eGmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RKtRcIwT; arc=fail smtp.client-ip=52.101.57.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RKtRcIwT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sKi8ogx3vVHVVjFN7cxm+eeFroutmpWnABFKhYuFHb+DMu0jYPbnUGVA7mLffq5qyIig1s6dzfNec6Mqy4Pdcnbx7IhuMuA++VS17s9E6W6wapyuBsYuGij97YMbeUwy7tYnYg1vG78EiXJ/3ANpPrY6S2wgWr5wGDDzsWC0NCT8Ain9DlhOkvTi8cb0iuzjn76n+TOqP75/8EcSNu+v4uT3So7uw3YSgnbsk+ye2Tc6iIovqEVvDWsXfbAsHXR6QFJwN/DGOQI/muE9vmrdqbExJeOdDSVxHt3LxQKExhum3C+a9QUhOJUO7AZU6MFeDRr+IdRG5TzYBsLsutVNUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TURjUxbudp0+y9iM0BYCisX/z1u7h93fT7sylILbAk8=;
 b=XP2T3sDhr5e+xF+TwcPXqVt2rcrwKJVulNxrRLW56q3hiyuJdx1uANzD5/iFtHp5EbcqHahRvkmOQ6bJpvHm+3FsFlyatsEVrWSIBPzloqugJvzgLtHcEceW9iyOzq5oYCy7YTqHZr+ejDLmMJFSs9nTP2nvVtoBpga0GqMqRQwEX3s7bvuFF0QAKxK5Se+IpDnYPeC8nhzTkHXEtNlrbuBKd8FwRrFhhaLD8YOjOhFuA8LEh/y9HaJWIbExFG5433kGAO7DlW+cHJFBne6cuvrvYWjUPfRycSEHeX5gmXweQrq6TX9TbeoeKfoLdwUJMgOxnnNRzivLxMBbH6KBag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TURjUxbudp0+y9iM0BYCisX/z1u7h93fT7sylILbAk8=;
 b=RKtRcIwTj71+q/2IQP+gGxV0CRQOXkdx3bdsEhTXEWDEc9wjxBkU75rZw/9yC4VQc3Kg3b/0l3pgl8sToBKINFldr11uMbSMbBj790igTurwNLLeMBUnzZrqGt/cQEyrGHDhHxf6du0o7SV5nFaA+v4D9gOQ74N8B+Vldttixe/z5BO5c39qkxR9qxm3Nner7HyNxpRHvxUGS0DmA844msm8sUHq/T1r6fFYbZJKLKj0aNwM0UoyBMqOZ/+MdvEVNijgkRin3BccYFtFB/ML1T/FEVzFi7e6lUeD4yuQvobdWJA6ZwL8Z4F5qqSj1XdFRZsidaEm/LPkJ7NbM28JCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB6603.namprd12.prod.outlook.com (2603:10b6:208:3a1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Sat, 22 Aug
 2026 01:56:04 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.010; Sat, 22 Aug 2026
 01:56:04 +0000
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
Subject: [PATCH v2 23/31] gpu: nova-core: gsp: add the GSP_INIT request builder
Date: Fri, 21 Aug 2026 18:54:40 -0700
Message-ID: <20260822015448.238214-24-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822015448.238214-1-jhubbard@nvidia.com>
References: <20260822015448.238214-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0123.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::8) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bd97898-c2d0-48b9-2393-08defff085ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|366016|376014|1800799024|6133799003|10067099003|56012099006|11063799006|5023799004|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/mEVdLGHLSjkW4ieXvGs8SmyQfazTwgN0cm+fYgUmLiEGkJOf5UGJEKhUDivQ6kwWcuQMzvN9Vyj800JKpMgTbF7nO/sIyJ5SORumsYA4LwQBH9CMccFXlCUh+er0T3zWWdhvoCcza+RK5qxv5Zg1dPNy/bb2Woj7v3phEtVjXJGCFk1muqPlLlO2fG3VsIHJhw3WsWWjYVUvGN+X0x7lFqWIsvEuiiW8zxarQJSKyLGpQMU4epDp/nh0J0zFnK+FJmh9chkOrBoH+yasxfxTU2nuS0o3QMRwWwiKBvzn0vQAGXK9cs5KkCihpLwZ1Gtajzfq05URW0ZrdABzEwGUXcceaxAQ0lGbMZeTda0IZEKEDEdsOc0TOTjgUxxi7Dv2q5N/NoX3tQio9GGCGjxcbtwyMv8g+XOCwC84qMuFxgkTXBaKprEnA5OLh7n1fXMc1XydoXpgqXu+uNzOZPSqnKQF3hRJ6E1c0zZV4T4dE1ztwN18LSTJmJ3txro/ynJRTxVnrGKxNTBpNRhfN+pyp4uZactY7VgG/Bd0eorF0oAt64kR9SJhVelOcEB1DwZa72/vuQSp9Rwrv/F9v5IopW9ZcNnmtfT+Ilu5MmQJjS35T55eKtVCNvhWE6FSt/0dZJgraZLsFv79T+x+UgzN3hXsq7xTSkg+VLn2bTvjJQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(366016)(376014)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(5023799004)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BEKJIf1rpI5AB3Sz6vqob3gi6BStta1LVUYSTDSysInRc3qXvxfmRpkvdmDQ?=
 =?us-ascii?Q?qmB2mKaBK37Pi6lYzjvxz0wQRj/JtacFgUou1wZWxmkOAXCCogGlYt5CK/oD?=
 =?us-ascii?Q?/Jf+KTg36uZXWLQKNfSC8LYzzlTuytTNGXaCaTC99Hbv/TohYqS8GW7s7xEX?=
 =?us-ascii?Q?PjaUptXbIdfXPzNGnaZuhOU27H+LepLzqd9F5gI7cf1xELEOTTdO9P/71AMQ?=
 =?us-ascii?Q?4sKL61YfCglUGCkn6vYxiOKnpD6v4+ABwATpTYjt13F/cGZyO8ntmFVkP9Sv?=
 =?us-ascii?Q?3diqCh8VjsoMfyNvkpluC7nbzuSjykMPGTkX7XXz83l5U9fxz6IqlDEZ2r6C?=
 =?us-ascii?Q?BANuHVY7TeKH3qrDtTePqt05VyrnaVhtBBzJdkJqr59LT8FE85KmLNqWZRPD?=
 =?us-ascii?Q?7e7iEhmdaIkx8EMdCMXNsdTc+Rl7DBDaR42ji3PDfhee1WvsnkuPZnMqE2Z8?=
 =?us-ascii?Q?M2+OzVGDMVUlGVVnByq7Mlspl5zFOjmwv42n6qG17SZ9XG/WaqOTmYrFfeEe?=
 =?us-ascii?Q?VOYKlQh+NAhtffmWFr/T0GEma8IevINJ8FgGKHMnoHet55QOgCOEDxXEruB2?=
 =?us-ascii?Q?FXuU5adwDJvtQQpxkCgaLct3/MW+xo+2OZBhSqBfoy1TkQ6l3AOJ9jIky6mF?=
 =?us-ascii?Q?J/9J618SFl9qcSLODGxauBn2dcrPWzp0XdTe3tiYi3YZUkzl151UmJuLBj2v?=
 =?us-ascii?Q?9Bpu6DT9kLRgQF2YByit3OWXFK7cbIGkU526cMxlRh6zp5YWlwckMGMzWqMY?=
 =?us-ascii?Q?ymB/JcQhS5qmNkTapynXMIhK+TE7UbXrwhcbXp1OEKt4l4lhUOmqUdTAl3qg?=
 =?us-ascii?Q?3XuCs1fcelPzYDp0PdxUHvO+kj172Dw5n3IgqYVqzFlqlJF6XFYzgUqG7gCt?=
 =?us-ascii?Q?+Zm5XCYNCQyX1QaC+db+UxWBdCqe7j/GUqOf2SH+eV+aBLCBV6wEyzyq50UM?=
 =?us-ascii?Q?leau6rHHkFd83vfR9BOHXBzpxzl3+wDuyVItPVM9pgxnSm2guZwbkisebPTR?=
 =?us-ascii?Q?/OanyuNt+b06ZM7IrdRkBQzKNxWDsDI+BPrhuKuQ6RNPu39SV+HDSQAL9GvE?=
 =?us-ascii?Q?YpFFeetOIop79oTHPdXs00g2JvYXk9P8MqrtURnKJU5QFighnB8MUtCfLOgl?=
 =?us-ascii?Q?V2DF/fAxGsLtTdtSY3q1EEgb66a3WHDvWa4InhTXd3S1g/3cvaEkNBuL/JE/?=
 =?us-ascii?Q?U0zt7OA083YrarsU8nfPHQoh7vw6+7AH3MIuPRmt+tAqRoGUxKzq21jCkEoL?=
 =?us-ascii?Q?1lXUDf7FkYpw+/4XHmEvtYWETtDZ+Xy8DhGyYvPOZHSwq+sh5Z1FBw9dQs3X?=
 =?us-ascii?Q?twbJcEKm3MYMdn1EPk89XTwkBwqPigk8pwQhwdhg3qOOR7nS6Ye81xZ3c+gg?=
 =?us-ascii?Q?0T/t0+L+OsZ2XcoV6Y9/3aZYoaffUspluXQ7XAydskc5xGx1l/ssOt0aEqCe?=
 =?us-ascii?Q?aM0dIOQQaJeFlfR17Dmo0RCUnQLINwoaMrRJi5DF91DyVKq0UXPAjVQEDXkj?=
 =?us-ascii?Q?xeaOkh/5HaWLGQomy3+5JRebAfq+s0oB/rxTemaT9b3+fytIN7o/he/brvg4?=
 =?us-ascii?Q?ThpfHbD3ouxoIkgR5AdHuMYyVwecK9EC347+Qa5E5t/Qe2qmDn6uZRm5bYmo?=
 =?us-ascii?Q?aopHX5ObBTNZ90+8Km4VDG/TND9Zw8MbW0p6mTX7p7hvcezrNW4AMi7mcnwO?=
 =?us-ascii?Q?YJq+ng8j9yxvFXRvn9PR8Na59FJ4V47IhQ6y6CGFDyAKkxW3BNBt2JNyfHFR?=
 =?us-ascii?Q?mEZmOG7dqw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bd97898-c2d0-48b9-2393-08defff085ae
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 01:56:03.4981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8S2rklFv7gUDDC6OVOOSaRvlZ5zhTZ3mxMdmiXSfmjQZ/VGAWrIASuMOSFd90XZtCJKYQa3DufK+QoAfQrAgRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6603

The r000 GSP boot protocol replaces the separate system-info, registry
and static-info commands with one GSP_INIT request, whose payload is an
NVKV key-value blob rather than a packed struct.

Nova-core has the NVKV codec and the GSP_INIT schema, but nothing that
fills the schema in from a PCI device.

Add the builder. It encodes the PCI identifiers and config mirror range
the RPC path already sends, and the registry entries, whose names carry
the NULL that GSP-RM counts in the encoded length. The PCI location goes
out as domain, bus and device in bits 63:32, 15:8 and 7:0, which is what
GSP-RM decodes, rather than the bus, device and function that PCI_DEVID
packs.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/commands.rs    | 52 +++++++++++++++
 drivers/gpu/nova-core/gsp/fw/commands.rs | 84 +++++++++++++++++++++++-
 2 files changed, 134 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index d5575c036eb9..0c3832ccf726 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -30,8 +30,16 @@
         },
         fw::{
             self,
+            commands::{
+                GspInitRequest,
+                RegKey, //
+            },
             MsgFunction, //
         },
+        nvkv::{
+            Encodeable,
+            Encoder, //
+        },
     },
     sbuffer::SBufferIter,
     vgpu::VgpuState, //
@@ -259,6 +267,50 @@ pub(crate) fn gpu_name(&self) -> core::result::Result<&str, GpuNameError> {
     }
 }
 
+/// Registry entries the driver sends to GSP-RM on every boot, each with the NULL terminator that
+/// Open RM counts in the encoded name length.
+///
+/// `RMSecBusResetEnable` enables PCI secondary bus reset. `RMForcePcieConfigSave` makes GSP-RM
+/// preserve PCI configuration registers across any PCI reset. `RMDevidCheckIgnore` lets GSP-RM
+/// boot when the PCI device id is absent from its product name database.
+///
+/// [`SetRegistry::new`] carries the same entries for the RPC path, where the names have no
+/// terminator because that encoding appends one.
+const REGISTRY_ENTRIES: &[(&[u8], u32)] = &[
+    (b"RMSecBusResetEnable\0", 1),
+    (b"RMForcePcieConfigSave\0", 1),
+    (b"RMDevidCheckIgnore\0", 1),
+];
+
+/// Builds the NVKV-encoded payload of a `GSP_INIT` request.
+///
+/// The payload carries the system information GSP-RM reads before it starts, and
+/// [`REGISTRY_ENTRIES`] as `REGKEY_NAME` and `REGKEY_VALUE_U32` pairs. GSP-RM requires each name
+/// to be followed by its value, which is the order [`RegKey`] declares them in.
+///
+/// # Errors
+///
+/// - `ENOMEM` if the registry list or the encoder buffer cannot be allocated.
+#[expect(dead_code)]
+pub(crate) fn build_gsp_init_payload(
+    pdev: &pci::Device<device::Bound>,
+    chipset: Chipset,
+    vgpu_state: VgpuState,
+) -> Result<KVVec<u64>> {
+    let mut regkeys = KVVec::new();
+    for &(name, value) in REGISTRY_ENTRIES {
+        regkeys.push(RegKey::new(name, value), GFP_KERNEL)?;
+    }
+    if matches!(vgpu_state, VgpuState::Enabled { .. }) {
+        regkeys.push(RegKey::new(b"RMSetSriovMode\0", 1), GFP_KERNEL)?;
+    }
+
+    let mut encoder = Encoder::new();
+    GspInitRequest::new(pdev, chipset, regkeys).encode(&mut encoder)?;
+
+    Ok(encoder.finish())
+}
+
 pub(crate) use fw::commands::PowerStateLevel;
 
 /// The `UnloadingGuestDriver` command, used to shut down the GSP.
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 5cd2d9646de3..c9deee8d23c8 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -245,6 +245,25 @@ pub(crate) enum OorArch {
     Riscv64 = 5,
 }
 
+impl OorArch {
+    /// Returns the variant naming the architecture this kernel is built for.
+    fn host() -> Self {
+        if cfg!(target_arch = "x86_64") {
+            Self::X86_64
+        } else if cfg!(target_arch = "aarch64") {
+            Self::Aarch64
+        } else if cfg!(target_arch = "powerpc64") {
+            Self::Ppc64le
+        } else if cfg!(target_arch = "arm") {
+            Self::Arm
+        } else if cfg!(target_arch = "riscv64") {
+            Self::Riscv64
+        } else {
+            Self::None
+        }
+    }
+}
+
 // TODO[FPRI]: This is a temporary solution to be replaced with the corresponding derive macros once
 // they land.
 impl TryFrom<u32> for OorArch {
@@ -271,7 +290,7 @@ fn from(value: OorArch) -> Self {
 
 nvkv_encode! {
     /// A GSP registry entry.
-    struct RegKey {
+    pub(crate) struct RegKey {
         key_name: Key<&'static [u8], { Self::REGKEY_NAME_KEY }>,
         key_value: Key<u32, { Self::REGKEY_VALUE_U32_KEY }>,
     }
@@ -280,6 +299,15 @@ struct RegKey {
 impl RegKey {
     const REGKEY_NAME_KEY: KeyId = 0x3070;
     const REGKEY_VALUE_U32_KEY: KeyId = 0x3071;
+
+    /// Creates a registry entry. `key_name` must include its NULL terminator, which GSP-RM counts
+    /// in the encoded name length.
+    pub(crate) fn new(key_name: &'static [u8], key_value: u32) -> Self {
+        Self {
+            key_name: key_name.into(),
+            key_value: key_value.into(),
+        }
+    }
 }
 
 impl Encodeable for KVVec<RegKey> {
@@ -317,7 +345,7 @@ impl VfInfo {
 nvkv_encode! {
     /// Payload of the `GSP_INIT` command.
     #[cfg_attr(not(CONFIG_KUNIT), allow(dead_code))]
-    struct GspInitRequest {
+    pub(crate) struct GspInitRequest {
         pci_device_id: Key<u32, { Self::PCI_DEVICE_ID_KEY }>,
         pci_sub_device_id: Key<u32, { Self::PCI_SUBDEVICE_ID_KEY }>,
         pci_revision_id: Key<u32, { Self::PCI_REVISION_ID_KEY }>,
@@ -330,6 +358,27 @@ struct GspInitRequest {
     }
 }
 
+bitfield! {
+    /// PCI bus, device and function, packed the way `PCI_DEVID` packs them, which is what
+    /// [`pci::Device::dev_id`] returns.
+    struct PciDevId(u16) {
+        15:8 bus;
+        7:3 device;
+        2:0 function;
+    }
+}
+
+bitfield! {
+    /// A GPU's PCI location, encoded the way GSP-RM decodes it, matching Open RM's
+    /// `gpuEncodeDomainBusDevice`. Despite the name GSP-RM gives the key, the function number
+    /// is not part of it.
+    struct DomainBusDevice(u64) {
+        63:32 domain;
+        15:8 bus;
+        7:0 device;
+    }
+}
+
 #[cfg_attr(not(CONFIG_KUNIT), allow(dead_code))]
 impl GspInitRequest {
     const PCI_DEVICE_ID_KEY: KeyId = 0x0001;
@@ -339,6 +388,37 @@ impl GspInitRequest {
     const PCI_CONFIG_MIRROR_SIZE_KEY: KeyId = 0x0011;
     const OOR_ARCH_KEY: KeyId = 0x0070;
     const NV_DOMAIN_BUS_DEVICE_FUNC_KEY: KeyId = 0x1020;
+
+    /// Describes `dev` to GSP-RM and asks it to apply `regkeys`.
+    ///
+    /// The same identifiers reach GSP-RM through [`GspSetSystemInfo::init`] on the RPC path.
+    pub(crate) fn new(
+        dev: &pci::Device<device::Bound>,
+        chipset: Chipset,
+        regkeys: KVVec<RegKey>,
+    ) -> Self {
+        let mirror = chipset.pci_config_mirror_range();
+        let dev_id = PciDevId::from(dev.dev_id());
+        let bus_device_func = DomainBusDevice::zeroed()
+            .with_domain(dev.domain_nr())
+            .with_bus(u8::from(dev_id.bus()))
+            .with_device(u8::from(dev_id.device()));
+        let device_id = (u32::from(dev.device_id()) << 16) | u32::from(dev.vendor_id().as_raw());
+        let sub_device_id =
+            (u32::from(dev.subsystem_device_id()) << 16) | u32::from(dev.subsystem_vendor_id());
+
+        Self {
+            pci_device_id: device_id.into(),
+            pci_sub_device_id: sub_device_id.into(),
+            pci_revision_id: u32::from(dev.revision_id()).into(),
+            pci_config_mirror_base: mirror.start.into(),
+            pci_config_mirror_size: (mirror.end - mirror.start).into(),
+            oor_arch: OorArch::host().into(),
+            bus_device_func: u64::from(bus_device_func).into(),
+            regkeys,
+            vf_info: None,
+        }
+    }
 }
 
 // Decode:
-- 
2.55.0

