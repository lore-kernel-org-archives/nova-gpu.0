Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011028.outbound.protection.outlook.com [52.101.62.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9210F395DBF
	for <nova-gpu@lists.linux.dev>; Tue, 15 Sep 2026 20:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789505937; cv=fail; b=VijhazxHmH1Y3/DfjyTqQuzCBpqytpBWDcY9+/7P6VUcZLpYDGYA3sAMSpwL8ogUHNPzG9StI7EOPt7YCdjBdGrkfJXy5oMQ4TbkGajRQdeQc2dh3y2EmrDHifu09oi1u6WMVkQR+R/YvTlDA/kkfuaXkrN42gN0BjbH0aGQumA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789505937; c=relaxed/simple;
	bh=x3q3BOeuNy67iijUqBs5WXC9YTvX6+Cex39KRulHhfc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tYlUZVbcqwF5Tdd5PWIaxSoqBVRLbx9JTogmR4nlU7CBQTZFZWCOMaTM2kbw8OKMsTtTlFWpx3RGAUSFCobZtMdstOqI77SG81WrDS4ZhEVdcb3sHoQlQPb8cY5GfQcD1jVBOL4IRi5PsVFlxIlMFmG3n4enLpHs/f7gy5LGxio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YB4JXUPf; arc=fail smtp.client-ip=52.101.62.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YB4JXUPf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aeB5ll1p+6T5o+jSJnsZDou5YOAG27YtraPgcE4IPaJEQg5Hncmd22nDkU/0COP1EAILM7LGGenZw6Et2bs/bbo4hgltlEWgt5OPcB7BXUy7oXVUphWZrvMg9ORW15CfAjjVgYP6G/2X92xhG4v71lCHG1i6cSjzj6TSUGaJYt+h7IFy8YZEAVm8rD7poz07OSk93cm63NH1GOgZSmnhSN2Y/MEVPFHvKTEjlg8Tp7NULLCm9O6WYabyO54w89jgnPwmA4NmW4FJaPh/WziH0DO7YnOMUiZAJuNBawNwIfavUB+O6DO9mS6w0iR/UXgREQKPpKkzqxrAFHDBtPWXBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=88TsNAgqBy7WRNzcoEp8+ipP2HN5JX7XYGuQ+ml9mBE=;
 b=xy0Llu3IThmsk4A1/NZ/DfzGL40t5zOyHYEIGuBaT7kqTXVPa0x/ZoKQHkpZI5Foj4eEQh4pw2xIyRb1G/19jGfgX85xnP22k9lU55f0gXoimX4qluN+DLxOKysLUB1RPMGHH8KBiI7fgg5VREL9LUjQ04Uq+rZYfZ5aXM098yFwmdWmkPjjA2SJy+vLge6Cg4vJ5sNA5qNlTcgFdBoI1BnZhiyJbEV7KrGrvTrArimygXAPXHeu0bW9cvFPxKsZpCqsXqQ9zGFISfoiDUcfVA6VG18oonVGX8WD26WJ0GLOVUctKxY2tkFaXbsQcVVM6R/ttZRlbZtx+SCoRdGngQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88TsNAgqBy7WRNzcoEp8+ipP2HN5JX7XYGuQ+ml9mBE=;
 b=YB4JXUPfGHvSMj7Qipd9eZIwRR4mr1X4eSOYCJ87ftuP3ZwIW508wkRmXfX8XvOtIuerhTV6+LgKB7rZXmr2Q3AGmvp2jL5QbipbNyNA6X25SZYsUqRsMezEV+2vsbQ6SCkvqztJAvJC09JUyCoqp+5SeJBcu9Nat5KrRcwTNp446NZylWl1ttdHQQl4IhBhFzublHwHv/82FLM/jed8Vrb+X+dUXSnVzFmXSSMbiJfTXMY3OQG82e6oS5asXFK+ZVZcKRd5jbq0MFkYQxndhKd7Ngd77h9phFpeEN+0mP5VcsBcXmYwjwk9WLSHhTSXa342hZpHqRXEIu/qSfBR0A==
Received: from SJ0PR13CA0183.namprd13.prod.outlook.com (2603:10b6:a03:2c3::8)
 by SN7PR12MB8602.namprd12.prod.outlook.com (2603:10b6:806:26d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 20:58:43 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::26) by SJ0PR13CA0183.outlook.office365.com
 (2603:10b6:a03:2c3::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Tue, 15
 Sep 2026 20:58:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 20:58:42 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 15 Sep
 2026 13:58:20 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 15 Sep 2026 13:58:20 -0700
Received: from inno-dell.home (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Tue, 15
 Sep 2026 13:58:13 -0700
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
	<zhiwang@kernel.org>, Peter Colberg <pcolberg@redhat.com>, Zhi Wang
	<zhiw@nvidia.com>
Subject: [PATCH 09/14] samples: rust: add Rust SR-IOV VF driver sample
Date: Tue, 15 Sep 2026 23:56:53 +0300
Message-ID: <20260915205659.76841-10-zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915205659.76841-1-zhiw@nvidia.com>
References: <20260915205659.76841-1-zhiw@nvidia.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|SN7PR12MB8602:EE_
X-MS-Office365-Filtering-Correlation-Id: f75db98b-0a95-44f1-ed41-08df136c2050
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|1800799024|23010399003|10067099003|6133799003|22082099003|18002099003|11063799006|56012099006|5023799004|13003099007;
X-Microsoft-Antispam-Message-Info:
	B7E3RKZKIRPU/KPKdXAphrz+HGh3u0f2lgPqastBh4c6/LElX5062Ar4EYNWTiLl9WSOA5fTe7Nqve8Cc+0m+rh3RvfTPIbBRol+bt+9aqKRIxa+Arsput0sm0vzatiPdgb0Pio6QeA+thqW5+4a9pzwBWKrlMGD6JZcP88l2mY4szsg9SO44m5WG0SKOxLu7dmndh/V3+fauRgrrJRz2P7VeRJiZRZY1fFkAc6OBOHirvucqH4hsTIs8XrbdM/St5ZUT6R767XAy7JzUlHV3IZFhainfU4mV6bVzqN8KSvgDkfaGFFp4A8XuNqDcL5AStV2WO7v1N4G/ad1WIL0kiTxEkwXOM1eZ1LEHUL+GGg08ihGnK9Ggg2X2370slplr8rNTTbazN/DQfEcnGi/WYmGGzM3dypf4BhjWV7wj2zorNMmAl7aPNuD66fy2IuBdBZkmw/+EXZUkhAQ5VRyKvVxVV/kSrQHovgKV2/W1zTErcUMRP+t3Yoh1cVlKPTXdIYaefuEeN9J2seeIb1xBJBTdkPNuvAF3c3VxCOOT4AJVQcu3lVOedIKaC32AVoHp6s7RL0MxNFJ/jwZ01Ryq1xXjkKMSCDGBhwABOJvuO2retGe1WdMlitOBLr/13ABHQGk1fVZVhnbeW742jxpRXChpfYP66olRUn5Y2hjUzwBdmviwOaCHIustMiC1a8AABPE7FG+H6CdG8HSxZQi2A==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(1800799024)(23010399003)(10067099003)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006)(5023799004)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5srs3tOqXB20yYawhVXSIAC5ADuWI8RUyu4qMeMo32Au5DxAIE0PE7T709iYA0kUrbasHl7zpm2jsX+xPq/yG9gFeVq6+m48ueI9WxdbIm5mymuqZ1Lt095xMI5/hPOs3p3wbgNiTeH3j5jmwiJxHPBYfdFtppDrYXFJNWtKKAOEmyc4Yrh8WJWeeR+5+Bwn+ir7igcWeJt3ujL6Ye54KOamooOr0n8XinW5s5sAR/f33GmIWfsmJy0HG7ga8DNTFljURxMIG+w6X1wN0Fg06K1gBJuM2QbTwEkC0tOLhptcV0Hr7jv10NB1hU0noK7y2mUEII545tJDmtNvDZztNlE8VyC2cSiRmMdPXb7U1VYyaqHKnLIpLeIkIh6JK15kvMbctBFRq6Z7BPQ5DHo+tZLDC85veOLRuF8K4vFdl7jyIU39SnK0mXT9nRml7C7a
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 20:58:42.9262
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f75db98b-0a95-44f1-ed41-08df136c2050
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8602

From: Peter Colberg <pcolberg@redhat.com>

Add a new SR-IOV driver sample that demonstrates how to enable and
disable the Single Root I/O Virtualization capability for a PCI device.

The sample may be exercised using QEMU's 82576 (igb) emulation.

Implement the PF and VF as ordinary PCI drivers. Publish pinned PF data
with a mutex-protected counter inline in the PF driver data, then borrow
and invoke it explicitly from VF probe. Register the VF driver first so
it is ready before the PF can enable VFs.

Link: https://www.qemu.org/docs/master/system/devices/igb.html
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
Co-developed-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 MAINTAINERS                       |   1 +
 samples/rust/Kconfig              |  11 ++
 samples/rust/Makefile             |   1 +
 samples/rust/rust_driver_sriov.rs | 241 ++++++++++++++++++++++++++++++
 4 files changed, 254 insertions(+)
 create mode 100644 samples/rust/rust_driver_sriov.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 2389df80ba50..5e168398e963 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21141,6 +21141,7 @@ F:	rust/helpers/pci.c
 F:	rust/kernel/pci.rs
 F:	rust/kernel/pci/
 F:	samples/rust/rust_driver_pci.rs
+F:	samples/rust/rust_driver_sriov.rs
 
 PCIE BANDWIDTH CONTROLLER
 M:	Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index 31d62533ef25..737670fd68f8 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -128,6 +128,17 @@ config SAMPLE_RUST_DRIVER_PLATFORM
 
 	  If unsure, say N.
 
+config SAMPLE_RUST_DRIVER_SRIOV
+	tristate "SR-IOV Driver"
+	depends on PCI_IOV
+	help
+	  This option builds the Rust SR-IOV driver sample.
+
+	  To compile this as a module, choose M here:
+	  the module will be called rust_driver_sriov.
+
+	  If unsure, say N.
+
 config SAMPLE_RUST_DRIVER_USB
 	tristate "USB Driver"
 	depends on USB = y
diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index b986b681cde5..238a11d5ec39 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_SAMPLE_RUST_DRIVER_I2C)		+= rust_driver_i2c.o
 obj-$(CONFIG_SAMPLE_RUST_I2C_CLIENT)		+= rust_i2c_client.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PCI)		+= rust_driver_pci.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PLATFORM)	+= rust_driver_platform.o
+obj-$(CONFIG_SAMPLE_RUST_DRIVER_SRIOV)		+= rust_driver_sriov.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_USB)		+= rust_driver_usb.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_FAUX)		+= rust_driver_faux.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_AUXILIARY)	+= rust_driver_auxiliary.o
diff --git a/samples/rust/rust_driver_sriov.rs b/samples/rust/rust_driver_sriov.rs
new file mode 100644
index 000000000000..ae1e1babb66b
--- /dev/null
+++ b/samples/rust/rust_driver_sriov.rs
@@ -0,0 +1,241 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust SR-IOV driver sample based on QEMU's 82576 ([igb]) emulation.
+//!
+//! To make this driver probe, QEMU must be run with `-device igb`.
+//!
+//! Further, enable [vIOMMU] with interrupt remapping using, e.g.,
+//!
+//! `-M q35,accel=kvm,kernel-irqchip=split -device intel-iommu,intremap=on,caching-mode=on`
+//!
+//! and append `intel_iommu=on` to the guest kernel arguments.
+//!
+//! [igb]: https://www.qemu.org/docs/master/system/devices/igb.html
+//! [vIOMMU]: https://wiki.qemu.org/Features/VT-d
+
+use kernel::{
+    device::{
+        Bound,
+        Core, //
+    },
+    driver,
+    new_mutex,
+    pci,
+    prelude::*,
+    sync::{
+        aref::ARef,
+        Mutex, //
+    },
+    types::CovariantForLt,
+    InPlaceModule, //
+};
+
+const PF_DRIVER_NAME: &CStr = c"rust_driver_sriov_pf";
+const VF_DRIVER_NAME: &CStr = c"rust_driver_sriov_vf";
+
+struct SamplePfDriver;
+struct SampleVfDriver;
+
+#[pin_data]
+struct PfApi<'bound> {
+    pdev: &'bound pci::Device<Bound>,
+    #[pin]
+    requests: Mutex<u64>,
+}
+
+type PfApiForLt = CovariantForLt!(PfApi<'_>);
+
+impl PfApi<'_> {
+    fn submit(self: Pin<&Self>, vf: &pci::Device<Bound>) -> Result<u64> {
+        let mut requests = self.requests.lock();
+        let request = (*requests).checked_add(1).ok_or(EOVERFLOW)?;
+        *requests = request;
+        drop(requests);
+
+        dev_info!(
+            self.pdev,
+            "Handle PF request {} from VF devfn {:#x}.\n",
+            request,
+            vf.dev_id()
+        );
+
+        Ok(request)
+    }
+}
+
+#[pin_data(PinnedDrop)]
+struct PfDriverData<'bound> {
+    // Keep the device alive until the registration stops exposing `PfApi::pdev`.
+    #[pin]
+    _registration: pci::VfRegistration<'bound, PfApiForLt>,
+    pdev: ARef<pci::Device>,
+}
+
+#[pin_data(PinnedDrop)]
+struct VfDriverData {
+    pdev: ARef<pci::Device>,
+}
+
+kernel::pci_device_table!(
+    PF_TABLE,
+    <SamplePfDriver as pci::Driver>::IdInfo,
+    [(
+        // E1000_DEV_ID_82576
+        pci::DeviceId::from_id(pci::Vendor::INTEL, 0x10c9),
+        ()
+    )]
+);
+
+kernel::pci_device_table!(
+    VF_TABLE,
+    <SampleVfDriver as pci::Driver>::IdInfo,
+    [(
+        // E1000_DEV_ID_82576_VF
+        pci::DeviceId::from_id(pci::Vendor::INTEL, 0x10ca),
+        ()
+    )]
+);
+
+#[vtable]
+impl pci::Driver for SamplePfDriver {
+    type IdInfo = ();
+    type Data<'bound> = PfDriverData<'bound>;
+
+    const ID_TABLE: pci::IdTable<Self::IdInfo> = &PF_TABLE;
+
+    fn probe<'bound>(
+        pdev: &'bound pci::Device<Core<'_>>,
+        _info: Option<&'bound Self::IdInfo>,
+    ) -> impl PinInit<Self::Data<'bound>, Error> + 'bound {
+        pin_init::pin_init_scope(move || {
+            dev_info!(
+                pdev,
+                "Probe Rust SR-IOV PF sample (PCI ID: {}, 0x{:x}).\n",
+                pdev.vendor_id(),
+                pdev.device_id()
+            );
+
+            pdev.enable_device_mem()?;
+            pdev.set_master();
+
+            Ok(try_pin_init!(PfDriverData {
+                // SAFETY:
+                // - probe has exclusive access to this PF before SR-IOV is enabled;
+                // - the registration is pinned in the PF driver data and dropped before `pdev`;
+                // - no other registration is created for this PF; and
+                // - VFs are enabled only after probe by `sriov_configure`.
+                _registration <- unsafe {
+                    pci::VfRegistration::new(
+                        pdev,
+                        try_pin_init!(PfApi {
+                            pdev,
+                            requests <- new_mutex!(0),
+                        }),
+                    )
+                },
+                pdev: pdev.into(),
+            }))
+        })
+    }
+
+    fn sriov_configure<'bound>(
+        dev: &'bound pci::sriov::Device<Core<'_>>,
+        this: Pin<&Self::Data<'bound>>,
+        nr_virtfn: i32,
+    ) -> Result<i32> {
+        if nr_virtfn == 0 {
+            dev_info!(
+                this.pdev,
+                "Disable SR-IOV (PCI ID: {}, 0x{:x}).\n",
+                this.pdev.vendor_id(),
+                this.pdev.device_id()
+            );
+            dev.disable_sriov();
+        } else {
+            dev_info!(
+                this.pdev,
+                "Enable SR-IOV (PCI ID: {}, 0x{:x}).\n",
+                this.pdev.vendor_id(),
+                this.pdev.device_id()
+            );
+            dev.enable_sriov(nr_virtfn)?;
+        }
+
+        assert_eq!(dev.num_vfs(), nr_virtfn);
+        Ok(nr_virtfn)
+    }
+}
+
+#[vtable]
+impl pci::Driver for SampleVfDriver {
+    type IdInfo = ();
+    type Data<'bound> = VfDriverData;
+
+    const ID_TABLE: pci::IdTable<Self::IdInfo> = &VF_TABLE;
+
+    fn probe<'bound>(
+        pdev: &'bound pci::Device<Core<'_>>,
+        _info: Option<&'bound Self::IdInfo>,
+    ) -> impl PinInit<Self::Data<'bound>, Error> + 'bound {
+        pin_init::pin_init_scope(move || {
+            dev_info!(
+                pdev,
+                "Probe Rust SR-IOV VF sample (PCI ID: {}, 0x{:x}).\n",
+                pdev.vendor_id(),
+                pdev.device_id()
+            );
+
+            let pdev_bound: &'bound pci::Device<Bound> = pdev;
+            let pf_api = pdev_bound.vf_registration_data::<PfApiForLt>()?;
+
+            pdev.enable_device_mem()?;
+            pdev.set_master();
+
+            let request = pf_api.submit(pdev)?;
+            dev_info!(pdev, "Submitted request {} through PF data.\n", request);
+
+            Ok(try_pin_init!(VfDriverData { pdev: pdev.into() }))
+        })
+    }
+}
+
+#[pinned_drop]
+impl PinnedDrop for PfDriverData<'_> {
+    fn drop(self: Pin<&mut Self>) {
+        dev_info!(self.pdev, "Remove Rust SR-IOV PF sample.\n");
+    }
+}
+
+#[pinned_drop]
+impl PinnedDrop for VfDriverData {
+    fn drop(self: Pin<&mut Self>) {
+        dev_info!(self.pdev, "Remove Rust SR-IOV VF sample.\n");
+    }
+}
+
+#[pin_data]
+struct SampleModule {
+    // Keep the VF driver registered while PF removal tears down its VFs.
+    #[pin]
+    _pf: driver::Registration<pci::Adapter<SamplePfDriver>>,
+    #[pin]
+    _vf: driver::Registration<pci::Adapter<SampleVfDriver>>,
+}
+
+impl InPlaceModule for SampleModule {
+    fn init(module: &'static ThisModule) -> impl PinInit<Self, Error> {
+        try_pin_init!(Self {
+            // The VF driver must be ready before the PF can enable VFs.
+            _vf <- driver::Registration::new(VF_DRIVER_NAME, module),
+            _pf <- driver::Registration::new(PF_DRIVER_NAME, module),
+        })
+    }
+}
+
+module! {
+    type: SampleModule,
+    name: "rust_driver_sriov",
+    authors: ["Peter Colberg"],
+    description: "Rust SR-IOV driver",
+    license: "GPL v2",
+}
