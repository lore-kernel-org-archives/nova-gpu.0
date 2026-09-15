Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012031.outbound.protection.outlook.com [52.101.53.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8BB43934A
	for <nova-gpu@lists.linux.dev>; Tue, 15 Sep 2026 20:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789505940; cv=fail; b=KRvhfZ5zwjHweZoM7g7kZOl0+W22OU7+mr6XOX+eOUKIXvuru4yrmovFf7I4DI7wASTDN24U71dw897xHWFmIYXVCViWXUjNhAeZ0rdJKaYbP8vuSAQRV17K5Pfi+4lX7mD9eeo2RakU78uFmltY0guW0xn/Y9RYFO5XL9sG57U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789505940; c=relaxed/simple;
	bh=0vm/IVja61Xk/JoSTJ0MgsmYaqIZQoBtIkNIFTefg+U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZHxfhMAnZmw/wktGcUOH5jOjccj5/NN1BgWppUoQh/0tVZ3Nt/2SJtISfJb219AZ1sqo1cuUoy/gQuNYX8Gg2z2Sla0tGFLSqpTFcXGr375uulv+gWc7GCu610UQz59/YFtqeneVcK2YtQ5NGiqt2i00w9LhaJrHBU9PKPi5J8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=f7vM3z/w; arc=fail smtp.client-ip=52.101.53.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="f7vM3z/w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xft9p4f19a/PbAdq/sTS7BbKMN8064cYCXg3/ZNskQAnaNBzzvitYc+QfLwvMWTd7O9E9FoO1kx1lUDMm6VRz4sV0J5ChOr+UVms7Fk5L1sUQiAbLiqrzdyMps72fCCRJC/RbW5RpwZCiHs1gNSyNWjc1hJso4w0+2FNV2sLRO/hkeMpnzjysDYw2z81xMDGXmh23wZdno3mCj6KEJso1aiDb3taPn2XFrhb53tOKlLK9/eRKPexwP0mBEaGwCVDme880D5Ziv/tL9Wn5A36p3weDmPZInjpxpQACHsoHS5Hm5+uzr4Vbp/W3SSKWqeE8182EgEjvepKLWX6XSatgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ur0wIalZLSJpV+OsGWLrSR1OwRCMyjVMx2jiCw6elDU=;
 b=cnXudBo4WdZ0HaOme862qY+VvL/njeDNv5DfCVE/ep2drCoKF3fTyrDm0t6Y0wSWg63h5i/TCKk6umaDTW+mEEoV6T+hsyh0KPI9tXRreZ4kpilxIcqVitFq9zWsl/M6KeXiIKvwDFhUsMVn3pBswb1VjlvXHuq4Z0Fm1YR7DNs2x6IEPb+0uQ7MLcQLSvjvXI6GQPDpbeoGowiVDgJujQ/kFVBxVIKbQb96Wrt8btHvEpWcJTV00A9lrbOKT3gADRX/i/rBVaghJRjVC1LD2kmGxQW9w5+MpnWyS+7y2+/Xa7Ki02Xeb7tBRFJzqeg734D6EHc/NQlhx7h9RuQ4fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ur0wIalZLSJpV+OsGWLrSR1OwRCMyjVMx2jiCw6elDU=;
 b=f7vM3z/wOg6NHPdh4HDP85Ogwaj6kC1vj9BVKDpVeTMJO/2uDGicjXIw8ACi7ahmAa1DiMAGWqKBhl7kmCFtewfy/OsFGtAI4X7F/z2yr7cgW7l+CqMp5jMyTBf54LlBEZTyyg92oUAbc3G+z1X+1qah2V9h3UX7NQdrupn6U5ymjDaPheEp0CXGkZBGkI/ITAoTyTGrry33t3ienE+RhG+HUKMr/2CocbzLaB5oLSGDET8AgkZMGA5UnURL37k35AWvkq8+YdTOpEv7jpKMfvhObH/5LmBeAvfC2oPa2zwQ8fdlkMHUTjKhcHIGEsjoVDwi4+t/euojkvV3iwyQnw==
Received: from SJ0PR03CA0041.namprd03.prod.outlook.com (2603:10b6:a03:33e::16)
 by PH7PR12MB5735.namprd12.prod.outlook.com (2603:10b6:510:1e2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 20:58:41 +0000
Received: from CO1PEPF000075F3.namprd03.prod.outlook.com
 (2603:10b6:a03:33e:cafe::65) by SJ0PR03CA0041.outlook.office365.com
 (2603:10b6:a03:33e::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Tue,
 15 Sep 2026 20:58:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1PEPF000075F3.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 20:58:40 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 15 Sep
 2026 13:58:13 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 15 Sep 2026 13:58:12 -0700
Received: from inno-dell.home (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Tue, 15
 Sep 2026 13:58:05 -0700
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
Subject: [PATCH 08/14] rust: pci: add typed SR-IOV PF registration data
Date: Tue, 15 Sep 2026 23:56:52 +0300
Message-ID: <20260915205659.76841-9-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F3:EE_|PH7PR12MB5735:EE_
X-MS-Office365-Filtering-Correlation-Id: 55b35334-6129-403f-ec7f-08df136c1ef0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|82310400026|36860700016|6133799003|18002099003|22082099003|13003099007|3023799007|10067099003|56012099006|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	o5SphEeJT7elqO1JLMuvMFsHuCSaGku947EKgpGqMob0/XQo0ORepSw+CNvNTl30kJI+ZT1CHEoyjc8CBV1y713Ruu1wV1WY7mJuKlodX1nRSFi3Q6v8m9p4sWSDfTJzIFiKIsKyIajQtKK9ck0KKYB9K2TS3dUQ2w4Eewtry9VsUszKDgvReluWKcxNSSl4EPxpp3VVZOJ15OcdUzSZjVDDOq7Jy0Z5NXs1YvRjym3Hxnbufd3yUZPeRv2N+J4El3C01pNrBoyl1il2CGj09p/NdOI0kUIFl5WOWQvfDGazw410UWdjI/p0+BoMa+C7VDbgR7nzud+JsioxtxKQFFDOs4Z3OcwI29UG71bd8kZRNRNtV1hic5AalsfMhBBmyb69fvytXM2x/yM+6AL6lbjp2L+e6+GboqoqR9E3g4sPB8sNwbmjmsyfxk5PwOGypvkdt8uddcQRsbGgpOJICYBMdPE/eqrIgIk84mcC1S7o64Am6bmBCjJ2IwT50HlVRwqr7t4HJJinMupyvJaX2XQWZxsH4VIS+pbhzpPMIYR/vHuP+6QLJAY4mNyHvaw/QkPSnvyJj42g9rORQPMllcj3+uDeTmc4XXUFdyd/aqwPPVfi2fZMQDd9CbEbMW5D89lF5qFDop/75t47xGr4+6oya2vhrxgWP+FlWOrKG8aKCdoZK513F3aJLlDZ+4OthfobJB2thOpVGKKtpWR78g==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(82310400026)(36860700016)(6133799003)(18002099003)(22082099003)(13003099007)(3023799007)(10067099003)(56012099006)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nppHVbg9UF8pZk5QZvvgteEdJ+i69Dh7dzsYW06wOJLzIX/FgftK/DUxCRIeKV9xitFIhpvKLX5LRyZ6iHwwIvrBW1ssxO6dlvJrtMroaHaKhBlloe0uKDSlBydCzOk9QEVbThcn0grtMS/VYn/nXj1B0nIuY2jMx/aHDVs07nQmp2BAMqpnLdLgxk3j2JHrCOdLEqK+hGsADX8HTzY4VChX/YZXSOHVow5Ve2U1yZtSPuNIl+AEgdy+RXt9XyP/HdiF6DinJt+1HMb7eIpyqOMKsiLsq40MXrA67BLzNkM5xD29QON6KOodC8KnATksM41Ny/5GP2XbSMLMeeCe6Yau+doBRaEoH1gOH508m9YbaayW0jNk5fsUGZ6Xb6pBxHjiGibhZbr9dsR7+wtNCdJ6swLui1do+ruy79oQ+jMtnHvlbQIbcaDqZBzo4cyM
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 20:58:40.5377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55b35334-6129-403f-ec7f-08df136c1ef0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5735

A VF driver may need to invoke PF-owned functionality without gaining
access to all private data belonging to the PF driver. The PCI device
alone cannot identify the restricted data type or express how long a
borrow remains valid.

Add a Rust registration slot to `struct pci_dev` and `VfRegistration`
to publish a `ForLt`-encoded payload. The registration is initialized
and pinned inline in the PF driver data, then publishes its address as
the final step of its own initialization. It remains inactive on
conventional PCI functions and rejects VFs.

Check that no VFs or other registration exist before publication. Pinned
drop disables SR-IOV before withdrawing the pointer and dropping the
payload. Managed SR-IOV ordering additionally removes every VF before
PF unbind.

Add `vf_registration_data_with()` for higher-ranked access and
`vf_registration_data()` for covariant data. `TypeId` rejects mismatched
Rust types without exposing the PF device or its complete driver data.

Keep SR-IOV operations behind a verified `pci::sriov::Device` view and
pass a pinned reference to the PCI driver data into `sriov_configure()`.
PF and VF consumers continue to use the ordinary `pci::Driver`
abstraction.

Expose `is_virtfn()` so PF drivers can reject VFs before initializing
hardware and publishing their registration.

Co-developed-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 include/linux/pci.h      |   6 +
 rust/kernel/pci.rs       |  69 +++++----
 rust/kernel/pci/sriov.rs | 299 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 345 insertions(+), 29 deletions(-)
 create mode 100644 rust/kernel/pci/sriov.rs

diff --git a/include/linux/pci.h b/include/linux/pci.h
index bc0d36204940..1ccc7fee7495 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -352,6 +352,9 @@ struct rcec_ea;
  *			Such bridges are allocated additional MMIO and bus
  *			number resources to allow for hierarchy expansion.
  * @is_pciehp:		PCIe Hot-Plug Capable bridge.
+ * @vf_registration_data_rust: Rust registration data published by the PF
+ *			before enabling VFs and retained until all VFs are
+ *			removed. The PF driver must use managed_sriov.
  */
 struct pci_dev {
 	struct list_head bus_list;	/* Node in per-bus list */
@@ -551,6 +554,9 @@ struct pci_dev {
 	u16		ats_cap;	/* ATS Capability offset */
 	u8		ats_stu;	/* ATS Smallest Translation Unit */
 #endif
+#if defined(CONFIG_PCI_IOV) && defined(CONFIG_RUST)
+	void		*vf_registration_data_rust;
+#endif
 #ifdef CONFIG_PCI_PRI
 	u16		pri_cap;	/* PRI Capability offset */
 	u32		pri_reqs_alloc; /* Number of PRI requests allocated */
diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index f2d71daef83a..46edc8007d78 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -37,6 +37,8 @@
 mod id;
 mod io;
 mod irq;
+#[cfg(CONFIG_PCI_IOV)]
+pub mod sriov;
 
 pub use self::cap::{
     ExtCapId,
@@ -64,6 +66,8 @@
     IrqVector,
     IrqVectorRegistration, //
 };
+#[cfg(CONFIG_PCI_IOV)]
+pub use self::sriov::VfRegistration;
 
 /// An adapter for the registration of PCI drivers.
 pub struct Adapter<T: Driver>(T);
@@ -160,13 +164,18 @@ extern "C" fn sriov_configure_callback(
         pdev: *mut bindings::pci_dev,
         nr_virtfn: c_int,
     ) -> c_int {
-        // SAFETY: The PCI bus only ever calls the sriov_configure callback with a valid pointer to
-        // a `struct pci_dev`.
-        //
-        // INVARIANT: `pdev` is valid for the duration of `sriov_configure_callback()`.
+        // SAFETY: The PCI bus invokes this callback with a valid device bound to this driver. The
+        // `CoreInternal` context is valid for the callback's duration.
         let pdev = unsafe { &*pdev.cast::<Device<device::CoreInternal<'_>>>() };
 
-        from_result(|| T::sriov_configure(pdev, nr_virtfn))
+        // SAFETY: `sriov_configure` is called only after a successful probe and before unbind, so
+        // the stored pointer has type `T::Data<'_>` and remains valid throughout this callback.
+        let data = unsafe { pdev.as_ref().drvdata_borrow::<T::Data<'_>>() };
+
+        from_result(|| {
+            let dev = sriov::Device::try_from_pci(pdev)?;
+            T::sriov_configure(dev, data, nr_virtfn)
+        })
     }
 }
 
@@ -355,41 +364,44 @@ fn unbind<'bound>(dev: &'bound Device<device::Core<'_>>, this: Pin<&Self::Data<'
         let _ = (dev, this);
     }
 
-    /// Single Root I/O Virtualization (SR-IOV) configure.
+    /// Configures Single Root I/O Virtualization (SR-IOV) for a Physical Function (PF).
     ///
-    /// Called when a user-space application enables or disables the SR-IOV capability for a
-    /// [`Device`] by writing the number of Virtual Functions (VF), `nr_virtfn` or zero to the
-    /// sysfs file `sriov_numvfs` for this device. Implementing this callback is optional.
+    /// The PCI core invokes this callback when userspace writes the number of Virtual Functions
+    /// (VFs), or zero, to the PF's `sriov_numvfs` sysfs file. For managed SR-IOV it is also called
+    /// with zero before [`Self::unbind`] when the PF still has enabled VFs.
     ///
-    /// Further, and unlike for a PCI driver written in C, when a PF device with enabled VFs is
-    /// unbound from its bound [`Driver`], the `sriov_configure()` callback is invoked to disable
-    /// SR-IOV before the `unbind()` callback. This guarantees that when a VF device is bound to a
-    /// driver, the underlying PF device is bound to a driver, too.
+    /// `dev` is a verified SR-IOV PF in the [`device::Core`] callback context. It can be converted
+    /// to the underlying PCI device through [`sriov::Device::as_pci`]. `this` is the private data
+    /// returned by [`Self::probe`]. Both remain valid for the duration of the callback.
     ///
-    /// Upon success, this callback must return the number of VFs that were enabled, or zero if
-    /// SR-IOV was disabled.
-    ///
-    /// See [PCI Express I/O Virtualization].
-    ///
-    /// [PCI Express I/O Virtualization]: https://docs.kernel.org/PCI/pci-iov-howto.html
+    /// Upon success, return the number of VFs that were enabled, or zero if SR-IOV was disabled.
     ///
     /// # Examples
     ///
     /// ```
     /// # use kernel::{device::Core, pci, prelude::*};
-    /// #[cfg(CONFIG_PCI_IOV)]
-    /// fn sriov_configure(dev: &pci::Device<Core<'_>>, nr_virtfn: i32) -> Result<i32> {
+    /// # struct Data;
+    /// fn sriov_configure(
+    ///     dev: &pci::sriov::Device<Core<'_>>,
+    ///     _this: Pin<&Data>,
+    ///     nr_virtfn: i32,
+    /// ) -> Result<i32> {
     ///     if nr_virtfn == 0 {
     ///         dev.disable_sriov();
     ///     } else {
     ///         dev.enable_sriov(nr_virtfn)?;
     ///     }
+    ///
     ///     Ok(nr_virtfn)
     /// }
     /// ```
     #[cfg(CONFIG_PCI_IOV)]
-    fn sriov_configure(dev: &Device<device::Core<'_>>, nr_virtfn: i32) -> Result<i32> {
-        let _ = (dev, nr_virtfn);
+    fn sriov_configure<'bound>(
+        dev: &'bound sriov::Device<device::Core<'_>>,
+        this: Pin<&Self::Data<'bound>>,
+        nr_virtfn: i32,
+    ) -> Result<i32> {
+        let _ = (dev, this, nr_virtfn);
         build_error!(crate::error::VTABLE_DEFAULT_ERROR)
     }
 }
@@ -508,24 +520,23 @@ pub fn resource_start(&self, bar: u32) -> Result<bindings::resource_size_t> {
     }
 
     /// Returns `true` if this device is a Physical Function (PF).
+    #[cfg(CONFIG_PCI_IOV)]
     #[inline]
-    #[expect(dead_code)]
     pub(crate) fn is_physfn(&self) -> bool {
         // SAFETY: `self.as_raw` is a valid pointer to a `struct pci_dev`.
         unsafe { (*self.as_raw()).is_physfn() != 0 }
     }
 
     /// Returns `true` if this device is a Virtual Function (VF).
+    #[cfg(CONFIG_PCI_IOV)]
     #[inline]
-    #[expect(dead_code)]
-    pub(crate) fn is_virtfn(&self) -> bool {
+    pub fn is_virtfn(&self) -> bool {
         // SAFETY: `self.as_raw` is a valid pointer to a `struct pci_dev`.
         unsafe { (*self.as_raw()).is_virtfn() != 0 }
     }
 
     /// Returns the number of Virtual Functions (VF) enabled for a Physical Function (PF).
     #[cfg(CONFIG_PCI_IOV)]
-    #[expect(dead_code)]
     pub(crate) fn num_vf(&self) -> i32 {
         // SAFETY: `self.as_raw` is a valid pointer to a `struct pci_dev`.
         unsafe { bindings::pci_num_vf(self.as_raw()) }
@@ -593,7 +604,7 @@ pub fn set_master(&self) {
     /// Enable the Single Root I/O Virtualization (SR-IOV) capability for this device,
     /// where `nr_virtfn` is number of Virtual Functions (VF) to enable.
     #[cfg(CONFIG_PCI_IOV)]
-    pub fn enable_sriov(&self, nr_virtfn: i32) -> Result {
+    pub(crate) fn enable_sriov(&self, nr_virtfn: i32) -> Result {
         // SAFETY:
         // `self.as_raw` returns a valid pointer to a `struct pci_dev`.
         //
@@ -609,7 +620,7 @@ pub fn enable_sriov(&self, nr_virtfn: i32) -> Result {
 
     /// Disable the Single Root I/O Virtualization (SR-IOV) capability for this device.
     #[cfg(CONFIG_PCI_IOV)]
-    pub fn disable_sriov(&self) {
+    pub(crate) fn disable_sriov(&self) {
         // SAFETY:
         // `self.as_raw` returns a valid pointer to a `struct pci_dev`.
         //
diff --git a/rust/kernel/pci/sriov.rs b/rust/kernel/pci/sriov.rs
new file mode 100644
index 000000000000..efbe444e0733
--- /dev/null
+++ b/rust/kernel/pci/sriov.rs
@@ -0,0 +1,299 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Abstractions for PCI Single Root I/O Virtualization (SR-IOV) drivers.
+
+use super::Device as PciDevice;
+use crate::{
+    bindings,
+    device, //
+    prelude::*,
+    types::{
+        CovariantForLt,
+        ForLt, //
+    },
+};
+use core::{
+    any::TypeId,
+    marker::PhantomPinned,
+    num::NonZero, //
+};
+
+/// A PCI Physical Function (PF) with an SR-IOV capability.
+///
+/// This capability view is created only after the PCI abstraction verifies that the device is an
+/// SR-IOV PF. Its device context follows the same hierarchy as [`PciDevice`].
+#[repr(transparent)]
+pub struct Device<Ctx: device::DeviceContext = device::Normal>(PciDevice<Ctx>);
+
+impl<Ctx: device::DeviceContext> Device<Ctx> {
+    pub(super) fn try_from_pci(pdev: &PciDevice<Ctx>) -> Result<&Self> {
+        // SAFETY: `pdev.as_raw()` is a valid pointer to a `struct pci_dev`.
+        if unsafe { (*pdev.as_raw()).is_physfn() == 0 } {
+            return Err(ENODEV);
+        }
+
+        // CAST: `Device` is a transparent capability view of `PciDevice` with the same context.
+        // SAFETY: The check above establishes the PF invariant, and the returned reference cannot
+        // outlive `pdev`.
+        Ok(unsafe { &*core::ptr::from_ref(pdev).cast() })
+    }
+
+    /// Returns the underlying PCI device with the same device context.
+    #[inline]
+    pub fn as_pci(&self) -> &PciDevice<Ctx> {
+        &self.0
+    }
+}
+
+impl<Ctx: device::DeviceContext> AsRef<PciDevice<Ctx>> for Device<Ctx> {
+    #[inline]
+    fn as_ref(&self) -> &PciDevice<Ctx> {
+        self.as_pci()
+    }
+}
+
+impl<Ctx: device::DeviceContext> AsRef<device::Device<Ctx>> for Device<Ctx> {
+    #[inline]
+    fn as_ref(&self) -> &device::Device<Ctx> {
+        self.as_pci().as_ref()
+    }
+}
+
+impl<'a> Device<device::Core<'a>> {
+    /// Returns the total number of VFs, or [`None`] if SR-IOV is unavailable.
+    #[inline]
+    pub fn total_vfs(&self) -> Option<NonZero<u16>> {
+        self.as_pci().sriov_get_totalvfs()
+    }
+
+    /// Enables `nr_virtfn` Virtual Functions (VFs).
+    #[inline]
+    pub fn enable_sriov(&self, nr_virtfn: i32) -> Result {
+        self.as_pci().enable_sriov(nr_virtfn)
+    }
+
+    /// Disables all Virtual Functions (VFs).
+    #[inline]
+    pub fn disable_sriov(&self) {
+        self.as_pci().disable_sriov();
+    }
+}
+
+impl Device<device::Bound> {
+    /// Returns the number of currently enabled Virtual Functions (VFs).
+    #[inline]
+    pub fn num_vfs(&self) -> i32 {
+        self.as_pci().num_vf()
+    }
+}
+
+// SAFETY: `Device` is a transparent wrapper around `PciDevice`, and neither type's layout
+// depends on its device context.
+kernel::impl_device_context_deref!(unsafe { Device });
+
+#[repr(C)]
+#[pin_data]
+struct VfRegistrationData<'a, F: ForLt + 'static> {
+    type_id: TypeId,
+    #[pin]
+    data: F::Of<'a>,
+}
+
+static_assert!(
+    core::mem::offset_of!(VfRegistrationData<'static, CovariantForLt!(())>, type_id) == 0
+);
+
+impl<'a, F: ForLt + 'static> VfRegistrationData<'a, F> {
+    fn new<D>(data: D) -> impl PinInit<Self, Error> + use<'a, D, F>
+    where
+        D: PinInit<F::Of<'a>, Error> + 'a,
+    {
+        try_pin_init!(Self {
+            type_id: TypeId::of::<F>(),
+            data <- data,
+        })
+    }
+}
+
+/// Typed data published by a Physical Function (PF) for its Virtual Functions (VFs).
+///
+/// The registration is initialized in place as part of the PF driver's pinned data. On an SR-IOV
+/// PF it publishes the inline payload after initialization; on a conventional PCI function it is
+/// inactive. A VF is rejected. Bound VFs access the payload through
+/// [`PciDevice::vf_registration_data()`] or [`PciDevice::vf_registration_data_with()`].
+///
+/// Managed SR-IOV removes all VFs before the PF driver is unbound. As a fallback, pinned drop also
+/// disables SR-IOV before withdrawing the payload.
+#[pin_data(PinnedDrop)]
+pub struct VfRegistration<'a, F: ForLt + 'static> {
+    pdev: &'a PciDevice<device::Bound>,
+    #[pin]
+    inner: VfRegistrationData<'a, F>,
+    published: bool,
+    #[pin]
+    _pin: PhantomPinned,
+}
+
+impl<'a, F: ForLt + 'static> VfRegistration<'a, F>
+where
+    for<'b> F::Of<'b>: Send + Sync,
+{
+    /// Publishes typed PF data for bound VF drivers.
+    ///
+    /// This returns a pin-initializer so the registration and payload can be embedded directly in
+    /// the PF driver's pinned data.
+    ///
+    /// Initialization returns [`ENODEV`] for a VF and [`EBUSY`] if the PF has enabled VFs or
+    /// already has a registration.
+    ///
+    /// # Safety
+    ///
+    /// The caller must invoke this during the PCI driver's probe and embed the result in the driver
+    /// data. On an SR-IOV PF, no VF may be enabled before probe successfully installs the complete
+    /// driver data, and the driver must use managed SR-IOV. The registration must be dropped before
+    /// anything its payload borrows and must not be forgotten. Probe must have exclusive access to
+    /// the PF registration slot. On a conventional PCI function, the registration remains
+    /// inactive.
+    pub unsafe fn new<'core, D>(
+        pdev: &'a PciDevice<device::Core<'core>>,
+        data: D,
+    ) -> impl PinInit<Self, Error> + use<'a, 'core, D, F>
+    where
+        D: PinInit<F::Of<'a>, Error> + 'a,
+    {
+        pin_init::pin_init_scope(move || {
+            if pdev.is_virtfn() {
+                return Err(ENODEV);
+            }
+
+            let published = pdev.is_physfn();
+            if published {
+                if pdev.num_vf() != 0 {
+                    return Err(EBUSY);
+                }
+
+                if !pdev.vf_registration_data_rust().is_null() {
+                    return Err(EBUSY);
+                }
+            }
+
+            Ok(try_pin_init!(Self {
+                pdev,
+                inner <- VfRegistrationData::new(data),
+                published,
+                _pin: PhantomPinned,
+                _: {
+                    if *published {
+                        pdev.set_vf_registration_data_rust(
+                            core::ptr::from_ref(inner.as_ref().get_ref()).cast_mut().cast(),
+                        );
+                    }
+                },
+            }))
+        })
+    }
+}
+
+#[pinned_drop]
+impl<F: ForLt + 'static> PinnedDrop for VfRegistration<'_, F> {
+    fn drop(self: Pin<&mut Self>) {
+        if !self.published {
+            return;
+        }
+
+        // SAFETY: `self.pdev` is the PF on which this registration was published. The call is a
+        // no-op on the normal managed-SR-IOV teardown path, where all VFs are already disabled.
+        unsafe { bindings::pci_disable_sriov(self.pdev.as_raw()) };
+        self.pdev
+            .set_vf_registration_data_rust(core::ptr::null_mut());
+    }
+}
+
+// SAFETY: The registration and its inline payload may be released from another thread after the
+// PCI core has removed all VFs.
+unsafe impl<F: ForLt> Send for VfRegistration<'_, F> where for<'a> F::Of<'a>: Send {}
+
+// SAFETY: VF consumers receive shared references only, and the payload supports shared access.
+unsafe impl<F: ForLt> Sync for VfRegistration<'_, F> where for<'a> F::Of<'a>: Send + Sync {}
+
+impl<Ctx: device::DeviceContext> PciDevice<Ctx> {
+    fn vf_registration_data_rust(&self) -> *mut core::ffi::c_void {
+        // SAFETY: `self.as_raw()` is a valid pointer to a `struct pci_dev`.
+        unsafe { (*self.as_raw()).vf_registration_data_rust }
+    }
+
+    fn set_vf_registration_data_rust(&self, data: *mut core::ffi::c_void) {
+        // SAFETY: Publication and withdrawal are serialized by PCI probe and managed teardown.
+        unsafe { (*self.as_raw()).vf_registration_data_rust = data };
+    }
+}
+
+impl PciDevice<device::Bound> {
+    /// # Safety
+    ///
+    /// The returned borrow must be confined by a closure higher-ranked independently over its
+    /// borrow and data lifetimes, or `F` must be covariant in its encoded lifetime.
+    unsafe fn vf_registration_data_pinned<F: ForLt + 'static>(&self) -> Result<Pin<&F::Of<'_>>> {
+        if !self.is_virtfn() {
+            return Err(ENODEV);
+        }
+
+        // SAFETY: A VF's `physfn` pointer remains valid for the VF's lifetime. Managed SR-IOV also
+        // keeps the PF driver bound until this VF is unbound.
+        let pf_dev = unsafe { (*self.as_raw()).__bindgen_anon_1.physfn };
+        if pf_dev.is_null() {
+            return Err(ENODEV);
+        }
+
+        // SAFETY: The PF cannot withdraw the pointer until managed teardown has removed this VF.
+        let ptr = unsafe { (*pf_dev).vf_registration_data_rust };
+        if ptr.is_null() {
+            return Err(ENOENT);
+        }
+
+        // SAFETY: The published pointer addresses a `VfRegistrationData`, whose first field is a
+        // `TypeId`.
+        let type_id = unsafe { ptr.cast::<TypeId>().read() };
+        if type_id != TypeId::of::<F>() {
+            return Err(EINVAL);
+        }
+
+        // SAFETY: The type check identifies `F`; lifetime parameters do not affect layout, and the
+        // inline data remains pinned for this VF borrow.
+        let data = unsafe {
+            let registration = ptr.cast::<VfRegistrationData<'_, F>>();
+            &raw const (*registration).data
+        };
+
+        // SAFETY: `data` is structurally pinned in the PF driver's pinned registration.
+        Ok(unsafe { Pin::new_unchecked(&*data) })
+    }
+
+    /// Accesses typed data published by this VF's PF through a closure.
+    ///
+    /// Returns [`ENODEV`] if this device is not a VF, [`ENOENT`] if its PF has not published
+    /// data, or [`EINVAL`] if the registered type does not match `F`.
+    ///
+    /// The closure's borrow and the registration data's lifetime are independent, so a borrow of
+    /// the context cannot be stored in invariant registration data.
+    pub fn vf_registration_data_with<F: ForLt + 'static, R>(
+        &self,
+        f: impl for<'borrow, 'data> FnOnce(Pin<&'borrow F::Of<'data>>) -> R,
+    ) -> Result<R> {
+        // SAFETY: The higher-ranked closure prevents the borrow from escaping or being stored in
+        // invariant data by keeping its lifetime independent of the erased data lifetime.
+        let data = unsafe { self.vf_registration_data_pinned::<F>()? };
+        Ok(f(data))
+    }
+
+    /// Returns typed data published by this VF's PF.
+    ///
+    /// This direct accessor is available only when the encoded data is covariant in its lifetime.
+    /// Use [`Self::vf_registration_data_with()`] for invariant data.
+    ///
+    /// It returns the same errors as [`Self::vf_registration_data_with()`].
+    pub fn vf_registration_data<F: CovariantForLt + 'static>(&self) -> Result<Pin<&F::Of<'_>>> {
+        // SAFETY: `CovariantForLt` permits shortening the encoded lifetime to this borrow.
+        unsafe { self.vf_registration_data_pinned::<F>() }
+    }
+}
