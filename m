Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011026.outbound.protection.outlook.com [52.101.62.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3642472096
	for <nova-gpu@lists.linux.dev>; Tue, 15 Sep 2026 20:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789505963; cv=fail; b=nlvi1zrhh2z8hawHjhGHE0Vt5EVgPZnGzBz4ymGy0v9nWwpgE2tU88CvkaOFJ2aJNIZp3YBU57c5EYPjYAXHDMCbnM8XZvjPx0oxpg8OBvJ4HX7nhRtHs2ND7xeGmAJ/9a3MyNYmtEvuH0cKPMJJDWXVIwJwSUzZ51b6Mfc2nDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789505963; c=relaxed/simple;
	bh=Ks811RhNsdB+AEOzsClsav3MBw7URUSZuTenKi8LtwM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NADvt83wTXGr4lzNSFlb+5n8fh4xi5kOCzYt3B1q5AaGzBkZpbnCtxnw79koBmJDEwNhFj0+f/8qdhX+It0Pot0V00kp4A5UPEGjOGwf1Ua3XscjZIkYeKrU/2+P8XOEBn5ZkxBfR73LZzPM9nlVd3OUZZXWbCjPd9jFicEUhx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sxIK/qf8; arc=fail smtp.client-ip=52.101.62.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sxIK/qf8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nAIsriIDLzccv5roAdIJsJmArQ2C2XJ171hFRGJ5NDqLqHH8fRJRBkHjsl3eZWWLkwpvapybdBIeD30Ol7lZQufU5mMrjV814y8dEJ2qHu9lZ5r//pOi9DYYNSKL+V6GA9OiD4lQFxTudvhJf+eRgUz6w7ufOKwy4/oWxChTvMOQfAjVkejjMMLznd0WLhwP7kPjozjWbYyXPkicjsK+Nf2p/Qh0xWeRPE/QN2IoxgULw00s1y+FftFwOEUamp8nhxHfrI4Sl7rr9BHLaEwDt4OoXndBwRpT6kIlKahmtsIy3pHClfU5Jw9OoudSvxS2hmlJUbXTIn5X1M95bR0QQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59MoSNbF2i54C1QGr5kXh03IIvaul41eARPdGXDdk3I=;
 b=unSMYS9Yy2+lbMALk4sgYRurA4wNsK5wyYY1S3CUmI1Orzw78xcZgO0uPiMeQFqcS8WbPeaoeB2hZ+7XKaMkKkpCGUEQRiY7mpfzJrlIK5UuEJTCcNGKBrc8tNOTPwlfQctCxb3p3/LBQRqo3MB6z2wMZ/zYXqXngdG+xx3l0ZwclL1bKhk2aveauBjd8XcdpfCVxqXx/pRLz9Vb22OO9KDn0bVaLd8sBkQF1EfoHt+2DtB+HfS/JcuQNPRX6Y0i5D4iVVrjpEg6/RR9m3JmncmLLfsszHeuYMoKTpZBjnIj6gG/j28vOKKAI5RXItx0C0YyRu9HGZNn/ddcnYcc3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59MoSNbF2i54C1QGr5kXh03IIvaul41eARPdGXDdk3I=;
 b=sxIK/qf8ixNuHwEfRIUeMtZMw11tGiuUSQ2Ukr/Y2VkRuQlQZHBH8Z2H5JiB4NGBSQDwtbizMBWrSH9svBdFNuDhqyR/VDrBKkRodI6tDJATiDfrOwpz5S0F69tVPFQCxpwZcySYdXtlWHltSV8sl+yAvNGNaikvym53ywhpgTZgddASicWytP5csfkjco79Ya+MgZJ8/p84XpkDrFl5Rjw5YdbQc6CltUtDqGzGiJiGT4wPpqx9bvl9UxifqxMnHPZcZYN/8U8akuSViLtohT3R0oWeHDq+lf7e3rauJ18QLumszoz4IqKdegIcRYcDrY/VpbW3f7+0g3DwVYxjtA==
Received: from SJ0PR05CA0060.namprd05.prod.outlook.com (2603:10b6:a03:33f::35)
 by SJ0PR12MB8167.namprd12.prod.outlook.com (2603:10b6:a03:4e6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 20:59:10 +0000
Received: from BY1PEPF0001AE17.namprd04.prod.outlook.com
 (2603:10b6:a03:33f:cafe::5a) by SJ0PR05CA0060.outlook.office365.com
 (2603:10b6:a03:33f::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.6 via Frontend Transport; Tue, 15
 Sep 2026 20:59:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BY1PEPF0001AE17.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 20:59:10 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 15 Sep
 2026 13:59:00 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 15 Sep 2026 13:59:00 -0700
Received: from inno-dell.home (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Tue, 15
 Sep 2026 13:58:52 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <dakr@kernel.org>, <acourbot@nvidia.com>
CC: <alex@shazbot.org>, <jgg@nvidia.com>, <yishaih@nvidia.com>,
	<skolothumtho@nvidia.com>, <kevin.tian@intel.com>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
	<boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
	<lossin@kernel.org>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
	<tmgross@umich.edu>, <jhubbard@nvidia.com>, <ecourtney@nvidia.com>,
	<cjia@nvidia.com>, <smitra@nvidia.com>, <kjaju@nvidia.com>,
	<alkumar@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
	<kwankhede@nvidia.com>, <targupta@nvidia.com>, <nova-gpu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
	<zhiwang@kernel.org>, Zhi Wang <zhiw@nvidia.com>
Subject: [PATCH 14/14] Documentation: rust: explain SR-IOV PF data sharing with VFs
Date: Tue, 15 Sep 2026 23:56:58 +0300
Message-ID: <20260915205659.76841-15-zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915205659.76841-1-zhiw@nvidia.com>
References: <20260915205659.76841-1-zhiw@nvidia.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE17:EE_|SJ0PR12MB8167:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d75c8a0-999c-4bdd-2fec-08df136c30fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|23010399003|376014|7416014|22082099003|18002099003|56012099006|11063799006|5023799004|3023799007|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	h+qspjJNgF02t5ztOkdcOZFiLZL7K7g36HcGmlKnNvYUh4q672R9PV/HxnB7Szd+qqOYsNfEEJ4a5zUAlJgYNBOcyvMg1/MdbWwtK2xoh22nSgdqSOrFfpNsE/VOQJjX9aT3oC8zFknP0dG46k2CmNQUa2OBtz+ZrUrg0XqFGQqNcEGnfRQt3/jnNYEpeNnxud+xUPPnIf4/yYdJrLMKrcQZxAMSs4idL1FH5ie9LuTJWFuokJpy+LiKL9exlVH1h2FVrxMFyK7ck5hEcA6rRuxcNVnpw0xHB2+rh9WH+gdb2wGoDVBpoms1BZ7+3m2zYCWQcTdhr0XB4JOLoHy1fWMFa7omwcsZdT1jAog37s8HwSWQH5uuEZPOVGhvjf7cjvW5b+daMBBfKOGfaKTFEhSgW4xEC7vKnJbCr4o/Yw82EW64j5yTpbsAKfoZy+EVz+Mci0U1Qu+rS77js2YeCKLnSK4i1KewF+zUi2tohJv/ay2u9xdMxZpx3ZWEGj8S03p71qLmZjKI1I4kUzP9Djr4ROFzGGgZMVcCT10jbjY8wwauHzJ2wn8XeYBWg4QhsZ0W9hTKaeEs0JSfs67xFEMxnwtvs02Ni0N9s8Cj6r/dAetalBfWQPe7UHc68+J1fsrU2R1lfBXZjOLOAiYwbnAJmzhBZPJ2Cx6a7apjxIKieTlLcwYLgFfhafrIgsaMgKkEruu7MbH/RpVhfZ/31A==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(23010399003)(376014)(7416014)(22082099003)(18002099003)(56012099006)(11063799006)(5023799004)(3023799007)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HlLQFtmQpoZssBrkH2OUbkDXI7L1+fd+asPsxnHuzYS9ijhNJVRXqptLhaeo2zo2BJ9G9U8mHbPEHP0fwpj6rzJg2miL49pPurSBI5vx7Rp2VR8xZUJxRrSkaGJxfxoxm4cmz9i/zSQ3S3TYO6JqEOWGaoD/os0UBtg1dctJw8BcmCcvBF0lfCDdVYNEHULcebBPOgH605tFjbZ3AZ0EZY8ARYm9sPhf62oU6lMV/37GJMxODfeXLZXJrhSTxbYjAFihnsJP4ByTiovW0p/aalT3V2jVOm/vM+O7DetI9e/96GJ+YOm/guwWacfjWFtfGOZRcoMmGdm+MCqDFwFjGhxticokB/R0F40wgMXoCQkkZe7poa0WHwh06N6H0cPQb7pQ3biRJy/YAR1BROgEs82X2t79IOd+teB1zY1yPKoXl5K4mJUKSbLfMNLfR10d
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 20:59:10.9059
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d75c8a0-999c-4bdd-2fec-08df136c30fd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE17.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8167

Rust and C VF drivers may need a narrow PF-owned interface without
gaining access to all private data belonging to the PF driver. The
typed PF registration and C FFI abstractions span PCI topology, type
checking, driver lifetime, and synchronization, which need a single
explanation.

The design embeds one pinned PF/VF contract inline in ordinary PCI
driver data. Rust consumers borrow it as `Pin<&T>`; C consumers borrow a
checked operations table and context. Both paths invoke the same Rust
implementation, while managed SR-IOV orders VF teardown before PF data
destruction.

Document the ownership and borrowing model, in-place initialization,
publication and teardown rules, FFI versioning and trampolines, locking
and asynchronous drain requirements, and limitations. Illustrate the
storage, lifetime, and Rust and C call paths with ASCII diagrams.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 Documentation/rust/index.rst             |   1 +
 Documentation/rust/pci-sriov-pf-data.rst | 330 +++++++++++++++++++++++
 MAINTAINERS                              |   1 +
 3 files changed, 332 insertions(+)
 create mode 100644 Documentation/rust/pci-sriov-pf-data.rst

diff --git a/Documentation/rust/index.rst b/Documentation/rust/index.rst
index b78ed0efa784..a3e8924d678a 100644
--- a/Documentation/rust/index.rst
+++ b/Documentation/rust/index.rst
@@ -37,6 +37,7 @@ more details.
     coding-guidelines
     arch-support
     testing
+    pci-sriov-pf-data
 
 You can also find learning materials for Rust in its section in
 :doc:`../process/kernel-docs`.
diff --git a/Documentation/rust/pci-sriov-pf-data.rst b/Documentation/rust/pci-sriov-pf-data.rst
new file mode 100644
index 000000000000..acc6f3582386
--- /dev/null
+++ b/Documentation/rust/pci-sriov-pf-data.rst
@@ -0,0 +1,330 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _pci_rust_sriov_pf_data:
+
+===========================================
+Sharing Rust PF data with SR-IOV VF drivers
+===========================================
+
+An SR-IOV Physical Function (PF) and its Virtual Functions (VFs) are
+independent PCI devices.  Their drivers may live in different modules, and a
+VF driver may be written in either Rust or C.  Nevertheless, a VF often needs
+to invoke a small PF-owned interface for coordination with the physical
+device.
+
+This document describes how a Rust PF driver can publish pinned data for its
+VFs without exposing its complete private ``drvdata``.  It supplements the
+general SR-IOV description in :doc:`../PCI/pci-iov-howto`.
+
+The idea
+========
+
+The PF publishes one deliberately chosen data object through
+``VfRegistration`` before enabling VFs.  The registration and object are
+initialized inline in the PF's pinned driver data.  A Rust VF receives a typed
+``Pin<&T>``.  A C VF receives a checked ``struct rust_ffi`` descriptor whose
+operations call the same object through generated C ABI trampolines.
+
+The published object is an explicit PF/VF contract, not a replacement for PF
+``drvdata``.  PCI supplies the route to the correct PF and orders driver
+teardown; the chosen object supplies only the data and operations that the PF
+intends to share.  VFs borrow that object and never own it.
+
+There is no global interface registry.  PCI topology selects the provider:
+the consumer is a VF and its ``physfn`` identifies the PF.  The consumer path
+then checks that the selected PF published the expected Rust type or C ABI.
+
+::
+
+        PF driver data (pinned)
+        +--------------------------------+
+        | VfRegistration                 |
+        |  +-----------------------------+
+        |  | rust_ffi (at offset 0)      |<----+
+        |  | TypeId | pinned T           |<--+ |
+        |  +-----------------------------+   | |
+        | remaining PF data              |   | |
+        +--------------------------------+   | |
+                                             | |
+        PF struct pci_dev                    | |
+        +----------------------------+       | |
+        | vf_registration_data_rust -+-------+ |
+        +----------------------------+         |
+                                               |
+        Rust VF: TypeId check -> Pin<&T> -------+
+        C VF: token/ABI/size -> ops/context ----+
+
+The design separates four concerns:
+
+* PCI topology selects the actual PF for a VF.
+* Rust ``TypeId`` or the C FFI token and version check the requested
+  interface.
+* A managed device link and the inline registration determine the lifetime
+  of the borrow.
+* The published data type supplies any synchronization needed by concurrent
+  callers.
+
+The FFI descriptor does not hold a second copy of the PF data.  Its
+``context`` points at the same pinned object that a Rust VF borrows directly.
+For example, both Rust and C VFs in the SR-IOV sample eventually call
+``PfApi::submit()``.  The C path adds only an ABI trampoline and return-value
+conversion.
+
+Lifetime foundation
+===================
+
+The published pointer is borrowed; it is not a reference-counted handle.
+Its lifetime is based on managed SR-IOV and a persistent managed device link
+from each VF consumer to its PF supplier.
+
+The PCI core creates that link before the VF is allowed to probe.  The link
+remains after a failed probe or a normal driver unbind so it also protects a
+later bind.  The driver core consequently waits for an in-progress VF probe
+and unbinds every bound VF consumer before unbinding the PF supplier.  On PF
+removal, managed SR-IOV also invokes ``sriov_configure(0)`` before the PF
+driver's remove callback if VFs are still enabled.  VF unbind, including
+destruction of its driver data, completes before PF removal proceeds.
+
+::
+
+        PF probe
+           |
+           +-- initialize and pin VfRegistration and its data
+           |
+           +-- publish as the registration's final initialization step
+           |
+        PF probe returns and installs all PF driver data
+           |
+        sriov_configure(n) enables VFs
+           |
+           +-- PCI creates each VF
+           |
+           +-- PCI adds a managed link: VF consumer -> PF supplier
+           |
+           +-- VF probe borrows and uses the PF data
+           |
+        PF unbind is requested
+           |
+           +-- driver core unbinds every VF consumer
+           |      |
+           |      +-- VF remove stops and drains all PF calls
+           |      |
+           |      +-- VF driver data is destroyed
+           |
+           +-- if VFs remain, PCI invokes sriov_configure(0)
+           |
+           +-- disabling SR-IOV destroys VF devices and links
+           |
+           +-- PF remove runs
+           |
+           +-- PF driver data is destroyed
+                  |
+                  +-- registration disables any remaining VFs
+                  |
+                  +-- registration withdraws and drops the data
+
+Disabling VFs through ``sriov_numvfs`` follows the shorter part of the same
+ordering: VF drivers are removed before their VF devices disappear, while the
+PF driver remains bound and its registration remains published.
+
+If ``sriov_configure(0)`` does not disable all VFs during PF unbind, the PCI
+core warns and forcibly disables SR-IOV.  The lifetime guarantee therefore
+does not depend on a successful driver callback.
+
+A successful VF probe may retain the borrow in its driver data for the
+duration of that binding.  A failed probe must discard the borrow before
+returning.  A VF remove callback must stop and drain all work that could use
+the PF data before the callback returns.  These rules also apply to raw
+descriptor and context pointers retained by a C VF.
+
+Publishing PF data
+==================
+
+PF and VF drivers use the ordinary ``pci::Driver`` abstraction.
+``VfRegistration::new()`` publishes ``ForLt``-encoded data for Rust
+consumers.  ``VfRegistration::new_ffi()`` publishes the same data and adds a
+C-callable FFI descriptor.  Both return a pin-initializer rather than an
+allocated registration handle.  The PF embeds it with ``<-`` in a
+``#[pin]`` field of its driver data::
+
+        #[pin_data]
+        struct PfData<'a> {
+            #[pin]
+            vf_registration: pci::VfRegistration<'a, MyApiForLt>,
+            // Fields borrowed by MyApi follow the registration.
+        }
+
+The constructor rejects a VF.  On a conventional PCI function without an
+SR-IOV capability it creates an inactive registration, allowing one PF-side
+driver to continue supporting devices with and without SR-IOV.
+
+The constructors are unsafe because the PF driver establishes conditions
+that cannot be expressed entirely in the type system.  A provider must:
+
+* Call the constructor during PCI probe, before any VF can be enabled.  It
+  publishes only when that function is an SR-IOV PF.
+* Publish at most one registration for a PF.
+* Initialize it in the pinned PF driver data and do not forget that data.
+* Enable VFs only after PF probe has returned and installed that driver data.
+* Use managed SR-IOV so VF consumers are unbound before the registration is
+  dropped.
+* Declare it before any PF driver fields borrowed by the published object, so
+  the registration is dropped first.
+
+The published type must be ``Send + Sync`` for every lifetime because VFs may
+call it from different threads.
+
+The Rust PCI adapter opts drivers into managed SR-IOV.  Its
+``sriov_configure`` callback receives a checked ``pci::sriov::Device`` and a
+pinned reference to the PF driver data.  It enables or disables VFs with
+``enable_sriov()`` and ``disable_sriov()``.
+
+Rust VF consumers
+=================
+
+A Rust VF implements ``pci::Driver`` and explicitly requests PF data during
+probe.  The accessor verifies that the PCI device is a VF, follows its PF
+relationship, checks that data was published, compares its ``TypeId``, and
+returns a pinned shared reference.  The VF does not receive the PF's
+``pci::Device``, the PF driver object, or an untyped pointer.
+
+PF and VF drivers may be registered by separate modules.  They must share the
+exact ``ForLt`` type that identifies the PF data.  Defining look-alike types
+independently does not work because they have different ``TypeId`` values.
+When separate Rust crates are used, put the shared definition in a crate that
+both can import.
+
+``vf_registration_data()`` is the direct accessor for data encoded by
+``CovariantForLt``.  ``vf_registration_data_with()`` supports invariant
+data; its higher-ranked closure prevents that data from escaping with a
+shortened lifetime.  A domain-specific VF handle may store only the VF device
+and use the closure accessor for each operation, rather than retaining a
+separate raw PF pointer.
+
+If one module registers both drivers, register the VF driver first.  This
+ensures that it is ready before the PF can enable VFs.  PF-only and VF-only
+modules register their ordinary PCI drivers independently.
+
+C VF consumers
+==============
+
+The common C descriptor is declared in ``include/linux/rust_ffi.h``::
+
+        struct rust_ffi
+        +---------------------------------------------------+
+        | token | ABI version | ops size | ops | context    |
+        +---------------------------------------------------+
+
+The token identifies the type and semantics of an operations table.  It is
+not a PCI device identifier, a secret, an authorization check, a registry
+key, or a lifetime handle.  PCI locates the PF before comparing the token.
+
+A driver-specific header defines the stable token, ABI version, and C
+operations structure shared by the Rust provider and C consumers.  ABI
+compatibility follows these rules:
+
+* The major version must match exactly.
+* A provider's minor version must be at least the consumer's requested minor
+  version.
+* A minor-version update may only append operations to the table.
+* ``ops_size`` must cover the table prefix used by the consumer.
+
+The Rust provider implements ``interop::ffi::Abi`` and applies
+``#[ffi_vtable]`` to methods on its PF data.  The macro verifies the complete
+bindgen operations-table layout and generates a private static operations
+table and private C ABI trampolines.  It does not generate the C header.  A
+trampoline recovers ``Pin<&T>`` from ``context`` and invokes the same Rust
+method used by Rust VFs.  It converts ``Result<()>`` into zero or a negative
+errno, and ``Result<c_int>`` into its successful value or a negative errno.
+
+::
+
+        Rust VF                                  C VF
+        vf_registration_data()                   borrow + ABI checks
+             + TypeId check                               |
+                   |                                      v
+                   v                         ops->submit(context, id)
+              Pin<&PfApi>                                |
+                   |                            generated trampoline
+                   +------------------+-------------------+
+                                      |
+                                      v
+                             PfApi::submit() -> Result
+                                |                 |
+                           Rust error         C 0 or -errno
+
+A C VF includes ``linux/rust_ffi.h`` directly or through its driver-specific
+header and borrows the interface during probe.  The essential call sequence
+is::
+
+        const struct my_pf_ops *ops;
+        const struct rust_ffi *ffi;
+        int ret;
+
+        ffi = pci_iov_borrow_rust_pf_data(vf, &my_token,
+                                          MY_ABI_MAJOR,
+                                          MY_ABI_MINOR,
+                                          sizeof(*ops));
+        if (IS_ERR(ffi))
+                return PTR_ERR(ffi);
+
+        ops = ffi->ops;
+        if (!ops->submit)
+                return -EOPNOTSUPP;
+
+        ret = ops->submit(ffi->context, pci_dev_id(vf));
+        if (ret)
+                return ret;
+
+The PCI helper verifies that the device is a VF, that its PF is bound to a
+managed SR-IOV driver, and that the descriptor satisfies the requested token,
+version, and size.  It returns a borrow, so there is no matching ``put``
+operation.  The size check does not prove that an individual operation is
+implemented, so the consumer must still check each callback it needs.  The
+pointers must not be used after VF probe fails or after VF remove returns.
+
+Synchronization and teardown
+============================
+
+All VFs of a PF borrow the same object and may call it concurrently.  Pinning
+keeps the object's address stable; it does not serialize access.  The PF data
+must use interior synchronization appropriate for each operation, such as a
+mutex for sleepable methods or an atomic for a simple counter.
+
+The sample uses ``Mutex<u64>`` for its request count to demonstrate shared,
+synchronized PF state.  The count is an internal implementation detail and
+is not returned through the C ABI.  Both consumers see only whether
+``submit()`` succeeded.
+
+Document for every C operation whether it may sleep and which calling
+contexts are permitted.  Before VF removal returns, cancel or flush any work
+that could still call an operation.  Do not wait for such work while holding
+a lock that the operation itself needs.
+
+Disabling SR-IOV through sysfs removes VFs synchronously while holding the PF
+device lock.  A VF remove path must not wait for an FFI operation that must
+acquire that same lock, or the two paths can deadlock.
+
+The managed device link supplies driver-presence and teardown ordering, but
+not runtime-PM integration.  Operations that access powered PF hardware must
+arrange runtime PM separately.
+
+Examples
+========
+
+The complete examples are:
+
+* ``samples/rust/rust_driver_sriov.rs``: a Rust PF and Rust VF sharing a
+  pinned PF object with a mutex-protected counter;
+* ``samples/rust/rust_driver_sriov.h``: the C ABI token, version, and
+  operations table;
+* ``samples/rust/rust_driver_sriov_c_vf.c``: a C VF borrowing and calling the
+  Rust PF object; and
+* ``drivers/gpu/nova-core/driver.rs``: a regular Rust PCI driver publishing
+  unit data as a typed PF-readiness marker without a C ABI.
+
+The Rust and C sample VF drivers match the same device ID, so only one can
+bind to a given VF.  Use the module ordering described by their Kconfig help
+or ``driver_override`` to select the C path deterministically.
+
+See also :doc:`../driver-api/device_link` for the general device-link model.
diff --git a/MAINTAINERS b/MAINTAINERS
index e03ebe44c341..922cfddcb2dc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21137,6 +21137,7 @@ L:	linux-pci@vger.kernel.org
 S:	Maintained
 C:	irc://irc.oftc.net/linux-pci
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git
+F:	Documentation/rust/pci-sriov-pf-data.rst
 F:	rust/helpers/pci.c
 F:	rust/kernel/pci.rs
 F:	rust/kernel/pci/
